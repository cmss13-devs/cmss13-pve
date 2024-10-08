/datum/equipment_preset/usasf
	name = "USASF"
	faction = FACTION_NAVY
	faction_group = FACTION_LIST_MARINE
	minimum_age = 20
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_SPANISH)
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

	utility_under = list(/obj/item/clothing/under/marine/officer/command)
	utility_hat = list(/obj/item/clothing/head/cmcap)
	utility_gloves = list(/obj/item/clothing/gloves/marine)
	utility_shoes = list(/obj/item/clothing/shoes/marine/knife)
	utility_extra = list(/obj/item/clothing/head/beret/cm, /obj/item/clothing/head/beret/cm/tan)

	service_under = list(/obj/item/clothing/under/marine/officer/bridge)
	service_over = list(/obj/item/clothing/suit/storage/jacket/marine/service, /obj/item/clothing/suit/storage/jacket/marine/service/mp)
	service_hat = list(/obj/item/clothing/head/cmcap)
	service_shoes = list(/obj/item/clothing/shoes/dress)

	dress_under = list(/obj/item/clothing/under/marine/dress/blues/senior)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/blues/officer)
	dress_hat = list(/obj/item/clothing/head/marine/dress_cover/officer)
	dress_gloves = list(/obj/item/clothing/gloves/marine/dress)
	dress_shoes = list(/obj/item/clothing/shoes/dress)

//*****************************************************************************************************/
