
/datum/equipment_preset/colonist
	name = FACTION_COLONIST
	languages = LANGUAGE_ENGLISH
	faction = FACTION_COLONIST
	skills = /datum/skills/civilian
	idtype = /obj/item/card/id/lanyard
	origin_override = ORIGIN_CIVILIAN

/datum/equipment_preset/colonist/load_name(mob/living/carbon/human/new_human, randomise)
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
		new_human.h_style = pick("Undercut, Top", "Partly Shaved", "CIA", "Mulder", "Medium Fade", "High Fade", "Pixie Cut Left", "Pixie Cut Right", "Coffee House Cut")
		new_human.f_style = pick("Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "3 O'clock Shadow", "3 O'clock Shadow", "3 O'clock Shadow", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache", "7 O'clock Shadow", "7 O'clock Moustache",)
	else
		new_human.h_style = pick("Undercut, Top", "CIA", "Mulder", "Pixie Cut Left", "Pixie Cut Right", "Scully", "Pvt. Redding", "Bun", "Short Bangs")
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,40)


/datum/equipment_preset/colonist/worker

	name = "Civilian Colonist, Blue-Collar"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_CIVILIAN_PUBLIC)

/datum/equipment_preset/colonist/worker/get_assignment(mob/living/carbon/human/new_human)
	if(prob(50))
		return "Class D Inhabitant"

	return "Class C Inhabitant"

/datum/equipment_preset/colonist/worker/load_gear(mob/living/carbon/human/new_human)

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

	var/random_civilian_shoe = rand(1,8)
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
		if(7)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/stompers(new_human), WEAR_FEET)

/datum/equipment_preset/colonist/business
	name = "Civilian Colonist, White-Collar"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_CIVILIAN_PUBLIC)

/datum/equipment_preset/colonist/business/get_assignment(mob/living/carbon/human/new_human)
	if(prob(50))
		return "Class B Inhabitant"

	return "Class A Inhabitant"

/datum/equipment_preset/colonist/business/load_gear(mob/living/carbon/human/new_human)

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

	var/random_business_uniform= rand(1,4)
	switch(random_business_uniform)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/brown(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate/brown(new_human), WEAR_JACKET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/blue(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate/blue(new_human), WEAR_JACKET)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/black(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate/black(new_human), WEAR_JACKET)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/grey(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate/grey(new_human), WEAR_JACKET)

	var/random_tie = rand(1,2)
	switch(random_tie)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/black(new_human), WEAR_ACCESSORY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/blue(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)

/datum/equipment_preset/colonist/researcher
	name = "Civilian Researcher"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Research Associate"
	paygrades = list(PAY_SHORT_CCMO = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/researcher
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_RESEARCH, ACCESS_WY_GENERAL, ACCESS_WY_COLONIAL, ACCESS_WY_RESEARCH)

/datum/equipment_preset/colonist/researcher/load_gear(mob/living/carbon/human/new_human)

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

	var/random_tie= rand(1,5)
	switch(random_tie)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/black(new_human), WEAR_ACCESSORY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/blue(new_human), WEAR_ACCESSORY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/green(new_human), WEAR_ACCESSORY)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/purple(new_human), WEAR_ACCESSORY)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/red(new_human), WEAR_ACCESSORY)

	var/random_archeologist_suit = rand(1,5)
	switch(random_archeologist_suit)
		if(1 to 3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat(new_human), WEAR_JACKET)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/vest/tan(new_human), WEAR_JACKET)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/vest(new_human), WEAR_JACKET)

	var/random_professional_shoe = rand(1,2)
	switch(random_professional_shoe)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown(new_human), WEAR_FEET)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)

/datum/equipment_preset/colonist/doctor
	name = "Civilian Doctor"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Medical Doctor"
	paygrades = list(PAY_SHORT_CDOC = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/survivor/doctor
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_MEDBAY)

/datum/equipment_preset/colonist/doctor/load_gear(mob/living/carbon/human/new_human)

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

/datum/equipment_preset/colonist/doctor/scrubs
	name = "Civilian Doctor, Scrubs"

/datum/equipment_preset/colonist/doctor/scrubs/load_gear(mob/living/carbon/human/new_human)

	var/random_scrubs= rand(1,4)
	switch(random_scrubs)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical/green(new_human), WEAR_BODY)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical/blue(new_human), WEAR_BODY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical/purple(new_human), WEAR_BODY)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical/lightblue(new_human), WEAR_BODY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/stethoscope(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(new_human), WEAR_FEET)

/datum/equipment_preset/colonist/admin
	name = "Civilian Administrator"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Administrator"
	role_comm_title = "ADMIN"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_LOGISTICS, ACCESS_CIVILIAN_ENGINEERING, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_MEDBAY, ACCESS_CIVILIAN_COMMAND)


/datum/equipment_preset/colonist/admin/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/black(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/black(new_human), WEAR_ACCESSORY)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)

/datum/equipment_preset/colonist/cargo
	name = "Civilian Logistics Worker"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Logistical Technician"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_LOGISTICS)


/datum/equipment_preset/colonist/cargo/load_gear(mob/living/carbon/human/new_human)

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
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest(new_human), WEAR_JACKET)
	//limb
	var/random_worker_shoe = rand(1,5)
	switch(random_worker_shoe)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian(new_human), WEAR_FEET)
		if(3 to 4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(new_human), WEAR_FEET)

/datum/equipment_preset/colonist/engineer
	name = "Civilian Engineer"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Maintenance Technician"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/MT
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_ENGINEERING)


/datum/equipment_preset/colonist/engineer/load_gear(mob/living/carbon/human/new_human)

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

/datum/equipment_preset/colonist/operations
	name = "Civilian Operations Technician"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Operations Technician"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(ACCESS_UPP_GENERAL, ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_COMMAND)

/datum/equipment_preset/colonist/operations/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black(new_human), WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear(new_human), WEAR_BODY)
	//limb
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)

/datum/equipment_preset/colonist/prisoner
	name = "Prisoner"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Inmate"
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian
	access = list(null)
	idtype = /obj/item/card/id

/datum/equipment_preset/colonist/prisoner/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/prison_boiler(new_human), WEAR_BODY)
	//limb
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(new_human), WEAR_FEET)

/datum/equipment_preset/colonist/security
	name = "Civilian Security Guard, Generic"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Security Officer"
	paygrades = list(PAY_SHORT_CPO = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/survivor/marshal
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_COMMAND)

/datum/equipment_preset/colonist/security/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/blue(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/black(new_human), WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/colonist, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/m4a3, WEAR_IN_R_STORE)

/datum/equipment_preset/colonist/security/weyland
	name = "Civilian Security Guard, Wey-Yu"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Weyland-Yutani Corporate Security Officer"
	paygrades = list(PAY_SHORT_CPO = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/survivor/marshal
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_COMMAND, ACCESS_WY_SECURITY)


/datum/equipment_preset/colonist/security/weyland/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/black(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/blue(new_human), WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/colonist, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/vp70, WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new 	/obj/item/ammo_magazine/pistol/vp70, WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp70, WEAR_IN_R_STORE)

/datum/equipment_preset/colonist/security/trijent
	name = "Civilian Security Guard, Trijent Corp"
	languages = list(LANGUAGE_JAPANESE, LANGUAGE_ENGLISH)
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST
	assignment = "Trijent Corporate Security Officer"
	paygrades = list(PAY_SHORT_CPO = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/civilian/survivor/marshal
	access = list(ACCESS_CIVILIAN_PUBLIC, ACCESS_CIVILIAN_BRIG, ACCESS_CIVILIAN_COMMAND, ACCESS_WY_SECURITY)

/datum/equipment_preset/colonist/security/trijent/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/black, WEAR_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress, WEAR_L_EAR)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/ivy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/blue(new_human), WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/colonist, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup, WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp70, WEAR_IN_R_STORE)

	//back
	//face
	//head
	//uniform
	//jacket
	//waist
	//limbs
	//pockets
