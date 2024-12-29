/datum/equipment_preset/clf
	name = FACTION_CLF
	languages = list(LANGUAGE_JAPANESE)
	faction_group = FACTION_LIST_CLF
	skills = /datum/skills/pfc
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	origin_override = ORIGIN_CIVILIAN
	idtype = /obj/item/card/id/lanyard
	access = list(ACCESS_CIVILIAN_PUBLIC)

/datum/equipment_preset/clf/get_assignment(mob/living/carbon/human/new_human)
	if(prob(50))
		return "Class D Inhabitant"

	return "Class C Inhabitant"

/datum/equipment_preset/clf/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(50;MALE, 50;FEMALE)
	var/random_name
	var/first_name
	var/last_name
	var/static/list/colors = list("BLACK" = list(15, 15, 10), "BLACK" = list(15, 15, 10))
	var/static/list/hair_colors = list("BLACK" = list(15, 15, 10))
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
	//gender checks
	if(new_human.gender == MALE)
		if(prob(90))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(1, 3)))]"
		else
			first_name = "[pick(GLOB.first_names_male_clf)]"
		new_human.h_style = pick("Undercut, Top", "Partly Shaved", "CIA", "Mulder", "Medium Fade", "High Fade", "Pixie Cut Left", "Pixie Cut Right", "Coffee House Cut")
		new_human.f_style = pick("Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "3 O'clock Shadow", "5 O'clock Shadow", "7 O'clock Shadow",)
	else
		if(prob(90))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(1, 3)))]"
		else
			first_name = "[pick(GLOB.first_names_female_clf)]"
		new_human.h_style = pick("Undercut, Top", "CIA", "Mulder", "Pixie Cut Left", "Pixie Cut Right", "Pvt. Redding", "Bun", "Short Bangs")
	//surname
	if(prob(90))
		last_name = "[capitalize(randomly_generate_japanese_word(rand(1, 4)))]"
	else
		last_name = "[pick(GLOB.last_names_clf)]"
	//put them together
	random_name = "[first_name] [last_name]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)


//*****************************************************************************************************/

/datum/equipment_preset/clf/soldier
	name = "TWE Rebel, Soldier"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_CLF
	rank = JOB_CLF
	role_comm_title = "GRL"

	skills = /datum/skills/clf

/datum/equipment_preset/clf/soldier/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/upp/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	if(prob(65))
		add_facewrap(new_human)
	//head
	if(prob(85))
		add_rebel_twe_helmet(new_human)
	//uniform
	add_rebel_twe_uniform(new_human)
	//jacket
	add_rebel_twe_suit(new_human)
	//waist
	if(prob(35))
		new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	//limbs
	add_rebel_twe_shoes(new_human)
	if(prob(35))
		add_rebel_twe_pistol(new_human)
	else if(prob(75))
		add_rebel_twe_smg(new_human)
	else if(prob(65))
		add_rebel_twe_rifle(new_human)
	else
		add_rebel_twe_shotgun(new_human)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
//*****************************************************************************************************/

/datum/equipment_preset/clf/engineer
	name = "TWE Rebel, Anti-Tank"

/datum/equipment_preset/clf/engineer/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/upp/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	if(prob(65))
		add_facewrap(new_human)
	//head
	if(prob(85))
		add_rebel_twe_helmet(new_human)
	//uniform
	add_rebel_twe_uniform(new_human)
	//jacket
	add_rebel_twe_suit(new_human)
	//waist
	if(prob(35))
		new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	//limbs
	add_rebel_twe_shoes(new_human)

	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/clf/medic
	name = "CLF Medic"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_CLF_MEDIC
	rank = JOB_CLF_MEDIC
	role_comm_title = "MED"
	paygrades = list(PAY_SHORT_CDOC = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/clf/combat_medic

/datum/equipment_preset/clf/medic/load_gear(mob/living/carbon/human/new_human)

	var/obj/item/clothing/under/colonist/clf/CLF = new()
	var/obj/item/clothing/accessory/storage/surg_vest/equipped/W = new()
	CLF.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(CLF, WEAR_BODY)

	add_rebel_ua_suit(new_human)
	add_rebel_ua_helmet(new_human)
	add_rebel_ua_shoes(new_human)
	add_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/full/with_defib_and_analyzer(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BELT)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/medic(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/ied(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/structure/bed/portable_surgery(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar(new_human), WEAR_IN_BACK)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/clf/specialist
	name = "CLF Specialist"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_CLF_SPECIALIST
	rank = JOB_CLF_SPECIALIST
	role_comm_title = "SPC"
	skills = /datum/skills/clf/specialist

/datum/equipment_preset/clf/specialist/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE) + list(ACCESS_CLF_ARMORY)

/datum/equipment_preset/clf/specialist/load_gear(mob/living/carbon/human/new_human)

	//jumpsuit and their webbing
	var/obj/item/clothing/under/colonist/clf/CLF = new()
	var/obj/item/clothing/accessory/storage/webbing/five_slots/W = new()
	CLF.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(CLF, WEAR_BODY)
	//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/militia(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/swat(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/combat(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/vp70(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night(new_human), WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/cct(new_human), WEAR_L_EAR)
	//standard backpack stuff
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar(new_human), WEAR_IN_BACK)
	//specialist backpack stuff
	new_human.equip_to_slot_or_del(new /obj/item/prop/folded_anti_tank_sadar(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_IN_BACK)
	//storage items
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	if(prob(75))
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/ied(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/ied(new_human), WEAR_IN_BACK)
		add_rebel_specialist_weapon(new_human, 10)
	else
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/ied(new_human), WEAR_IN_JACKET)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/ied(new_human), WEAR_IN_JACKET)
		add_weapon(/obj/item/weapon/gun/lever_action/r4t, /obj/item/ammo_magazine/handful/lever_action, new_human)

//*****************************************************************************************************/

/datum/equipment_preset/clf/leader
	name = "CLF Leader"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_CLF_LEADER
	rank = JOB_CLF_LEADER
	role_comm_title = "LDR"
	skills = /datum/skills/clf/leader

/datum/equipment_preset/clf/leader/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE) + list(ACCESS_CLF_ARMORY, ACCESS_CLF_LEADERSHIP, ACCESS_CLF_FLIGHT)

/datum/equipment_preset/clf/leader/load_gear(mob/living/carbon/human/new_human)

	//No random armor, so that it's more clear that he's the leader
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/clf(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/militia(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/sec/hos(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/combat(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/sensor/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/sensor(new_human), WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/command(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/screwdriver(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/multitool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/m1911(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	add_weapon(/obj/item/weapon/gun/rifle/mar40, /obj/item/ammo_magazine/rifle/mar40, new_human)

//*****************************************************************************************************/

/datum/equipment_preset/clf/synth
	name = "CLF Multipurpose Synthetic"
	flags = EQUIPMENT_PRESET_EXTRA

	languages = ALL_SYNTH_LANGUAGES

	skills = /datum/skills/colonial_synthetic
	assignment = JOB_CLF_SYNTH
	rank = JOB_CLF_SYNTH
	paygrades = list(PAY_SHORT_SYN = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Syn"

/datum/equipment_preset/clf/synth/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_ALL)

/datum/equipment_preset/clf/synth/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(50;MALE,50;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(prob(10))
		random_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
	else if(new_human.gender == MALE)
		random_name = "[pick(GLOB.first_names_male_clf)]"
	else
		random_name = "[pick(GLOB.first_names_female_clf)]"

	if(new_human.gender == MALE)
		new_human.f_style = "5 O'clock Shadow"

	new_human.change_real_name(new_human, random_name)
	new_human.r_hair = 15
	new_human.g_hair = 15
	new_human.b_hair = 25
	new_human.r_eyes = 139
	new_human.g_eyes = 62
	new_human.b_eyes = 19
	idtype = /obj/item/card/id/data

/datum/equipment_preset/clf/synth/load_race(mob/living/carbon/human/new_human)
	new_human.set_species(SYNTH_COLONY_GEN_ONE)

/datum/equipment_preset/clf/synth/load_skills(mob/living/carbon/human/new_human)
	. = ..()
	new_human.allow_gun_usage = FALSE

/datum/equipment_preset/clf/synth/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/command(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp, WEAR_FACE)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/jan, WEAR_HEAD)
	//body
	var/obj/item/clothing/under/colonist/clf/CLF = new()
	var/obj/item/clothing/accessory/storage/webbing/webbing = new()
	CLF.attach_accessory(new_human, webbing)
	new_human.equip_to_slot_or_del(CLF, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/militia, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/full/with_suture_and_graft, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/combat, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/synth, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full_barbed_wire, WEAR_R_STORE)

/datum/equipment_preset/clf/synth/combat
	name = "CLF Combat Synthetic"
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/clf/synth/combat/load_skills(mob/living/carbon/human/new_human)
	. = ..()
	new_human.allow_gun_usage = TRUE

/datum/equipment_preset/clf/synth/combat/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/command(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp, WEAR_FACE)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/jan, WEAR_HEAD)
	//body
	var/obj/item/clothing/under/colonist/clf/CLF = new()
	var/obj/item/clothing/accessory/storage/webbing/webbing = new()
	CLF.attach_accessory(new_human, webbing)
	new_human.equip_to_slot_or_del(CLF, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/militia, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40/extended, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/mar40/carbine, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/full/with_suture_and_graft, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/combat, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/synth, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full_barbed_wire, WEAR_R_STORE)

//*****************************************************************************************************/

/datum/equipment_preset/clf/commander
	name = "CLF Cell Commander"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_CLF_COMMANDER
	rank = JOB_CLF_COMMANDER
	paygrades = list(PAY_SHORT_REBC = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CMDR"
	skills = /datum/skills/clf/commander

/datum/equipment_preset/clf/commander/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_ALL)

/datum/equipment_preset/clf/commander/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/mercenary/miner(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/command(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/clf(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/militia/smartgun(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/mateba/highimpact(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/revolver/mateba/highimpact(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun/clf(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/clf/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp(new_human), WEAR_FEET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_R_STORE)
