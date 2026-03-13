/datum/equipment_preset/iasf
	name = FACTION_IASF
	faction = FACTION_IASF
	faction_group = FACTION_LIST_TWE
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	flags = EQUIPMENT_PRESET_EXTRA
	origin_override = ORIGIN_TWE
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO)
	idtype = /obj/item/card/id/dogtag

//*****************************************************************************************************/
//Imperial Armed Space Foces
//*****************************************************************************************************/

/datum/equipment_preset/iasf/load_id(mob/living/carbon/human/new_human, client/mob_client)
	var/obj/item/clothing/under/uniform = new_human.w_uniform
	if(istype(uniform))
		uniform.has_sensor = UNIFORM_HAS_SENSORS
		uniform.sensor_faction = FACTION_TWE
	return ..()

/datum/equipment_preset/iasf/standard
	name = "IASF, Trooper (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Trp"
	assignment = JOB_TWE_IASF_RIFLEMAN
	rank = JOB_TWE_IASF_RIFLEMAN
	skills = /datum/skills/iasf
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO)

/datum/equipment_preset/iasf/standard/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/medium(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/rmc/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	//head
	if(prob(40))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_IN_BACK)
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles/green(new_human), WEAR_IN_HELMET)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/heavy(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/f90(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_R_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/iasf/medic
	name = "IASF, Combat Medical Technician (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CMT"
	assignment = JOB_TWE_IASF_MEDIC
	rank = JOB_TWE_IASF_MEDIC
	skills = /datum/skills/iasf/medic
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO, ACCESS_TWE_MEDICAL)

/datum/equipment_preset/iasf/medic/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/medic(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/rmc/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/surgical_case/regular(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	//head
	if(prob(40))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_IN_BACK)
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles/green(new_human), WEAR_IN_HELMET)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/heavy(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/p90/twe(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/rmc/full(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p90/twe(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p90/twe(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p90/twe(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/iasf/engineer
	name = "IASF, Combat Engineer (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CE"
	assignment = JOB_TWE_IASF_ENGI
	rank = JOB_TWE_IASF_ENGI
	skills = /datum/skills/iasf/engi
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO, ACCESS_TWE_ENGINEERING)

/datum/equipment_preset/iasf/engineer/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/medium(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/rmc/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/toolkit/full(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)
	//head
	if(prob(40))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_IN_BACK)
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles/green(new_human), WEAR_IN_HELMET)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/tactical(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/heavy(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/f90(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/iasf/machinegun
	name = "IASF, GPMG Gunner (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "HW(GPMG)"
	assignment = JOB_TWE_IASF_SMARTGUNNER
	rank = JOB_TWE_IASF_SMARTGUNNER
	skills = /datum/skills/iasf/smartgun
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO)

/datum/equipment_preset/iasf/machinegun/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smartgun(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smartgun(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/rmc(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	new_human.equip_to_slot(new /obj/item/clothing/glasses/night/m56_goggles/rmc(new_human), WEAR_EYES)
	//head
	if(prob(40))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_IN_BACK)
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles/green(new_human), WEAR_IN_HELMET)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/rmc/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/smartgun(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppsmall/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun/rmc/iasf(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/l905/l54(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/rmc/full(new_human), WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/iasf/sniper
	name = "IASF, Scout Sniper (M42A2) (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "ScS"
	assignment = JOB_TWE_IASF_SNIPER
	rank = JOB_TWE_IASF_SNIPER
	skills = /datum/skills/iasf/specialist
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO)

/datum/equipment_preset/iasf/sniper/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/rmc/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	//head
	if(prob(40))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_IN_BACK)
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles/green(new_human), WEAR_IN_HELMET)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/M42A(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/iasf/sniper/light
	name = "IASF, Scout Sniper (DMR) (Equipped)"

/datum/equipment_preset/iasf/sniper/light/load_gear(mob/living/carbon/human/new_human)
	//uniform
	add_iasf_uniform(new_human)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90/scope/ap(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90/marksman/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90/marksman/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90/marksman/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90/marksman/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90/marksman/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90/marksman/ap(new_human), WEAR_IN_BELT)
	..()

//*****************************************************************************************************/

/datum/equipment_preset/iasf/pilot
	name = "IASF, Fleet Air Arm (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "FAA"
	assignment = JOB_TWE_IASF_PILOT
	rank = JOB_TWE_IASF_PILOT
	skills = /datum/skills/iasf/pilot
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO, ACCESS_WY_FLIGHT, ACCESS_TWE_ENGINEERING)

/datum/equipment_preset/iasf/pilot/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/rmc/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/pilot(new_human), WEAR_HEAD)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/royal_marine/light/iasf(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/p90/twe(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p90/twe(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p90/twe(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p90/twe(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/iasf/leader
	name = "IASF, Section Leader (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "STL"
	assignment = JOB_TWE_IASF_SECTION_LEADER
	rank = JOB_TWE_IASF_SECTION_LEADER
	skills = /datum/skills/iasf/leader
	access = list(ACCESS_WY_GENERAL, ACCESS_WY_FLIGHT, ACCESS_TWE_COMMANDO, ACCESS_TWE_LEADERSHIP)

/datum/equipment_preset/iasf/leader/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/medium(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/green(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/rmc/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	//head
	if(prob(40))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_IN_BACK)
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles/green(new_human), WEAR_IN_HELMET)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/heavy(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90/a_grip(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/f90(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/iasf/leader/lesser
	name = "IASF, Section Team Leader (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TL"
	assignment = JOB_TWE_IASF_TEAM_LEADER
	rank = JOB_TWE_IASF_TEAM_LEADER

//*****************************************************************************************************/

/datum/equipment_preset/iasf/troopsergeant
	name = "IASF, Troop Sergeant (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMC4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TS"
	assignment = JOB_TWE_IASF_TROOP_LEADER
	rank = JOB_TWE_IASF_TROOP_LEADER
	skills = /datum/skills/iasf/lieutenant
	access = list(ACCESS_WY_GENERAL, ACCESS_WY_FLIGHT, ACCESS_TWE_COMMANDO, ACCESS_TWE_LEADERSHIP, ACCESS_TWE_ARMORY)

/datum/equipment_preset/iasf/troopsergeant/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/medium(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/green(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/rmc/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	//head
	if(prob(40))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/royal_marine/generic(new_human), WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf(new_human), WEAR_IN_BACK)
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/mgoggles/green(new_human), WEAR_IN_HELMET)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine/heavy(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23/l23/iasf(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/nsg(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/iasf/lieutenant
	name = "IASF, Platoon Lieutenant (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMO1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "LT"
	assignment = JOB_TWE_IASF_LIEUTENANT
	rank = JOB_TWE_IASF_LIEUTENANT
	skills = /datum/skills/iasf/lieutenant
	access = list(ACCESS_WY_GENERAL, ACCESS_WY_FLIGHT, ACCESS_TWE_COMMANDO, ACCESS_TWE_LEADERSHIP, ACCESS_TWE_ARMORY)

/datum/equipment_preset/iasf/lieutenant/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/frame(new_human), WEAR_BACK) //Shock horror, a SNCO kitted to not be a frontline leadership jockey? Can't wait to see people try it anyways
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/nsg23(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/rmc(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/overwatch_camera/twe(new_human), WEAR_R_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf(new_human), WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc(new_human), WEAR_HEAD)
	//uniform
	add_iasf_uniform(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/royal_marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/royal_marine(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/uppmags/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23/l23/iasf(new_human), WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc/nsg(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/rmc(new_human), WEAR_IN_R_STORE)

//*****************************************************************************************************/
// SENIOR OFFICERS
//*****************************************************************************************************/

/datum/equipment_preset/iasf/captain
	name = "IASF, Platoon Captain (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMO3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CPT"
	assignment = JOB_TWE_IASF_CAPTAIN
	rank = JOB_TWE_IASF_CAPTAIN
	skills = /datum/skills/iasf/captain
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO, ACCESS_TWE_LEADERSHIP, ACCESS_TWE_SENIOR_LEAD)

/datum/equipment_preset/iasf/captain/load_gear(mob/living/carbon/human/new_human)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf/commander_cap(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/iasf/service(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/twe(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78/rmc(new_human), WEAR_IN_ACCESSORY)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/green(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/red(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/device/cotablet/rmc(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/rmc(new_human), WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/iasf/major
	name = "IASF, Squadron Major (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMO4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "MAJ"
	assignment = JOB_TWE_IASF_MAJOR
	rank = JOB_TWE_IASF_MAJOR
	skills = /datum/skills/iasf/major
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO, ACCESS_TWE_LEADERSHIP, ACCESS_TWE_SENIOR_LEAD)

/datum/equipment_preset/iasf/major/load_gear(mob/living/carbon/human/new_human)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf/commander_cap(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/iasf/service(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78/rmc(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service/iasf_co(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/twe(new_human), WEAR_ACCESSORY)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/green(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/red(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/device/cotablet/rmc(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/rmc(new_human), WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/iasf/general
	name = "IASF, General (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	paygrades = list(PAY_SHORT_RMO8 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "GEN"
	assignment = JOB_TWE_IASF_GENERAL
	rank = JOB_TWE_IASF_GENERAL
	skills = /datum/skills/iasf/major
	access = list(ACCESS_WY_GENERAL, ACCESS_TWE_COMMANDO, ACCESS_TWE_LEADERSHIP, ACCESS_TWE_SENIOR_LEAD)

/datum/equipment_preset/iasf/general/load_gear(mob/living/carbon/human/new_human)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/rmc/iasf(new_human), WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/royal_marine/iasf/commander_cap(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/royal_marine/lt/service, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch/rmc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78/rmc(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service/iasf_co/alt(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/twe(new_human), WEAR_ACCESSORY)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/green(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke/red(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/device/cotablet/rmc(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/rmc(new_human), WEAR_IN_R_STORE)

