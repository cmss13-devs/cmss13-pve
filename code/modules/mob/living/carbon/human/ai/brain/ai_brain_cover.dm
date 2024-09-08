/datum/human_ai_brain
	/// If TRUE, AI is currently in some form of cover
	var/in_cover = FALSE

	/// If TRUE, the AI is in hard cover, meaning that it's solid and can't be seen through
	var/hard_cover = FALSE

	COOLDOWN_DECLARE(cover_search_cooldown)

/datum/human_ai_brain/proc/on_cover_destroyed(atom/source, force)
	UnregisterSignal(source, COMSIG_PARENT_QDELETING)
	in_cover = FALSE
	hard_cover = FALSE

/datum/human_ai_brain/proc/on_shot_inside_cover(datum/source, damage_result, ammo_flags, obj/projectile/bullet)
	if(faction_check(bullet.firer))
		return // FF

	// Cover isn't working. Charge!
	in_cover = FALSE
	hard_cover = FALSE
	UnregisterSignal(tied_human, COMSIG_HUMAN_BULLET_ACT)


/datum/human_ai_brain/proc/locate_cover(obj/projectile/bullet, projectile_dir)
	if(!COOLDOWN_FINISHED(src, cover_search_cooldown))
		return
	COOLDOWN_START(src, cover_search_cooldown, 15 SECONDS)
	var/list/turf_dict = list()
	if(!recursive_turf_cover_scan(get_turf(tied_human), turf_dict, reverse_direction(projectile_dir)))
		outside_cover_processing(bullet, projectile_dir, FALSE)
		squad_cover_processing(FALSE, turf_dict, bullet, projectile_dir)
	else
		inside_cover_processing(turf_dict, FALSE)
		squad_cover_processing(TRUE, turf_dict, bullet, projectile_dir)


/datum/human_ai_brain/proc/squad_cover_processing(inside = TRUE, list/turf_dict, obj/projectile/bullet, projectile_dir)
	if(!squad_id)
		return

	var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict["[squad_id]"]
	if(!squad)
		return

	for(var/datum/human_ai_brain/brain as anything in squad.ai_in_squad)
		if(brain == src)
			continue

		if(get_dist(tied_human, brain.tied_human) > view_distance)
			continue

		if(brain.tied_human.is_mob_incapacitated())
			continue

		brain.squad_covering = TRUE
		COOLDOWN_START(brain, cover_search_cooldown, 15 SECONDS)

		if(inside)
			brain.inside_cover_processing(turf_dict, TRUE)
		else
			brain.outside_cover_processing(bullet, projectile_dir, TRUE)

/datum/human_ai_brain/proc/recursive_turf_cover_scan(turf/scan_turf, list/turf_dict, cover_dir)
	if(length(turf_dict) > 128)
		return FALSE // abort if the room is too large
	//if(istype(scan_turf, /turf/closed))
	//	return TRUE // abort if we're a wall
	if(scan_turf in turf_dict)
		return TRUE // abort if we've already been scanned
	turf_dict[scan_turf] = 0
	var/obj/structure/barricade/cade = locate() in scan_turf.contents
	if(cade?.dir in get_related_directions(cover_dir))
		turf_dict[scan_turf] += 5
	var/obj/item/explosive/mine/mine = locate() in scan_turf.contents
	if(mine)
		if(!faction_check(mine.iff_signal))
			turf_dict[scan_turf] -= 50
		else
			turf_dict[scan_turf] -= 2 // even if it's our mine, we don't really want to stand on it
	for(var/obj/thing in scan_turf.contents)
		if(thing.density && !istype(thing, /obj/structure/barricade))
			turf_dict[scan_turf] -= 1000 // If it has something dense on it, don't bother
	for(var/cardinal in GLOB.cardinals)
		var/turf/nearby_turf = get_step(scan_turf, cardinal)
		if(!nearby_turf)
			continue
		var/obj/structure/reagent_dispensers/fueltank/tank = locate() in nearby_turf.contents
		if(tank)
			turf_dict[scan_turf] -= 10 // ideally not near any highly explosive fuel tanks if we can help it
		if(istype(nearby_turf, /turf/closed))
			turf_dict[scan_turf] += 2 // Near a wall is a bit safer
			continue
		if(!recursive_turf_cover_scan(nearby_turf, turf_dict, cover_dir))
			return FALSE
	return TRUE


/datum/human_ai_brain/proc/outside_cover_processing(obj/projectile/bullet, projectile_dir, from_squad = FALSE)
	var/shortest_cover_dist = 50
	var/turf/shortest_cover_turf
	var/atom/cover_atom
	var/list/cardinal_bullet_dirs = make_dir_cardinal(projectile_dir)
	var/list/inverse_cardinal_bullet_dirs = list()
	for(var/dir in cardinal_bullet_dirs)
		inverse_cardinal_bullet_dirs += reverse_direction(dir)
	var/list/view_contents = view(7, tied_human)
	cade_loop:
		for(var/obj/structure/barricade/cade in view_contents)
			for(var/atom/thing in cade.loc)
				if(thing.density && (cade != thing))
					continue cade_loop
			if(cade.dir in inverse_cardinal_bullet_dirs)
				var/dist = get_dist(tied_human, cade)
				if(dist < shortest_cover_dist)
					shortest_cover_dist = dist
					shortest_cover_turf = get_turf(cade)
					cover_atom = cade
	if(shortest_cover_turf)
		ADD_ONGOING_ACTION(src, /datum/ongoing_action/take_cover, shortest_cover_turf, cover_atom, FALSE)
		if(!from_squad)
			squad_cover_processing(FALSE, view_contents - shortest_cover_turf)
		else
			squad_covering = FALSE
		return
	wall_loop:
		for(var/turf/closed/wall in view_contents)
			for(var/dir in cardinal_bullet_dirs)
				var/turf/open/maybe_cover = get_step(wall, dir)
				if(!istype(maybe_cover) || !(tied_human in viewers(world.view, maybe_cover)))
					continue
				for(var/atom/thing in maybe_cover)
					if(thing.density)
						continue wall_loop
				if(bullet.firer in viewers(world.view, maybe_cover))
					continue
				var/dist = get_dist(tied_human, maybe_cover)
				if(dist < shortest_cover_dist)
					shortest_cover_dist = dist
					shortest_cover_turf = maybe_cover
					cover_atom = wall
	if(shortest_cover_turf)
		ADD_ONGOING_ACTION(src, /datum/ongoing_action/take_cover, shortest_cover_turf, cover_atom, TRUE)
		if(!from_squad)
			squad_cover_processing(FALSE, view_contents - shortest_cover_turf)

	squad_covering = FALSE



/datum/human_ai_brain/proc/inside_cover_processing(list/turf_dict, from_squad = FALSE)
	var/highest_cover_value = turf_dict[turf_dict[1]]
	var/turf/highest_cover_turf
	for(var/turf/turf as anything in turf_dict)
#ifdef TESTING
		turf.maptext = "<h2>[turf_dict[turf]]</h2>"
#endif
		if(turf_dict[turf] > highest_cover_value)
			highest_cover_value = turf_dict[turf]
			highest_cover_turf = turf
	if(!highest_cover_turf)
		squad_covering = FALSE
		return // damn
#ifdef TESTING
	to_chat(world, "highest_cover_value: [highest_cover_value], turf coords: [highest_cover_turf.x], [highest_cover_turf.y], [highest_cover_turf.z]")
	addtimer(CALLBACK(src, PROC_REF(clear_cover_value_debug), turf_dict), 60 SECONDS)
	ADD_ONGOING_ACTION(src, /datum/ongoing_action/take_inside_cover, highest_cover_turf)
	if(!from_squad)
		squad_cover_processing(TRUE, turf_dict - highest_cover_turf)
	else
		squad_covering = FALSE

/datum/human_ai_brain/proc/clear_cover_value_debug(list/turf_list)
	for(var/turf/T as anything in turf_list)
		T.maptext = null

#else
	ADD_ONGOING_ACTION(src, /datum/ongoing_action/take_inside_cover, highest_cover_turf)
	if(!from_squad)
		squad_cover_processing(TRUE, view_contents - highest_cover_turf)
	else
		squad_covering = FALSE
#endif

