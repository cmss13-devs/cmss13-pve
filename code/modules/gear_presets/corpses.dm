
/datum/equipment_preset/corpse
	name = "Corpse - Colonist - Blue-collar"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Class C Inhabitant"
	rank = JOB_COLONIST
	faction = FACTION_COLONIST
	languages = list()
	access = list(ACCESS_CIVILIAN_PUBLIC)
	skills = /datum/skills/civilian
	idtype = /obj/item/card/id/lanyard
	var/xenovictim = FALSE //Set to true to make the corpse spawn as a victim of a xeno burst


/datum/equipment_preset/corpse/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(MALE, FEMALE)
	var/datum/preferences/A = new
	A.randomize_appearance(new_human)
	var/random_name = capitalize(pick(new_human.gender == MALE ? first_names_male : first_names_female)) + " " + capitalize(pick(last_names))
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

/datum/equipment_preset/corpse/load_languages(mob/living/carbon/human/new_human)
	return

/datum/equipment_preset/corpse/load_status(mob/living/carbon/human/new_human)
	. = ..(new_human)

	// These two values matter because they are checked on death for weed_food
	new_human.undefibbable = TRUE
	if(xenovictim)
		new_human.chestburst = 2

	new_human.death(create_cause_data("existing"), TRUE) //Kills the new mob
	new_human.apply_damage(100, BRUTE)
	new_human.apply_damage(100, BRUTE)
	new_human.apply_damage(100, BRUTE)
	if(xenovictim)
		var/datum/internal_organ/organ
		var/i
		for(i in list("heart","lungs"))
			organ = new_human.internal_organs_by_name[i]
			new_human.internal_organs_by_name -= i
			new_human.internal_organs -= organ
		new_human.update_burst()
		//buckle to nest
		var/obj/structure/bed/nest/nest = locate() in get_turf(src)
		if(nest)
			new_human.buckled = nest
			new_human.setDir(nest.dir)
			nest.buckled_mob = new_human
			nest.afterbuckle(new_human)
	new_human.spawned_corpse = TRUE
	new_human.updatehealth()
	new_human.pulse = PULSE_NONE

/datum/equipment_preset/corpse/load_gear(mob/living/carbon/human/new_human)
	var/random_gear = rand(1,6)
	switch(random_gear)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/brown(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/boiler/cyan(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/yellow(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/workwear/khaki(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/civilian/brown(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/blue(new_human), WEAR_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/workwear/blue(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/windbreaker/blue(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/boiler/grey(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/workwear/blue(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup/brown(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
		if(6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/bomber(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/workwear/blue(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)

/datum/equipment_preset/corpse/colonist/burst
	name = "Corpse - Colonist - Blue-collar - Burst"
	xenovictim = TRUE
//*****************************************************************************************************/

/datum/equipment_preset/corpse/prisoner
	name = "Corpse - Prison - Inmate"
	assignment = "Prisoner"

/datum/equipment_preset/corpse/prisoner/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/boiler/prison(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/prison(new_human), WEAR_FEET)

/datum/equipment_preset/corpse/prisoner/burst
	name = "Corpse - Prison - Inmate"
	xenovictim = TRUE
//*****************************************************************************************************/
