
/datum/equipment_preset/pmc
	name = "PMC"
	faction = FACTION_PMC
	rank = FACTION_PMC
	idtype = /obj/item/card/id/pmc
	faction = FACTION_PMC
	faction_group = FACTION_LIST_WY
	languages = list(LANGUAGE_ENGLISH)
	var/human_versus_human = FALSE

/datum/equipment_preset/pmc/New()
	. = ..()
	access = get_access(ACCESS_LIST_WY_PMC)

/datum/equipment_preset/pmc/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(75;MALE,25;FEMALE)
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
		new_human.h_style = pick("Undercut", "Partly Shaved", "Side Undercut", "Side Hang Undercut (Reverse)", "Undercut, Top", "Medium Fade", "High Fade", "Coffee House Cut")
		new_human.f_style = pick("Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "3 O'clock Shadow", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache", "7 O'clock Shadow", "7 O'clock Moustache",)
	else
		new_human.h_style = pick("Side Undercut", "Side Hang Undercut (Reverse)", "Undercut, Top", "CIA", "Mulder", "Pvt. Redding", "Pixie Cut Left", "Pixie Cut Right")
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,35)

/datum/equipment_preset/pmc/load_id(mob/living/carbon/human/new_human, client/mob_client)
	if(human_versus_human)
		var/obj/item/clothing/under/uniform = new_human.w_uniform
		if(istype(uniform))
			uniform.has_sensor = UNIFORM_HAS_SENSORS
			uniform.sensor_faction = FACTION_PMC
	return ..()


//*****************************************************************************************************/
/datum/equipment_preset/pmc/standard
	name = "Weyland-Yutani PMC (Standard)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_PMC_STANDARD
	rank = JOB_PMC_STANDARD
	paygrades = list(PAY_SHORT_PMC_OP = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pmc

/datum/equipment_preset/pmc/standard/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	//head
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc, WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/weyyu, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/pmc/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/splint, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_ACCESSORY)
	//jacket
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc, WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/light, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

	if(prob(65))
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39/tactical/ap, WEAR_J_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/ap, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/ap, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/ap, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/ap, WEAR_IN_L_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/elite, WEAR_J_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_L_STORE)

//*****************************************************************************************************/
/datum/equipment_preset/pmc/medic
	name = "Weyland-Yutani PMC (Corporate Medic)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_PMC_MEDIC
	rank = JOB_PMC_MEDIC
	paygrades = list(PAY_SHORT_PMC_MS = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pmc/medic

/datum/equipment_preset/pmc/medic/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	//head
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc, WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/weyyu, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/pmc/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/splint, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_ACCESSORY)
	//jacket
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc, WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full/dutch, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/extended, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/extended, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/extended, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/extended, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/extended, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/extended, WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/pmc/leader
	name = "Weyland-Yutani PMC (Leader)"
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_PMC_LEADER
	rank = JOB_PMC_LEADER
	paygrades = list(PAY_SHORT_PMC_TL = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SL"
	skills = /datum/skills/pmc/SL

/datum/equipment_preset/pmc/leader/New()
	. = ..()
	access = get_access(ACCESS_LIST_WY_PMC) + list(ACCESS_WY_LEADERSHIP, ACCESS_WY_PMC_TL)

/datum/equipment_preset/pmc/leader/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	//head
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner, WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/weyyu, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/pmc/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/splint, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_ACCESSORY)
	//jacket
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc, WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/elite, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

	var/obj/item/device/radio/headset/R = new_human.wear_l_ear
	if(istype(R))
		R.volume = RADIO_VOLUME_IMPORTANT

//*****************************************************************************************************/

/datum/equipment_preset/pmc/gunner
	name = "Weyland-Yutani PMC (Gunner)"
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_PMC_GUNNER
	rank = JOB_PMC_GUNNER
	paygrades = list(PAY_SHORT_PMC_SS = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SG"
	skills = /datum/skills/pmc/smartgunner

/datum/equipment_preset/pmc/gunner/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/pmc/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/splint, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/smartgunner/veteran/pmc, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/pmc/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m56_goggles/no_nightvision(new_human), WEAR_EYES)

//*****************************************************************************************************/

/datum/equipment_preset/pmc/sniper
	name = "Weyland-Yutani PMC (Sniper)"
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_PMC_SNIPER
	rank = JOB_PMC_SNIPER
	paygrades = list(PAY_SHORT_PMC_WS = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Spc"
	skills = /datum/skills/pmc/specialist

/datum/equipment_preset/pmc/sniper/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles/m42c, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	//head
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc, WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/weyyu, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/pmc/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/splint, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/elite, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, WEAR_IN_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/m39/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/pmc_sniper, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)
//*****************************************************************************************************/
/datum/equipment_preset/pmc/crewman
	name = "Weyland-Yutani PMC (Crewman)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_PMC_CREWMAN
	rank = JOB_PMC_CREWMAN
	paygrades = list(PAY_SHORT_PMC_VS = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pmc/tank_crew

/datum/equipment_preset/pmc/crewman/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pmc, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding/superior, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/vp78, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tank, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/pmc_m39, WEAR_L_STORE)

	spawn_weapon(/obj/item/weapon/gun/smg/m39, /obj/item/ammo_magazine/smg/m39, new_human, 0, 0)

/*****************************************************************************************************/

/datum/equipment_preset/pmc/xeno_handler
	name = "Weyland-Yutani PMC (Xeno Handler)"
	flags = EQUIPMENT_PRESET_EXTRA

	faction_group = FACTION_LIST_MARINE_WY

	assignment = JOB_PMC_XENO_HANDLER
	rank = JOB_PMC_XENO_HANDLER
	paygrades = list(PAY_SHORT_PMC_XS = JOB_PLAYTIME_TIER_0)
	role_comm_title = "XH"
	skills = /datum/skills/pmc/xeno_handler
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE, LANGUAGE_XENOMORPH)

/datum/equipment_preset/pmc/xeno_handler/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pmc, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/multitool, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/splint, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/baton, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/vp70, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/pmc_m39, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)

/*****************************************************************************************************/

/datum/equipment_preset/pmc/doctor
	name = "Weyland-Yutani PMC (Trauma Surgeon)"
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_PMC_DOCTOR
	rank = JOB_PMC_DOCTOR
	paygrades = list(PAY_SHORT_PMC_DOC = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SGN"
	skills = /datum/skills/pmc/doctor

/datum/equipment_preset/pmc/doctor/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/gunner, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pmc, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/equipped, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full/dutch, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)

	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39, WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pressurized_reagent_canister/oxycodone, WEAR_R_STORE) //surgery

/*****************************************************************************************************/

/datum/equipment_preset/pmc/technician
	name = "Weyland-Yutani PMC (Corporate Technician)"
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_PMC_ENGINEER
	rank = JOB_PMC_ENGINEER
	paygrades = list(PAY_SHORT_PMC_TEC = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TEC"
	skills = /datum/skills/pmc/engineer

/datum/equipment_preset/pmc/technician/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pmc, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding/superior, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/defenses/handheld/sentry/wy/mini, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/defenses/handheld/sentry/wy/mini, WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full, WEAR_R_STORE)

/*****************************************************************************************************/

/datum/equipment_preset/pmc/director
	name = "Weyland-Yutani PMC (Corporate Operations Director)"
	flags = EQUIPMENT_PRESET_EXTRA
	languages = ALL_HUMAN_LANGUAGES

	assignment = JOB_PMC_DIRECTOR
	rank = JOB_PMC_DIRECTOR
	paygrades = list(PAY_SHORT_PMC_DIR = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Dir"
	skills = /datum/skills/pmc/director
/datum/equipment_preset/pmc/director/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pmc, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/lockable, WEAR_BACK)
	var/obj/item/storage/pouch/pistol/command/command_pouch = new(new_human)
	command_pouch.desc = replacetext(command_pouch.desc, "Captains", "corporate PMC directors")
	new_human.equip_to_slot_or_del(command_pouch, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/cotablet/pmc(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	var/obj/item/device/radio/headset/R = new_human.wear_l_ear
	if(istype(R))
		R.volume = RADIO_VOLUME_CRITICAL

//*****************************************************************************************************/

/datum/equipment_preset/pmc/synth
	name = "Weyland-Yutani PMC (Support Synthetic)"
	flags = EQUIPMENT_PRESET_EXTRA

	languages = ALL_SYNTH_LANGUAGES

	skills = /datum/skills/synthetic
	idtype = /obj/item/card/id/pmc
	assignment = JOB_PMC_SYNTH
	rank = JOB_PMC_SYNTH
	paygrades = list(PAY_SHORT_SYN = JOB_PLAYTIME_TIER_0)
	role_comm_title = "WY Syn"

/datum/equipment_preset/pmc/synth/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(50;MALE,50;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(prob(10))
		random_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
	else if(new_human.gender == MALE)
		random_name = "[pick(GLOB.first_names_male_pmc)]"
	else
		random_name = "[pick(GLOB.first_names_female_pmc)]"

	if(new_human.gender == MALE)
		new_human.f_style = "5 O'clock Shadow"

	new_human.change_real_name(new_human, random_name)
	new_human.r_hair = 15
	new_human.g_hair = 15
	new_human.b_hair = 25
	new_human.r_eyes = 139
	new_human.g_eyes = 62
	new_human.b_eyes = 19

/datum/equipment_preset/pmc/synth/load_race(mob/living/carbon/human/new_human)
		new_human.set_species(SYNTH_GEN_THREE)

/datum/equipment_preset/pmc/synth/load_skills(mob/living/carbon/human/new_human)
		new_human.set_skills(/datum/skills/synthetic)
		new_human.allow_gun_usage = FALSE

/datum/equipment_preset/pmc/synth/load_gear(mob/living/carbon/human/new_human)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pmc, WEAR_BODY)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/equipped, WEAR_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/light/synth, WEAR_JACKET)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/telebaton, WEAR_IN_JACKET)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/nailgun, WEAR_IN_JACKET)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/nailgun, WEAR_IN_JACKET)

		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc, WEAR_HEAD)
		new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc, WEAR_L_EAR)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/experimental_mesons, WEAR_EYES)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc, WEAR_FACE)

		new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/rmc/knife, WEAR_FEET)

		new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/smartpack/white, WEAR_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/roller/surgical, WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/upgraded, WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/tool/crew_monitor, WEAR_IN_BACK)

		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full/dutch, WEAR_WAIST)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/nailgun/compact, WEAR_J_STORE)

		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical, WEAR_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/tool/screwdriver/tactical, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters/tactical, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/tool/wrench, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/stack/cable_coil, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/stack/cable_coil, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/device/multitool, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool/hugetank, WEAR_IN_L_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full_barbed_wire, WEAR_R_STORE)
