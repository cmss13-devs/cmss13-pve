/datum/equipment_preset/canc
	name = "CANC Rebel"
	languages = list(LANGUAGE_CHINESE)
	ethnicity = CHINESE_ETHNICITY
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_CANC
	faction_group = FACTION_LIST_CANC
	skills = /datum/skills/pfc
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	origin_override = ORIGIN_CANC
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/canc/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/canc/rifleman
	name = "CANC Rebel, Rifleman"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_CANC
	faction_group = FACTION_LIST_CANC
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	assignment = "Rifleman"
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/canc/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/canc(new_human), WEAR_L_EAR)
	if(prob(65))
		add_neckerchief(new_human)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/canc(new_human), WEAR_HEAD)
	//uniform
	add_canc_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/ranks/canc(new_human), WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/CANC(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/preloaded(new_human), WEAR_J_STORE)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/guard(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown(new_human), WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/upp(new_human), WEAR_R_STORE)
