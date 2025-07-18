/datum/equipment_preset/faami
	name = "FAAMI Operator"
	faction = FACTION_FAAMI
	rank = JOB_FAAMI_RIFLE
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FAAMI
	faction_group = list(FACTION_LIST_CONTRACTOR)
	languages = list(LANGUAGE_FRENCH, LANGUAGE_ENGLISH)
	var/human_versus_human = FALSE
	var/headset_type = /obj/item/device/radio/headset/distress/faami

/datum/equipment_preset/faami/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE)

/datum/equipment_preset/faami/load_name(mob/living/carbon/human/new_human)
	new_human.gender = pick(40;MALE,60;FEMALE)
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
	idtype = /obj/item/card/id/dogtag
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

/datum/equipment_preset/faami/load_id(mob/living/carbon/human/new_human, client/mob_client)
	if(human_versus_human)
		var/obj/item/clothing/under/uniform = new_human.w_uniform
		if(istype(uniform))
			uniform.has_sensor = UNIFORM_HAS_SENSORS
			uniform.sensor_faction = FACTION_FAAMI
	return ..()

//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman
	name = "FAAMI Operator"
	paygrades = list(PAY_SHORT_FA2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Soldat"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Operator"
	rank = JOB_FAAMI_RIFLE
	skills = /datum/skills/pfc/recon
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/faami(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/auxiliary
	name = "FAAMI Auxiliary"
	paygrades = list(PAY_SHORT_FA1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Auxiliary"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Auxiliary Operator"
	rank = JOB_FAAMI_RIFLE
	skills = /datum/skills/pfc
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/auxiliary/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/green(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/auxiliary/lead
	name = "FAAMI Auxiliary Lead"
	paygrades = list(PAY_SHORT_FA3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Auxiliary Lead"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Auxiliary Lead"
	rank = JOB_FAAMI_RIFLE
	skills = /datum/skills/tl
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/auxiliary/lead/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/green(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/tech
	name = "FAAMI Field Technician"
	paygrades = list(PAY_SHORT_FA3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Technician"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Field Technician"
	rank = JOB_FAAMI_TECH
	skills = /datum/skills/combat_engineer
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/tech/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/med_large_stack, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/med_small_stack, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/faami(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/equipped, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/engine(new_human), WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/medic
	name = "FAAMI Field Medic"
	paygrades = list(PAY_SHORT_FA3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Medic"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Field Medic"
	rank = JOB_FAAMI_MEDIC
	skills = /datum/skills/combat_medic/recon
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/medic/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/faami(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud/no_nvg, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/drop_green/equipped, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/medgreen(new_human), WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full(new_human), WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/mg
	name = "FAAMI Machinegun Operator"
	paygrades = list(PAY_SHORT_FA4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Soldat"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Machinegun Operator"
	rank = JOB_FAAMI_MG
	skills = /datum/skills/pfc/recon
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/mg/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/masm55, WEAR_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/faami(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/masm(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/masm(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/masm(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/masm(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/masm(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/squadlead
	name = "FAAMI Squad Leader"
	paygrades = list(PAY_SHORT_FA6 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SL"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Squad Leader"
	rank = JOB_FAAMI_SL
	skills = /datum/skills/SL
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/squadlead/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/black(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/scout
	name = "FAAMI Scout"
	paygrades = list(PAY_SHORT_FA4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Scout"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Scout"
	rank = JOB_FAAMI_SCOUT
	skills = /datum/skills/tl/recon
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/scout/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/faami(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/scout/radio
	name = "FAAMI Radioman"
	paygrades = list(PAY_SHORT_FA4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Radioman"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Radioman"
	rank = JOB_FAAMI_SCOUT
	skills = /datum/skills/tl/recon
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/scout/radio/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/merc(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/faami(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/officer
	name = "FAAMI Officer"
	paygrades = list(PAY_SHORT_FO2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Officer"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Officer"
	rank = JOB_FAAMI_LT
	skills = /datum/skills/lt
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/officer/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/sec/hos(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/spearhead, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/spearhead, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/spearhead, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/sniper
	name = "FAAMI Marksman"
	paygrades = list(PAY_SHORT_FA4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Soldat"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Marksman"
	rank = JOB_FAAMI_SNIPER
	skills = /datum/skills/pfc/recon
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/sniper/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/facepaint/green, WEAR_IN_BACK)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/poncho/green, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107/marksman, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/commando
	name = "FAAMI Drop Commando"
	paygrades = list(PAY_SHORT_FE1 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Commando"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Drop Commando"
	rank = JOB_FAAMI_ELITE
	skills = /datum/skills/pfc/recon
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/commando/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/hoverpack, WEAR_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/sec(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/small/equipped, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107/commando, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107/commando, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107/commando, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107/commando, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107/commando, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/rifleman/commando/sl
	name = "FAAMI Drop Commando Leader"
	paygrades = list(PAY_SHORT_FE2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Commando"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Drop Commando Leader"
	rank = JOB_FAAMI_ELITE_SL
	skills = /datum/skills/tl/recon
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/rifleman/commando/sl/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/hoverpack, WEAR_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/sec/hos(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/faami(new_human), WEAR_FACE)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/faami(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/small/equipped, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/faami/light(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/fn107/commando, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/m15, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107/commando, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107/commando, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107/commando, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/fn107/commando, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

/datum/equipment_preset/faami/officer/co
	name = "FAAMI Commander"
	paygrades = list(PAY_SHORT_FO4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CO"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "FAAMI Commanding Officer"
	rank = JOB_FAAMI_CO
	skills = /datum/skills/lt
	faction = FACTION_FAAMI

/datum/equipment_preset/faami/officer/co/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/five_slot(new_human), WEAR_BACK)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm/red(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/charcoal(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/revolver/spearhead/black, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/spearhead, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/spearhead, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/france, WEAR_ACCESSORY)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


//*****************************************************************************************************/

