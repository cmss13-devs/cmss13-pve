/datum/xeno_ai_movement/drone

//drones expand the hive
/datum/xeno_ai_movement/drone/ai_move_idle(delta_time, game_evaluation)
	var/mob/living/carbon/xenomorph/X = parent
	if(X.throwing)
		return

	if(next_home_search < world.time && (!home_turf || home_turf.weeds || get_dist(home_turf, X) > max_distance_from_home))
		var/turf/T = get_turf(X.loc)
		next_home_search = world.time + home_search_delay
		if(!T.weeds)
			home_turf = T
		else
			var/shortest_distance
			for(var/i in RANGE_TURFS(home_locate_range, T))
				var/turf/potential_home = i

				var/area/found_area = get_area(potential_home)
				if(found_area.flags_area & AREA_NOTUNNEL)
					continue

				if(!found_area.can_build_special)
					continue

				if(potential_home.weeds)
					continue

				if(!potential_home.is_weedable())
					continue

				if(locate(/obj/effect/alien/weeds/node) in range(3, potential_home))
					continue

				if(potential_home.density)
					continue

				if(shortest_distance && get_dist(X, potential_home) > shortest_distance)
					continue

				shortest_distance = get_dist(X, potential_home)
				home_turf = potential_home

	if(!home_turf)
		if(!X.resting)
			X.lay_down()
		return

	if(X.resting)
		X.lay_down()

	if(!X.move_to_next_turf(home_turf, home_locate_range))
		home_turf = null

	if(get_dist(home_turf, X) <= 0)
		var/datum/action/xeno_action/onclick/plant_weeds/plant_weed_action = get_xeno_action_by_type(parent, /datum/action/xeno_action/onclick/plant_weeds)
		INVOKE_ASYNC(plant_weed_action, TYPE_PROC_REF(/datum/action/xeno_action/onclick/plant_weeds, use_ability_wrapper))
		home_turf = null
