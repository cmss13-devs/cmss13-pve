/datum/human_ai_squad_preset/upp
	faction = FACTION_UPP

/datum/human_ai_squad_preset/upp/militia
	name = "Militia Group"
	desc = "A small group of 5 lightly-armed UPP militiamen."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/militia = 5,
	)

/datum/human_ai_squad_preset/upp/patrol
	name = "Patrol Group"
	desc = "A small group of 3 UPP riflemen and a machinegunner for patrolling."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 3,
		/datum/equipment_preset/upp/machinegunner = 1,
	)

/datum/human_ai_squad_preset/upp/medical
	name = "Medical Response Unit"
	desc = "Three UPP medics for medical emergency response."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/sanitar = 3,
	)

/datum/human_ai_squad_preset/upp/squad
	name = "Standard Squad"
	desc = "A standard squad of 10 UPP soldiers."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 6,
		/datum/equipment_preset/upp/machinegunner = 2,
		/datum/equipment_preset/upp/sanitar = 1,
		/datum/equipment_preset/upp/squadlead = 1,
	)

/datum/human_ai_squad_preset/upp/command
	name = "Command Element"
	desc = "A UPP officer, platoon sergeant, and their guard team."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
		/datum/equipment_preset/upp/navallead = 1,
		/datum/equipment_preset/upp/officer = 1,
	)

