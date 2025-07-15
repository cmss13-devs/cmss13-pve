/datum/human_ai_squad_preset/faami
	faction = FACTION_FAAMI

/datum/human_ai_squad_preset/faami/auxiliary
	name = "Auxiliaries, Patrol"
	desc = "A small patrol of FAAMI Auxiliaries, armed with basic equipment and training."
	ai_to_spawn = list(
		/datum/equipment_preset/faami/rifleman/auxiliary = 2,
	)

/datum/human_ai_squad_preset/faami/auxiliary/squad
	name = "Auxiliaries, Squad"
	desc = "A squad patrol of FAAMI Auxiliaries, armed with basic equipment and training."
	ai_to_spawn = list(
		/datum/equipment_preset/faami/rifleman/auxiliary/lead = 1,
		/datum/equipment_preset/faami/rifleman/auxiliary = 3,
	)

/datum/human_ai_squad_preset/faami/standard
	name = "Operators, Patrol"
	desc = "A 2-man patrol of FAAMI operators, the main frontline troops, decently trained and equipped."
	ai_to_spawn = list(
		/datum/equipment_preset/faami/rifleman = 2,
	)

/datum/human_ai_squad_preset/faami/standard/support
	name = "Operators, Support"
	desc = "A 2-man Automatic Support team, mainly used for covering fire during combat situations."
	ai_to_spawn = list(
		/datum/equipment_preset/faami/rifleman/mg = 1,
		/datum/equipment_preset/faami/rifleman = 1,
	)

/datum/human_ai_squad_preset/faami/standard/assault
	name = "Operators, Assault"
	desc = "A 4-man Assault team, used for breaching and breaking lines of enemy forces, but can't do much alone."
	ai_to_spawn = list(
		/datum/equipment_preset/faami/rifleman = 3,
		/datum/equipment_preset/faami/rifleman/tech = 1,
	)

/datum/human_ai_squad_preset/faami/standard/command
	name = "Operators, Command"
	desc = "A 4-man Command team, in charge of the command of an entire platoon of FAAMI operatives."
	ai_to_spawn = list(
		/datum/equipment_preset/faami/rifleman/squadlead = 1,
		/datum/equipment_preset/faami/rifleman = 1,
		/datum/equipment_preset/faami/rifleman/medic = 1,
		/datum/equipment_preset/faami/rifleman/scout/radio = 1,
	)
