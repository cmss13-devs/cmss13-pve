/client/proc/fortify_room()
	set name = "Fortify Room"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	var/list/turf_list = list()
	var/retval

	switch(tgui_input_list(mob, "How fortified should this be?", "Fortification Level", list("Wood", "Sandbag", "Sandbag (Wired)", "Metal", "Metal (Wired)", "Plasteel", "Plasteel (Wired)")))
		if("Wood")
			retval = recursive_turf_room_fortify(get_turf(mob), turf_list, /obj/structure/barricade/wooden, null)
		if("Sandbag")
			retval = recursive_turf_room_fortify(get_turf(mob), turf_list, /obj/structure/barricade/sandbags/full, null)
		if("Sandbag (Wired)")
			retval = recursive_turf_room_fortify(get_turf(mob), turf_list, /obj/structure/barricade/sandbags/wired, null)
		if("Metal")
			retval = recursive_turf_room_fortify(get_turf(mob), turf_list, /obj/structure/barricade/metal, /obj/structure/barricade/plasteel/metal)
		if("Metal (Wired)")
			retval = recursive_turf_room_fortify(get_turf(mob), turf_list, /obj/structure/barricade/metal/wired, /obj/structure/barricade/plasteel/metal/wired)
		if("Plasteel")
			retval = recursive_turf_room_fortify(get_turf(mob), turf_list, /obj/structure/barricade/metal/plasteel, /obj/structure/barricade/plasteel)
		if("Plasteel (Wired)")
			retval = recursive_turf_room_fortify(get_turf(mob), turf_list, /obj/structure/barricade/metal/plasteel/wired, /obj/structure/barricade/plasteel/wired)

	if(retval)
		to_chat(src, SPAN_NOTICE("Room fortified. Tiles scanned: [length(turf_list)]."))
	else
		to_chat(src, SPAN_NOTICE("Room too large to fully fortify. Capped at [length(turf_list)]."))

/proc/recursive_turf_room_fortify(turf/scan_turf, list/turf_list, cade_type, folding_cade_type)
	if(length(turf_list) > 195) // We're choosing 195 because 200 is the BYOND recursion limit so we're just playing it safe
		return FALSE // abort if the room is too large
	if(istype(scan_turf, /turf/closed))
		return TRUE // abort if we're a wall
	if(scan_turf in turf_list)
		return TRUE // abort if we've already been scanned
	if((locate(/obj/structure/machinery/door) in scan_turf) || (locate(/obj/structure/window_frame) in scan_turf) || (locate(/obj/structure/window) in scan_turf))
		return TRUE // abort if there's a door or window here
	turf_list += scan_turf
	for(var/cardinal in GLOB.cardinals)
		var/turf/nearby_turf = get_step(scan_turf, cardinal)
		if(!nearby_turf)
			continue

		if((locate(/obj/structure/window_frame) in nearby_turf) || (locate(/obj/structure/window) in nearby_turf))
			var/should_place = TRUE
			for(var/obj/structure/barricade/existing_cade in scan_turf)
				if(existing_cade.dir == cardinal)
					should_place = FALSE
					break

			if(should_place)
				var/obj/structure/barricade/cade = new cade_type(scan_turf)
				cade.setDir(cardinal)

		if(folding_cade_type && (locate(/obj/structure/machinery/door) in nearby_turf))
			var/should_place = TRUE
			for(var/obj/structure/barricade/existing_cade in scan_turf)
				if(existing_cade.dir == cardinal)
					should_place = FALSE
					break

			if(should_place)
				var/obj/structure/barricade/plasteel/cade = new folding_cade_type(scan_turf)
				cade.setDir(cardinal)
				cade.open(cade) // this closes it

		if(!recursive_turf_room_fortify(nearby_turf, turf_list, cade_type, folding_cade_type))
			return FALSE
	return TRUE
