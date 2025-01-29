/datum/human_ai_squad_preset/wy
	faction = FACTION_WY

/datum/human_ai_squad_preset/wy/patrol
	name = "W-Y Security Patrol Group"
	desc = "A patrol group of 2 Standard corporate security guards."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/security/weyland/tactical = 2,
	)

/datum/human_ai_squad_preset/wy/squad
	name = "W-Y Security Squad"
	desc = "A squad of corporate security, comprising 2 guards, 1 engineer, and 1 leader."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/security/weyland/tactical = 2,
		/datum/equipment_preset/colonist/security/weyland/tactical/lead = 1,
	)
