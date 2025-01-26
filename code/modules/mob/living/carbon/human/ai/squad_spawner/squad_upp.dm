/datum/human_ai_squad_preset/upp
	faction = FACTION_UPP

/datum/human_ai_squad_preset/upp/militia
	name = "Territorial Guard, Patrol"
	desc = "3 Territorial Guardsmen."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/militia = 3,
	)

/datum/human_ai_squad_preset/upp/rifleteam
	name = "Naval Infantry, Rifle Team"
	desc = "2 Naval Infantry riflemen."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
	)

/datum/human_ai_squad_preset/upp/gunteam
	name = "Naval Infantry, Gun Team"
	desc = "1 Naval Infantry riflemen, 1 machinegunner."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 1,
		/datum/equipment_preset/upp/machinegunner = 1,
	)

/datum/human_ai_squad_preset/upp/squad
	name = "Naval Infantry, Squad"
	desc = "2 Naval Infantry riflemen, 1 machinegunner, 1 squad leader."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
		/datum/equipment_preset/upp/machinegunner = 1,
		/datum/equipment_preset/upp/squadlead = 1,
	)

/datum/human_ai_squad_preset/upp/medical
	name = "Naval Infantry, Sanitar Element"
	desc = "2 Naval Infantry Sanitars"
	ai_to_spawn = list(
		/datum/equipment_preset/upp/sanitar = 2,
	)

/datum/human_ai_squad_preset/upp/command
	name = "Naval Infantry, Command Element"
	desc = "1 Naval Infantry Platoon Commander, 2 riflemen, 1 Platoon Sergeant."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
		/datum/equipment_preset/upp/navallead = 1,
		/datum/equipment_preset/upp/officer/naval = 1,
	)

