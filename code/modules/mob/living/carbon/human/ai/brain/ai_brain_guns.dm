/datum/human_ai_brain
	var/obj/item/weapon/gun/primary_weapon
	var/list/obj/item/weapon/gun/secondary_weapons = list()
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
