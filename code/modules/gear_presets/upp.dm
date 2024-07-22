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
		new_human.f_style = pick("3 O'clock Shadow", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache")
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

	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(17,35)
	new_human.h_style = pick("Crewcut", "Shaved Head", "Buzzcut", "Undercut", "Side Undercut", "Bun, Topknot")
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
	idtype = /obj/item/card/id/dogtag

//*****************************************************************************************************/

/datum/equipment_preset/uscm/private_equipped/upp
	name = "UPP Squad Rifleman"
	paygrade = "UE2"
	access = list(ACCESS_UPP_GENERAL)
	languages = list(LANGUAGE_RUSSIAN, LANGUAGE_CHINESE)
	faction_group = list(FACTION_UPP)
	faction = FACTION_UPP

/datum/equipment_preset/uscm/private_equipped/upp/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP, WEAR_HEAD)
	//body
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/platoon, WEAR_BODY)
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

/datum/equipment_preset/upp/medic
	name = "UPP Medic"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/upp/combat_medic
	assignment = JOB_UPP_MEDIC
	rank = JOB_UPP_MEDIC
	role_comm_title = "Med"
	paygrade = "UE3"

/datum/equipment_preset/upp/medic/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/compact, WEAR_IN_BACK) //1
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
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap, WEAR_HEAD)
	//body
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/medic, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/support, WEAR_JACKET) //medic should move fast
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/bizon/upp, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
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

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/machinegunner
	name = "UPP Machinegunner"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/upp/specialist
	assignment = JOB_UPP_SPECIALIST
	rank = JOB_UPP_SPECIALIST
	role_comm_title = "Spc"
	paygrade = "UE5"

/datum/equipment_preset/upp/machinegunner/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_BACK) //1
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //1.33
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //1.66
	//back
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/heavy, WEAR_HEAD)
	//body
	var/obj/item/clothing/under/marine/veteran/UPP/UPP = new()
	new_human.equip_to_slot_or_del(UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/heavy, WEAR_JACKET)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

	var/obj/item/device/internal_implant/subdermal_armor/implant = new()
	implant.on_implanted(new_human)

	//body
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pkp, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp, WEAR_IN_JACKET)
	//waist
	var/uppvetsidearm = prob(50) ? /obj/item/storage/belt/gun/type47/t73 : /obj/item/storage/belt/gun/type47/np92
	new_human.equip_to_slot_or_del(new uppvetsidearm, WEAR_WAIST) // 50/50 np92 or t73

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
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret, WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/mp, WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/mp, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/revolver, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/UPP/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder, WEAR_IN_R_STORE)
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
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/officer/M = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	M.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(M, WEAR_BODY)
	for(var/i in 1 to W.hold.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_ACCESSORY)

	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/officer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer/leader, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/np92, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/officer/senior
	name = "UPP Senior Lieutenant"
	assignment = JOB_UPP_SRLT_OFFICER
	rank = JOB_UPP_SRLT_OFFICER
	role_comm_title = "Sr-Lt."
	paygrade = "UO2"

/datum/equipment_preset/upp/officer/senior/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/officer/M = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	M.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(M, WEAR_BODY)
	for(var/i in 1 to W.hold.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_ACCESSORY)

	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/officer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer/leader, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/t73, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/officer/kapitan
	name = "UPP Kapitan"
	assignment = JOB_UPP_KPT_OFFICER
	rank = JOB_UPP_KPT_OFFICER
	role_comm_title = "May."
	paygrade = "UO3"
	skills = /datum/skills/upp/kapitan

/datum/equipment_preset/upp/officer/kapitan/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/officer/M = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	M.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(M, WEAR_BODY)
	for(var/i in 1 to W.hold.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_ACCESSORY)

	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/kapitan, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer/leader, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/t73, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/officer/major
	name = "UPP Major"
	assignment = JOB_UPP_MAY_OFFICER
	rank = JOB_UPP_MAY_OFFICER
	role_comm_title = "May."
	paygrade = "UO4"
	skills = /datum/skills/upp/commander

/datum/equipment_preset/upp/officer/major/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/peaked, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/officer/M = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	M.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(M, WEAR_BODY)
	for(var/i in 1 to W.hold.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_ACCESSORY)

	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/kapitan, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer/leader, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/t73/leader, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

//*****************************************************************************************************/

/datum/equipment_preset/upp/officer/lt_kolonel
	name = "UPP Leytenant Kolonel"
	assignment = JOB_UPP_LTKOL_OFFICER
	rank = JOB_UPP_LTKOL_OFFICER
	role_comm_title = "Lt. Kol."
	paygrade = "UO5"
	skills = /datum/skills/upp/commander

/datum/equipment_preset/upp/officer/lt_kolonel/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/peaked, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/officer/M = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	M.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(M, WEAR_BODY)
	for(var/i in 1 to W.hold.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_ACCESSORY)

	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/kapitan, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer/leader, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/t73/leader, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)
//*****************************************************************************************************/

/datum/equipment_preset/upp/officer/kolonel
	name = "UPP Kolonel"
	assignment = JOB_UPP_KOL_OFFICER
	rank = JOB_UPP_KOL_OFFICER
	role_comm_title = "Kol."
	paygrade = "UO6"
	skills = /datum/skills/upp/commander

/datum/equipment_preset/upp/officer/kolonel/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/peaked, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/UPP/officer/M = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	M.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(M, WEAR_BODY)
	for(var/i in 1 to W.hold.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_ACCESSORY)

	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/kapitan, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/flamer/leader, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/t73/leader, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full, WEAR_R_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

//*****************************************************************************************************/
/datum/equipment_preset/upp/synth
	name = "UPP Combat Synthetic"
	flags = EQUIPMENT_PRESET_EXTRA

	languages = ALL_SYNTH_LANGUAGES_UPP

	skills = /datum/skills/synthetic
	assignment = JOB_UPP_COMBAT_SYNTH
	rank = JOB_UPP_COMBAT_SYNTH
	paygrade = "SYN"
	idtype = /obj/item/card/id/gold

/datum/equipment_preset/upp/synth/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(50;MALE,50;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(prob(10))
		random_name = "[capitalize(randomly_generate_chinese_word(2))]"
	else if(new_human.gender == MALE)
		random_name = "[pick(first_names_male_upp)]"
	else
		random_name = "[pick(first_names_female_upp)]"

	if(new_human.gender == MALE)
		new_human.f_style = pick("3 O'clock Shadow", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache")


	new_human.change_real_name(new_human, random_name)
	new_human.h_style = pick("Crewcut", "Shaved Head", "Buzzcut", "Undercut", "Side Undercut")
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
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/upp/synth/load_race(mob/living/carbon/human/new_human)
	new_human.set_species(SYNTH_GEN_THREE)

/datum/equipment_preset/upp/synth/load_gear(mob/living/carbon/human/new_human)
	load_name(new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/compact, WEAR_IN_BACK) //1
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK) //2
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK) //2.33
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //2.66
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //3
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //3.33
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/command, WEAR_L_EAR)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	//head
	var/hat = pick(/obj/item/clothing/head/uppcap, /obj/item/clothing/head/uppcap/beret, /obj/item/clothing/head/uppcap/ushanka)
	new_human.equip_to_slot_or_del(new hat, WEAR_HEAD)
	//body
	var/obj/item/clothing/under/marine/veteran/UPP/medic/UPP = new()
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
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
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

/datum/equipment_preset/upp/conscript
	//meme role
	name = "UPP Colonial Defense Soldider"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/upp
	assignment = "Colonial Defense Rifleman"
	rank = JOB_UPP_CONSCRIPT
	role_comm_title = "ColDef"
	paygrade = "UE1"

/datum/equipment_preset/upp/conscript/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels
	//back
	var/maybebackpack = prob(20) ? pick(/obj/item/storage/backpack/lightpack/upp, /obj/item/storage/backpack/lightpack) : null
	if(maybebackpack)
		new_human.equip_to_slot_or_del(new maybebackpack, WEAR_BACK) //what in back?
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
		new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/bottle/vodka, WEAR_IN_JACKET)
		//limit of snowcoat
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/upp, WEAR_IN_JACKET)

	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	var/maybegloves = prob(80) ? pick(/obj/item/clothing/gloves/black, /obj/item/clothing/gloves/marine/veteran/upp, /obj/item/clothing/gloves/combat) : null
	if(maybegloves)
		new_human.equip_to_slot_or_del(new maybegloves, WEAR_HANDS)

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

/datum/equipment_preset/upp/commando
	name = "UPP Commando (!DEATHSQUAD!)"
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
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
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

/datum/equipment_preset/upp/commando/medic
	name = "UPP Commando Medic (!DEATHSQUAD!)"
	flags = EQUIPMENT_PRESET_EXTRA

	skills = /datum/skills/commando/medic
	assignment = JOB_UPP_COMMANDO_MEDIC
	rank = JOB_UPP_COMMANDO_MEDIC
	role_comm_title = "2ndKdo"
	paygrade = "UC2"

/datum/equipment_preset/upp/commando/medic/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/kdo/medic, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/medic, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/commando, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/upp, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles/upp, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4, WEAR_L_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/handcuffs, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/handcuffs, WEAR_IN_JACKET)

	spawn_weapon(/obj/item/weapon/gun/rifle/type71/carbine/commando, /obj/item/ammo_magazine/rifle/type71, new_human, 0, 5)

//*****************************************************************************************************/

/datum/equipment_preset/upp/commando/leader
	name = "UPP Commando Leader (!DEATHSQUAD!)"
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
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
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


/datum/equipment_preset/upp/commando/low_threat
	name = "UPP Commando"

/datum/equipment_preset/upp/commando/low_threat/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/kdo, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/commando, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/np92/suppressed, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak/upp/weak, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
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

/datum/equipment_preset/upp/commando/medic/low_threat
	name = "UPP Commando Medic"

/datum/equipment_preset/upp/commando/medic/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/kdo/medic, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP/medic, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/commando, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak/upp/weak, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/upp, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m42_night_goggles/upp, WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4, WEAR_L_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/handcuffs, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/handcuffs, WEAR_IN_JACKET)

	spawn_weapon(/obj/item/weapon/gun/rifle/type71/carbine/commando, /obj/item/ammo_magazine/rifle/type71, new_human, 0, 5)

/datum/equipment_preset/upp/commando/leader/low_threat
	name = "UPP Commando Leader"

/datum/equipment_preset/upp/commando/leader/load_gear(mob/living/carbon/human/new_human)
	//TODO: add backpacks and satchels
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/kdo/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP/commando, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/beret, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak/upp/weak, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
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

//*****************************************************************************************************/

/datum/equipment_preset/upp/tank
	name = "UPP Vehicle Crewman (TANK)"
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_UPP_CREWMAN
	rank = JOB_UPP_CREWMAN
	paygrade = "UE5"
	role_comm_title = "TANK"
	minimum_age = 30
	skills = /datum/skills/tank_crew

/datum/equipment_preset/upp/tank/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP/cct(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/revolver(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tank(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/UPP/engi(new_human), WEAR_HEAD)

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
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/surgical, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/np92, WEAR_IN_BACK) //targeting unarmed medical personal is not a war crime in aliens(primarily because, off memory, warcrimes aren't really a thing, although this definately is bad manners), and the playerbase is HRP in this concern!(if you don't get the joke, the players regularly execute unarmed doctors in hvh events. :D)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/np92, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/ushanka, WEAR_HEAD)
	//body
	var/obj/item/clothing/under/marine/veteran/UPP/medic/UPP = new()
	var/obj/item/clothing/accessory/storage/surg_vest/equipped/W = new()
	UPP.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(UPP, WEAR_BODY)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/oxycodone, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/upp, WEAR_HANDS)
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
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)
