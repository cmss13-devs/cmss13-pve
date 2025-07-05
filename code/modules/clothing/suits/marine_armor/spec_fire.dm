#define FIRE_SHIELD_CD 150

/obj/item/clothing/suit/storage/marine/M35
	name = "\improper M35 pyrotechnician armor"
	desc = "A custom set of M35 armor designed for use by USCM Pyrotechnicians. Prototype cooling and heat dissipation systems ensure the wearer is effectively fireproof."
	icon_state = "pyro_armor"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	light_range = 5
	fire_intensity_resistance = BURN_LEVEL_TIER_1
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROT
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_FEET
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_FEET
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_FEET
	specialty = "M35 pyrotechnician"
	unacidable = TRUE
	var/fire_shield_on = TRUE
	var/can_activate = FALSE

/obj/item/clothing/suit/storage/marine/M35/equipped(mob/user, slot)
	if(slot == WEAR_JACKET)
		RegisterSignal(user, COMSIG_LIVING_FLAMER_CROSSED, PROC_REF(flamer_fire_callback))
	..()

/// This proc is solely so that IgniteMob() fails
/obj/item/clothing/suit/storage/marine/M35/proc/fire_shield_is_on(mob/living/L)
	SIGNAL_HANDLER

	if(L.fire_reagent?.fire_penetrating)
		return

	return COMPONENT_CANCEL_IGNITION

/obj/item/clothing/suit/storage/marine/M35/proc/flamer_fire_callback(mob/living/L, datum/reagent/R)
	SIGNAL_HANDLER

	if(R.fire_penetrating)
		return

	. = COMPONENT_NO_IGNITE
	if(fire_shield_on)
		. |= COMPONENT_NO_BURN

/obj/item/clothing/suit/storage/marine/M35/dropped(mob/user)
	if (!istype(user))
		return
	UnregisterSignal(user, list(
		COMSIG_LIVING_PREIGNITION,
		COMSIG_LIVING_FLAMER_CROSSED,
		COMSIG_LIVING_FLAMER_FLAMED,
	))
	..()

#undef FIRE_SHIELD_CD
/*
/datum/action/item_action/specialist/fire_shield
	ability_primacy = SPEC_PRIMARY_ACTION_2

/datum/action/item_action/specialist/fire_shield/New(mob/living/user, obj/item/holder)
	..()
	name = "Activate Fire Shield"
	button.name = name
	button.overlays.Cut()
	var/image/IMG = image('icons/obj/items/clothing/cm_suits.dmi', button, "pyro_armor")
	button.overlays += IMG

/datum/action/item_action/specialist/fire_shield/action_cooldown_check()
	var/obj/item/clothing/suit/storage/marine/M35/armor = holder_item
	if (!istype(armor))
		return FALSE

	return !armor.can_activate

/datum/action/item_action/specialist/fire_shield/can_use_action()
	var/mob/living/carbon/human/H = owner
	if(istype(H) && !H.is_mob_incapacitated() && H.wear_suit == holder_item)
		return TRUE

/datum/action/item_action/specialist/fire_shield/action_activate()
	. = ..()
	var/obj/item/clothing/suit/storage/marine/M35/armor = holder_item
	if (!istype(armor))
		return

	armor.fire_shield()
*/
