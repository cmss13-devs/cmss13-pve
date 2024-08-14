//basically adds vehicle seats code to every chair that you may need

/obj/structure/bed/chair
	var/buckle_offset_x = 0
	var/mob_old_x = 0
	var/buckle_offset_y = 0
	var/mob_old_y = 0

/obj/structure/bed/chair/Initialize()
	..()

	addtimer(CALLBACK(src, PROC_REF(setup_buckle_offsets)), 1 SECONDS)

/obj/structure/bed/chair/proc/setup_buckle_offsets()
	if(pixel_x != 0)
		buckle_offset_x = pixel_x
	if(pixel_y != 0)
		buckle_offset_y = pixel_y

/obj/structure/bed/chair/afterbuckle(mob/M)
	if(buckled_mob)
		if(buckled_mob != M)
			return

		if(buckle_offset_x != 0)
			mob_old_x = M.pixel_x
			M.pixel_x = buckle_offset_x
		if(buckle_offset_y != 0)
			mob_old_y = M.pixel_y
			M.pixel_y = buckle_offset_y
	else

		if(buckle_offset_x != 0)
			M.pixel_x = mob_old_x
			mob_old_x = 0
		if(buckle_offset_y != 0)
			M.pixel_y = mob_old_y
			mob_old_y = 0

	for(var/obj/structure/bed/chair/CH in get_turf(src))
		if(CH != src)
			//if both seats on same tile have buckled mob, we become dense, otherwise, not dense.
			if(buckled_mob)
				if(CH.buckled_mob)
					REMOVE_TRAIT(buckled_mob, TRAIT_UNDENSE, DOUBLE_SEATS_TRAIT)
					REMOVE_TRAIT(CH.buckled_mob, TRAIT_UNDENSE, DOUBLE_SEATS_TRAIT)
				else
					ADD_TRAIT(buckled_mob, TRAIT_UNDENSE, DOUBLE_SEATS_TRAIT)
			else
				if(CH.buckled_mob)
					ADD_TRAIT(CH.buckled_mob, TRAIT_UNDENSE, DOUBLE_SEATS_TRAIT)
				REMOVE_TRAIT(M, TRAIT_UNDENSE, DOUBLE_SEATS_TRAIT)
			break

	handle_rotation()
