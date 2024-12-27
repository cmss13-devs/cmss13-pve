/datum/equipment_preset/colonist/bluecollar/rebel
	name = "Rebel, Guerilla"
	flags = EQUIPMENT_PRESET_EXTRA
	faction_group = FACTION_LIST_CLF
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pfc
	access = list(ACCESS_CIVILIAN_PUBLIC)

/datum/equipment_preset/colonist/bluecollar/rebel/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	if(prob(65))
		add_facewrap(new_human)
	//head
	//uniform
	add_civilian_uniform(new_human)
	//jacket
	add_civilian_jacket(new_human)
	//limbs
	add_civilian_shoe(new_human)
	add_survivor_weapon_pistol(new_human)

/datum/equipment_preset/colonist/bluecollar/rebel/soldier
	name = "Rebel, Guerilla (Veteran)"
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/colonist/bluecollar/rebel/soldier/get_assignment(mob/living/carbon/human/new_human)
	if(prob(85))
		return "Rifleman"
	return "Squad Leader"

/datum/equipment_preset/colonist/bluecollar/rebel/soldier/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_ua_helmet(new_human)
	//uniform
	add_rebel_uniform(new_human)
	//jacket
	add_rebel_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	//limbs
	add_rebel_shoes(new_human)
	add_rebel_gloves(new_human)
	add_rebel_weapon(new_human)

/datum/equipment_preset/colonist/bluecollar/rebel/medic
	name = "Rebel, Guerilla (Medic)"
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)
	skills = /datum/skills/corpsman

/datum/equipment_preset/colonist/bluecollar/rebel/medic/get_assignment(mob/living/carbon/human/new_human)
	if(prob(50))
		return "Medic"
	return "Corpsman"

/datum/equipment_preset/colonist/bluecollar/rebel/medic/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/tech(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_ua_helmet(new_human)
	//uniform
	add_rebel_uniform(new_human)
	//jacket
	add_rebel_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full(new_human), WEAR_WAIST)
	//limbs
	add_rebel_shoes(new_human)
	add_rebel_weapon(new_human)

/datum/equipment_preset/colonist/bluecollar/rebel/at
	name = "Rebel, Guerilla (Anti-Tank)"
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)
	skills = /datum/skills/corpsman

/datum/equipment_preset/colonist/bluecollar/rebel/at/get_assignment(mob/living/carbon/human/new_human)
	if(prob(50))
		return "Rifleman"
	return "Rocketeer"

/datum/equipment_preset/colonist/bluecollar/rebel/at/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/prop/folded_anti_tank_sadar(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_ua_helmet(new_human)
	//uniform
	add_rebel_uniform(new_human)
	//jacket
	add_rebel_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/vp70_near_empty(new_human), WEAR_WAIST)
	//limbs
	add_rebel_shoes(new_human)
