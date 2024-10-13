/datum/equipment_preset/upp
	name = FACTION_UPP
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_CHINESE)
	faction = FACTION_UPP
	idtype = /obj/item/card/id/dogtag
	origin_override = ORIGIN_UPP

/datum/equipment_preset/upp/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	var/first_name
	var/last_name
	//gender checks
	if(new_human.gender == MALE)
		if(prob(40))
			first_name = "[capitalize(randomly_generate_chinese_word(1))]"
		else
			first_name = "[pick(GLOB.first_names_male_upp)]"
		new_human.f_style = pick("3 O'clock Shadow", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache")
	else
		if(prob(40))
			first_name = "[capitalize(randomly_generate_chinese_word(1))]"
		else
			first_name = "[pick(GLOB.first_names_female_upp)]"
	//surname
	if(prob(35))
		last_name = "[capitalize(randomly_generate_chinese_word(pick(20;1, 80;2)))]"
	else
		last_name = "[pick(GLOB.last_names_upp)]"
	//put them together
	random_name = "[first_name] [last_name]"

	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(17,35)
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
		new_human.h_style = pick("Undercut, Top", "Partly Shaved", "CIA", "Mulder", "Medium Fade", "High Fade", "Pixie Cut Left", "Pixie Cut Right", "Coffee House Cut")
		new_human.f_style = pick("Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "3 O'clock Shadow", "3 O'clock Shadow", "3 O'clock Shadow", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache", "7 O'clock Shadow", "7 O'clock Moustache",)
	else
		new_human.h_style = pick("Undercut, Top", "CIA", "Mulder", "Pixie Cut Left", "Pixie Cut Right", "Scully", "Pvt. Redding", "Bun", "Short Bangs")

//*****************************************************************************************************/

/datum/equipment_preset/upp/militia
	name = "UPP People's Territorial Guardsman"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "People's Territorial Guard Rifleman"
	role_comm_title = "PTG-RFN"
	paygrades = list(PAY_SHORT_UE1 = JOB_PLAYTIME_TIER_0, PAY_SHORT_UE2 = JOB_PLAYTIME_TIER_1)
	skills = /datum/skills/pfc
	access = list(ACCESS_UPP_GENERAL, ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_COMMAND)

/datum/equipment_preset/upp/militia/load_gear(mob/living/carbon/human/new_human)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/ushanka, WEAR_HEAD)
	new_human.undershirt = "Territorial Guard Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/hatchet, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/fancy/cigar/matchbook/brown, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight/flare, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight/flare, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/territorial, WEAR_L_EAR)
	//head
	var/random_hat= rand(1,3)
	switch(random_hat)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap, WEAR_HEAD)
		if(2 to 3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/boonie, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	var/random_storage = rand(1,2)
	switch(random_storage)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing, WEAR_ACCESSORY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)

	//jacket
	var/random_jacket= rand(1,5)
	switch(random_jacket)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/jacket, WEAR_JACKET)
		if(3 to 4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/lamp, WEAR_JACKET)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light, WEAR_JACKET)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/guard, WEAR_FEET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/arnold/weak, WEAR_WAIST)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/compass, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/upp/folded, WEAR_IN_R_STORE)

	var/random_gear = rand(1,5)
	switch(random_gear)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/carbine, WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
		if(3 to 4)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71, WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/type23, WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/buckshot, WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/buckshot, WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/buckshot, WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/buckshot, WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/buckshot, WEAR_IN_JACKET)
//*****************************************************************************************************/

/datum/equipment_preset/upp/rifleman
	name = "UPP Squad Rifleman (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = JOB_SQUAD_MARINE
	role_comm_title = "RFN"
	rank = JOB_SQUAD_MARINE
	paygrades = list(PAY_SHORT_UE1 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pfc
	access = list(ACCESS_UPP_GENERAL)

/datum/equipment_preset/upp/rifleman/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive/upp, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	var/maybeberet = rand(1,3)
	switch(maybeberet)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval/alt, WEAR_HEAD)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/arnold/weak, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
//*****************************************************************************************************/

/datum/equipment_preset/upp/sanitar
	name = "UPP Squad Sanitar (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = "Sanitar"
	role_comm_title ="SNITR"
	rank = JOB_SQUAD_MEDIC_UPP
	paygrades = list(PAY_SHORT_UE3 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/combat_medic
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_MEDICAL, ACCESS_UPP_MEDPREP)

/datum/equipment_preset/upp/sanitar/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/medic, WEAR_L_EAR)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription, WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	//head
	var/maybeberet = rand(1,3)
	switch(maybeberet)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/carbine, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/tricordrazine, WEAR_IN_L_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
//*****************************************************************************************************/

/datum/equipment_preset/upp/machinegunner
	name = "UPP Squad Machinegunner (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = "Machinegunner"
	role_comm_title = "MG"
	rank = JOB_SQUAD_SMARTGUN_UPP
	paygrades = list(PAY_SHORT_UE3 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/smartgunner
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_MACHINEGUN)

/datum/equipment_preset/upp/machinegunner/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	var/maybeberet = rand(1,3)
	switch(maybeberet)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval/alt, WEAR_HEAD)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/smartgunner/upp, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pkp/iff, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_JACKET)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_R_STORE)
	//waist
	var/uppvetsidearm = prob(50) ? /obj/item/storage/belt/gun/type47/t73 : /obj/item/storage/belt/gun/type47/np92
	new_human.equip_to_slot_or_del(new uppvetsidearm, WEAR_WAIST) // 50/50 np92 or t73

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
//*****************************************************************************************************/
/datum/equipment_preset/upp/squadlead
	name = "UPP Squad Sergeant (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	paygrades = list(PAY_SHORT_UE4 = JOB_PLAYTIME_TIER_0, PAY_SHORT_UE5 = JOB_PLAYTIME_TIER_1)
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_TLPREP)
	assignment = JOB_SQUAD_TEAM_LEADER
	rank = JOB_SQUAD_TEAM_LEADER
	faction_group = list(FACTION_UPP)
	faction = FACTION_UPP
	role_comm_title = "SQSGT"

/datum/equipment_preset/upp/squadlead/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	var/maybeberet = rand(1,3)
	switch(maybeberet)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval/alt, WEAR_HEAD)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/navallead
	name = "UPP Platoon Sergeant (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = JOB_SQUAD_LEADER
	role_comm_title = "PLTSGT"
	rank = JOB_SQUAD_LEADER
	paygrades = list(PAY_SHORT_UE6 = JOB_PLAYTIME_TIER_0, PAY_SHORT_UE7 = JOB_PLAYTIME_TIER_1)
	skills = /datum/skills/SL
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_ENGLISH, LANGUAGE_CHINESE)
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_ARMORY, ACCESS_UPP_FLIGHT, ACCESS_UPP_SQUAD_ONE, ACCESS_UPP_SQUAD_TWO, ACCESS_UPP_LEADERSHIP, ACCESS_UPP_MEDPREP, ACCESS_UPP_TLPREP)
	minimap_icon = "leader"

/datum/equipment_preset/upp/navallead/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	var/maybeberet = rand(1,3)
	switch(maybeberet)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval/alt, WEAR_HEAD)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/arnold/weak, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/military_police
	name = "UPP Military Police"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_UPP_POLICE
	role_comm_title = "MP"
	rank = JOB_UPP_POLICE
	paygrades = list(PAY_SHORT_UE4 = JOB_PLAYTIME_TIER_0, PAY_SHORT_UE5 = JOB_PLAYTIME_TIER_1)
	skills = /datum/skills/upp/military_police
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_SECURITY, ACCESS_UPP_ARMORY, ACCESS_UPP_FLIGHT, ACCESS_UPP_SQUAD_ONE, ACCESS_UPP_SQUAD_TWO, ACCESS_UPP_LEADERSHIP, ACCESS_UPP_SENIOR_LEAD, ACCESS_UPP_MEDPREP, ACCESS_UPP_TLPREP)

/datum/equipment_preset/upp/military_police/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light/pap, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/UPP/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/t73, WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/officer
	name = "UPP Lieutenant"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/upp/officer
	assignment = JOB_UPP_LT_OFFICER
	role_comm_title = "LT"
	rank = JOB_UPP_LT_OFFICER
	paygrades = list(PAY_SHORT_UO1 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_SECURITY, ACCESS_UPP_ARMORY, ACCESS_UPP_FLIGHT, ACCESS_UPP_SQUAD_ONE, ACCESS_UPP_SQUAD_TWO, ACCESS_UPP_LEADERSHIP, ACCESS_UPP_SENIOR_LEAD, ACCESS_UPP_MEDPREP, ACCESS_UPP_TLPREP)
	idtype = /obj/item/card/id/silver

/datum/equipment_preset/upp/officer/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/peaked, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/service, WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/upp, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/t73, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/notepad, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/pen/clicky, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

/datum/equipment_preset/upp/officer/senior
	name = "UPP Senior Lieutenant"
	assignment = JOB_UPP_SRLT_OFFICER
	role_comm_title = "SRLT"
	rank = JOB_UPP_SRLT_OFFICER
	paygrades = list(PAY_SHORT_UO2 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/upp/officer/kapitan
	name = "UPP Kapitan"
	assignment = JOB_UPP_KPT_OFFICER
	role_comm_title = "KPT"
	rank = JOB_UPP_KPT_OFFICER
	paygrades = list(PAY_SHORT_UO3 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/upp/kapitan

/datum/equipment_preset/upp/officer/major
	name = "UPP Major"
	assignment = JOB_UPP_MAY_OFFICER
	role_comm_title = "MAY"
	rank = JOB_UPP_MAY_OFFICER
	paygrades = list(PAY_SHORT_UO4 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/upp/commander

/datum/equipment_preset/upp/officer/lt_kolonel
	name = "UPP Leytenant Kolonel"
	assignment = JOB_UPP_LTKOL_OFFICER
	role_comm_title = "LTKOL"
	rank = JOB_UPP_LTKOL_OFFICER
	paygrades = list(PAY_SHORT_UO5 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/upp/officer/kolonel
	name = "UPP Kolonel"
	assignment = JOB_UPP_KOL_OFFICER
	role_comm_title = "KOL"
	rank = JOB_UPP_KOL_OFFICER
	paygrades = list(PAY_SHORT_UO6 = JOB_PLAYTIME_TIER_0)

//*****************************************************************************************************/
/datum/equipment_preset/upp/synth
	name = "UPP Support Synthetic"
	flags = EQUIPMENT_PRESET_EXTRA
	languages = ALL_SYNTH_LANGUAGES_UPP
	skills = /datum/skills/synthetic
	assignment = "Support Synthetic"
	rank = JOB_UPP_SUPPORT_SYNTH
	paygrades = list(PAY_SHORT_SYN = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_SYNTH, ACCESS_UPP_GENERAL, ACCESS_UPP_SECURITY, ACCESS_UPP_ARMORY, ACCESS_UPP_FLIGHT, ACCESS_UPP_SQUAD_ONE, ACCESS_UPP_SQUAD_TWO, ACCESS_UPP_LEADERSHIP, ACCESS_UPP_SENIOR_LEAD, ACCESS_UPP_MEDPREP, ACCESS_UPP_TLPREP)

/datum/equipment_preset/upp/synth/load_race(mob/living/carbon/human/new_human)
	new_human.set_species(SYNTH_GEN_THREE)

/datum/equipment_preset/upp/synth/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "Naval Infantry Telnyashka"
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	//head
	var/helmetvariety = rand(1,2)
	switch(helmetvariety)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval/alt, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/khaki, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/drop_black/equipped, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light/pap, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/synth, WEAR_R_STORE)

/datum/equipment_preset/upp/synth/commando
	name = "UPP Synthetic Commando"
	flags = EQUIPMENT_PRESET_EXTRA
	languages = ALL_SYNTH_LANGUAGES_UPP
	skills = /datum/skills/synthetic
	assignment = "Commando"
	rank = JOB_UPP_COMBAT_SYNTH
	paygrades = list(PAY_SHORT_SYN = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_SECURITY, ACCESS_UPP_ARMORY, ACCESS_UPP_FLIGHT, ACCESS_UPP_SQUAD_ONE, ACCESS_UPP_SQUAD_TWO, ACCESS_UPP_LEADERSHIP, ACCESS_UPP_SENIOR_LEAD, ACCESS_UPP_MEDPREP, ACCESS_UPP_TLPREP)
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/upp/synth/commando/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)

	new_human.change_real_name(new_human, "Commando #[rand(250)]")
	new_human.age = rand(18,35)
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
		new_human.h_style = pick("Undercut, Top", "Shaved Head", "Bald")
		new_human.f_style = "Shaved"
	else
		new_human.h_style = pick("Undercut, Top", "Shaved Head", "Bald")

/datum/equipment_preset/upp/synth/commando/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/type23, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles/upp, WEAR_EYES)
	//head
	var/helmetvariety = rand(1,2)
	switch(helmetvariety)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval/alt, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/equipped, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/carbine, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/shotgun/heavybuck, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/upp, WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/commando
	name = "UPP Reconnaissance Commando"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/commando
	assignment = "Reconnaissance Commando Frogman"
	rank = JOB_UPP_COMMANDO
	role_comm_title = "RECON"
	paygrades = list(PAY_SHORT_UE7 = JOB_PLAYTIME_TIER_0)
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_ENGLISH, LANGUAGE_TSL, LANGUAGE_SPANISH, LANGUAGE_CHINESE)
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_SECURITY, ACCESS_UPP_ARMORY, ACCESS_UPP_FLIGHT, ACCESS_UPP_SQUAD_ONE, ACCESS_UPP_SQUAD_TWO, ACCESS_UPP_LEADERSHIP, ACCESS_UPP_SENIOR_LEAD, ACCESS_UPP_MEDPREP, ACCESS_UPP_TLPREP)

/datum/equipment_preset/upp/commando/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/restraint/handcuffs/zip, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/restraint/handcuffs/zip, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/restraint/handcuffs/zip, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)

	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/kdo, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/upp, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles/upp, WEAR_EYES)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/np92/suppressed, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92, WEAR_IN_ACCESSORY)

	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/carbine/commando, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/commando/leader
	name = "UPP Reconnaissance Commando Leader"
	skills = /datum/skills/commando/leader
	assignment = "Lead Reconnaissance Commando Frogman"
	rank = JOB_UPP_COMMANDO_LEADER
	role_comm_title = "RECON-TL"
	paygrades = list(PAY_SHORT_UO2 = JOB_PLAYTIME_TIER_0)

//*****************************************************************************************************/

/datum/equipment_preset/upp/tank
	name = "UPP Vehicle Crewman"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Crewman"
	role_comm_title = "CRMN"
	rank = JOB_UPP_CREWMAN
	paygrades = list(PAY_SHORT_UE2 = JOB_PLAYTIME_TIER_0, PAY_SHORT_UE3 = JOB_PLAYTIME_TIER_1)
	skills = /datum/skills/tank_crew
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_ENGINEERING)

/datum/equipment_preset/upp/tank/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding, WEAR_EYES)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/equipped, WEAR_R_STORE)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light/pap, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/revolver, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/tank, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)

/datum/equipment_preset/upp/pilot
	name = "UPP Pilot"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Pilot"
	role_comm_title = "PILOT"
	rank = JOB_UPP_CREWMAN
	paygrades = list(PAY_SHORT_UE2 = JOB_PLAYTIME_TIER_0, PAY_SHORT_UE3 = JOB_PLAYTIME_TIER_1)
	skills = /datum/skills/pilot
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_ENGINEERING)

/datum/equipment_preset/upp/pilot/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/naval, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/aviator, WEAR_EYES)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light/pap, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/revolver, WEAR_J_STORE)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
//*****************************************************************************************************/

/datum/equipment_preset/upp/mildoctor
	name = "UPP Military Doctor"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Leytenant Doktor"
	role_comm_title = "LTDOK"
	rank = JOB_UPP_LT_DOKTOR
	paygrades = list(PAY_SHORT_UO1 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/doctor
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_MEDICAL, ACCESS_UPP_RESEARCH, ACCESS_CLF_LEADERSHIP, ACCESS_UPP_MEDPREP)

/datum/equipment_preset/upp/mildoctor/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/surgical, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/medic, WEAR_L_EAR)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret/naval, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/equipped, WEAR_ACCESSORY)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/oxycodone, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/oxycodone, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/tricordrazine, WEAR_IN_L_STORE)

//CIVILIANS

/datum/equipment_preset/upp/colonist
	name = "UPP Civilian"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Grazhdanin"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_CIVILIAN_PUBLIC)
	idtype = /obj/item/card/id

/datum/equipment_preset/upp/colonist/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	var/random_civilian_satchel= rand(1,3)
	switch(random_civilian_satchel)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/blue(new_human), WEAR_BACK)

	var/random_civilian_uniform= rand(1,9)
	switch(random_civilian_uniform)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/khaki(new_human), WEAR_BODY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/cyan(new_human), WEAR_BODY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/grey(new_human), WEAR_BODY)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/blue(new_human), WEAR_BODY)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/khaki(new_human), WEAR_BODY)
		if(6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/pink(new_human), WEAR_BODY)
		if(7)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/green(new_human), WEAR_BODY)
		if(8)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/brown(new_human), WEAR_BODY)
		if(9)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/blue(new_human), WEAR_BODY)

	var/random_civilian_jacket= rand(1,12)
	switch(random_civilian_jacket)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate/brown(new_human), WEAR_JACKET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate/blue(new_human), WEAR_JACKET)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate(new_human), WEAR_JACKET)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_yellow(new_human), WEAR_JACKET)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_brown(new_human), WEAR_JACKET)
		if(6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_blue(new_human), WEAR_JACKET)
		if(7)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/windbreaker_green(new_human), WEAR_JACKET)
		if(8)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/vest(new_human), WEAR_JACKET)
		if(9)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/vest/tan(new_human), WEAR_JACKET)
		if(10)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/vest/grey(new_human), WEAR_JACKET)
		if(11)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/apron/overalls(new_human), WEAR_JACKET)
		if(12)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/apron/overalls/tan(new_human), WEAR_JACKET)
	var/random_civilian_shoe = rand(1,7)
	switch(random_civilian_shoe)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown(new_human), WEAR_FEET)
		if(3 to 4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
		if(6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian(new_human), WEAR_FEET)
		if(7)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(new_human), WEAR_FEET)

/datum/equipment_preset/upp/researcher
	name = "UPP Civilian Researcher"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Ministry of Education Research Associate"
	paygrades = list(PAY_SHORT_CCMO = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/researcher
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH)
	idtype = /obj/item/card/id

/datum/equipment_preset/upp/researcher/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	var/random_civilian_satchel= rand(1,3)
	switch(random_civilian_satchel)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BODY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BODY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/blue(new_human), WEAR_BODY)

	var/random_professional_uniform= rand(1,3)
	switch(random_professional_uniform)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/brown(new_human), WEAR_BODY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/blue(new_human), WEAR_BODY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/black(new_human), WEAR_BODY)

	var/random_tie= rand(1,6)
	switch(random_tie)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/black(new_human), WEAR_ACCESSORY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/blue(new_human), WEAR_ACCESSORY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/green(new_human), WEAR_ACCESSORY)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/purple(new_human), WEAR_ACCESSORY)
		if(6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/red(new_human), WEAR_ACCESSORY)

	var/random_archeologist_suit = rand(1,4)
	switch(random_archeologist_suit)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat(new_human), WEAR_JACKET)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/vest/tan(new_human), WEAR_JACKET)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/vest(new_human), WEAR_JACKET)

	var/random_professional_shoe = rand(1,2)
	switch(random_professional_shoe)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown(new_human), WEAR_FEET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)

/datum/equipment_preset/upp/doctor

	name = "UPP Civilian Doctor"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Ministry of Health Medical Doctor"
	paygrades = list(PAY_SHORT_CDOC = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/survivor/doctor
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_MEDBAY)
	idtype = /obj/item/card/id

/datum/equipment_preset/upp/doctor/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	var/random_civilian_satchel= rand(1,3)
	switch(random_civilian_satchel)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/blue(new_human), WEAR_BACK)

	var/random_professional_uniform= rand(1,3)
	switch(random_professional_uniform)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/brown(new_human), WEAR_BODY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/blue(new_human), WEAR_BODY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/black(new_human), WEAR_BODY)

	var/random_tie= rand(1,6)
	switch(random_tie)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/black(new_human), WEAR_ACCESSORY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/blue(new_human), WEAR_ACCESSORY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/green(new_human), WEAR_ACCESSORY)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/purple(new_human), WEAR_ACCESSORY)
		if(6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/red(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat(new_human), WEAR_JACKET)

	var/random_professional_shoe = rand(1,2)
	switch(random_professional_shoe)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown(new_human), WEAR_FEET)

/datum/equipment_preset/upp/admin
	name = "UPP Civilian Administrator"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	faction_group = FACTION_LIST_UPP_COLONY
	assignment = "Administrator"
	role_comm_title = "ADMIN"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_LEADERSHIP, ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_LOGISTICS, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_MEDBAY, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id

/datum/equipment_preset/upp/admin/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/brown(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/black(new_human), WEAR_ACCESSORY)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)

/datum/equipment_preset/upp/cargo
	name = "UPP Civilian Logistics Worker"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Logistical Technician"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_LOGISTICS)
	idtype = /obj/item/card/id

/datum/equipment_preset/upp/cargo/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	var/random_boilersuit= rand(1,3)
	switch(random_boilersuit)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/khaki(new_human), WEAR_BODY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/cyan(new_human), WEAR_BODY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/grey(new_human), WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/utility_vest(new_human), WEAR_JACKET)
	//limb
	var/random_worker_shoe = rand(1,5)
	switch(random_worker_shoe)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian(new_human), WEAR_FEET)
		if(3 to 4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(new_human), WEAR_FEET)

/datum/equipment_preset/upp/engineer
	name = "UPP Civilian Engineer"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Maintenance Technician"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/MT
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_ENGINEERING)
	idtype = /obj/item/card/id

/datum/equipment_preset/upp/engineer/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	var/random_boilersuit= rand(1,3)
	switch(random_boilersuit)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/khaki(new_human), WEAR_BODY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/cyan(new_human), WEAR_BODY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/boilersuit/grey(new_human), WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/utility_vest(new_human), WEAR_JACKET)
	//limbs
	var/random_worker_shoe = rand(1,5)
	switch(random_worker_shoe)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian(new_human), WEAR_FEET)
		if(3 to 4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(new_human), WEAR_FEET)

/datum/equipment_preset/upp/operations
	name = "UPP Civilian Operations Technician"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Operations Technician"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_UPP_GENERAL, ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id

/datum/equipment_preset/upp/operations/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear(new_human), WEAR_BODY)
	//limb
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)

/datum/equipment_preset/upp/police
	name = "UPP People's Armed Police Officer"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	faction_group = FACTION_LIST_UPP_COLONY
	assignment = "People's Armed Police Militsioner"
	role_comm_title = "MILTSY"
	paygrades = list(PAY_SHORT_UC1 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/cmb
	access = list(ACCESS_UPP_GENERAL, ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_LOGISTICS, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_MEDBAY, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id/silver

/datum/equipment_preset/upp/police/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/peaked/police, WEAR_HEAD)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/pap, WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/jacket/pap, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/UPP/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/t73, WEAR_IN_R_STORE)


/datum/equipment_preset/upp/police/riot
	name = "UPP People's Armed Police Officer - Riot"

/datum/equipment_preset/upp/police/riot/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/nerve_gas, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/nerve_gas, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/nerve_gas, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/military/upp, WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/peaked/police, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/pap, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/beanbag, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/beanbag, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/beanbag, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/beanbag, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/heavy/beanbag, WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/light/pap, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/UPP/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/t73, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/type23/riot, WEAR_R_HAND)

/datum/equipment_preset/upp/prisoner
	name = "UPP Prisoner"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Inmate"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(null)
	idtype = /obj/item/card/id/lanyard

/datum/equipment_preset/upp/prisoner/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/prison_boiler(new_human), WEAR_BODY)
	//limb
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(new_human), WEAR_FEET)

/datum/equipment_preset/upp/police/mss
	name = "UPP MSS Agent"
	assignment = "Ministry of Space Security Operative"
	role_comm_title = "MSS-OP"
	paygrades = list(PAY_SHORT_UO2 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/cmb
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_SECURITY, ACCESS_UPP_ARMORY, ACCESS_UPP_FLIGHT, ACCESS_UPP_SQUAD_ONE, ACCESS_UPP_SQUAD_TWO, ACCESS_UPP_LEADERSHIP, ACCESS_UPP_SENIOR_LEAD, ACCESS_UPP_MEDPREP, ACCESS_UPP_TLPREP, ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_COMMAND)
	idtype = /obj/item/card/id/silver

/datum/equipment_preset/upp/police/mss/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/peaked/mss, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/service, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/np92(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92(new_human), WEAR_IN_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/upp/mss, WEAR_JACKET)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/notepad, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/pen/clicky, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

	//back
	//face
	//head
	//uniform
	//jacket
	//waist
	//limbs
	//pockets
