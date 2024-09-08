GLOBAL_LIST_INIT(human_ai_factions, assemble_human_ai_factions())

/proc/assemble_human_ai_factions()
	. = list()
	for(var/datum/human_ai_faction/faction as anything in subtypesof(/datum/human_ai_faction))
		faction = new
		.[faction.faction] = faction

/datum/human_ai_faction
	var/faction = FACTION_NEUTRAL
	var/shoot_to_kill = TRUE

/datum/human_ai_faction/proc/apply_faction_data(datum/human_ai_brain/brain)
	return
