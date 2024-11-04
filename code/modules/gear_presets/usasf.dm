/datum/equipment_preset/usasf
	name = "USASF"
	faction = FACTION_NAVY
	faction_group = FACTION_LIST_MARINE
	minimum_age = 20
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_SPANISH)
	///Gives the sailors their radios
	var/headset_type = /obj/item/device/radio/headset/distress/USASF
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/usasf/load_name(mob/living/carbon/human/new_human, randomise)
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

//*****************************************************************************************************/

/datum/equipment_preset/usasf/crew
	name = "USASF Crewman"
	rank = JOB_NAVY_CREWMAN
	assignment = JOB_NAVY_CREWMAN
	paygrades = list(PAY_SHORT_NE3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Crew"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/ship_crew

/datum/equipment_preset/usasf/crew/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/engi/navy, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/botanic_leather/generic, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_L_STORE)

/datum/equipment_preset/usasf/crew/snipe
	name = "USASF Damage-Control Crewman"
	paygrades = list(PAY_SHORT_NE4 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/usasf/crew/snipe/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/engi/OT/navy, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/engine, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tank(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_L_STORE)
	..()

/datum/equipment_preset/usasf/crew/flight
	name = "USASF Flight-Deck Crewman (Red)"
	assignment = JOB_NAVY_SKITTLE
	rank = JOB_NAVY_SKITTLE
	paygrades = list(PAY_SHORT_NE5 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Ordnc"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/flight_crew

/datum/equipment_preset/usasf/crew/flight/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/usasf, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp/marinepilot, WEAR_HEAD)
	..()

/datum/equipment_preset/usasf/crew/flight/green
	name = "USASF Flight-Deck Crewman (green)"
	role_comm_title = "Mntnc"

/datum/equipment_preset/usasf/crew/flight/green/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/usasf/green, WEAR_JACKET)
	..()

/datum/equipment_preset/usasf/crew/flight/purple
	name = "USASF Flight-Deck Crewman (purple)"
	role_comm_title = "Fuel"

/datum/equipment_preset/usasf/crew/flight/purple/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/usasf/purple, WEAR_JACKET)
	..()

/datum/equipment_preset/usasf/crew/flight/white
	name = "USASF Flight-Deck Crewman (white)"
	role_comm_title = "Sfty"

/datum/equipment_preset/usasf/crew/flight/white/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/usasf/white, WEAR_JACKET)
	..()

/datum/equipment_preset/usasf/crew/flight/blue
	name = "USASF Flight-Deck Crewman (blue)"
	role_comm_title = "Hndlr"

/datum/equipment_preset/usasf/crew/flight/blue/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/usasf/blue, WEAR_JACKET)
	..()

//*****************************************************************************************************/

/datum/equipment_preset/usasf/corpsman
	name = "USASF Hospital Corpsman"
	assignment = JOB_NAVY_MEDIC
	rank = JOB_NAVY_MEDIC
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "HM"
	skills = /datum/skills/corpsman

/datum/equipment_preset/uscm_ship/corpsman/nurse/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical/lightblue(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/medgreen(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/latex(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_BACK)

//*****************************************************************************************************/

/datum/equipment_preset/usasf/engi
	name = "USASF Engineering Technician"
	assignment = JOB_NAVY_ENGI
	rank = JOB_NAVY_ENGI
	paygrades = list(PAY_SHORT_NE6 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Tech"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/eng_tech

/datum/equipment_preset/usasf/engi/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/engi/navy/tech, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/engine, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/equipped, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium(new_human), WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/usasf/helljumper
	name = "USASF Para-Rescue Support Technician"
	assignment = JOB_NAVY_PARA_TECH
	rank = JOB_NAVY_PARA_TECH
	paygrades = list(PAY_SHORT_NE8 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "ParaTech"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/para_tech

/datum/equipment_preset/usasf/helljumper/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/USASF/command/attache, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/pilot/flight/para, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/tech/tanker/para, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf/helljumper, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/medgreen, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/drop_green/equipped, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full/dutch, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/navy, WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/tactical, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/parachute, WEAR_BACK)

//*****************************************************************************************************/

/datum/equipment_preset/usasf/jtac
	name = "USASF Orbital Fire-Support Liason Officer"
	assignment = JOB_NAVY_JTAC
	rank = JOB_NAVY_JTAC
	paygrades = list(PAY_SHORT_NO2)
	role_comm_title = "JFO"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/jtac

/datum/equipment_preset/usasf/jtac/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/USASF/command/attache, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/intel/navy, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/navy, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/pen, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/notepad, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/commander, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/full, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/rto/navy, WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/tactical, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/ap, WEAR_IN_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/navy, WEAR_BACK)

/datum/equipment_preset/usasf/jtac/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_NE9 = JOB_PLAYTIME_TIER_0)

//*****************************************************************************************************/

/datum/equipment_preset/usasf/officer
	name = "USASF Duty Officer"
	assignment = JOB_NAVY_SO
	rank = JOB_NAVY_SO
	paygrades = list(PAY_SHORT_NO3)
	role_comm_title = "Duty Off."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/officer
	idtype = /obj/item/card/id/silver

/datum/equipment_preset/usasf/officer/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/USASF/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/ce/navy, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/techofficer, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/full, WEAR_WAIST)

/datum/equipment_preset/usasf/officer/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_NO2 = JOB_PLAYTIME_TIER_0)

//*****************************************************************************************************/

/datum/equipment_preset/usasf/flightboss
	name = "USASF Flight Boss"
	assignment = JOB_NAVY_FLIGHT_BOSS
	rank = JOB_NAVY_FLIGHT_BOSS
	paygrades = list(PAY_SHORT_NO2)
	role_comm_title = "Flight Boss"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/flightboss

/datum/equipment_preset/usasf/flightboss/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/USASF/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/ce/navy, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/usasf/yellow, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp/marinepilot, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/botanic_leather/generic, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/usasf/chief_engineer
	name = "USASF Engineering Duty Officer"
	assignment = JOB_NAVY_CHIEF_ENGINEER
	rank = JOB_NAVY_CHIEF_ENGINEER
	paygrades = list(PAY_SHORT_NO4)
	role_comm_title = "LCDR."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/navycengi
	idtype = /obj/item/card/id/silver

/datum/equipment_preset/usasf/chief_engineer/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/USASF/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/ce/navy, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/engine, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/chiefofficer, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/black, WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/full, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_L_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/usasf/CO
	name = "USASF Commanding Officer"
	assignment = JOB_NAVY_CO
	rank = JOB_NAVY_CO
	paygrades = list(PAY_SHORT_NO6)
	role_comm_title = "CAPT."
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/navycommander
	idtype = /obj/item/card/id/gold

/datum/equipment_preset/usasf/CO/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/USASF/command, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/ce/navy, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/usasf, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/marine/peaked/captain/black, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber, WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/m1911, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_L_STORE)

/datum/equipment_preset/usasf/CO/lesser_rank
	name = parent_type::name + " (Lesser Rank)"
	paygrades = list(PAY_SHORT_NO5 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CDR."
