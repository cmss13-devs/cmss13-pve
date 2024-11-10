GLOBAL_LIST_EMPTY(human_ai_brains)

/datum/human_ai_brain
	var/mob/living/carbon/human/tied_human

	var/micro_action_delay = 0.2 SECONDS
	var/short_action_delay = 0.5 SECONDS
	var/medium_action_delay = 2 SECONDS
	var/long_action_delay = 5 SECONDS
	var/action_delay_mult = 1

	/// If TRUE, shoots until the target is dead. Else, stops when downed
	var/shoot_to_kill = TRUE

	/// Distance for view checks
	var/view_distance = 7

	/// Should we limit our FOV in case view_distance is more than 7
	var/scope_vision = TRUE

	/// List of whitelisted/blacklisted action datums
	var/list/action_whitelist = null
	var/list/action_blacklist = null

	/// List of current action datums
	var/list/ongoing_actions = list()

	/// Semi-permanent "order" datum. Does not expire
	var/datum/ai_order/current_order

	var/list/detection_turfs = list()

	var/in_combat = FALSE
	var/combat_decay_time_min = 15 SECONDS
	var/combat_decay_time_max = 30 SECONDS

	var/peek_cover_chance = 60

	var/list/friendly_factions = list()
	var/list/neutral_factions = list()
	var/previous_faction

	var/squad_covering = FALSE

	/// If false, cannot be assigned to a squad
	var/can_assign_squad = TRUE

/datum/human_ai_brain/New(mob/living/carbon/human/tied_human)
	. = ..()
	src.tied_human = tied_human
	RegisterSignal(tied_human, COMSIG_PARENT_QDELETING, PROC_REF(on_human_delete))
	RegisterSignal(tied_human, COMSIG_HUMAN_EQUIPPED_ITEM, PROC_REF(on_item_equip))
	RegisterSignal(tied_human, COMSIG_HUMAN_UNEQUIPPED_ITEM, PROC_REF(on_item_unequip))
	RegisterSignal(tied_human, COMSIG_MOB_PICKUP_ITEM, PROC_REF(on_item_pickup))
	RegisterSignal(tied_human, COMSIG_MOB_DROP_ITEM, PROC_REF(on_item_drop))
	RegisterSignal(tied_human, COMSIG_MOB_DEATH, PROC_REF(reset_ai))
	RegisterSignal(tied_human, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))
	RegisterSignal(tied_human, COMSIG_HUMAN_BULLET_ACT, PROC_REF(on_shot))
	RegisterSignal(tied_human, COMSIG_HUMAN_HANDCUFFED, PROC_REF(on_handcuffed))
	RegisterSignal(tied_human, COMSIG_HUMAN_GET_AI_BRAIN, PROC_REF(get_ai_brain))
	GLOB.human_ai_brains += src
	setup_detection_radius()
	appraise_inventory()

/datum/human_ai_brain/Destroy(force, ...)
	GLOB.human_ai_brains -= src
	tied_human = null

	reset_ai()

	return ..()

/datum/human_ai_brain/proc/reset_ai()
	end_cover()

	in_combat = FALSE

	target_turf = null
	shot_at = null
	lose_target()

	for(var/action in ongoing_actions)
		qdel(action)

	ongoing_actions.Cut()

/datum/human_ai_brain/process(delta_time)
	if(tied_human.is_mob_incapacitated())
		for(var/action in ongoing_actions)
			qdel(action)
		ongoing_actions.Cut()
		lose_target()
		return

	var/possible_target = get_target()
	if(possible_target)
		lose_target()
		set_target(possible_target)

	if(current_target)
		enter_combat()

	// Might be wise to move this off tick and instead make it signal-based
	item_search(range(2, tied_human))

	// List all allowed action types for AI to consider
	var/list/allowed_actions = action_whitelist || (GLOB.AI_actions.Copy() - action_blacklist)
	for(var/datum/ongoing_action as anything in ongoing_actions)
		if(is_type_in_list(ongoing_action, allowed_actions))
			allowed_actions -= ongoing_action.type

	// Create assoc list of selected AI actions and their weight
	var/list/possible_actions = list()
	for(var/action_type in shuffle(allowed_actions))
		var/datum/ai_action/glob_ref = GLOB.AI_actions[action_type]
		var/weight = glob_ref.get_weight(src)
		if(weight) // No weight means we shouldn't consider this action at all
			possible_actions[action_type] = weight

	// Sorts all allowed actions by their weight
	var/list/sorted_actions = sortTim(possible_actions, GLOBAL_PROC_REF(cmp_numeric_dsc), TRUE)

	// Choose what actions to start in current process() iteration
	for(var/action_type as anything in sorted_actions)
		var/datum/ai_action/possible_action = GLOB.AI_actions[action_type]

		var/list/conflicting_actions = possible_action.get_conflicts(src)
		for(var/datum/ai_action/ongoing_action as anything in ongoing_actions)
			if(ongoing_action.type in conflicting_actions)
				possible_action = null
				break

		if(!possible_action)
			continue

		ongoing_actions += new action_type(src)
#ifdef TESTING
		message_admins("action of type [action_type] was added to [tied_human.real_name]")
#endif

	for(var/datum/ai_action/action as anything in ongoing_actions)
		var/retval = action.trigger_action()
		switch(retval)
			if(ONGOING_ACTION_UNFINISHED_BLOCK)
				return
			if(ONGOING_ACTION_COMPLETED)
				qdel(action)

/datum/human_ai_brain/proc/set_target(mob/living/new_target)
	if(!new_target)
		return

	RegisterSignal(new_target, COMSIG_PARENT_QDELETING, PROC_REF(on_target_delete), TRUE)
	RegisterSignal(new_target, COMSIG_MOB_DEATH, PROC_REF(on_target_death), TRUE)
	RegisterSignal(new_target, COMSIG_MOVABLE_MOVED, PROC_REF(on_target_move), TRUE)
	current_target = new_target
	target_turf = get_turf(current_target)

/datum/human_ai_brain/proc/lose_target()
	if(istype(current_target))
		UnregisterSignal(current_target, COMSIG_PARENT_QDELETING)
		UnregisterSignal(current_target, COMSIG_MOB_DEATH)
		UnregisterSignal(current_target, COMSIG_MOVABLE_MOVED)
	current_target = null

/datum/human_ai_brain/proc/update_target_pos()
	if(current_target)
		if(tied_human in viewers(view_distance, current_target))
			target_turf = get_turf(current_target)
		else
			COOLDOWN_START(src, fire_offscreen, 2 SECONDS)
			lose_target()

/datum/human_ai_brain/proc/on_target_delete(datum/source, force)
	SIGNAL_HANDLER
	lose_target()
	target_turf = null

/datum/human_ai_brain/proc/on_target_death(datum/source)
	SIGNAL_HANDLER
	lose_target()
	target_turf = null

/datum/human_ai_brain/proc/on_target_move(atom/oldloc, dir, forced)
	SIGNAL_HANDLER
	update_target_pos()

/datum/human_ai_brain/proc/on_human_delete(datum/source, force)
	SIGNAL_HANDLER
	tied_human = null

/datum/human_ai_brain/proc/ensure_primary_hand(obj/item/held_item)
	if(tied_human.get_inactive_hand() == held_item)
		tied_human.swap_hand()

/datum/human_ai_brain/proc/has_ongoing_action(path)
	if(!ispath(path))
		return FALSE

	for(var/datum/ai_action/action as anything in ongoing_actions)
		if(istype(action, path))
			return TRUE

	return FALSE

/datum/human_ai_brain/proc/set_current_order(datum/ai_order/ref)
	if(!ref)
		return

	current_order = ref
	current_order.brains += src

/datum/human_ai_brain/proc/remove_current_order()
	if(current_order)
		current_order.brains -= src
	current_order = null

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

		enter_combat()

		var/mob/firer = bullet.firer
		if(firer?.faction in neutral_factions)
			on_neutral_faction_betray(firer.faction)

		if(faction_check(firer))
			return

		if(get_dist(tied_human, firer) <= view_distance)
			set_target(firer)
		else
			COOLDOWN_START(src, fire_offscreen, 4 SECONDS)
			target_turf = get_turf(firer)

/datum/human_ai_brain/proc/on_move(atom/oldloc, direction, forced)
	setup_detection_radius()

	if(in_cover)
		end_cover()

	update_target_pos()

/datum/human_ai_brain/proc/enter_combat()
	SIGNAL_HANDLER
	if(squad_id) // call for help
		var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict["[squad_id]"]
		for(var/datum/human_ai_brain/squaddie as anything in squad.ai_in_squad)
			if(squaddie.target_turf)
				continue
			if(get_dist(squaddie.tied_human, tied_human) > squaddie.view_distance)
				continue
			if(!squaddie.can_target(current_target))
				continue
			squaddie.target_turf = target_turf

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
		lose_target()
		say_exit_combat_line()
		if(!sniper_home)
			holster_primary()

	if(current_cover)
		if(!prob(peek_cover_chance))
			target_turf = null
		end_cover()
	else
		target_turf = null

	in_combat = FALSE

/datum/human_ai_brain/proc/on_shot(datum/source, damage_result, ammo_flags, obj/projectile/bullet)
	SIGNAL_HANDLER
	if(tied_human.client)
		return

	enter_combat()

	var/mob/firer = bullet.firer
	if(firer?.faction in neutral_factions)
		on_neutral_faction_betray(firer.faction)

	if(faction_check(firer))
		return

	if(get_dist(tied_human, firer) <= view_distance)
		set_target(firer)
	else
		COOLDOWN_START(src, fire_offscreen, 4 SECONDS)
		target_turf = get_turf(firer)

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
