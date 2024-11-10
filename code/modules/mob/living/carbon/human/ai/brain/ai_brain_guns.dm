/datum/human_ai_brain
	var/obj/item/weapon/gun/primary_weapon
	//var/obj/item/weapon/primary_melee
	/// Appraisal datum
	var/datum/firearm_appraisal/gun_data
	/// If we've tried to reload (and failed) with our current inventory
	var/tried_reload = FALSE
	/// Cooldown for if we've fired too many rounds in a burst (for recoil)
	COOLDOWN_DECLARE(fire_overload_cooldown)

/datum/human_ai_brain/proc/should_reload()
	if(!primary_weapon)
		return FALSE

	if(primary_weapon.in_chamber)
		return FALSE

	if(!primary_weapon.current_mag)
		return TRUE

	if(primary_weapon.current_mag.current_rounds > 0)
		return FALSE

	return TRUE

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
