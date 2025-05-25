/datum/equipment_preset/mercenary
	name = "Mercenary"
	faction = FACTION_MERCENARY
	rank = JOB_MERCENARY
	idtype = /obj/item/card/id/lanyard
	faction = FACTION_MERCENARY
	faction_group = list(FACTION_MERCENARY)
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	var/human_versus_human = FALSE
	var/headset_type = /obj/item/device/radio/headset/distress/mercenary

/datum/equipment_preset/mercenary/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE)


/datum/equipment_preset/mercenary/load_name(mob/living/carbon/human/new_human)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	random_name = capitalize(pick(new_human.gender == MALE ? GLOB.first_names_male : GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
	new_human.change_real_name(new_human, random_name)
	new_human.name = new_human.real_name
	new_human.age = rand(22,45)

	var/static/list/colors = list("BLACK" = list(15, 15, 25), "BROWN" = list(102, 51, 0), "AUBURN" = list(139, 62, 19))
	var/static/list/hair_colors = colors.Copy() + list("BLONDE" = list(197, 164, 30), "CARROT" = list(174, 69, 42))
	var/hair_color = pick(hair_colors)
	new_human.r_hair = hair_colors[hair_color][1]
	new_human.g_hair = hair_colors[hair_color][2]
	new_human.b_hair = hair_colors[hair_color][3]
	new_human.r_facial = hair_colors[hair_color][1]
	new_human.g_facial = hair_colors[hair_color][2]
	new_human.b_facial = hair_colors[hair_color][3]
	var/eye_color = pick(colors)
	new_human.r_eyes = colors[eye_color][1]
	new_human.g_eyes = colors[eye_color][2]
	new_human.b_eyes = colors[eye_color][3]
	idtype = /obj/item/card/id/data
	if(new_human.gender == MALE)
		new_human.h_style = pick("Crewcut", "Shaved Head", "Buzzcut", "Undercut", "Side Undercut", "Pvt. Joker", "Marine Fade", "Low Fade", "Medium Fade", "High Fade", "No Fade", "Coffee House Cut", "Flat Top",)
		new_human.f_style = pick("5 O'clock Shadow", "Shaved", "Full Beard", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache", "7 O'clock Shadow", "7 O'clock Moustache",)
	else
		new_human.h_style = pick("Ponytail 1", "Ponytail 2", "Ponytail 3", "Ponytail 4", "Pvt. Redding", "Pvt. Clarison", "Cpl. Dietrich", "Pvt. Vasquez", "Marine Bun", "Marine Bun 2", "Marine Flat Top",)
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)
	new_human.r_hair = rand(15,35)
	new_human.g_hair = rand(15,35)
	new_human.b_hair = rand(25,45)

/datum/equipment_preset/mercenary/load_id(mob/living/carbon/human/new_human, client/mob_client)
	if(human_versus_human)
		var/obj/item/clothing/under/uniform = new_human.w_uniform
		if(istype(uniform))
			uniform.has_sensor = UNIFORM_HAS_SENSORS
			uniform.sensor_faction = FACTION_MERCENARY
	return ..()

//*****************************************************************************************************/

/datum/equipment_preset/mercenary/grunt
	name = "Black Dragoons Grunt"
	paygrades = list(PAY_SHORT_BD_G = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Grunt"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Black Dragoons Grunt"
	rank = JOB_MERCENARY_GRUNT
	skills = /datum/skills/cargotech
	faction = FACTION_MERCENARY

/datum/equipment_preset/mercenary/grunt/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/mercenary, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/holobadge/cord, WEAR_ACCESSORY)
	if(prob(35))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/blue(new_human), WEAR_JACKET)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat/white)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/full, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/mercenary/pilot
	name = "Black Dragoons Pilot"
	paygrades = list(PAY_SHORT_BD_P = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Pilot"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Black Dragoons Pilot"
	rank = JOB_MERCENARY_PILOT
	skills = /datum/skills/crew_chief
	faction = FACTION_MERCENARY

/datum/equipment_preset/mercenary/pilot/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/mercenary, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/holobadge/cord, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/pilot(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp/marinepilot, WEAR_HEAD)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/mercenary/sentinel
	name = "Black Dragoons Sentinel (Patrol, SMG)"
	paygrades = list(PAY_SHORT_BD_S = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Sentinel"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Black Dragoons Sentinel"
	rank = JOB_MERCENARY_SENTINEL
	skills = /datum/skills/trooper
	faction = FACTION_MERCENARY

/datum/equipment_preset/mercenary/sentinel/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/mercenary, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava, WEAR_FACE)
	//uniform + armour
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/merc/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/soft/sec/corp, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/holobadge/cord, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/fp9000/tactical, WEAR_IN_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/mercenary/sentinel/response
	name = "Black Dragoons Sentinel (Rapid Response, SMG)"
	paygrades = list(PAY_SHORT_BD_S = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Sentinel"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Black Dragoons Sentinel"
	rank = JOB_MERCENARY_SENTINEL
	skills = /datum/skills/trooper
	faction = FACTION_MERCENARY

/datum/equipment_preset/mercenary/sentinel/response/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre,WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/mercenary, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava, WEAR_FACE)
	//uniform + armour
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/merc/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/soft/sec/corp, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/holobadge/cord, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/fp9000/tactical, WEAR_IN_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/fp9000, WEAR_IN_R_STORE)

//*****************************************************************************************************/


/datum/equipment_preset/mercenary/sentinel/response/carbine
	name = "Black Dragoons Sentinel (Rapid Response, Carbine)"
	paygrades = list(PAY_SHORT_BD_S = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Sentinel"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Black Dragoons Sentinel"
	rank = JOB_MERCENARY_SENTINEL
	skills = /datum/skills/trooper
	faction = FACTION_MERCENARY

/datum/equipment_preset/mercenary/sentinel/response/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre,WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/mercenary, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava, WEAR_FACE)
	//uniform + armour
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/merc/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/soft/sec/corp, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/holobadge/cord, WEAR_ACCESSORY)
	//new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nk4, WEAR_IN_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/b92fs, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	//new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/nk4, WEAR_IN_R_STORE)
	//new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/nk4, WEAR_IN_R_STORE)
	//new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/nk4, WEAR_IN_R_STORE)

