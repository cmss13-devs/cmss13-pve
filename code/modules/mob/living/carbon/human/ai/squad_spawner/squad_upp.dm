/datum/human_ai_squad_preset/upp
	faction = FACTION_UPP

/datum/human_ai_squad_preset/upp/militia
	name = "Territorial Guard, Patrol"
	desc = "Small Territorial Guard recon patrol armed with Type 71 rifles or KS29 pump-shotguns and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/militia = 3,
	)

/datum/human_ai_squad_preset/upp/rifleteam
	name = "Naval Infantry, Rifle Team"
	desc = "Naval Infantry patrol armed with AG80 rifles and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
	)

/datum/human_ai_squad_preset/upp/gunteam
	name = "Naval Infantry, Gun Team"
	desc = "Naval Infantry patrol armed with a AG80 rifle and an QYJ-72 GPMG, and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 1,
		/datum/equipment_preset/upp/machinegunner = 1,
	)

/datum/human_ai_squad_preset/upp/squad
	name = "Naval Infantry, Squad"
	desc = "Naval Infantry patrol armed with 3 AG80 rifles and an QYJ-72 GPMG, and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
		/datum/equipment_preset/upp/machinegunner = 1,
		/datum/equipment_preset/upp/squadlead = 1,
	)

/datum/human_ai_squad_preset/upp/medical
	name = "Naval Infantry, Sanitar Element"
	desc = "Naval Infantry team armed with AG80 rifles and carrying ample medical supplies."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/sanitar = 2,
	)

/datum/human_ai_squad_preset/upp/command
	name = "Naval Infantry, Command Element"
	desc = "Naval Infantry team armed with AG80 rifles. Best utilized as defended objective, PltCo is not armed effectively."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman = 2,
		/datum/equipment_preset/upp/navallead = 1,
		/datum/equipment_preset/upp/officer/naval = 1,
	)

