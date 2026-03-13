/datum/human_ai_squad_preset/iasf
	faction = FACTION_IASF

/datum/human_ai_squad_preset/iasf/rifleteam
	name = "TWE, IASF Assault Group"
	desc = "TWE IASF patrol armed with F903 rifles and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/iasf/leader/lesser = 1,
		/datum/equipment_preset/iasf/standard = 1,
	)

/datum/human_ai_squad_preset/iasf/gunteam
	name = "TWE, IASF Fire Support Group"
	desc = "TWE IASF patrol armed with a F903 rifle and an L58A3 smartgun, and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/iasf/machinegun = 1,
		/datum/equipment_preset/iasf/standard = 1,
	)

/datum/human_ai_squad_preset/iasf/squad
	name = "TWE, IASF Section"
	desc = "TWE IASF patrol armed with 3 F903 rifles and an L58A3 smartgun, and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/iasf/leader = 1,
		/datum/equipment_preset/iasf/standard = 2,
		/datum/equipment_preset/iasf/machinegun = 1,
	)

/datum/human_ai_squad_preset/iasf/support
	name = "TWE, IASF Support Group"
	desc = "TWE IASF specialist team armed with F903 rifles, carrying ample medical & engineering supplies."
	ai_to_spawn = list(
		/datum/equipment_preset/iasf/medic = 1,
		/datum/equipment_preset/iasf/engineer = 1,
	)

/datum/human_ai_squad_preset/iasf/command
	name = "TWE, Headquarters Section"
	desc = "TWE IASF command team armed with NSG L23 and F903 rifles, carrying ample ammunition."
	ai_to_spawn = list(
		/datum/equipment_preset/iasf/lieutenant = 1,
		/datum/equipment_preset/iasf/troopsergeant = 1,
		/datum/equipment_preset/iasf/standard = 1,
	)
