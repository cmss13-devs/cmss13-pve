/datum/xeno_ai_movement/ranged
	var/turf/travelling_turf
	var/potential_turf_range = 7
	var/min_range = 4

/datum/xeno_ai_movement/ranged/ai_move_target(delta_time, game_evaluation)
	var/mob/living/carbon/xenomorph/X = parent
	if(!X.current_target in GLOB.all_multi_vehicles || !X.current_target in GLOB.all_defenses)
		if(X.current_target.is_mob_incapacitated())
			return ..()

	if(!travelling_turf || !(get_turf(X) in view(world.view, X.current_target)))
		travelling_turf = get_turf(X.current_target)
	else if(get_dist(X, travelling_turf) <= min_range)
		travelling_turf = X.loc

	if(!X.move_to_next_turf(travelling_turf) || get_dist(travelling_turf, X) <= 0)
		var/list/potential_turfs = RANGE_TURFS(potential_turf_range, travelling_turf)
		potential_turfs -= X.loc
		while(length(potential_turfs))
			var/turf/target_turf = pick(potential_turfs)
			potential_turfs -= target_turf

			if(get_dist(target_turf, X.current_target) <= min_range)
				continue

			if(target_turf in view(X.current_target))
				travelling_turf = target_turf
				break

/datum/xeno_ai_movement/ranged/boiler
	potential_turf_range = 8
	min_range = 6
