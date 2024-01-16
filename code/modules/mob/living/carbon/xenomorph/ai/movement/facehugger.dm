/datum/xeno_ai_movement/linger/facehugger/New(mob/living/carbon/xenomorph/parent)
	. = ..()
	var/turf/current_turf = get_turf(parent)
	if(. != INITIALIZE_HINT_QDEL && (locate(/obj/effect/alien/egg) in current_turf))
		home_turf = current_turf

/datum/xeno_ai_movement/linger/facehugger/ai_move_idle(delta_time)
	var/mob/living/carbon/xenomorph/facehugger/idle_xeno = parent
	if(idle_xeno.throwing)
		return

	if(next_home_search < world.time && (!home_turf || !(locate(/obj/effect/alien/egg) in home_turf) || get_dist(home_turf, idle_xeno) > max_distance_from_home))
		var/turf/T = get_turf(idle_xeno.loc)
		next_home_search = world.time + home_search_delay
		var/obj/effect/alien/egg/possible_egg = locate(/obj/effect/alien/egg) in T
		if(possible_egg && possible_egg.status == EGG_BURST)
			home_turf = T
		else
			var/shortest_distance = INFINITY
			for(var/i in RANGE_TURFS(home_locate_range, T))
				var/turf/potential_home = i
				possible_egg = locate(/obj/effect/alien/egg) in potential_home
				if(possible_egg && possible_egg.status == EGG_BURST && get_dist(idle_xeno, potential_home) < shortest_distance)
					home_turf = potential_home
					shortest_distance = get_dist(idle_xeno, potential_home)

	if(!home_turf)
		return

	var/obj/effect/alien/egg/eggy = locate(/obj/effect/alien/egg) in home_turf
	if(idle_xeno.move_to_next_turf(home_turf, home_locate_range) && eggy && eggy.status == EGG_BURST)
		if(get_dist(home_turf, idle_xeno) <= 0)
			idle_xeno.climb_in_egg(eggy)
	else
		home_turf = null

/datum/xeno_ai_movement/linger/facehugger/ai_move_target(delta_time)
	var/mob/living/carbon/xenomorph/moving_xeno = parent

	if(moving_xeno.action_busy)
		return

	return ..()

#define REENGAGE_COOLDOWN (7 SECONDS)
#define FIND_NEW_TRAVEL_TURF_LIMIT 5
#define FIND_NEW_TRAVEL_RADIUS_MAX 10

/datum/xeno_ai_movement/linger/facehugger/check_for_travelling_turf_change(mob/living/carbon/xenomorph/moving_xeno)
	if(!(moving_xeno in view(FIND_NEW_TRAVEL_RADIUS_MAX, moving_xeno.current_target)) && COOLDOWN_FINISHED(src, reengage_cooldown))
		travelling_turf = get_turf(moving_xeno.current_target)
		COOLDOWN_START(src, reengage_cooldown, REENGAGE_COOLDOWN)
		moving_xeno.emote("growl")
		return

	if(!travelling_turf || get_dist(travelling_turf, moving_xeno) <= 0)
		for(var/i = 0 to FIND_NEW_TRAVEL_TURF_LIMIT)
			travelling_turf = get_random_turf_in_range_unblocked(moving_xeno.current_target, linger_range + linger_deviation, linger_range - linger_deviation)

			if(!travelling_turf)
				continue

			if(get_dist(travelling_turf, moving_xeno.current_target) <= 4)
				continue

			var/travelling_turf_dir = get_dir(moving_xeno, travelling_turf)
			var/current_target_dir = get_dir(moving_xeno, moving_xeno.current_target)

			if(current_target_dir != travelling_turf_dir && current_target_dir != turn(travelling_turf_dir, 45) && current_target_dir != turn(travelling_turf_dir, -45))
				break

	if(!travelling_turf)
		travelling_turf = get_turf(moving_xeno.current_target)
		return

#undef REENGAGE_COOLDOWN
#undef FIND_NEW_TRAVEL_TURF_LIMIT
#undef FIND_NEW_TRAVEL_RADIUS_MAX

/mob/living/carbon/xenomorph/facehugger/check_mob_target(mob/living/carbon/checked_target)
	if(!ishuman(checked_target))
		return FALSE // We don't wanna to attack anyone except humans (compat for soon coming XvX code)

	if(istype(checked_target.wear_mask, /obj/item/clothing/mask/facehugger))
		return FALSE

	if(checked_target.status_flags & XENO_HOST)
		return FALSE

	if(can_not_harm(checked_target))
		return FALSE

	if(checked_target.stat == DEAD)
		return FALSE

	return TRUE

/mob/living/carbon/xenomorph/facehugger/proc/climb_in_egg(obj/effect/alien/egg/eggy)
	set waitfor = FALSE

	if(do_after(src, 10, INTERRUPT_ALL, BUSY_ICON_GENERIC, eggy))
		visible_message(SPAN_XENOWARNING("[src] crawls back into [eggy]!"))
		eggy.status = EGG_GROWN
		eggy.icon_state = "Egg"
		eggy.deploy_egg_triggers()
		qdel(src)

