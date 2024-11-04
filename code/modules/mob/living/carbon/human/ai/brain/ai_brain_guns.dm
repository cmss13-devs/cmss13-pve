/datum/human_ai_brain
	var/obj/item/weapon/gun/primary_weapon
	//var/obj/item/weapon/primary_melee
	/// Currently firing a gun
	var/currently_firing = FALSE
	/// Appraisal datum
	var/datum/firearm_appraisal/gun_data
	/// How many rounds fired in this burst
	var/rounds_burst_fired = 0
	/// If we are currently in a reloading sequence
	var/currently_reloading = FALSE
	/// If we've tried to reload (and failed) with our current inventory
	var/tried_reload = FALSE
	/// Cooldown for if we've fired too many rounds in a burst (for recoil)
	COOLDOWN_DECLARE(fire_overload_cooldown)

/datum/human_ai_brain/proc/unholster_primary()
	if(tied_human.l_hand == primary_weapon || tied_human.r_hand == primary_weapon)
		return

	if(tied_human.get_active_hand())
		tied_human.drop_held_item(tied_human.get_active_hand())

	tied_human.u_equip(primary_weapon)
	tied_human.put_in_active_hand(primary_weapon)
	sleep(max(primary_weapon.wield_delay, short_action_delay * action_delay_mult))
	primary_weapon?.wield(tied_human)

/datum/human_ai_brain/proc/holster_primary()
	if(tied_human.s_store || (tied_human.l_hand != primary_weapon && tied_human.r_hand != primary_weapon))
		return

	if(currently_firing)
		end_gun_fire()
	tied_human.equip_to_slot(primary_weapon, WEAR_J_STORE)

/datum/human_ai_brain/proc/reload_primary()
	set waitfor = FALSE

	if(!primary_weapon || tried_reload)
		return

	currently_reloading = TRUE
	currently_busy = TRUE
	currently_firing = FALSE

	var/obj/item/ammo_magazine/mag = primary_ammo_search()
	if(!mag)
		tried_reload = TRUE
#ifdef TESTING
		to_chat(world, "[tied_human.name] tried to reload without ammo.")
#endif
		currently_reloading = FALSE
		currently_busy = FALSE
		return //soz
	gun_data.do_reload(mag, tied_human, src)
#ifdef TESTING
	to_chat(world, "[tied_human.name] reloaded [primary_weapon].")
#endif
	currently_reloading = FALSE
	currently_busy = FALSE

/datum/human_ai_brain/proc/primary_ammo_search()
	for(var/obj/item/ammo_magazine/mag as anything in equipment_map[HUMAN_AI_AMMUNITION])
		if(istype(primary_weapon, mag.gun_type) && mag.ai_can_use(tied_human, src))
			return mag

/datum/human_ai_brain/proc/should_reload_primary()
	if(!primary_weapon || gun_data?.disposable)
		return FALSE

	if(!primary_weapon.current_mag)
		return TRUE

	if(primary_weapon.current_mag.current_rounds > 0 || primary_weapon?.in_chamber)
		return FALSE
	return TRUE
