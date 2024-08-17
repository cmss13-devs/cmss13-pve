/datum/equipment_preset/uscm/lancer
	name = "Freelancer Marauder"
	paygrade = "Freelancer Marauder"
	role_comm_title = "FL"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP)
	faction_group = list(FACTION_FREELANCER)
	faction = FACTION_FREELANCER
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	assignment = "Marauder"
	rank = JOB_SQUAD_MARINE
	skills = /datum/skills/pfc
	minimap_icon = "private"

/datum/equipment_preset/uscm/lancer/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)

/datum/equipment_preset/uscm/lancer/smartgunner
	name = "Freelancer Machinegunner"
	paygrade = "Freelancer Gunner"
	role_comm_title = "MG"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_SMARTGUNNER)
	assignment = "Machinegunner"
	rank = JOB_SQUAD_SMARTGUN
	skills = /datum/skills/smartgunner
	minimap_icon = "smartgunner"

/datum/equipment_preset/uscm/lancer/smartgunner/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)

/datum/equipment_preset/uscm/lancer/rto
	name = "Radio Jockey"
	paygrade = "Freelancer Jokey"
	role_comm_title = "RJ"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_CO)
	assignment = "Radio Jokey"
	rank = JOB_SQUAD_RTO
	skills = /datum/skills/SL
	minimap_icon = "rto"

/datum/equipment_preset/uscm/lancer/rto/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)

/datum/equipment_preset/uscm/lancer/med
	name = "Freelancer Surgeon"
	paygrade = "Freelancer Medic"
	role_comm_title = "Srg"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_MEDICAL)
	assignment = "Surgeon"
	rank = JOB_SQUAD_MEDIC
	skills = /datum/skills/combat_medic
	minimap_icon = "medic"

/datum/equipment_preset/uscm/lancer/med/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine/medic/upp

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)

/datum/equipment_preset/uscm/lancer/tl
	name = "Freelancer Bruiser"
	paygrade = "Freelancer Standard"
	role_comm_title = "Bruiser"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_TEAMLEAD)
	assignment = "Bruiser"
	rank = JOB_SQUAD_TEAM_LEADER
	skills = /datum/skills/pmc/SL
	minimap_icon = "tl"

/datum/equipment_preset/uscm/lancer/tl/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)

/datum/equipment_preset/uscm/lancer/sl
	name = "Freelancer Warlord"
	paygrade = "Freelancer Leader"
	role_comm_title = "Warlord"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_SENIOR_LEAD)
	assignment = "Warlord"
	rank = JOB_SQUAD_LEADER
	skills = /datum/skills/pmc/SL
	minimap_icon = "leader"

/datum/equipment_preset/uscm/lancer/sl/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
