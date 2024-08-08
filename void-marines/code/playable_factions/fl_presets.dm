/datum/equipment_preset/uscm/pfc/fl
	name = "Freelancer Marauder"
	paygrade = "Freelancer Standard"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP)
	role_comm_title = "FL"

/datum/equipment_preset/uscm/pfc/fl/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

/datum/equipment_preset/uscm/smartgunner/fl
	name = "Freelancer Machinegunner"
	paygrade = "Freelancer Standard"
	assignment = "Machinegunner"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_SMARTGUNNER)
	role_comm_title = "MG"

/datum/equipment_preset/uscm/smartgunner/fl/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

/datum/equipment_preset/uscm/rto/fl
	name = "Radio Jockey"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_CO)
	paygrade = "Freelancer Standard"
	role_comm_title = "RJ"

/datum/equipment_preset/uscm/rto/fl/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

/datum/equipment_preset/uscm/medic/fl
	name = "Freelancer Surgeon"
	paygrade = "Freelancer Medic"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_MEDICAL)
	assignment = "Surgeon"
	role_comm_title = "Srg"

/datum/equipment_preset/uscm/medic/fl/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine/medic/upp

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

/datum/equipment_preset/uscm/tl/fl
	name = "Freelancer Cutthroat"
	paygrade = "Freelancer Standard"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_TEAMLEAD)

/datum/equipment_preset/uscm/tl/fl/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

/datum/equipment_preset/uscm/leader/fl
	name = "Freelancer Master At Arms"
	access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_ILLEGAL_PIRATE_PREP, ACCESS_ILLEGAL_PIRATE_SENIOR_LEAD)
	paygrade = "Freelancer Leader"
	role_comm_title = "MAA"

/datum/equipment_preset/uscm/leader/fl/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/lightpack
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
