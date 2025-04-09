/datum/equipment_preset/royal_marine
	name = FACTION_TWE
	faction = FACTION_TWE
	faction_group = list(FACTION_TWE)
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	flags = EQUIPMENT_PRESET_EXTRA
	origin_override = ORIGIN_TWE
	access = list(ACCESS_LIST_WY_ALL, ACCESS_TWE_COMMANDO)
	idtype = /obj/item/card/id/dogtag

//*****************************************************************************************************/
/datum/equipment_preset/twe/royal_marine/load_id(mob/living/carbon/human/new_human, client/mob_client)
	var/obj/item/clothing/under/uniform = new_human.w_uniform
	if(istype(uniform))
		uniform.has_sensor = UNIFORM_HAS_SENSORS
		uniform.sensor_faction = FACTION_TWE
	return ..()

/datum/equipment_preset/royal_marine/standard
	name = "TWE Royal Marine Commando, Rifleman"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC"
	assignment = "Rifleman"
	rank = JOB_TWE_RMC_RIFLEMAN
	skills = /datum/skills/rmc
	access = list(ACCESS_LIST_WY_ALL, ACCESS_TWE_COMMANDO)

/datum/equipment_preset/royal_marine/standard/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/heavy, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked/twe, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/overwatch_camera, WEAR_R_EAR)
	//head
	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_IN_BACK)
	//uniform
	add_rmc_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters/tactical, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppsmall/rmc/preset, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23/preloaded, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/nsg, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78, WEAR_IN_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(/obj/item/clothing/under/marine/veteran/marsoc, WEAR_BODY)

/datum/equipment_preset/royal_marine/medic
	name = "TWE Royal Marine Commando, Medic"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC MED"
	assignment = "Medic"
	rank = JOB_TWE_RMC_MEDIC
	skills = /datum/skills/rmc
	access = list(ACCESS_LIST_WY_ALL, ACCESS_TWE_COMMANDO, ACCESS_TWE_MEDICAL)

/datum/equipment_preset/royal_marine/medic/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/heavy, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/robust, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/overwatch_camera, WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	//head
	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_IN_BACK)
	//uniform
	add_rmc_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters/tactical, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppsmall/rmc/preset, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23/preloaded, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full/dutch, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/nsg23, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/nsg23, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/nsg23, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78, WEAR_IN_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(/obj/item/clothing/under/marine/veteran/marsoc, WEAR_BODY)

//*****************************************************************************************************/
/datum/equipment_preset/royal_marine/machinegun
	name = "TWE Royal Marine Commando, Smartgunner"
	paygrades = list(PAY_SHORT_RMC1 = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "RMC SG"
	assignment = "Smartgunner"
	rank = JOB_TWE_RMC_SMARTGUNNER
	skills = /datum/skills/rmc/smartgun
	access = list(ACCESS_LIST_WY_ALL, ACCESS_TWE_COMMANDO)

/datum/equipment_preset/royal_marine/machinegun/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light, WEAR_BACK)
	new_human.equip_to_slot(new /obj/item/smartgun_battery, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smartgun/holo_targetting, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smartgun/holo_targetting, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/overwatch_camera, WEAR_R_EAR)
	new_human.equip_to_slot(new /obj/item/clothing/glasses/night/m56_goggles, WEAR_EYES)
	//head
	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_IN_BACK)
	//uniform
	add_rmc_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters/tactical, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/smartgun, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppsmall/rmc/preset, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun/rmc, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/l905/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(/obj/item/clothing/under/marine/veteran/marsoc, WEAR_BODY)

//*****************************************************************************************************/
/datum/equipment_preset/royal_marine/team_leader
	name = "TWE Royal Marine Commando, Team Leader"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC TL"
	assignment = "Team Leader"
	rank = JOB_TWE_RMC_TEAMLEADER
	skills = /datum/skills/rmc/leader
	access = list(ACCESS_LIST_WY_ALL, ACCESS_TWE_COMMANDO, ACCESS_TWE_LEADERSHIP)

/datum/equipment_preset/royal_marine/team_leader/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/heavy, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked/twe, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/green, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/overwatch_camera, WEAR_R_EAR)
	//head
	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_IN_BACK)
	//uniform
	add_rmc_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters/tactical, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppsmall/rmc/preset, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23/preloaded, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/nsg, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78, WEAR_IN_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(/obj/item/clothing/under/marine/veteran/marsoc, WEAR_BODY)
//*****************************************************************************************************/

/datum/equipment_preset/royal_marine/lieuteant //they better say it Lef-tenant or they should be banned for LRP. More importantly this guy doesn't spawn in the ERT
	name = "TWE Royal Marine Commando, Officer"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RNO1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC LT"
	assignment = "Commander"
	rank = JOB_TWE_RMC_LIEUTENANT
	skills = /datum/skills/rmc/leader
	access = list(ACCESS_LIST_WY_ALL, ACCESS_TWE_COMMANDO, ACCESS_TWE_LEADERSHIP, ACCESS_TWE_SENIOR_LEAD)

/datum/equipment_preset/royal_marine/lieuteant/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/heavy, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/green, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked/twe, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/overwatch_camera, WEAR_R_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_IN_BACK)
	add_rmc_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters/tactical, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppsmall/rmc/preset, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23/preloaded, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/nsg, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78, WEAR_IN_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(/obj/item/clothing/under/marine/veteran/marsoc, WEAR_BODY)


/datum/equipment_preset/royal_marine/stealth
	name = "TWE Royal Marine Commando, Stealth"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC"
	assignment = "Marine Commando"
	rank = JOB_TWE_RMC_BREACHER
	skills = /datum/skills/rmc
	access = list(ACCESS_LIST_WY_ALL, ACCESS_TWE_COMMANDO)

/datum/equipment_preset/royal_marine/stealth/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/heavy, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked/twe, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc/he, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/overwatch_camera, WEAR_R_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_nvg, WEAR_IN_BACK)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/marsoc, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/royal_marines, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters/tactical, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppsmall/rmc/preset, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23/preloaded/tactical, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/nsg, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78, WEAR_IN_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(/obj/item/clothing/under/marine/veteran/marsoc, WEAR_BODY)


/datum/equipment_preset/royal_marine/sniper
	name = "TWE Royal Marine Commando, Marksman"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "RMC MKSN"
	assignment = "Marksman"
	rank = JOB_TWE_RMC_MARKSMAN
	skills = /datum/skills/rmc/specialist
	access = list(ACCESS_LIST_WY_ALL, ACCESS_TWE_COMMANDO)

/datum/equipment_preset/royal_marine/sniper/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/heavy, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked/twe, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/overwatch_camera, WEAR_R_EAR)
	//head
	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine, WEAR_IN_BACK)
	//uniform
	add_rmc_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters/tactical, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppsmall/rmc/preset, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/M42A, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78, WEAR_IN_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(/obj/item/clothing/under/marine/veteran/marsoc, WEAR_BODY)
