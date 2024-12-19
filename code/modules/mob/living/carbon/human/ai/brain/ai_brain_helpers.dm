/mob/living/carbon/human/proc/get_ai_brain()
	RETURN_TYPE(/datum/human_ai_brain)

	var/list/out_brain = list()
	SEND_SIGNAL(src, COMSIG_HUMAN_GET_AI_BRAIN, out_brain)
	if(length(out_brain))
		return out_brain[1]


/datum/human_ai_brain/proc/get_ai_brain(datum/source, list/out_brain)
	SIGNAL_HANDLER

	out_brain += src

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
/datum/human_ai_brain/proc/faction_check(atom/target)
	if(isdefenses(target))
		var/obj/structure/machinery/defenses/defense_target = target
		if(tied_human.faction in defense_target.faction_group)
			return TRUE
		return FALSE

	if(ismob(target))
		var/mob/mob_target = target

		if(mob_target.faction == tied_human.faction)
			return TRUE

		if(mob_target.faction in friendly_factions)
			return TRUE

		if(mob_target.faction in neutral_factions)
			return TRUE

	return FALSE

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

/datum/human_ai_brain/proc/ensure_primary_hand(obj/item/held_item)
	if(tied_human.get_inactive_hand() == held_item)
		tied_human.swap_hand()

/datum/human_ai_brain/proc/unholster_primary()
	if(!primary_weapon || tied_human.l_hand == primary_weapon || tied_human.r_hand == primary_weapon)
		return

	var/cur_hand = tied_human.get_active_hand()
	if(cur_hand)
		tied_human.drop_held_item(cur_hand)

	tied_human.u_equip(primary_weapon)
	tied_human.put_in_active_hand(primary_weapon)

	primary_weapon.guaranteed_delay_time = world.time
	primary_weapon.wield_time = world.time
	primary_weapon.pull_time = world.time

/datum/human_ai_brain/proc/wield_primary()
	primary_weapon?.wield(tied_human)

/datum/human_ai_brain/proc/wield_primary_sleep()
	wield_primary()
	sleep(max(primary_weapon?.wield_delay, short_action_delay * action_delay_mult))

/datum/human_ai_brain/proc/holster_primary()
	if(tied_human.s_store || (tied_human.l_hand != primary_weapon && tied_human.r_hand != primary_weapon))
		return FALSE

	return tied_human.equip_to_slot_if_possible(primary_weapon, WEAR_J_STORE, TRUE)

/// Melee system currently only supports bootknives.
/datum/human_ai_brain/proc/unholster_melee()
	if(istype(tied_human.l_hand, /obj/item) || istype(tied_human.r_hand, /obj/item))
		return TRUE

	var/cur_hand = tied_human.get_active_hand()
	if(cur_hand)
		tied_human.drop_held_item(cur_hand)

	if(tied_human.shoes)
		var/obj/item/melee_weapon = tied_human.shoes.remove_item(tied_human)
		drawn_melee_weapon = melee_weapon
		RegisterSignal(drawn_melee_weapon, COMSIG_ITEM_DROPPED, PROC_REF(on_melee_dropped))
		return melee_weapon

/datum/human_ai_brain/proc/on_melee_dropped()
	SIGNAL_HANDLER

	UnregisterSignal(drawn_melee_weapon, COMSIG_ITEM_DROPPED)
	drawn_melee_weapon = null

/datum/human_ai_brain/proc/holster_melee()
	if(!drawn_melee_weapon || (drawn_melee_weapon.loc != tied_human))
		on_melee_dropped()
		return TRUE

	if(tied_human.shoes && tied_human.shoes.can_be_inserted(drawn_melee_weapon))
		return tied_human.shoes.attempt_insert_item(tied_human, drawn_melee_weapon)

	tied_human.drop_held_item(drawn_melee_weapon)
	return

/datum/human_ai_brain/proc/unholster_any_weapon()
	if(unholster_melee())
		tied_human.a_intent_change(INTENT_GRAB)
		return TRUE
	if(primary_weapon)
		unholster_primary()
		ensure_primary_hand(primary_weapon)
		wield_primary()
		tied_human.a_intent_change(INTENT_GRAB)
		return TRUE
	// insert any viable weapon slot macros in here
