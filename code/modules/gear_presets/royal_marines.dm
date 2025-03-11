/datum/equipment_preset/twe
	name = "Three World Empire"
	faction = FACTION_TWE
	faction_group = list(FACTION_TWE, FACTION_MARINE)
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	idtype = /obj/item/card/id/dogtag

//*****************************************************************************************************/

/datum/equipment_preset/twe/royal_marine/standard
	name = "Royal Marine Commando"
	paygrades = list(PAY_SHORT_RMC1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Royal Marines Rifleman"
	rank = JOB_TWE_RMC_RIFLEMAN
	skills = /datum/skills/rmc

/datum/equipment_preset/twe/royal_marine/standard/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/royal_marine, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/royal_marine, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/royal_marine, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/light/team_leader, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/rmc_nsg_ammo, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/incin, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full, WEAR_R_STORE)

//*****************************************************************************************************/
/datum/equipment_preset/twe/royal_marine/spec
	paygrades = list(PAY_SHORT_RMC2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC SPC"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/rmc/specialist

/datum/equipment_preset/twe/royal_marine/spec/marksman
	name = "TWE Royal Marine Commando (Marksman)"
	assignment = "Royal Marines Marksman"
	rank = JOB_TWE_RMC_MARKSMAN

/datum/equipment_preset/twe/royal_marine/spec/marksman/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/royal_marine, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/royal_marine, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/royal_marines, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/royal_marine, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/light/team_leader, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90/scope, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/rmc_nsg_ammo, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/compact, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/incin, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full, WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/twe/royal_marine/spec/breacher
	name = "TWE Royal Marine Commando (Breacher)"
	assignment = "Royal Marines Breacher"
	rank = JOB_TWE_RMC_BREACHER

/datum/equipment_preset/twe/royal_marine/spec/breacher/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/royal_marine, WEAR_L_EAR)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/breacher, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/royal_marine, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/royal_marines, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/royal_marine, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/pointman, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90/shotgun, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/surgical, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/compact, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot/ballistic, WEAR_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full, WEAR_R_STORE)

//*****************************************************************************************************/
/datum/equipment_preset/twe/royal_marine/spec/machinegun
	name = "TWE Royal Marine Commando (Smartgunner)"
	role_comm_title = "RMC SG"
	assignment = "Royal Marines Smartgunner"
	rank = JOB_TWE_RMC_SMARTGUNNER
	skills = /datum/skills/rmc/smartgun

/datum/equipment_preset/twe/royal_marine/spec/machinegun/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/royal_marine, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/royal_marine, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc, WEAR_FEET)
	new_human.equip_to_slot(new /obj/item/clothing/glasses/night/m56_goggles, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/royal_marines, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/royal_marine, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/smartgun, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun/rmc, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/l905/full, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/compact, WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/smartgun_battery(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smartgun/holo_targetting, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smartgun/holo_targetting, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full, WEAR_R_STORE)

//*****************************************************************************************************/
/datum/equipment_preset/twe/royal_marine/team_leader
	name = "TWE Royal Marine Commando (Teamleader)"
	paygrades = list(PAY_SHORT_RMC4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC TL"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Royal Marines Team Leader"
	rank = JOB_TWE_RMC_TEAMLEADER
	skills = /datum/skills/rmc/leader

/datum/equipment_preset/twe/royal_marine/team_leader/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/royal_marine, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/royal_marine/team_leader, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/royal_marine/tl, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/royal_marines, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/light/team_leader, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90/a_grip, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/l905/full, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/compact, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/incin, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full, WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/twe/royal_marine/lieuteant //they better say it Lef-tenant or they should be banned for LRP. More importantly this guy doesn't spawn in the ERT
	name = "TWE Royal Marine Commando (Officer)"
	paygrades = list(PAY_SHORT_RNO1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC LT"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Royal Marines Team Commander"
	rank = JOB_TWE_RMC_LIEUTENANT
	skills = /datum/skills/rmc/leader

/datum/equipment_preset/twe/royal_marine/lieuteant/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/royal_marine, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/royal_marine/team_leader, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/royal_marine/lt, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/royal_marines, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/light/team_leader, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90/a_grip, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/l905/full, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/compact, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/incin, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full, WEAR_R_STORE)

