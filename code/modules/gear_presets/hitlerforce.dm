/datum/equipment_preset/hitlerforce

	name = "Wehrmacht Heer"// we are RETURNING TO CASTLE WOLFENSTEIN
	faction = FACTION_WW2_GERMAN
	faction_group = list(
		FACTION_WW2_GERMAN,
	)
	rank = JOB_HEER_GRUNT
	languages = list(
		LANGUAGE_GERMAN,
	)
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/hitlerforce/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE) //TODO: tell scotty to configure the security on the map for CLF access..

/datum/equipment_preset/mercenary/load_name(mob/living/carbon/human/new_human)
	new_human.gender = MALE //rip to whoever it was.
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name


