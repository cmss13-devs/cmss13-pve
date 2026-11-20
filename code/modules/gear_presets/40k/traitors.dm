/datum/equipment_preset/traitors
	name = "Traitor Forces"
	faction = FACTION_TRAITOR
	faction_group = list(FACTION_TRAITOR)
	languages = list(LANGUAGE_ENGLISH)
	var/headset_type = /obj/item/device/radio/headset/distress/imperial/traitor
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/traitors/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/traitors/cultist
	name = "Traitor Cultist (Pistol)"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_TRAITOR
	paygrades = list(PAY_SHORT_TRA = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/traitors/cultist/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "Naval Infantry Telnyashka"
	if(prob(85))
		add_cultist_mask(new_human)
	//uniform
	add_cultist_uniform(new_human)
	if(prob(85))
		add_cultist_armour(new_human)
	//limbs
	add_worker_shoe(new_human)
	add_cultist_pistol(new_human)

/datum/equipment_preset/traitors/cultist/rifle
	name = "Traitor Cultist (Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_TRAITOR
	paygrades = list(PAY_SHORT_TRA = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/traitors/cultist/rifle/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "Naval Infantry Telnyashka"
	if(prob(85))
		add_cultist_mask(new_human)
	//uniform
	add_cultist_uniform(new_human)
	if(prob(85))
		add_cultist_armour(new_human)
	//limbs
	add_worker_shoe(new_human)
	add_cultist_rifle(new_human)

/datum/equipment_preset/traitors/guard
	name = "Traitor Guardsman"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_TRAITOR
	paygrades = list(PAY_SHORT_TRAG = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/traitors/guard/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard/traitor(new_human), WEAR_HEAD)
	else
		add_cultist_mask(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard/traitor(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard/traitor(new_human), WEAR_JACKET)

	add_traitor_guardsman_ranged(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)

/datum/equipment_preset/traitors/guard/flamer
	name = "Traitor Guardsman (Flamer)"

/datum/equipment_preset/traitors/guard/flamer/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard/traitor(new_human), WEAR_HEAD)
	else
		add_cultist_mask(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard/traitor(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard/traitor(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/imperial/weak(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/imperial(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/imperial(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)

/datum/equipment_preset/traitors/guard/enforcer
	name = "Traitor Guard Enforcer"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_TRAITOR
	paygrades = list(PAY_SHORT_TRAE = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/traitors/guard/enforcer/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	if(prob(35))
		add_cultist_mask(new_human)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard/elite/traitor(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard/traitor(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human),WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard/elite/traitor(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/heretic(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
