/datum/equipment_preset/usa/guardsman
	name = "Imperial Guardsman"
	assignment = JOB_ARMY_TROOPER
	rank = JOB_ARMY_TROOPER
	paygrades = list(PAY_SHORT_AE2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TRPR"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/trooper

/datum/equipment_preset/usa/guardsman/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	add_combat_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife(new_human), WEAR_FEET)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/standard(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
