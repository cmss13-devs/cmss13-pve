/datum/xeno_ai_movement
	var/mob/living/carbon/xenomorph/parent

	// Home turf
	var/next_home_search = 0
	var/home_search_delay = 5 SECONDS
	var/max_distance_from_home = 15
	var/home_locate_range = 15
	var/turf/home_turf
	var/obj/effect/landmark/ai_hive/hive_landmark


/datum/xeno_ai_movement/New(mob/living/carbon/xenomorph/parent)
	. = ..()
	if(!parent)
		return INITIALIZE_HINT_QDEL

	src.parent = parent

/datum/xeno_ai_movement/Destroy(force, ...)
	parent = null
	return ..()

/datum/xeno_ai_movement/proc/ai_move_idle(delta_time)
	SHOULD_NOT_SLEEP(TRUE)
	var/mob/living/carbon/xenomorph/idle_xeno = parent
	if(idle_xeno.throwing)
		return

	if(next_home_search < world.time && (!home_turf || !home_turf.weeds || get_dist(home_turf, idle_xeno) > max_distance_from_home))
		var/turf/T = get_turf(idle_xeno.loc)
		next_home_search = world.time + home_search_delay
		if(T.weeds)
			home_turf = T
		else
			var/shortest_distance = INFINITY
			for(var/i in RANGE_TURFS(home_locate_range, T))
				var/turf/potential_home = i
				if(potential_home.weeds && !potential_home.density && get_dist(idle_xeno, potential_home) < shortest_distance)
					home_turf = potential_home
					shortest_distance = get_dist(idle_xeno, potential_home)

	if(!home_turf)
		return

	if(idle_xeno.move_to_next_turf(home_turf, home_locate_range))
		if(get_dist(home_turf, idle_xeno) <= 0 && !idle_xeno.resting)
			idle_xeno.lay_down()
	else
		home_turf = null

/datum/xeno_ai_movement/proc/ai_move_target(delta_time)
	SHOULD_NOT_SLEEP(TRUE)
	var/mob/living/carbon/xenomorph/X = parent
	if(X.throwing)
		return

	var/turf/T = get_turf(X.current_target)
	if(get_dist(X, X.current_target) <= 1)
		var/list/turfs = RANGE_TURFS(1, T)
		while(length(turfs))
			T = pick(turfs)
			turfs -= T
			if(!T.density)
				break

			if(T == get_turf(X.current_target))
				break

	if(!X.move_to_next_turf(T))
		X.current_target = null
		return TRUE

/datum/xeno_ai_movement/proc/ai_move_hive(delta_time)
	SHOULD_NOT_SLEEP(TRUE)
	var/mob/living/carbon/xenomorph/retreating_xeno = parent
	if(retreating_xeno.throwing)
		return

	var/shortest_distance = INFINITY
	var/obj/effect/landmark/ai_hive/hive
	if(!hive_landmark)
		for(var/obj/effect/landmark/ai_hive/potential_hive in world)
			if(potential_hive.z != retreating_xeno.z)
				continue

			var/xeno_to_potential_hive_distance = get_dist(retreating_xeno, potential_hive)
			if(xeno_to_potential_hive_distance > shortest_distance)
				continue

			hive = potential_hive
			shortest_distance = xeno_to_potential_hive_distance

		if(!hive)
			return

		hive_landmark = hive

	if(get_dist(retreating_xeno, hive_landmark) <= hive_landmark.hive_radius)
		return ai_strap_host(delta_time)

	var/turf/hive_turf = get_turf(hive_landmark)
	if(retreating_xeno.move_to_next_turf(hive_turf, world.maxx))
		return TRUE

/datum/xeno_ai_movement/proc/ai_strap_host(delta_time)
	SHOULD_NOT_SLEEP(TRUE)
	var/mob/living/carbon/xenomorph/capping_xeno = parent
	if(capping_xeno.throwing)
		return

	var/turf/nest_turf
	var/turf/weeded_wall

	var/shortest_distance = INFINITY
	for(var/turf/potential_nest as anything in RANGE_TURFS(hive_landmark.hive_radius, hive_landmark))
		if(potential_nest.density || !potential_nest.weeds)
			continue

		var/obj/structure/bed/nest/preexisting_nest = locate() in potential_nest
		if(preexisting_nest && preexisting_nest.buckled_mob)
			continue

		var/turf/potential_weeded_wall
		for(var/turf/closed/touching_turf in orange(1, potential_nest))
			if(!touching_turf.weeds)
				continue

			if(get_dir(potential_nest, touching_turf) in diagonals)
				continue

			potential_weeded_wall = touching_turf
			break

		if(!potential_weeded_wall)
			continue

		var/xeno_to_potential_nest_distance = get_dist(capping_xeno, potential_nest)
		if(xeno_to_potential_nest_distance > shortest_distance)
			continue

		nest_turf = potential_nest
		weeded_wall = potential_weeded_wall
		shortest_distance = xeno_to_potential_nest_distance

	if(!nest_turf)
		return

	if(get_dist(capping_xeno, nest_turf) < 1)
		if(capping_xeno.get_inactive_hand())
			capping_xeno.swap_hand()
		INVOKE_ASYNC(capping_xeno, TYPE_PROC_REF(/mob, do_click), weeded_wall, "", list())
		return TRUE

	if(capping_xeno.move_to_next_turf(nest_turf))
		return TRUE
