/datum/human_ai_squad_preset/upp
	faction = FACTION_UPP

/datum/human_ai_squad_preset/upp/militia
	name = "Territorial Guard, Patrol"
	desc = "Territorial Guard recon patrol armed with Type 71 rifles or KS29 pump-shotguns and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/militia = 2,
	)

/datum/human_ai_squad_preset/upp/rifleteam
	name = "Naval Infantry, Assault Team"
	desc = "Naval Infantry patrol armed with 2 AG80 rifles and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman/ag80 = 2,
	)

/datum/human_ai_squad_preset/upp/gunteam
	name = "Naval Infantry, Lead Team"
	desc = "Naval Infantry patrol armed with a AG80 rifle and a Type 71 rifle, and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/squadlead = 1,
		/datum/equipment_preset/upp/rifleman/ag80 = 1,
	)

/datum/human_ai_squad_preset/upp/squad
	name = "Naval Infantry, Squad"
	desc = "Naval Infantry patrol armed with 2 AG80 rifles and 2 Type 71 rifles, and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/squadlead = 1,
		/datum/equipment_preset/upp/rifleman/ag80 = 2,
		/datum/equipment_preset/upp/rifleman = 1,
	)

/datum/human_ai_squad_preset/upp/medical
	name = "Naval Infantry, Sanitar Element"
	desc = "Naval Infantry team armed with 2 AG80 rifles and carrying ample medical supplies."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/sanitar = 2,
	)

/datum/human_ai_squad_preset/upp/command
	name = "Naval Infantry, Command Element"
	desc = "Naval Infantry team armed with 2 AG80 rifles and 1 Type 71 rifle. Best utilized as defended objective, PltCo is not armed effectively."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/rifleman/ag80 = 2,
		/datum/equipment_preset/upp/navallead = 1,
		/datum/equipment_preset/upp/officer/naval = 1,
	)

/datum/human_ai_squad_preset/upp/gunner
	name = "Naval Infantry, Gunner"
	desc = "USE WITH CAUTION. Naval Infantry heavy gunner armed with a GPMG loaded with HEAP and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/machinegunner = 1,
	)
