/datum/equipment_preset/cia
	name = "CIA"
	flags = null
	minimum_age = 25
	assignment = JOB_CIA
	skills = /datum/skills/cia
	languages = ALL_HUMAN_LANGUAGES
	faction = FACTION_MARINE

/datum/equipment_preset/cia/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL) + list(ACCESS_CIA)

/datum/equipment_preset/cia/analyst
	name = "CIA Agent (Civilian Clothing)"
	flags = EQUIPMENT_PRESET_EXTRA
	rank = "Intelligence Analyst"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	role_comm_title = PAY_SHORT_CIV
	minimap_background = "background_civillian"
	minimap_icon = "cia_ia"
	idtype = /obj/item/card/id/adaptive

/datum/equipment_preset/cia/analyst/load_gear(mob/living/carbon/human/new_human, client/mob_client)
	. = ..()

	//Give them a random piece of civvie clothing.
	var/random_outfit = pick(
		/obj/item/clothing/under/liaison_suit/black,
		/obj/item/clothing/under/liaison_suit/brown,
		/obj/item/clothing/under/liaison_suit/field,
		/obj/item/clothing/under/liaison_suit/outing,
	)

	var/random_suit = pick(
		/obj/item/clothing/suit/storage/jacket/marine/corporate/black,
		/obj/item/clothing/suit/storage/jacket/marine/corporate/brown,
		/obj/item/clothing/suit/storage/jacket/marine/corporate/blue,
		/obj/item/clothing/suit/storage/jacket/marine/bomber,
		/obj/item/clothing/suit/storage/jacket/marine/bomber/red,
		/obj/item/clothing/suit/storage/jacket/marine/bomber/grey,
		/obj/item/clothing/suit/storage/jacket/marine/vest,
		/obj/item/clothing/suit/storage/jacket/marine/vest/tan,
		/obj/item/clothing/suit/storage/jacket/marine/vest/grey,
	)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/cia(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new random_outfit(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new random_suit(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/lockable/liaison(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_IN_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/m1911/socom/equipped, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/device/portable_vendor/antag/cia/covert(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/camera(new_human), WEAR_IN_BACK)

/datum/equipment_preset/cia/officer
	name = "CIA Agent (USCM Liaison - 1st Lieutenant)"
	flags = EQUIPMENT_PRESET_EXTRA
	rank = "Intelligence Liaison Officer"
	assignment = JOB_CIA_LIAISON
	paygrades = list(PAY_SHORT_MO2 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/cia/officer
	role_comm_title = "ILO"
	minimum_age = 25
	minimap_icon = "cia_lo"
	minimap_background = "background_ua"
	idtype = /obj/item/card/id/adaptive

/datum/equipment_preset/cia/officer/load_gear(mob/living/carbon/human/new_human, client/mob_client)
	. = ..()

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/cia(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/bridge(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/m1911/socom(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/bridge(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/lockable/liaison(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/m1911(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/device/portable_vendor/antag/cia/covert(new_human), WEAR_IN_BACK)

/datum/equipment_preset/cia/officer/o3
	name = "CIA Agent (USCM Liaison - Captain)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_MO3 = JOB_PLAYTIME_TIER_0)
	minimum_age = 30

/datum/equipment_preset/uscm/marsoc/cia
	name = "CIA Agent (Marine Raider Advisor)"
	flags = EQUIPMENT_PRESET_EXTRA
	minimum_age = 30
	skills = /datum/skills/cia/officer

/datum/equipment_preset/uscm/marsoc/cia/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL) + list(ACCESS_CIA)

/datum/equipment_preset/uscm/marsoc/cia/load_gear(mob/living/carbon/human/new_human, client/mob_client)
	. = ..()
	new_human.equip_to_slot_or_del(new /obj/item/device/portable_vendor/antag/cia, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big, WEAR_EYES)

/// Spies ///

/datum/equipment_preset/rebel/cia
	name = "CIA Spy (UA Rebel Engineer)"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/cia
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	assignment = "Sapper"

/datum/equipment_preset/rebel/cia/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE) + list(ACCESS_CIA)

/datum/equipment_preset/rebel/cia/load_gear(mob/living/carbon/human/new_human, client/mob_client)
	new_human.undershirt = "undershirt"

	//head
	if(prob(45))
		add_facewrap(new_human)
	add_rebel_ua_helmet(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/rebel_ua, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/meson, WEAR_EYES)
	//uniform
	var/obj/item/clothing/under/colonist/boilersuit/darkblue/uniform = new()
	var/obj/item/clothing/accessory/storage/tool_webbing/equipped/webbing = new()
	uniform.attach_accessory(new_human, webbing)
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	//jacket
	add_rebel_ua_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	//limbs
	add_rebel_ua_shoes(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_HANDS)
	if(prob(25))
		add_rebel_ua_shotgun(new_human)
	else
		add_rebel_ua_rifle(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert, WEAR_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/device/portable_vendor/antag/cia, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/low_grade_full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_R_STORE)

/datum/equipment_preset/clf/engineer/cia
	name = "CIA Spy (TWE Rebel Engineer)"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/cia
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	assignment = "Revolutionary Sapper"

/datum/equipment_preset/clf/engineer/cia/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE) + list(ACCESS_CIA)

/datum/equipment_preset/clf/engineer/cia/load_gear(mob/living/carbon/human/new_human, client/mob_client)
	new_human.undershirt = "undershirt"

	//head
	if(prob(45))
		add_facewrap(new_human)
	add_rebel_twe_helmet(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/rebel_twe, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/meson, WEAR_EYES)
	//uniform
	var/obj/item/clothing/under/colonist/boilersuit/khaki/uniform = new()
	var/obj/item/clothing/accessory/storage/tool_webbing/equipped/webbing = new()
	uniform.attach_accessory(new_human, webbing)
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	//jacket
	add_rebel_twe_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	//limbs
	add_rebel_twe_shoes(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_HANDS)
	if(prob(25))
		add_rebel_twe_smg(new_human)
	else
		add_rebel_twe_rifle(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert, WEAR_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/device/portable_vendor/antag/cia, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/low_grade_full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_R_STORE)

/datum/equipment_preset/upp/rifleman/cia
	name = "CIA Spy (UPP Rifleman)"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/cia

/datum/equipment_preset/upp/rifleman/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE) + list(ACCESS_CIA)

/datum/equipment_preset/upp/rifleman/cia/load_gear(mob/living/carbon/human/new_human, client/mob_client)
	. = ..()
	new_human.equip_to_slot_or_del(new /obj/item/device/portable_vendor/antag/cia/covert, WEAR_IN_BACK)


/datum/equipment_preset/upp/officer/senior/cia
	name = "CIA Spy (UPP Senior Officer)"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/cia/officer

/datum/equipment_preset/upp/officer/senior/cia/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE) + list(ACCESS_CIA)

/datum/equipment_preset/upp/officer/senior/cia/load_gear(mob/living/carbon/human/new_human, client/mob_client)
	. = ..()
	new_human.equip_to_slot_or_del(new /obj/item/device/portable_vendor/antag/cia, WEAR_IN_BACK)


