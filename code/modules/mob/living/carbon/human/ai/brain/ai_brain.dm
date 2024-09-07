GLOBAL_LIST_EMPTY(human_ai_brains)

/datum/human_ai_brain
	var/mob/living/carbon/human/tied_human

	var/micro_action_delay = 0.2 SECONDS
	var/short_action_delay = 0.5 SECONDS
	var/medium_action_delay = 2 SECONDS
	var/long_action_delay = 5 SECONDS
	var/action_delay_mult = 1

	/// Midway through doing something, shouldn't start something else
	var/currently_busy = FALSE

	/// If TRUE, shoots until the target is dead. Else, stops when downed
	var/shoot_to_kill = TRUE

	/// Distance for view checks
	var/view_distance = 7

	/// How far the AI will chuck a nade if they can't find an enemy to throw it back at
	var/nade_direction_throw = 4

	/// List of current action datums
	var/list/ongoing_actions = list()

	/// List of semi-permanent "order" action datums. These do not expire
	var/list/ongoing_orders = list()

	var/list/detection_turfs = list()

	var/in_combat = FALSE
	var/combat_decay_time = 30 SECONDS

/datum/human_ai_brain/New(mob/living/carbon/human/tied_human)
	. = ..()
	src.tied_human = tied_human
	RegisterSignal(tied_human, COMSIG_PARENT_QDELETING, PROC_REF(on_human_delete))
	RegisterSignal(tied_human, COMSIG_HUMAN_EQUIPPED_ITEM, PROC_REF(on_item_equip))
	RegisterSignal(tied_human, COMSIG_HUMAN_UNEQUIPPED_ITEM, PROC_REF(on_item_unequip))
	RegisterSignal(tied_human, COMSIG_MOB_PICKUP_ITEM, PROC_REF(on_item_pickup))
	RegisterSignal(tied_human, COMSIG_MOB_DROP_ITEM, PROC_REF(on_item_drop))
	RegisterSignal(tied_human, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))
	if(!length(all_medical_items))
		all_medical_items = brute_heal_items + burn_heal_items + tox_heal_items + oxy_heal_items + bleed_heal_items + bonebreak_heal_items + painkiller_items
	GLOB.human_ai_brains += src
	setup_detection_radius()

/datum/human_ai_brain/Destroy(force, ...)
	tied_human = null
	set_primary_weapon(null)
	current_target = null
	target_floor = null
	GLOB.human_ai_brains -= src
	return ..()

/datum/human_ai_brain/process(delta_time)
	if(tied_human.is_mob_incapacitated())
		end_gun_fire()
		return

	for(var/datum/ongoing_action/action as anything in ongoing_actions)
		var/retval = action.trigger_action()
		switch(retval)
			if(ONGOING_ACTION_UNFINISHED_BLOCK)
				return
			if(ONGOING_ACTION_COMPLETED)
				ongoing_actions -= action
				qdel(action)
				currently_busy = FALSE

	var/list/things_around = range(2, tied_human)
	// Might be wise to move these off tick and instead make them signal-based
	nade_throwback(things_around)
	item_search(things_around)
	bullet_detect(things_around)

	if(!currently_busy && healing_start_check())
		currently_busy = TRUE
		start_healing()

	if(!currently_busy && should_reload_primary())
		currently_busy = TRUE
		reload_primary()

	if(!currently_busy && !current_target && primary_weapon)
		current_target = get_target(view_distance)
		RegisterSignal(current_target, COMSIG_PARENT_QDELETING, PROC_REF(on_target_delete))

	if(!currently_busy && primary_weapon && current_target && !currently_firing && COOLDOWN_FINISHED(src, fire_overload_cooldown) && primary_weapon.has_ammunition())
		currently_busy = TRUE
		if(get_dist(tied_human, current_target) > gun_data.maximum_range)
			if(!has_ongoing_action(/datum/ongoing_action/approach_target) && !in_cover)
				ADD_ONGOING_ACTION(src, /datum/ongoing_action/approach_target, current_target, gun_data.maximum_range)
		attack_target()

/datum/human_ai_brain/proc/on_human_delete(datum/source, force)
	SIGNAL_HANDLER
	tied_human = null

/datum/human_ai_brain/proc/on_target_delete(datum/source, force)
	SIGNAL_HANDLER
	current_target = null

/datum/human_ai_brain/proc/ensure_primary_hand(obj/item/held_item)
	if(tied_human.get_inactive_hand() == held_item)
		tied_human.swap_hand()

/datum/human_ai_brain/proc/nade_throwback(list/things_around)
	if(has_ongoing_action(/datum/ongoing_action/throw_back_nade))
		return

	var/turf/place_to_throw
	var/obj/item/explosive/grenade/throw_nade
	for(var/obj/item/explosive/grenade/nade in things_around)
		if(!nade.active || nade.throwing)
			continue

		throw_nade = nade

		var/list/possible_targets = list()
		for(var/mob/living/carbon/target in range(view_distance, tied_human))
			if(can_target(target))
				possible_targets += target

		if(length(possible_targets))
			var/mob/living/carbon/chosen_target = pick(possible_targets)
			var/list/turf_pathfind_list = AStar(get_turf(tied_human), get_turf(chosen_target), /turf/proc/AdjacentTurfs, /turf/proc/Distance, view_distance)
			for(var/i = length(turf_pathfind_list); i >= 4; i--) // We cut it off at 4 because we want to avoid most of the nade blast
				var/turf/target_turf = turf_pathfind_list[i]
				if(target_turf in viewers(world.view, tied_human))
					place_to_throw = target_turf
					goto throw_back_nade
			place_to_throw = turf_pathfind_list[4]
			goto throw_back_nade

		// We haven't found an enemy in range that we can throw to, so we'll just throw in a direction that doesn't have friendlies
		var/list/directions = list(
			locate(tied_human.x, tied_human.y + nade_direction_throw, tied_human.z),
			locate(tied_human.x + nade_direction_throw, tied_human.y, tied_human.z),
			locate(tied_human.x, tied_human.y - nade_direction_throw, tied_human.z),
			locate(tied_human.x - nade_direction_throw, tied_human.y, tied_human.z),
		)
		location_loop:
			for(var/turf/location as anything in directions)
				if(location)
					var/list/turf/path = getline2(tied_human, location, include_from_atom = FALSE)
					for(var/turf/possible_blocker as anything in path)
						if(possible_blocker.density)
							continue location_loop

					var/has_friendly = FALSE
					for(var/mob/possible_friendly in range(3, location))
						if(!can_target(possible_friendly))
							has_friendly = TRUE
							break

					if(!has_friendly)
						place_to_throw = location
						goto throw_back_nade

		// There's friendlies all around us, apparently. Just uh. Die ig.
		break

	if(!throw_nade)
		return

	throw_back_nade:
		ADD_ONGOING_ACTION(src, /datum/ongoing_action/throw_back_nade, throw_nade, place_to_throw)

/// Use ADD_ONGOING_ACTION() macro instead of calling this directly
/datum/human_ai_brain/proc/_add_ongoing_action(datum/ongoing_action/path, ...)
	if(path::order)
		stack_trace("Order of [path] was attempted to be added as an action.")
	ongoing_actions += new path(src, args)

/datum/human_ai_brain/proc/has_ongoing_action(path)
	if(!ispath(path))
		return FALSE

	for(var/datum/ongoing_action/action as anything in ongoing_actions)
		if(istype(action, path))
			return TRUE

	return FALSE

/datum/human_ai_brain/proc/add_ongoing_order(datum/ongoing_action/ref)
	if(!ref.order)
		stack_trace("Action of [ref.type] was attempted to be added as an order.")
	ongoing_orders += ref

/datum/human_ai_brain/proc/has_ongoing_order(path)
	if(!ispath(path))
		return FALSE

	for(var/datum/ongoing_action/action as anything in ongoing_orders)
		if(istype(action, path))
			return TRUE

	return FALSE

/datum/human_ai_brain/proc/bullet_detect(list/things_nearby)
	var/obj/projectile/bullet = locate(/obj/projectile) in things_nearby
	if(!bullet)
		return

	if(ismob(bullet.firer))
		var/mob/firer = bullet.firer
		if(!in_cover && !faction_check(firer)) // If it's our own bullets, we don't need to be alarmed
			locate_cover(bullet, bullet.dir)

/datum/human_ai_brain/proc/locate_cover(obj/projectile/bullet, projectile_dir)
	if(!COOLDOWN_FINISHED(src, cover_search_cooldown))
		return
	COOLDOWN_START(src, cover_search_cooldown, 15 SECONDS)
	var/list/turf_dict = list()
	if(!recursive_turf_cover_scan(get_turf(tied_human), turf_dict, reverse_direction(projectile_dir)))
		var/shortest_cover_dist = 50
		var/turf/shortest_cover_turf
		var/atom/cover_atom
		var/list/cardinal_bullet_dirs = make_dir_cardinal(projectile_dir)
		var/list/inverse_cardinal_bullet_dirs = list()
		for(var/dir in cardinal_bullet_dirs)
			inverse_cardinal_bullet_dirs += reverse_direction(dir)
		var/list/view_contents = view(7, tied_human)
		for(var/obj/structure/barricade/cade in view_contents)
			if(cade.dir in inverse_cardinal_bullet_dirs)
				var/dist = get_dist(tied_human, cade)
				if(dist < shortest_cover_dist)
					shortest_cover_dist = dist
					shortest_cover_turf = get_turf(cade)
					cover_atom = cade
		if(shortest_cover_turf)
			ADD_ONGOING_ACTION(src, /datum/ongoing_action/take_cover, shortest_cover_turf, cover_atom, FALSE)
			return
		for(var/turf/closed/wall in view_contents)
			for(var/dir in cardinal_bullet_dirs)
				var/turf/open/maybe_cover = get_step(wall, dir)
				if(!istype(maybe_cover))
					continue
				if(bullet.firer in viewers(world.view, maybe_cover))
					continue
				var/dist = get_dist(tied_human, maybe_cover)
				if(dist < shortest_cover_dist)
					shortest_cover_dist = dist
					shortest_cover_turf = maybe_cover
					cover_atom = wall
		if(shortest_cover_turf)
			ADD_ONGOING_ACTION(src, /datum/ongoing_action/take_cover, shortest_cover_turf, cover_atom, TRUE)
			return


	else
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
			return // damn
#ifdef TESTING
		to_chat(world, "highest_cover_value: [highest_cover_value], turf coords: [highest_cover_turf.x], [highest_cover_turf.y], [highest_cover_turf.z]")
		addtimer(CALLBACK(src, PROC_REF(clear_cover_value_debug), turf_dict), 60 SECONDS)
		ADD_ONGOING_ACTION(src, /datum/ongoing_action/take_inside_cover, highest_cover_turf)

/datum/human_ai_brain/proc/clear_cover_value_debug(list/turf_list)
	for(var/turf/T as anything in turf_list)
		T.maptext = null

#else
		ADD_ONGOING_ACTION(src, /datum/ongoing_action/take_inside_cover, highest_cover_turf)
#endif

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

/datum/human_ai_brain/proc/faction_check(mob/target)
	return target?.faction == tied_human.faction

/datum/human_ai_brain/proc/setup_detection_radius()
	if(length(detection_turfs))
		clear_detection_radius()

	for(var/turf/open/floor in range(1, tied_human))
		RegisterSignal(floor, COMSIG_TURF_ENTERED, PROC_REF(on_detection_turf_enter))
		detection_turfs += floor

/datum/human_ai_brain/proc/clear_detection_radius()
	for(var/turf/open/floor as anything in detection_turfs)
		UnregisterSignal(floor, COMSIG_TURF_ENTERED)

	detection_turfs.Cut()

/datum/human_ai_brain/proc/on_detection_turf_enter(datum/source, atom/movable/entering)
	SIGNAL_HANDLER
	if(entering == tied_human)
		return

	if(istype(entering, /obj/projectile))
		var/obj/projectile/bullet = entering
		if(ismob(bullet.firer))
			if(!in_cover && !faction_check(bullet.firer)) // If it's our own bullets, we don't need to be alarmed
				enter_combat()
				locate_cover(bullet, bullet.dir)

/datum/human_ai_brain/proc/on_move(atom/movable/mover, atom/oldloc, direction)
	setup_detection_radius()

/datum/human_ai_brain/proc/enter_combat()
	SIGNAL_HANDLER

	in_combat = TRUE
	addtimer(CALLBACK(src, PROC_REF(exit_combat)), combat_decay_time, TIMER_UNIQUE | TIMER_OVERRIDE)

/datum/human_ai_brain/proc/exit_combat()
	in_combat = FALSE
