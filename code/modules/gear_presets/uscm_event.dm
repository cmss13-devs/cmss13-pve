/datum/equipment_preset/uscm_event
	name = "USCM (Event Roles)"
	faction = FACTION_MARINE
	faction_group = FACTION_LIST_MARINE
	minimum_age = 30
	languages = list(LANGUAGE_ENGLISH)


/*****************************************************************************************************/

/datum/equipment_preset/uscm_event/colonel
	name = "USCM O-6 - Colonel (High Command)"
	flags = EQUIPMENT_PRESET_EXTRA

	idtype = /obj/item/card/id/general
	access = list(ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_MORGUE)
	assignment = JOB_COLONEL
	rank = JOB_COLONEL
	paygrade = "MO6"
	role_comm_title = "COL"
	minimum_age = 40
	skills = /datum/skills/general
	languages = ALL_HUMAN_LANGUAGES //Know your enemy.

	utility_under = list(/obj/item/clothing/under/marine)
	utility_hat = list(/obj/item/clothing/head/cmcap)

	service_under = list(/obj/item/clothing/under/marine/service)
	service_shoes = list(/obj/item/clothing/shoes/laceup)
	service_extra = list(/obj/item/clothing/suit/storage/jacket/marine/service)
	service_hat = list(/obj/item/clothing/head/marine/peaked)

	dress_under = list(/obj/item/clothing/under/marine/blues/nco)
	dress_hat = list(/obj/item/clothing/head/marine/dress_cover/officer)
	dress_shoes = list(/obj/item/clothing/shoes/laceup)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer)

/datum/equipment_preset/uscm_event/colonel/New()
	. = ..()
	access = get_access(ACCESS_LIST_GLOBAL)

/datum/equipment_preset/uscm_event/colonel/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/highcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/service(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/marine/peaked(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/mateba/cmateba/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/telebaton, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/flash, WEAR_IN_JACKET)

/datum/equipment_preset/uscm_event/general
	name = "USCM O-7 - Brigadier General (High Command)"
	flags = EQUIPMENT_PRESET_EXTRA

	idtype = /obj/item/card/id/general
	access = list(ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY, ACCESS_MARINE_MORGUE)
	assignment = JOB_GENERAL
	rank = JOB_GENERAL
	paygrade = "MO7"
	role_comm_title = "GEN"
	minimum_age = 50
	skills = /datum/skills/general
	languages = ALL_HUMAN_LANGUAGES //Know your enemy.

	service_under = list(/obj/item/clothing/under/marine/service)
	service_shoes = list(/obj/item/clothing/shoes/laceup)
	service_extra = list(/obj/item/clothing/suit/storage/jacket/marine/service)
	service_hat = list(/obj/item/clothing/head/marine/peaked)

/datum/equipment_preset/uscm_event/general/New()
	. = ..()
	access = get_access(ACCESS_LIST_GLOBAL)

/datum/equipment_preset/uscm_event/general/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/service(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/highcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/mateba/general(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/marine/peaked(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/large/mateba/impact(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/cotablet(new_human.back), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/mateba_case/general(new_human.back), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/handcuffs(new_human.back), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/telebaton, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/flash, WEAR_IN_JACKET)

/datum/equipment_preset/uscm_event/general/o7
	name = "USCM O-7 - Brigadier General (High Command)"
	paygrade = "MO7"

/datum/equipment_preset/uscm_event/general/o8
	name = "USCM O-8 - Major General (High Command)"
	paygrade = "MO8"

/datum/equipment_preset/uscm_event/general/o9
	name = "USCM O-9 - Lieutenant General (High Command)"
	paygrade = "MO9"

/datum/equipment_preset/uscm_event/general/o10
	name = "USCM O-10 - General (High Command)"
	paygrade = "MO10"

/datum/equipment_preset/uscm_event/general/o10c
	name = "USCM O-10C - Assistant Commandant of the Marine Corps (High Command)"
	paygrade = "MO10C"
	assignment = JOB_ACMC
	rank = JOB_ACMC
	role_comm_title = "ACMC"

/datum/equipment_preset/uscm_event/general/o10s
	name = "USCM O-10S - Commandant of the Marine Corps (High Command)"
	paygrade = "MO10S"
	assignment = JOB_CMC
	rank = JOB_CMC
	role_comm_title = "CMC"

/*****************************************************************************************************/

/datum/equipment_preset/uscm_event/uaac/tis
	name = "UAAC-TIS"

	idtype = /obj/item/card/id/provost
	skills = /datum/skills/provost

/datum/equipment_preset/uscm_event/uaac/tis/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL)

/datum/equipment_preset/uscm_event/uaac/tis/io
	name = "UAAC-TIS Intelligence Officer (NO2)"
	minimum_age = 25
	skills = /datum/skills/intel

	assignment = JOB_TIS_IO
	rank = "UAAC-TIS Intelligence Officer"
	paygrade = "NO2"
	role_comm_title = "TIS-IO"
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/uscm_event/uaac/tis/io/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/highcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder(new_human), WEAR_L_STORE)
