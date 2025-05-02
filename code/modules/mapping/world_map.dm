// This will save things to a sav file, sadly can't be a map export. But I may make a converter for that in-game to help out. ~Cass

/atom
	var/unique_save_vars = list()
	var/was_stashed = FALSE

/atom/proc/vars_to_save()
 	return list("color","name","amount","was_stashed")+unique_save_vars

/atom/proc/get_saveable_contents()
	return contents

proc/isemptylist(list/list)
	if(!list.len)
		return 1
	return 0

proc/clearlist(list/list)
	if(istype(list))
		list.len = 0
	return

/datum/map_object
	var/savedtype
	var/was_stashed
	var/object_vars = list()
	var/contents = list()
	var/list/forensic_data = list()

	var/list/reagent_data = list()
	var/metadata
	var/x
	var/y
	var/z

	var/name = ""

/datum/map_reagent_data
	var/id
	var/amount
	var/data

/proc/get_object_data(obj/O)
	set background = 1

	if(!O)
		return FALSE

	var/datum/map_object/MO = new/datum/map_object
	if(!MO)
		return
	MO.savedtype = O.type

	MO.name = O.name

	if(MO.was_stashed != TRUE)
		O.was_stashed = TRUE
	else
		MO.was_stashed = O.was_stashed

	for(var/V in O.vars_to_save() )
		var/save_var = TRUE
		if(!(V in O.vars))
			save_var = FALSE
			continue
		if(!(O.vars[V] == initial(O.vars[V])))
			if(islist(O.vars[V]))
				var/list/M = O.vars[V]
				for(var/P in M)
					if(!istext(P) && !isnum(P) && !ispath(P))
						save_var = FALSE
						continue
					if(listgetindex(M,P))
						var/asso_var = listgetindex(M,P)
						if(asso_var && (!istext(asso_var) && !isnum(asso_var) && !ispath(asso_var)) )
							save_var = FALSE
							continue

			else
				if(!istext(O.vars[V]) && !isnum(O.vars[V]) && !ispath(O.vars[V]))	// make sure all references to mobs/objs/turfs etc, are fully cut!
					save_var = FALSE
					continue

		if(save_var)
			MO.object_vars[V] = O.vars[V]

		CHECK_TICK

	return MO

/proc/full_item_save(obj/O)
	set background = 1

// get all objects in a area. I hate the method that's about to follow, but after finding exploits and potential shitcode that's in the game right now
// actually worried we'd get the bad reference juju happening (like syringes containing blood and that blood having the actual mob reference in its data
// which caused an infinite loop) - or items non-existing causing broken loading. because of this, the saving process has to be manually filtered for all the loops.

	var/datum/map_object/MO = get_object_data(O)
	if(!MO) return

	CHECK_TICK


	for(var/obj/A in O.get_saveable_contents())
		var/datum/map_object/MO_2 = get_object_data(A)
		if(!MO_2)
			continue

		MO.contents += MO_2

		CHECK_TICK

		for(var/obj/B in A.get_saveable_contents())
			var/datum/map_object/MO_3 = get_object_data(B)
			if(!MO_3) continue

			MO_2.contents += MO_3

			CHECK_TICK

			for(var/obj/C in B.get_saveable_contents())
				var/datum/map_object/MO_4 = get_object_data(C)
				if(!MO_4) continue

				MO_3.contents += MO_4

				CHECK_TICK

		CHECK_TICK

	return MO

/proc/full_item_load(var/datum/map_object/MO, loc)
	if(!ispath(MO.savedtype))
		error("Undefined save type [MO.savedtype]")
		return
	var/obj/O = new MO.savedtype (loc)
	CHECK_TICK
	MO.unpack_object_data(O)
	O.forceMove(loc)

	for(var/datum/map_object/MD in MO.contents)
		if(!ispath(MD.savedtype))
			error("Undefined save type [MD.savedtype]")
			continue

		var/obj/A = new MD.savedtype (loc)
		CHECK_TICK
		MD.unpack_object_data(A)
		A.forceMove(O)

		CHECK_TICK

		for(var/datum/map_object/MF in MD.contents)
			if(!ispath(MF.savedtype))
				error("Undefined save type [MF.savedtype]")
				continue

			var/obj/B = new MF.savedtype (loc)
			CHECK_TICK
			MF.unpack_object_data(B)
			B.forceMove(A)

			CHECK_TICK

			for(var/datum/map_object/MG in MF.contents)
				if(!ispath(MG.savedtype))
					error("Undefined save type [MG.savedtype]")
					continue

				var/obj/C = new MG.savedtype (loc)
				CHECK_TICK
				MG.unpack_object_data(C)
				C.forceMove(B)

				CHECK_TICK

	return O

/datum/map_object/proc/unpack_object_data(obj/O, obj/containing_obj)
	if(!O || QDELETED(O))
		return

	O.x = x
	O.y = y
	O.z = z

	if(containing_obj)
		O.forceMove(containing_obj)

	clearlist(O.contents)

	for(var/V in O.vars_to_save())
		if(object_vars[V])
			O.vars[V] = object_vars[V]

	var/turf/turfmoveto = locate(x,y,z)	// this should fix display sign issues
	if(turfmoveto && (turfmoveto != get_turf(O)) )
		O.forceMove(turfmoveto)

	return TRUE