/datum/xeno_ai_movement
	var/mob/living/carbon/xenomorph/parent

	// Home turf
	var/next_home_search = 0
	var/home_search_delay = 5 SECONDS
	var/max_distance_from_home = 15
	var/home_locate_range = 15
	var/turf/home_turf

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
