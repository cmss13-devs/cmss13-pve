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

	/// How long we will ignore max fire distance after shot from afar
	var/return_fire_duration = 5 SECONDS

	/// List of current action datums
	var/list/ongoing_actions = list()

	/// List of semi-permanent "order" action datums. These do not expire
	//var/list/ongoing_orders = list()
	var/datum/ongoing_action/order/ongoing_order

	var/list/detection_turfs = list()

	var/in_combat = FALSE
	var/combat_decay_time_min = 15 SECONDS
	var/combat_decay_time_max = 30 SECONDS
	var/squad_covering = FALSE

	var/peek_cover_chance = 35

	var/list/friendly_factions = list()
	var/list/neutral_factions = list()
	var/previous_faction
	/// If false, cannot be assigned to a squad
	var/can_assign_squad = TRUE
	var/allowed_approach_retreat = TRUE

/datum/human_ai_brain/New(mob/living/carbon/human/tied_human)
	. = ..()
	src.tied_human = tied_human
	RegisterSignal(tied_human, COMSIG_PARENT_QDELETING, PROC_REF(on_human_delete))
	RegisterSignal(tied_human, COMSIG_HUMAN_EQUIPPED_ITEM, PROC_REF(on_item_equip))
	RegisterSignal(tied_human, COMSIG_HUMAN_UNEQUIPPED_ITEM, PROC_REF(on_item_unequip))
	RegisterSignal(tied_human, COMSIG_MOB_PICKUP_ITEM, PROC_REF(on_item_pickup))
	RegisterSignal(tied_human, COMSIG_MOB_DROP_ITEM, PROC_REF(on_item_drop))
	RegisterSignal(tied_human, COMSIG_MOB_DEATH, PROC_REF(reset_ai_state))
	RegisterSignal(tied_human, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))
	RegisterSignal(tied_human, COMSIG_HUMAN_BULLET_ACT, PROC_REF(on_shot))
	RegisterSignal(tied_human, COMSIG_HUMAN_HANDCUFFED, PROC_REF(on_handcuffed))
	RegisterSignal(tied_human, COMSIG_HUMAN_GET_AI_BRAIN, PROC_REF(get_ai_brain))
	if(!length(all_medical_items))
		all_medical_items = brute_heal_items + burn_heal_items + tox_heal_items + oxy_heal_items + bleed_heal_items + bonebreak_heal_items + painkiller_items
	GLOB.human_ai_brains += src
	setup_detection_radius()

/datum/human_ai_brain/Destroy(force, ...)
	GLOB.human_ai_brains -= src
	tied_human = null

	reset_ai_state()

	return ..()

/datum/human_ai_brain/proc/reset_ai_state()
	set_primary_weapon(null)
	end_gun_fire()
	end_cover()
	//primary_melee = null

	gun_data = null
	target_floor = null
	ongoing_order = null
	current_target = null

	currently_reloading = FALSE

	for(var/action in ongoing_actions)
		qdel(action)

	ongoing_actions.Cut()

/datum/human_ai_brain/process(delta_time)
	if(tied_human.is_mob_incapacitated())
		end_gun_fire()
		current_target = null
		return

	var/order_return
	if(can_process_order())
		order_return = ongoing_order.trigger_action(src)

	if(!in_combat && !currently_busy && (order_return != ONGOING_ACTION_UNFINISHED))
		approach_squad_leader()

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

	if(!currently_busy && !currently_reloading && should_reload_primary())
		reload_primary()

	if(primary_weapon && current_target)
		if(allowed_approach_retreat && !length(ongoing_actions))
			var/target_futile = current_target.is_mob_incapacitated()
			var/distance = get_dist(tied_human, current_target)
			if(distance > gun_data.optimal_range || target_futile)
				if(!current_cover)
					var/walk_distance = target_futile ? gun_data.minimum_range : gun_data.optimal_range
					ADD_ONGOING_ACTION(src, AI_ACTION_APPROACH, current_target, walk_distance)

			else if(distance < gun_data.optimal_range)
				var/walk_distance = current_cover ? gun_data.minimum_range : gun_data.optimal_range
				ADD_ONGOING_ACTION(src, AI_ACTION_RETREAT, current_target, walk_distance)

		if(!currently_busy && !currently_firing && !currently_reloading && COOLDOWN_FINISHED(src, fire_overload_cooldown))
			attack_target()

	if(!currently_busy && !current_target && primary_weapon)
		current_target = get_target(view_distance)
		RegisterSignal(current_target, COMSIG_PARENT_QDELETING, PROC_REF(on_target_delete), TRUE)

	if(!currently_busy && !in_combat && healing_start_check())
		start_healing()

/datum/human_ai_brain/proc/on_human_delete(datum/source, force)
	SIGNAL_HANDLER
	tied_human = null

/datum/human_ai_brain/proc/on_target_delete(datum/source, force)
	SIGNAL_HANDLER
	end_gun_fire()
	current_target = null

/datum/human_ai_brain/proc/ensure_primary_hand(obj/item/held_item)
	if(tied_human.get_inactive_hand() == held_item)
		tied_human.swap_hand()

/datum/human_ai_brain/proc/nade_throwback(list/things_around)
	if(has_ongoing_action(AI_ACTION_THROWBACK))
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
					var/list/turf/path = get_line(tied_human, location, include_start_atom = FALSE)
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
		ADD_ONGOING_ACTION(src, AI_ACTION_THROWBACK, throw_nade, place_to_throw)

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

/datum/human_ai_brain/proc/set_ongoing_order(datum/ongoing_action/ref)
	if(!ref)
		return

	if(!ref.order)
		stack_trace("Action of [ref.type] was attempted to be added as an order.")
	ongoing_order = ref

/datum/human_ai_brain/proc/has_ongoing_order(path)
	return istype(ongoing_order, path)

/datum/human_ai_brain/proc/clear_ongoing_order()
	ongoing_order = null

/// Returns TRUE if the target is friendly/neutral to us
/datum/human_ai_brain/proc/faction_check(mob/target)
	if(!target)
		return FALSE

	if(target.faction == tied_human.faction)
		return TRUE

	if(target.faction in friendly_factions)
		return TRUE

	if(target.faction in neutral_factions)
		return TRUE

	return FALSE

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
	if(tied_human.client)
		return

	if(entering == tied_human)
		return

	if(istype(entering, /obj/projectile))
		var/obj/projectile/bullet = entering
		if(ismob(bullet.firer))
			if(!current_cover && !squad_covering && !faction_check(bullet.firer)) // If it's our own bullets, we don't need to be alarmed
				if(!has_ongoing_order(/datum/ongoing_action/order/sniper_nest))
					try_cover(bullet)
				enter_combat()

/datum/human_ai_brain/proc/on_move(atom/movable/mover, atom/oldloc, direction)
	setup_detection_radius()
	if(in_cover)
		end_cover()

/datum/human_ai_brain/proc/enter_combat()
	SIGNAL_HANDLER
	if(squad_id) // call for help
		var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict["[squad_id]"]
		for(var/datum/human_ai_brain/squaddie as anything in squad.ai_in_squad)
			if(squaddie.current_target)
				continue
			if(get_dist(squaddie.tied_human, tied_human) > squaddie.view_distance)
				continue
			if(!squaddie.can_target(current_target))
				continue
			squaddie.current_target = current_target
			squaddie.RegisterSignal(current_target, COMSIG_PARENT_QDELETING, PROC_REF(on_target_delete), TRUE)

	if(tied_human.client)
		return

	if(!in_combat)
		say_in_combat_line()
	in_combat = TRUE
	addtimer(CALLBACK(src, PROC_REF(exit_combat)), rand(combat_decay_time_min, combat_decay_time_max), TIMER_UNIQUE | TIMER_NO_HASH_WAIT | TIMER_OVERRIDE)

/datum/human_ai_brain/proc/exit_combat()
	if(tied_human.client)
		return

	if(in_combat)
		tied_human.a_intent = INTENT_DISARM
		current_target = null
		say_exit_combat_line()
		holster_primary()

	if(current_cover)
		if(prob(peek_cover_chance))
			ADD_ONGOING_ACTION(src, AI_ACTION_APPROACH_CAREFUL, target_floor, 1)
		end_cover()

	in_combat = FALSE

/datum/human_ai_brain/proc/can_process_order()
	if(!ongoing_order)
		return FALSE

	if(!ongoing_order.can_perform_in_combat && in_combat)
		return FALSE

	return TRUE

/datum/human_ai_brain/proc/on_shot(datum/source, damage_result, ammo_flags, obj/projectile/bullet)
	SIGNAL_HANDLER
	if(tied_human.client)
		return

	var/mob/firer = bullet.firer
	if(firer?.faction in neutral_factions)
		on_neutral_faction_betray(firer.faction)

	if(allowed_return_fire && (get_dist(tied_human, firer) > view_distance) && (primary_weapon?.ammo.max_range > view_distance))
		COOLDOWN_START(src, return_fire, return_fire_duration)

	if(!faction_check(firer))
		if(current_target != firer)
			end_gun_fire()
		current_target = firer
		RegisterSignal(firer, COMSIG_PARENT_QDELETING, PROC_REF(on_target_delete), TRUE)
		if(!current_cover)
			try_cover(bullet)
		else if(in_cover)
			on_shot_inside_cover(bullet)

/datum/human_ai_brain/proc/on_neutral_faction_betray(faction)
	if(!tied_human.faction)
		return

	var/datum/human_ai_faction/our_faction = SShuman_ai.human_ai_factions[tied_human.faction]
	if(!our_faction)
		return

	our_faction.remove_neutral_faction(faction)
	our_faction.reapply_faction_data()

/datum/human_ai_brain/proc/on_handcuffed(datum/source)
	SIGNAL_HANDLER

	if((tied_human.stat >= DEAD) || tied_human.client)
		return

	message_admins("AI human [tied_human.real_name] has been handcuffed while alive or unconscious.", tied_human.x, tied_human.y, tied_human.z)

/datum/human_ai_brain/proc/get_ai_brain(datum/source, list/out_brain)
	SIGNAL_HANDLER

	out_brain += src


/mob/living/carbon/human/proc/get_ai_brain()
	RETURN_TYPE(/datum/human_ai_brain)

	var/list/out_brain = list()
	SEND_SIGNAL(src, COMSIG_HUMAN_GET_AI_BRAIN, out_brain)
	if(length(out_brain))
		return out_brain[1]
