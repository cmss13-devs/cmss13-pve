/client/proc/game_master_toggle_light()
	set name = "Toggle Light"
	set category = "Game Master.Extras"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	toggle_daylight()
/proc/toggle_daylight()
	var/list/turfs_to_change = list(/turf/open/desert/dirt, /turf/open/desert/rock, /turf/open/asphalt)
	for(var/turf/open/turf in world)
		if(is_type_in_list(turf, turfs_to_change))
			turf.set_light(1.4, 0.2, "#ffcc66")

/client/proc/make_filthy()
	set name = "Make Groundside Filthy"
	set category = "Game Master.Extras"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	do_make_filthy()

/proc/do_make_filthy()
	var/list/turf/valid_turfs = list()
	var/list/ground_levels = SSmapping.levels_by_trait(ZTRAIT_GROUND)
	for(var/ground_z in ground_levels)
		for(var/turf/open/turf in Z_TURFS(ground_z))
			var/valid = TRUE
			for(var/atom/movable/movable as anything in turf.contents)
				if(movable.density && movable.can_block_movement)
					valid = FALSE
					break
			if(valid)
				valid_turfs += turf
			CHECK_TICK

	for(var/turf/open/open in valid_turfs)
		if(prob(75))
			new /obj/effect/decal/cleanable/dirt(open)