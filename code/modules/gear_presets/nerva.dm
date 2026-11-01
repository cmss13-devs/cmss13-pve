

/datum/equipment_preset/colonist/nerva/crewman
	name = "CSCSS Nerva Crewman"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Crewman"
	role_comm_title = "Crew"
	paygrades = list(PAY_SHORT_CREW = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_LOGISTICS)
	idtype = /obj/item/card/id/lanyard

/datum/equipment_preset/colonist/nerva/crewman/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	add_civilian_uniform(new_human)
	//jacket
	add_civilian_jacket(new_human)
	//limbs
	add_civilian_shoe(new_human)

/datum/equipment_preset/colonist/nerva/captain
	name = "CSCSS Nerva Captain"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Captain"
	role_comm_title = "CAPT"
	paygrades = list(PAY_SHORT_CAPT = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/nerva/captain
	access = list(ACCESS_LIST_COLONIAL_ALL, ACCESS_LIST_MARINE_ALL)
	idtype = /obj/item/card/id/gold


/datum/equipment_preset/colonist/nerva/captain/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/lockable(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(new_human), WEAR_EYES)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/sec/alt(new_human), WEAR_HEAD)
	//outfit
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/director(new_human), WEAR_BODY)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)


/datum/equipment_preset/colonist/nerva/bridge_officer
	name = "CSCSS Nerva Bridge Officer"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Bridge Officer"
	role_comm_title = "BO"
	paygrades = list(PAY_SHORT_BO = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id/silver


/datum/equipment_preset/colonist/nerva/bridge_officer/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear(new_human), WEAR_BODY)
	//limb
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)


/datum/equipment_preset/colonist/nerva/cmo
	name = "CSCSS Nerva CMO"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Chief Medical Officer"
	role_comm_title = "CMO"
	paygrades = list(PAY_SHORT_CMO = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/nerva/cmo
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_MEDBAY, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id/silver


/datum/equipment_preset/colonist/nerva/cmo/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel

	new_human.undershirt = "undershirt"
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chief_medical_officer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/standard/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/latex(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)


/datum/equipment_preset/colonist/nerva/doctor
	name = "CSCSS Nerva Medical Specialist"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Medical Specialist"
	role_comm_title = "MS"
	paygrades = list(PAY_SHORT_MED = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/nerva/doctor
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_MEDBAY, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id/lanyard


/datum/equipment_preset/colonist/nerva/doctor/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	add_professionalwear(new_human)
	add_tie(new_human)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat(new_human), WEAR_JACKET)
	//limb
	add_dress_shoes(new_human)


/datum/equipment_preset/colonist/nerva/hos
	name = "CSCSS Nerva Head of Security"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Head of Security"
	role_comm_title = "HoS"
	paygrades = list(PAY_SHORT_HOS = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/nerva/hos
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id/silver


/datum/equipment_preset/colonist/nerva/hos/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"

	new_human.equip_to_slot_or_del(new  /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new 	/obj/item/clothing/under/liaison_suit/grey(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new 	/obj/item/clothing/gloves/combat(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new 	/obj/item/clothing/shoes/combat(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new 	/obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new 	/obj/item/storage/belt/security/MP/CMB/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new 	/obj/item/clothing/suit/storage/CMB/marshal(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new 	/obj/item/clothing/head/hybrisa/cmb_peaked_cap_gold, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/m44/custom/webley, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/revolver/webley, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/revolver/webley, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight/tnr, WEAR_IN_BACK)

/datum/equipment_preset/colonist/nerva/security
	name = "CSCSS Nerva Security Officer"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Security Officer"
	role_comm_title = "Off"
	paygrades = list(PAY_SHORT_SEC = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/nerva/security
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_BRIG)
	idtype = /obj/item/card/id/lanyard


/datum/equipment_preset/colonist/nerva/security/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight/tnr, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//head
	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/CMB, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/black, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/waist, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/m1911, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/CMB, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/CMB/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/pen/clicky, WEAR_IN_R_STORE)


/datum/equipment_preset/colonist/nerva/ce
	name = "CSCSS Nerva Chief Engineer"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Chief Engineer"
	role_comm_title = "CE"
	paygrades = list(PAY_SHORT_CE = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/nerva/ce
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id/silver


/datum/equipment_preset/colonist/nerva/ce/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"

	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/eng(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat/white(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/darkblue(new_human), WEAR_BODY)
	//jacket
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/stompers(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/black(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow(new_human), WEAR_HANDS)


/datum/equipment_preset/colonist/nerva/engineer
	name = "CSCSS Nerva Ship Technician"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Ship Technician"
	role_comm_title = "ST"
	paygrades = list(PAY_SHORT_ENG = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/nerva/engineer
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_LOGISTICS)
	idtype = /obj/item/card/id/lanyard


/datum/equipment_preset/colonist/nerva/engineer/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"

	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/eng(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat(new_human), WEAR_HEAD)
	//uniform
	add_worker_uniform(new_human)
	//jacket
	add_worker_jacket(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full, WEAR_WAIST)
	//limb
	add_worker_shoe(new_human)
	add_worker_gloves(new_human)
