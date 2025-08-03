/datum/human_ai_squad_preset/fil
	faction = FACTION_FIL

/datum/human_ai_squad_preset/fil/auxiliary
	name = "Auxiliaries, Patrol"
	desc = "A small patrol of FIL Auxiliaries, armed with basic equipment and training."
	ai_to_spawn = list(
		/datum/equipment_preset/fil/rifleman/auxiliary = 2,
	)

/datum/human_ai_squad_preset/fil/auxiliary/squad
	name = "Auxiliaries, Squad"
	desc = "A squad patrol of FIL Auxiliaries, armed with basic equipment and training."
	ai_to_spawn = list(
		/datum/equipment_preset/fil/rifleman/auxiliary/lead = 1,
		/datum/equipment_preset/fil/rifleman/auxiliary = 3,
	)

/datum/human_ai_squad_preset/fil/standard
	name = "Operators, Patrol"
	desc = "A 2-man patrol of FIL operators, the main frontline troops, decently trained and equipped."
	ai_to_spawn = list(
		/datum/equipment_preset/fil/rifleman = 2,
	)

/datum/human_ai_squad_preset/fil/standard/support
	name = "Operators, Support"
	desc = "A 2-man Automatic Support team, mainly used for covering fire during combat situations."
	ai_to_spawn = list(
		/datum/equipment_preset/fil/rifleman/mg = 1,
		/datum/equipment_preset/fil/rifleman = 1,
	)

/datum/human_ai_squad_preset/fil/standard/assault
	name = "Operators, Assault"
	desc = "A 4-man Assault team, used for breaching and breaking lines of enemy forces, but can't do much alone."
	ai_to_spawn = list(
		/datum/equipment_preset/fil/rifleman = 3,
		/datum/equipment_preset/fil/rifleman/tech = 1,
	)

/datum/human_ai_squad_preset/fil/standard/command
	name = "Operators, Command"
	desc = "A 4-man Command team, in charge of the command of an entire platoon of FIL operatives."
	ai_to_spawn = list(
		/datum/equipment_preset/fil/rifleman/squadlead = 1,
		/datum/equipment_preset/fil/rifleman = 1,
		/datum/equipment_preset/fil/rifleman/medic = 1,
		/datum/equipment_preset/fil/rifleman/scout/radio = 1,
	)
