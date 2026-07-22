/datum/equipment_preset/imperial_guard
	name = "Imperial Guard"
	faction = FACTION_IMPERIAL_GUARD
	rank = JOB_SQUAD_MARINE
	faction = FACTION_IMPERIAL_GUARD
	faction_group = list(FACTION_IMPERIAL_GUARD)
	languages = list(LANGUAGE_ENGLISH)
	var/headset_type = /obj/item/device/radio/headset/distress/imperial/imperial_guard
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/imperial_guard/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(50;MALE,50;FEMALE)
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

//*****************************************************************************************************/

/datum/equipment_preset/imperial_guard/conscript
	name = "Imperial Guard Conscript"
	assignment = JOB_IMP_CONSCRIPT
	rank = JOB_IMP_CONSCRIPT
	paygrades = list(PAY_SHORT_ME1 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP)
	role_comm_title = "Cns."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/trooper

/datum/equipment_preset/imperial_guard/conscript/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian(new_human), WEAR_FEET)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard/whiteshield(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun, WEAR_IN_R_STORE)

/datum/equipment_preset/imperial_guard/guardsman
	name = "Imperial Guard Guardsman"
	assignment = JOB_IMP_GUARDSMAN
	rank = JOB_IMP_GUARDSMAN
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Grd."
	skills = /datum/skills/pfc

/datum/equipment_preset/imperial_guard/guardsman/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard(new_human), WEAR_HEAD)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full/imperial(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human),WEAR_IN_BACK)

/datum/equipment_preset/imperial_guard/guardsman/tl
	name = "Imperial Guard Team Leader"
	assignment = JOB_IMP_TL
	rank = JOB_IMP_TL
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_TL_PREP)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "TL."
	skills = /datum/skills/tl

/datum/equipment_preset/imperial_guard/medicae
	name = "Imperial Guard Medicae"
	assignment = JOB_IMP_MEDICAE
	rank = JOB_IMP_MEDICAE
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP, ACCESS_MARINE_MEDBAY)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Med."
	skills = /datum/skills/combat_medic_pve

/datum/equipment_preset/imperial_guard/medicae/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full(new_human), WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/softpack/regular(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/softpack/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer/soul(new_human), WEAR_IN_BACK)

/datum/equipment_preset/imperial_guard/specialist/flamer
	name = "Imperial Guard Specialist (Flamer)"
	assignment = JOB_IMP_SPECIALIST
	rank = JOB_IMP_SPECIALIST
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	role_comm_title = "Spc."
	skills = /datum/skills/pfc

/datum/equipment_preset/imperial_guard/specialist/flamer/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/imperial(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/imperial(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/imperial(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full/imperial(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human),WEAR_IN_BACK)

/datum/equipment_preset/imperial_guard/specialist/plasma
	name = "Imperial Guard Specialist (Plasma)"
	assignment = JOB_IMP_SPECIALIST
	rank = JOB_IMP_SPECIALIST
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Spc."
	skills = /datum/skills/pfc

/datum/equipment_preset/imperial_guard/specialist/plasma/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/plasmagun(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/plasmagun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/plasmagun(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full/imperial(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human),WEAR_IN_BACK)

/datum/equipment_preset/imperial_guard/specialist/rocket
	name = "Imperial Guard Specialist (Rocket Launcher)"
	assignment = JOB_IMP_SPECIALIST
	rank = JOB_IMP_SPECIALIST
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Spc."
	skills = /datum/skills/pfc

/datum/equipment_preset/imperial_guard/specialist/rocket/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/launcher/rocket/imperial(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/imperial/at(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/imperial/at(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/imperial(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full/imperial(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human),WEAR_IN_BACK)

/datum/equipment_preset/imperial_guard/vox_operator
	name = "Imperial Guard Vox Operator"
	assignment = JOB_IMP_VOX_OPERATOR
	rank = JOB_IMP_VOX_OPERATOR
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Vox."
	skills = /datum/skills/tl

/datum/equipment_preset/imperial_guard/vox_operator/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/full/imperial(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/vox(new_human), WEAR_BACK)

/datum/equipment_preset/imperial_guard/sl
	name = "Imperial Guard Squad Leader"
	assignment = JOB_IMP_SL
	rank = JOB_IMP_SL
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Sl."
	skills = /datum/skills/SL

/datum/equipment_preset/imperial_guard/sl/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/guard(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/balaclava(new_human), WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/chainsword(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human),WEAR_IN_BACK)

/datum/equipment_preset/imperial_guard/lt
	name = "Imperial Guard Platoon Leader"
	assignment = JOB_IMP_LT
	rank = JOB_IMP_LT
	paygrades = list(PAY_SHORT_MO2 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_LEADER, ACCESS_MARINE_COMMAND)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Lt."
	skills = /datum/skills/lt

/datum/equipment_preset/imperial_guard/lt/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/imperial(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/guard(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/chainsword(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human),WEAR_IN_BACK)

/datum/equipment_preset/imperial_guard/commissar
	name = "Imperial Commissar"
	assignment = JOB_IMP_CMR
	rank = JOB_IMP_CMR
	paygrades = list(PAY_SHORT_CMR = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_LEADER, ACCESS_MARINE_COMMAND)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Commissar."
	skills = /datum/skills/lt

/datum/equipment_preset/imperial_guard/commissar/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/commissar(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/commissar(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/boltpistol(new_human), WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/powersword(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/boltpistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/boltpistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/boltpistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/boltpistol(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human),WEAR_IN_BACK)

/datum/equipment_preset/imperial_guard/enginseer
	name = "Mechanicus Enginseer"
	assignment = JOB_IMP_ENGI
	rank = JOB_IMP_ENGI
	paygrades = list(PAY_SHORT_ENGINSEER = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_ENGPREP, ACCESS_CIVILIAN_ENGINEERING)
	flags = EQUIPMENT_PRESET_EXTRA
	role_comm_title = "Enginseer."
	skills = /datum/skills/combat_engineer

/datum/equipment_preset/imperial_guard/enginseer/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/enginseer(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/guard(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/equipped(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/enginseer(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/lasgun/laspistol(new_human), WEAR_IN_BELT)
