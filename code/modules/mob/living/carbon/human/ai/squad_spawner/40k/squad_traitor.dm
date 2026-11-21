/datum/human_ai_squad_preset/traitor
	faction = FACTION_TRAITOR

/datum/human_ai_squad_preset/traitor
	name = "Traitor Cultists, Team"
	desc = "A pair of traitor cultists, one with a stubrifle, the other a stubpistol."
	ai_to_spawn = list(
		/datum/equipment_preset/traitors/cultist = 1,
		/datum/equipment_preset/traitors/cultist/rifle = 1,
	)

/datum/human_ai_squad_preset/traitor/squad
	name = "Traitor Cultists, Squad"
	desc = "A squad of traitor cultists with stub rifles and pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/traitors/cultist = 2,
		/datum/equipment_preset/traitors/cultist/rifle = 2,
	)

/datum/human_ai_squad_preset/traitor/guard
	name = "Traitor Guardsmen, Team"
	desc = "A team of traitor guardsmen."
	ai_to_spawn = list(
		/datum/equipment_preset/traitors/guard = 2,
	)

/datum/human_ai_squad_preset/traitor/guard/flamer
	name = "Traitor Guardsmen, Flamer Team"
	desc = "A flamer team of traitor guardsmen."
	ai_to_spawn = list(
		/datum/equipment_preset/traitors/guard/flamer = 1,
		/datum/equipment_preset/traitors/guard = 1,
	)

/datum/human_ai_squad_preset/traitor/guard/squad
	name = "Traitor Guardsmen, Squad"
	desc = "A team of traitor guardsmen, led by an enforcer."
	ai_to_spawn = list(
		/datum/equipment_preset/traitors/guard/enforcer = 1,
		/datum/equipment_preset/traitors/guard = 3,
	)
