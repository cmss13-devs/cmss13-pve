// ----- Mercenary Survivors

// after double check pmc/miner isn't being used anywhere.
/datum/equipment_preset/survivor/pmc/miner
	name = "Survivor - Mercenary"
	flags = EQUIPMENT_PRESET_START_OF_ROUND

	assignment = "Mercenary"
	skills = /datum/skills/civilian/survivor/pmc
	flags = EQUIPMENT_PRESET_START_OF_ROUND
	access = list(ACCESS_CIVILIAN_PUBLIC)

/datum/equipment_preset/survivor/pmc/miner/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/mercenary/miner, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/mercenary/miner, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/mercenary/miner, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)
	add_pmc_survivor_weapon(new_human)

	..()

// after double check pmc/freelancer isn't being used anywhere.
/datum/equipment_preset/survivor/pmc/freelancer
	name = "Survivor - Freelancer"
	assignment = "Freelancer"
	skills = /datum/skills/civilian/survivor/pmc
	flags = EQUIPMENT_PRESET_START_OF_ROUND
	access = list(ACCESS_CIVILIAN_PUBLIC)

/datum/equipment_preset/survivor/pmc/freelancer/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/freelancer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/pmc, WEAR_HANDS)
	add_merc_helmet(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)
	add_pmc_survivor_weapon(new_human)

	..()

// New Varadero CO Survivor.
/datum/equipment_preset/survivor/new_varadero/commander
	name = "Survivor - USASF Commander"
	assignment = "USASF Commander"
	skills = /datum/skills/commander
	paygrades = list(PAY_SHORT_NO5 = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/gold
	role_comm_title = "USASF CDR"
	flags = EQUIPMENT_PRESET_START_OF_ROUND
	access = list(
		ACCESS_CIVILIAN_PUBLIC,
		ACCESS_CIVILIAN_RESEARCH,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_CIVILIAN_LOGISTICS,
		ACCESS_CIVILIAN_BRIG,
		ACCESS_CIVILIAN_MEDBAY,
		ACCESS_CIVILIAN_COMMAND,
	)

/datum/equipment_preset/survivor/new_varadero/commander/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/bridge(new_human), WEAR_BODY)

	var/obj/item/clothing/suit/storage/jacket/marine/service/suit = new()
	suit.icon_state = "[suit.initial_icon_state]_o"
	suit.buttoned = FALSE

	var/obj/item/clothing/accessory/ranks/navy/o5/pin = new()
	suit.attach_accessory(new_human, pin)

	new_human.equip_to_slot_or_del(suit, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/notepad(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/pen/fountain(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/med_small_stack(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/m1911(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)

	..()

// ----- Hostile Survivors

/// used in Shivas Snowball

/datum/equipment_preset/survivor/clf/cold
	name = "CLF Survivor (Cold)"

//children of spawn rebel shoes proc
/datum/equipment_preset/survivor/clf/cold/add_rebel_ua_suit(mob/living/carbon/human/human)
	if(!istype(human))
		return
	var/suitpath = pick(
		/obj/item/clothing/suit/storage/militia,
		/obj/item/clothing/suit/storage/militia/vest,
		/obj/item/clothing/suit/storage/militia/brace,
		/obj/item/clothing/suit/storage/militia/partial,
		)
	human.equip_to_slot_or_del(new suitpath, WEAR_JACKET)

//children of spawn rebel helmet proc
/datum/equipment_preset/survivor/clf/cold/add_rebel_ua_helmet(mob/living/carbon/human/human)
	if(!istype(human))
		return
	var/helmetpath = pick(
		/obj/item/clothing/head/militia,
		/obj/item/clothing/head/militia/bucket,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/head/helmet/skullcap,
		/obj/item/clothing/head/helmet/swat,
		)
	human.equip_to_slot_or_del(new helmetpath, WEAR_HEAD)

//children of spawn rebel shoes proc
/datum/equipment_preset/survivor/clf/cold/add_rebel_ua_shoes(mob/living/carbon/human/human)
	if(!istype(human))
		return
	var/shoespath = /obj/item/clothing/shoes/combat
	human.equip_to_slot_or_del(new shoespath, WEAR_FEET)
