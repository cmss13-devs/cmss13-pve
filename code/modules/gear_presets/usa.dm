/datum/equipment_preset/usa
	name = "US Army"
	faction = FACTION_ARMY
	faction_group = FACTION_LIST_MARINE
	minimum_age = 20
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_SPANISH)
	///Gives the soldiers their radios
	var/headset_type = /obj/item/device/radio/headset/distress/army
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/usa/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new
	A.randomize_appearance(new_human)
	var/random_name = capitalize(pick(new_human.gender == MALE ? GLOB.first_names_male : GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
	var/static/list/colors = list("BLACK" = list(15, 15, 10), "BROWN" = list(48, 38, 18), "BROWN" = list(48, 38, 18),"BLUE" = list(29, 51, 65), "GREEN" = list(40, 61, 39), "STEEL" = list(46, 59, 54))
	var/static/list/hair_colors = list("BLACK" = list(15, 15, 10), "BROWN" = list(48, 38, 18), "AUBURN" = list(77, 48, 36), "BLONDE" = list(95, 76, 44))
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
	if(new_human.gender == MALE)
		new_human.h_style = pick("Undercut", "Partly Shaved", "Side Undercut", "Side Hang Undercut (Reverse)", "Undercut, Top", "Medium Fade", "High Fade", "Coffee House Cut", "Crewcut", "Shaved Head", "Buzzcut", "Pvt. Joker", "Marine Fade", "Low Fade", "Medium Fade", "High Fade",)
		new_human.f_style = pick("Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "3 O'clock Shadow", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache", "7 O'clock Shadow", "7 O'clock Moustache",)
	else
		new_human.h_style = pick("Side Undercut", "Side Hang Undercut (Reverse)", "Undercut, Top", "CIA", "Mulder", "Pvt. Redding", "Pixie Cut Left", "Pixie Cut Right", "Bun", "Ponytail 1", "Ponytail 2", "Ponytail 3", "Ponytail 4", "Pvt. Clarison", "Cpl. Dietrich", "Pvt. Vasquez", "Marine Bun", "Marine Bun 2", "Marine Flat Top",)
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,35)

/datum/equipment_preset/usa/proc/spawn_army_fluff_items(mob/living/carbon/human/new_human)
	var/obj/item/helmet_accessory = pick(GLOB.allowed_helmet_items)
	new_human.equip_to_slot_or_del(new helmet_accessory, WEAR_IN_HELMET)
	if(prob(50))
		var/obj/item/helmet_accessory_two = pick(GLOB.allowed_helmet_items)
		new_human.equip_to_slot_or_del(new helmet_accessory_two, WEAR_IN_HELMET)
	var/list/possible_masks = subtypesof(/obj/item/clothing/mask/rebreather) + subtypesof(/obj/item/clothing/mask/tornscarf)
	if(prob(50))
		var/obj/item/clothing/mask/new_mask = pick(possible_masks)
		new_human.equip_to_slot_or_del(new new_mask, WEAR_FACE)


//*****************************************************************************************************/

/datum/equipment_preset/usa/trooper
	name = "Army Trooper"
	assignment = JOB_ARMY_TROOPER
	rank = JOB_ARMY_TROOPER
	paygrades = list(PAY_SHORT_AE2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TRPR"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/trooper

/datum/equipment_preset/usa/trooper/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/army, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/m41amk1, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive, WEAR_BACK)
	spawn_army_fluff_items(new_human)

/datum/equipment_preset/usa/trooper/grenadier
	name = parent_type::name + " (grenadier)"
	name = "Army Grenadier"
	assignment = JOB_ARMY_PROPIPE
	rank = JOB_ARMY_PROPIPE
	role_comm_title = "GRNDR"

/datum/equipment_preset/usa/trooper/grenadier/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/grenade/army, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/incendiary, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/incendiary, WEAR_IN_BACK)
	spawn_army_fluff_items(new_human)
	..()


/datum/equipment_preset/usa/marksman
	name = "Army Designated Marksman"
	assignment = JOB_ARMY_MARKSMAN
	rank = JOB_ARMY_MARKSMAN
	paygrades = list(PAY_SHORT_AE3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "MRKMN"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/trooper	//Trooper but with a scoped rifle

/datum/equipment_preset/usa/marksman/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/poncho/green/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m4ra/army, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/full, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/incendiary, WEAR_IN_R_STORE)
	spawn_army_fluff_items(new_human)

/datum/equipment_preset/usa/marksman/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_AE2 = JOB_PLAYTIME_TIER_0)


/datum/equipment_preset/usa/gunner
	name = "Army Gunner"
	assignment = JOB_ARMY_GUNNER
	rank = JOB_ARMY_GUNNER
	paygrades = list(PAY_SHORT_AE3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "LGNR"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/trooper	//trooper with a big gun, no fancy skills

/datum/equipment_preset/usa/gunner/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/lmg/army, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/m41e2ap, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/folding_barricade/three, WEAR_BACK)
	spawn_army_fluff_items(new_human)

/datum/equipment_preset/usa/gunner/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_AE2 = JOB_PLAYTIME_TIER_0)


/datum/equipment_preset/usa/heavygunner
	name = "Army Heavy Gunner"
	assignment = JOB_ARMY_SMARTGUNNER
	rank = JOB_ARMY_SMARTGUNNER
	paygrades = list(PAY_SHORT_AE4E = JOB_PLAYTIME_TIER_0)
	role_comm_title = "HGNR"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/heavygunner

/datum/equipment_preset/usa/heavygunner/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/smartgunner/black, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m56_goggles/no_nightvision, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/army/full, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
	spawn_army_fluff_items(new_human)

/datum/equipment_preset/usa/heavygunner/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_AE3 = JOB_PLAYTIME_TIER_0)


/datum/equipment_preset/usa/ATgunner
	name = "Army Anti-Tank Gunner"
	assignment = JOB_ARMY_ATFIRE
	rank = JOB_ARMY_ATFIRE
	paygrades = list(PAY_SHORT_AE4E = JOB_PLAYTIME_TIER_0)
	role_comm_title = "AT GNR."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/trooper	//Trooper with a toob, nothing fancy needed

/datum/equipment_preset/usa/ATgunner/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/army, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/m41amk1, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/launcher/rocket/army, WEAR_BACK)
	spawn_army_fluff_items(new_human)

/datum/equipment_preset/usa/ATgunner/loader
	name = "Army Anti-Tank Loader"
	assignment = JOB_ARMY_ATLOAD
	rank = JOB_ARMY_ATLOAD
	paygrades = list(PAY_SHORT_AE3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "AT LDR."

/datum/equipment_preset/usa/ATgunner/loader/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/rocketpack/army, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/wp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/ap, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/ap, WEAR_IN_BACK)
	spawn_army_fluff_items(new_human)
	..()


/datum/equipment_preset/usa/sapper
	name = "Army Combat Engineering Technician"
	assignment = JOB_ARMY_ENGI
	rank = JOB_ARMY_ENGI
	paygrades = list(PAY_SHORT_AE4E = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CET"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/sapper

/datum/equipment_preset/usa/sapper/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/engine, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/equipped, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/army, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/m41amk1, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full_barbed_wire, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/engikit/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/welder_chestrig, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive, WEAR_IN_BACK)
	spawn_army_fluff_items(new_human)


/datum/equipment_preset/usa/mainttech
	name = "Army Technical Engineer"
	assignment = JOB_ARMY_MT
	rank = JOB_ARMY_MT
	paygrades = list(PAY_SHORT_AE5 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "T. Eng."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/mainttech

/datum/equipment_preset/usa/mainttech/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/boiler, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/engine, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/equipped, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/black, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full_barbed_wire, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/engikit/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/welder_chestrig, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/defenses/handheld/sentry, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool, WEAR_IN_BACK)


/datum/equipment_preset/usa/medic
	name = "Army Combat Medical Technician"
	assignment = JOB_ARMY_MEDIC
	rank = JOB_ARMY_MEDIC
	paygrades = list(PAY_SHORT_AE4E = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CMT"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/medic

/datum/equipment_preset/usa/medic/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/medgreen(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/intel/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/army, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full/army, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/medic/army, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	spawn_army_fluff_items(new_human)


/datum/equipment_preset/usa/nco
	name = "Army Fireteam Leader"
	assignment = JOB_ARMY_NCO
	rank = JOB_ARMY_NCO
	paygrades = list(PAY_SHORT_AE5 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "FTL"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/nco

/datum/equipment_preset/usa/nco/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/army/masterkey, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/m41amk1, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/shotgun/large/buckshot, WEAR_R_STORE)
	spawn_army_fluff_items(new_human)


/datum/equipment_preset/usa/snco
	name = "Army Squad Leader"
	assignment = JOB_ARMY_SNCO
	rank = JOB_ARMY_SNCO
	paygrades = list(PAY_SHORT_AE7 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SL"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/snco

/datum/equipment_preset/usa/snco/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/army/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/army, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/m41amk1, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/army, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/m94/signal, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive, WEAR_IN_BACK)
	spawn_army_fluff_items(new_human)

/datum/equipment_preset/usa/snco/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_AE6 = JOB_PLAYTIME_TIER_0)


/datum/equipment_preset/usa/lt
	name = "Army Platoon Officer"
	assignment = JOB_ARMY_LT
	rank = JOB_ARMY_LT
	paygrades = list(PAY_SHORT_AO2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Plt. Off."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/lt

/datum/equipment_preset/usa/lt/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/army/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/army, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/commander, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_R_STORE)
	spawn_army_fluff_items(new_human)

/datum/equipment_preset/usa/lt/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_AO1 = JOB_PLAYTIME_TIER_0)


/datum/equipment_preset/usa/intelofficer
	name = "Army Intelligence Officer"
	assignment = JOB_ARMY_INTEL
	rank = JOB_ARMY_INTEL
	paygrades = list(PAY_SHORT_AO2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Intel Off."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/lt

/datum/equipment_preset/usa/intelofficer/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/army/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/tool/pen/fountain, WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/boiler, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/spook, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/intel/army, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/notepad, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/army, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/m1911/socom, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/intel/chestrig/army, WEAR_BACK)

/datum/equipment_preset/usa/intelofficer/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_AO1 = JOB_PLAYTIME_TIER_0)


/datum/equipment_preset/usa/researcher
	name = "Army Science Officer"
	assignment = JOB_ARMY_RESEARCHER
	rank = JOB_ARMY_RESEARCHER
	paygrades = list(PAY_SHORT_AO3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Science Off."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/lt
	idtype = /obj/item/card/id/silver

/datum/equipment_preset/usa/researcher/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/army/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/boiler, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/latex, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army, WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat/researcher, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/commander, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_R_STORE)

/datum/equipment_preset/usa/researcher/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_AO2 = JOB_PLAYTIME_TIER_0)


