GLOBAL_LIST_INIT_TYPED(underwear_m, /datum/sprite_accessory/underwear, setup_underwear(MALE))
GLOBAL_LIST_INIT_TYPED(underwear_f, /datum/sprite_accessory/underwear, setup_underwear(FEMALE))
GLOBAL_LIST_INIT_TYPED(underwear_restricted, /datum/sprite_accessory/underwear, setup_underwear(null, TRUE))

/proc/setup_underwear(restricted_gender, restricted)
	var/list/underwear_list = list()
	for(var/underwear_type in subtypesof(/datum/sprite_accessory/underwear))
		var/datum/sprite_accessory/underwear/underwear_datum = new underwear_type
		if(restricted_gender && underwear_datum.gender != restricted_gender && (underwear_datum.gender == MALE || underwear_datum.gender == FEMALE))
			continue
		if(restricted && !underwear_datum.restricted)
			continue
		if(underwear_datum.camo_conforming)
			underwear_list["[underwear_datum.name] (Camo Conforming)"] = underwear_datum
			var/datum/sprite_accessory/underwear/classic_datum = new underwear_type
			classic_datum.generate_non_conforming("c")
			underwear_list[classic_datum.name] = classic_datum
			var/datum/sprite_accessory/underwear/jungle_datum = new underwear_type
			jungle_datum.generate_non_conforming("j")
			underwear_list[jungle_datum.name] = jungle_datum
			var/datum/sprite_accessory/underwear/desert_datum = new underwear_type
			desert_datum.generate_non_conforming("d")
			underwear_list[desert_datum.name] = desert_datum
			var/datum/sprite_accessory/underwear/snow_datum = new underwear_type
			snow_datum.generate_non_conforming("s")
			underwear_list[snow_datum.name] = snow_datum
		else
			underwear_list[underwear_datum.name] = underwear_datum
	return underwear_list

/datum/sprite_accessory/underwear
	icon = 'icons/mob/humans/underwear.dmi'
	var/camo_conforming = FALSE
	var/restricted = FALSE

/datum/sprite_accessory/underwear/proc/get_image(mob_gender)
	var/selected_icon_state = icon_state
	if(camo_conforming)
		switch(SSmapping.configs[GROUND_MAP].camouflage_type)
			if("classic")
				selected_icon_state = "c_" + selected_icon_state
			if("jungle")
				selected_icon_state = "j_" + selected_icon_state
			if("desert")
				selected_icon_state = "d_" + selected_icon_state
			if("snow")
				selected_icon_state = "s_" + selected_icon_state
	if(gender == PLURAL)
		selected_icon_state += mob_gender == MALE ? "_m" : "_f"
	return image(icon, selected_icon_state)

/datum/sprite_accessory/underwear/proc/generate_non_conforming(camo_key)
	camo_conforming = FALSE
	icon_state = "[camo_key]_[icon_state]"
	switch(camo_key)
		if("c")
			name += " (Classic)"
		if("j")
			name += " (Jungle)"
		if("d")
			name += " (Desert)"
		if("s")
			name += " (Snow)"

// Both

/datum/sprite_accessory/underwear/boxers
	name = "White Boxers"
	icon_state = "white_boxers"
	gender = NEUTER
	camo_conforming = FALSE

/datum/sprite_accessory/underwear/boxers/black
	name = "Black Boxers"
	icon_state = "black_boxers"

/datum/sprite_accessory/underwear/boxers/blue
	name = "Blue Boxers"
	icon_state = "blue_boxers"

/datum/sprite_accessory/underwear/boxers/pink
	name = "Pink Boxers"
	icon_state = "pink_boxers"

/datum/sprite_accessory/underwear/boxers/grey
	name = "Grey Boxers"
	icon_state = "grey_boxers"

/datum/sprite_accessory/underwear/boxers/marine
	name = "USCM Boxers"
	icon_state = "marine_boxers"

/datum/sprite_accessory/underwear/boxers/army
	name = "USA Boxers"
	icon_state = "army_boxers"
	restricted = TRUE

/datum/sprite_accessory/underwear/boxers/upp
	name = "UPP Boxers"
	icon_state = "upp_boxers"
	restricted = TRUE

/datum/sprite_accessory/underwear/briefs
	name = "White Briefs"
	icon_state = "white_briefs"
	gender = NEUTER
	camo_conforming = FALSE

/datum/sprite_accessory/underwear/briefs/black
	name = "Black Briefs"
	icon_state = "black_briefs"

// Female

/datum/sprite_accessory/underwear/panties
	name = "White Panties"
	icon_state = "white_satin"
	gender = FEMALE
	camo_conforming = FALSE

/datum/sprite_accessory/underwear/panties/black
	name = "Black Panties"
	icon_state = "black_satin"

/datum/sprite_accessory/underwear/panties/grey
	name = "Grey Panties"
	icon_state = "grey_satin"
