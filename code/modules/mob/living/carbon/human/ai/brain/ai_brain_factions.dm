/datum/human_ai_faction
	var/faction = FACTION_NEUTRAL
	var/shoot_to_kill = TRUE

	var/list/in_combat_lines = list()
	var/list/exit_combat_lines = list()
	var/list/squad_member_death_lines = list()

	var/list/friendly_factions = list()
	var/list/neutral_factions = list()

/datum/human_ai_faction/proc/apply_faction_data(datum/human_ai_brain/brain)
	if(length(in_combat_lines))
		brain.in_combat_lines = in_combat_lines

	if(length(exit_combat_lines))
		brain.exit_combat_lines = exit_combat_lines

	if(length(squad_member_death_lines))
		brain.squad_member_death_lines = squad_member_death_lines

	brain.shoot_to_kill = shoot_to_kill
	brain.friendly_factions = friendly_factions
	brain.neutral_factions = neutral_factions

/datum/human_ai_faction/proc/reapply_faction_data()
	for(var/datum/human_ai_brain/brain in GLOB.human_ai_brains)
		if(brain.tied_human?.faction == faction)
			apply_faction_data(brain)

/datum/human_ai_faction/clf
	faction = FACTION_CLF
	friendly_factions = list(
		FACTION_COLONIST,
	)


/datum/human_ai_faction/uscm
	faction = FACTION_USCM
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_WY,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_UPP,
		FACTION_MERCENARY,
	)

/datum/human_ai_faction/upp
	faction = FACTION_UPP
	friendly_factions = list(
		FACTION_COLONIST,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_USCM,
		FACTION_MERCENARY,
		FACTION_TWE,
	)

/datum/human_ai_faction/wy
	faction = FACTION_WY
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_MARINE,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_USCM,
		FACTION_MERCENARY,
	)

/datum/human_ai_faction/wy_deathsquad
	faction = FACTION_WY_DEATHSQUAD
	friendly_factions = list(
		FACTION_WY,
	)
	in_combat_lines = list(
		"Visual confirmed, engaging.",
		"Engaging hostile.",
		"Eliminating hostile.",
		"Engaging.",
		"Contact.",
		"Viscon, proceeding."
	)
	exit_combat_lines = list(
		"Hostilities ceased.",
		"Ceasing engagement."
	)
	squad_member_death_lines = list(
		"Allied unit disabled.",
		"Friendly unit decomissioned.",
		"Allied unit decomissioned.",
		"Friendly unit disabled."
	)
