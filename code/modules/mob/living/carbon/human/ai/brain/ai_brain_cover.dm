/datum/human_ai_brain
	/// If TRUE, AI is currently in some form of cover
	var/in_cover = FALSE

	/// Reference to atom currently selected as a cover place
	var/atom/current_cover

	COOLDOWN_DECLARE(cover_search_cooldown)

/datum/human_ai_brain/proc/end_cover(atom/source) // 'source' argument reserved for unregistering cade/wall/etc delete comsigs
	current_cover = null
	in_cover = FALSE

/datum/human_ai_brain/proc/on_shot_inside_cover(obj/projectile/bullet)
	// Cover isn't working. Charge!
	end_cover()

/datum/human_ai_brain/proc/try_cover(obj/projectile/bullet)
	if(!COOLDOWN_FINISHED(src, cover_search_cooldown))
		return

	COOLDOWN_START(src, cover_search_cooldown, 10 SECONDS)

	var/list/turf_dict = list()
	var/cover_dir = reverse_direction(angle2dir4ai(bullet.angle))

	recursive_turf_cover_scan(get_turf(tied_human), turf_dict, cover_dir)

#ifdef TESTING
	addtimer(CALLBACK(src, PROC_REF(clear_cover_value_debug), turf_dict.Copy()), 60 SECONDS)
#endif

	cover_processing(turf_dict)
	squad_cover_processing(turf_dict)


/datum/human_ai_brain/proc/squad_cover_processing(list/turf_dict)
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

		brain.cover_processing(turf_dict, TRUE)


/datum/human_ai_brain/proc/recursive_turf_cover_scan(turf/scan_turf, list/turf_dict, cover_dir, first_iteration = TRUE)
	if(length(turf_dict) > 200)
		return FALSE // abort if the room is too large

	if(scan_turf in turf_dict)
		return TRUE // abort if we've already been scanned

	turf_dict[scan_turf] = 0

	for(var/atom/movable/thing as anything in scan_turf.contents)
		if(thing.density && !istype(thing, /obj/structure/barricade))
			turf_dict[scan_turf] -= 1000
			if(first_iteration)
				break // We don't wanna end our cover search on self
			return TRUE // If it has something dense on it, don't bother

	var/obj/structure/barricade/cade = locate() in scan_turf.contents
	if(cade?.density && (cade?.dir in get_related_directions(cover_dir)))
		turf_dict[scan_turf] += cade.projectile_coverage / 2

	var/obj/item/explosive/mine/mine = locate() in scan_turf.contents
	if(mine)
		if(!faction_check(mine.iff_signal))
			turf_dict[scan_turf] -= 50
		else
			turf_dict[scan_turf] -= 5 // even if it's our mine, we don't really want to stand on it

	turf_dict[scan_turf] -= get_dist(tied_human, scan_turf)
	if(current_target) // Might be smarter to hide in a different direction
		turf_dict[scan_turf] += get_dist(current_target, scan_turf) * 0.5

		if(get_dir(current_target, scan_turf) in get_related_directions(cover_dir))
			turf_dict[scan_turf] -= 20

#ifdef TESTING
	//sleep(1)
#endif

	for(var/cardinal in shuffle(GLOB.cardinals))
		var/turf/nearby_turf = get_step(scan_turf, cardinal)
		if(!nearby_turf)
			continue

		if(istype(nearby_turf, /turf/closed))
			turf_dict[scan_turf] += 2 // Near a wall is a bit safer
			if(cardinal in get_related_directions(cover_dir))
				turf_dict[scan_turf] += 8
			continue

		var/obj/structure/reagent_dispensers/fueltank/tank = locate() in nearby_turf.contents
		if(tank)
			turf_dict[scan_turf] -= 10 // ideally not near any highly explosive fuel tanks if we can help it

#ifdef TESTING
		scan_turf.maptext = "<h2>[turf_dict[scan_turf]]</h2>"
#endif

		if(!recursive_turf_cover_scan(nearby_turf, turf_dict, cover_dir, FALSE))
			return FALSE

#ifdef TESTING
	scan_turf.maptext = "<h2>[turf_dict[scan_turf]]</h2>"
#endif

	return TRUE

/datum/human_ai_brain/proc/clear_cover_value_debug(list/turf_list)
	for(var/turf/T as anything in turf_list)
		T.maptext = null

/datum/human_ai_brain/proc/cover_processing(list/turf_dict, from_squad = FALSE)
	var/most_weight = -INFINITY
	var/turf/best_cover
	for(var/turf/T as anything in turf_dict)
		var/weight = turf_dict[T]
		if(weight > most_weight)
			most_weight = weight
			best_cover = T

	if(best_cover && best_cover != get_turf(tied_human))
		turf_dict -= best_cover
		// insert cover atom deletion/move comsigs here
		current_cover = best_cover
		if(!from_squad)
			squad_cover_processing(FALSE, turf_dict)

	squad_covering = FALSE
