/datum/human_ai_squad_preset/upp
	faction = FACTION_UPP

/datum/human_ai_squad_preset/upp/militia
	name = "Territorial Guard, Patrol"
	ai_to_spawn = list(
		/datum/equipment_preset/upp/militia = 3,
	)

/datum/human_ai_squad_preset/upp/rifleteam
	name = "Naval Infantry, Rifle Team"
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
	)

/datum/human_ai_squad_preset/upp/gunteam
	name = "Naval Infantry, Gun Team"
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 1,
		/datum/equipment_preset/upp/machinegunner = 1,
	)

/datum/human_ai_squad_preset/upp/squad
	name = "Naval Infantry, Squad"
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
		/datum/equipment_preset/upp/machinegunner = 1,
		/datum/equipment_preset/upp/squadlead = 1,
	)

/datum/human_ai_squad_preset/upp/medical
	name = "Naval Infantry, Sanitar Element"
	ai_to_spawn = list(
		/datum/equipment_preset/upp/sanitar = 2,
	)

/datum/human_ai_squad_preset/upp/command
	name = "Naval Infantry, Command Element"
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
		/datum/equipment_preset/upp/navallead = 1,
		/datum/equipment_preset/upp/officer/naval = 1,
	)

