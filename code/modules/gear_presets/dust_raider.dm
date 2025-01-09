/datum/equipment_preset/dust_raider
	name = "Dust Raider"
	idtype = /obj/item/card/id/dogtag
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_MARINE


/datum/equipment_preset/dust_raider/load_name(mob/living/carbon/human/new_human)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	random_name = capitalize(pick(new_human.gender == MALE ? GLOB.first_names_male : GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
	new_human.change_real_name(new_human, random_name)
	new_human.name = new_human.real_name
	new_human.age = rand(21,45)

//*****************************************************************************************************/
