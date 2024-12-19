/datum/human_ai_squad_preset/wy
	faction = FACTION_WY

/datum/human_ai_squad_preset/wy/patrol
	name = "W-Y Security Patrol Group"
	desc = "A patrol group of 3 Standard corporate security guards."
	ai_to_spawn = list(
		/datum/equipment_preset/goon/standard = 3,
	)

/datum/human_ai_squad_preset/wy/squad
	name = "W-Y Security Squad"
	desc = "A squad of corporate security, comprising 4 guards, 1 engineer, and 1 leader."
	ai_to_spawn = list(
		/datum/equipment_preset/goon/standard = 4,
		/datum/equipment_preset/goon/engineer = 1,
		/datum/equipment_preset/goon/lead = 1,
	)
