/datum/equipment_preset/upp
	name = FACTION_UPP
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_CHINESE)
	faction = FACTION_UPP
	idtype = /obj/item/card/id/dogtag
	origin_override = ORIGIN_UPP

/datum/equipment_preset/upp/New()
	. = ..()
	access = get_access(ACCESS_LIST_UPP_ALL) //ACCESS_COME_BACK_TO_ME

/datum/equipment_preset/upp/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(50;MALE,50;FEMALE)
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
			first_name = "[pick(first_names_male_upp)]"
	else
		if(prob(40))
			first_name = "[capitalize(randomly_generate_chinese_word(1))]"
		else
			first_name = "[pick(first_names_female_upp)]"
	//surname
	if(prob(35))
		last_name = "[capitalize(randomly_generate_chinese_word(pick(20;1, 80;2)))]"
	else
		last_name = "[pick(last_names_upp)]"
	//put them together
	random_name = "[first_name] [last_name]"
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
		new_human.h_style = pick("Side Undercut", "Side Hang Undercut (Reverse)", "Undercut, Top", "CIA", "CIA","Mulder", "Pixie Cut Left", "Pixie Cut Right", "Bun")
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,35)

	idtype = /obj/item/card/id/dogtag

//*****************************************************************************************************/

/datum/equipment_preset/upp/militia
	//Not a meme role
	name = "UPP Colonial Militia Rifleman"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/upp
	assignment = "Colonial Defense Rifleman"
	role_comm_title = "ColDef"
	paygrade = "UE1"

/datum/equipment_preset/upp/militia/load_gear(mob/living/carbon/human/new_human)
	//back
	var/maybebackpack = prob(20) ? pick(/obj/item/storage/backpack/lightpack/upp, /obj/item/storage/backpack/satchel) : null
	if(maybebackpack)
		new_human.equip_to_slot_or_del(new maybebackpack, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)

	//head
	var/maybehat = prob(66) ? pick(/obj/item/clothing/head/uppcap, /obj/item/clothing/head/uppcap/beret, /obj/item/clothing/head/ushanka, /obj/item/clothing/head/uppcap/ushanka) : null
	if(maybehat)
		new_human.equip_to_slot_or_del(new maybehat, WEAR_HEAD)

	//body
	var/obj/item/clothing/under/marine/veteran/UPP/UPP = new()
	new_human.equip_to_slot_or_del(UPP, WEAR_BODY)

	var/maybejacket = prob(50) ? pick(/obj/item/clothing/suit/storage/marine/faction/UPP/jacket, /obj/item/clothing/suit/storage/snow_suit/soviet) : null
	if(maybejacket)
		new_human.equip_to_slot_or_del(new maybejacket, WEAR_JACKET)
		new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_JACKET)
		new_human.equip_to_slot_or_del(new /obj/item/stack/medical/splint, WEAR_IN_JACKET)
		//limit of snowcoat
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_JACKET)

	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)

	//gun
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/carbine, WEAR_R_HAND)

	//webbing or belt?
	if(prob(30))
		var/obj/item/clothing/accessory/storage/webbing/W = new()
		UPP.attach_accessory(new_human, W)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
	else if(prob(30))
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/scarce, WEAR_WAIST)
	//if you fail the rolls you must scavenge the ammo from your fallen brethren

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

	if(prob(10))
		//sometimes Ivan smiles upon the corps
		new_human.set_species("Human Hero")

//*****************************************************************************************************/

/datum/equipment_preset/uscm/private_equipped/upp
	name = "UPP Squad Rifleman (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_UPP_GENERAL)
	assignment = JOB_SQUAD_MARINE
	rank = JOB_SQUAD_MARINE
	paygrade = "UE2"
	role_comm_title = "RFN"
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_CHINESE)
	faction_group = list(FACTION_UPP)
	faction = FACTION_UPP
	skills = /datum/skills/pfc

/datum/equipment_preset/uscm/private_equipped/upp/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP, WEAR_HEAD)
	//body
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/platoon, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp_knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

/datum/equipment_preset/uscm/private_equipped/upp/lesser_rank
	paygrade = "UE1"

//*****************************************************************************************************/

/datum/equipment_preset/uscm/medic_equipped/upp
	name = "UPP Squad Sanitar (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_MEDPREP, ACCESS_UPP_MEDICAL)
	assignment = JOB_SQUAD_MEDIC_UPP
	rank = JOB_SQUAD_MEDIC_UPP
	paygrade = "UE4"
	role_comm_title ="SNITR"
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_CHINESE)
	faction_group = list(FACTION_UPP)
	faction = FACTION_UPP
	skills = /datum/skills/combat_medic

/datum/equipment_preset/uscm/medic_equipped/upp/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK) //2
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK) //2.33
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //3
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //3.33
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/medic, WEAR_L_EAR)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP, WEAR_HEAD)
	//body
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/platoon, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/support, WEAR_JACKET) //medic should move fast
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/bizon/upp, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//póckets
	var/obj/item/storage/pouch/magazine/large/ppouch = new()
	new_human.equip_to_slot_or_del(ppouch, WEAR_R_STORE)
	for(var/i = 1 to ppouch.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/bizon, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/tricordrazine, WEAR_IN_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/smartgunner_equipped/upp
	name = "UPP Squad Machinegunner (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_MACHINEGUN)
	assignment = "Machinegunner"
	paygrade = "UE4"
	role_comm_title = "MG"
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_CHINESE)
	faction_group = list(FACTION_UPP)
	faction = FACTION_UPP

/datum/equipment_preset/uscm/smartgunner_equipped/upp/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //1.33
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //1.66
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/heavy, WEAR_HEAD)
	//body
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/platoon, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/heavy, WEAR_JACKET)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/green, WEAR_FACE)

	//body
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pkp, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_JACKET)
	//waist
	var/uppvetsidearm = prob(50) ? /obj/item/storage/belt/gun/type47/t73 : /obj/item/storage/belt/gun/type47/np92
	new_human.equip_to_slot_or_del(new uppvetsidearm, WEAR_WAIST) // 50/50 np92 or t73

//*****************************************************************************************************/
/datum/equipment_preset/uscm/tl_equipped/upp
	name = "UPP Squad Sergeant (Equipped)"
	paygrade = "UE5"
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_TLPREP)
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_ENGLISH, LANGUAGE_CHINESE)
	faction_group = list(FACTION_UPP)
	faction = FACTION_UPP

/datum/equipment_preset/uscm/tl_equipped/upp/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP, WEAR_HEAD)
	//body
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/platoon, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp_knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/uscm/leader_equipped/upp
	name = "USCM Platoon Sergeant (Equipped)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP)
	assignment = JOB_SQUAD_LEADER
	rank = JOB_SQUAD_LEADER
	paygrade = "ME7"
	role_comm_title = "PltSgt"
	minimum_age = 27
	skills = /datum/skills/SL

	minimap_icon = "leader"

/datum/equipment_preset/uscm/leader_equipped/upp/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP, WEAR_HEAD)
	//body
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/platoon, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp_knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
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

	skills = /datum/skills/upp/military_police
	assignment = JOB_UPP_POLICE
	rank = JOB_UPP_POLICE
	role_comm_title = "MP"
	paygrade = "UE6"

/datum/equipment_preset/upp/military_police/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/mp, WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/mp, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/revolver, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/UPP/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/officer
	name = "UPP Lieutenant"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/upp/officer
	assignment = JOB_UPP_LT_OFFICER
	rank = JOB_UPP_LT_OFFICER
	role_comm_title = "Lt."
	paygrade = "UO1"

/datum/equipment_preset/upp/officer/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/officer, WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/officer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/t73, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

/datum/equipment_preset/upp/officer/senior
	name = "UPP Senior Lieutenant"
	assignment = JOB_UPP_SRLT_OFFICER
	rank = JOB_UPP_SRLT_OFFICER
	role_comm_title = "Sr-Lt."
	paygrade = "UO2"

/datum/equipment_preset/upp/officer/kapitan
	name = "UPP Kapitan"
	assignment = JOB_UPP_KPT_OFFICER
	rank = JOB_UPP_KPT_OFFICER
	role_comm_title = "May."
	paygrade = "UO3"
	skills = /datum/skills/upp/kapitan

/datum/equipment_preset/upp/officer/major
	name = "UPP Major"
	assignment = JOB_UPP_MAY_OFFICER
	rank = JOB_UPP_MAY_OFFICER
	role_comm_title = "May."
	paygrade = "UO4"
	skills = /datum/skills/upp/commander

/datum/equipment_preset/upp/officer/lt_kolonel
	name = "UPP Leytenant Kolonel"
	assignment = JOB_UPP_LTKOL_OFFICER
	rank = JOB_UPP_LTKOL_OFFICER
	role_comm_title = "Lt. Kol."
	paygrade = "UO5"
	skills = /datum/skills/upp/commander

/datum/equipment_preset/upp/officer/kolonel
	name = "UPP Kolonel"
	assignment = JOB_UPP_KOL_OFFICER
	rank = JOB_UPP_KOL_OFFICER
	role_comm_title = "Kol."
	paygrade = "UO6"
	skills = /datum/skills/upp/commander


//*****************************************************************************************************/

/datum/equipment_preset/upp/synth
	name = "UPP Combat Synthetic"
	flags = EQUIPMENT_PRESET_EXTRA

	languages = ALL_SYNTH_LANGUAGES_UPP

	skills = /datum/skills/synthetic
	assignment = JOB_UPP_COMBAT_SYNTH
	rank = JOB_UPP_COMBAT_SYNTH
	paygrade = "SYN"
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/upp/synth/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(50;MALE,50;FEMALE)
/* 	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(prob(10))
		random_name = "[capitalize(randomly_generate_chinese_word(2))]"
	else if(new_human.gender == MALE)
		random_name = "[pick(first_names_male_upp)]"
	else
		random_name = "[pick(first_names_female_upp)]" */

/datum/equipment_preset/upp/synth/load_race(mob/living/carbon/human/new_human)
	new_human.set_species(SYNTH_GEN_THREE)

/datum/equipment_preset/upp/synth/load_gear(mob/living/carbon/human/new_human)
	load_name(new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK) //2
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK) //2.33
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //2.66
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //3
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //3.33
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	//head
	var/hat = pick(/obj/item/clothing/head/uppcap, /obj/item/clothing/head/uppcap/beret, /obj/item/clothing/head/uppcap/ushanka)
	new_human.equip_to_slot_or_del(new hat, WEAR_HEAD)
	//body
	var/obj/item/clothing/under/marine/veteran/UPP = new()
	var/obj/item/clothing/accessory/storage/tool_webbing/equipped/W = new()
	UPP.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/support, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/glass/bottle/tricordrazine, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/bizon/upp, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//póckets
	var/obj/item/storage/pouch/magazine/large/ppouch = new()
	new_human.equip_to_slot_or_del(ppouch, WEAR_R_STORE)
	for(var/i = 1 to ppouch.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/bizon, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/tricordrazine, WEAR_IN_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/commando
	name = "UPP Commando"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/commando
	assignment = JOB_UPP_COMMANDO
	rank = JOB_UPP_COMMANDO
	role_comm_title = "JKdo"
	paygrade = "UC1"
	idtype = /obj/item/card/id/data
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_ENGLISH, LANGUAGE_TSL, LANGUAGE_SPANISH, LANGUAGE_CHINESE)

/datum/equipment_preset/upp/commando/New()
	. = ..()
	access = get_access(ACCESS_LIST_GLOBAL)

/datum/equipment_preset/upp/commando/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/kdo, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/commando, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/np92/suppressed, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/upp, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles/upp, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full, WEAR_L_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/handcuffs, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/handcuffs, WEAR_IN_BACK)

	spawn_weapon(/obj/item/weapon/gun/rifle/type71/carbine/commando, /obj/item/ammo_magazine/rifle/type71, new_human, 0, 8)

//*****************************************************************************************************/

/datum/equipment_preset/upp/commando/leader
	name = "UPP Commando Leader"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/commando/leader
	assignment = JOB_UPP_COMMANDO_LEADER
	rank = JOB_UPP_COMMANDO_LEADER
	role_comm_title = "1stKdo"
	paygrade = "UC3"
	idtype = /obj/item/card/id/silver

/datum/equipment_preset/upp/commando/leader/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/kdo/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/commando, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/upp, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles/upp, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/np92/suppressed, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4, WEAR_L_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/handcuffs, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/handcuffs, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/handcuffs, WEAR_IN_BACK)

	spawn_weapon(/obj/item/weapon/gun/rifle/type71/carbine/commando, /obj/item/ammo_magazine/rifle/type71, new_human, 0, 7)

//*****************************************************************************************************/

/datum/equipment_preset/upp/tank
	name = "UPP Vehicle Crewman"
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_UPP_CREWMAN
	rank = JOB_UPP_CREWMAN
	paygrade = "UE5"
	role_comm_title = "TANK"
	minimum_age = 18
	skills = /datum/skills/tank_crew

/datum/equipment_preset/upp/tank/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/cct(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/revolver(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/jacket(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tank(new_human), WEAR_R_STORE)

	spawn_weapon(/obj/item/weapon/gun/rifle/type71/carbine, /obj/item/ammo_magazine/rifle/type71, new_human, 0, 3)

/datum/equipment_preset/upp/tank/load_status()
	return

//*****************************************************************************************************/

/datum/equipment_preset/upp/doctor
	name = "UPP Doctor"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/upp/combat_medic
	assignment = JOB_UPP_LT_DOKTOR
	rank = JOB_UPP_LT_DOKTOR
	role_comm_title = "Lt. Med."
	paygrade = "UO1"

/datum/equipment_preset/upp/doctor/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/np92, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/medic, WEAR_L_EAR)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap, WEAR_HEAD)
	//body
	var/obj/item/clothing/under/marine/veteran/UPP = new()
	var/obj/item/clothing/accessory/storage/surg_vest/equipped/W = new()
	UPP.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(UPP, WEAR_BODY)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/oxycodone, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	//póckets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/oxycodone, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/tricordrazine, WEAR_IN_L_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/foxtrot, WEAR_FACE)
