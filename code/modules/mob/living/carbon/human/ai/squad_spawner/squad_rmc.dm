/datum/human_ai_squad_preset/twe
	faction = FACTION_TWE

/datum/human_ai_squad_preset/twe/rifleteam
	name = "TWE, Assault Group"
	desc = "TWE patrol armed with NSG L23A1 rifles and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/leader/lesser_rank = 1,
		/datum/equipment_preset/royal_marine/standard = 1,
	)

/datum/human_ai_squad_preset/twe/gunteam
	name = "TWE, Fire Support Group"
	desc = "TWE patrol armed with a NSG L23A1 rifle and an L58A3 smartgun, and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/machinegun = 1,
		/datum/equipment_preset/royal_marine/standard = 1,
	)

/datum/human_ai_squad_preset/twe/squad
	name = "TWE, Section"
	desc = "TWE patrol armed with 3 NSG L23A1 rifles and an L58A3 smartgun, and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/leader = 1,
		/datum/equipment_preset/royal_marine/standard = 2,
		/datum/equipment_preset/royal_marine/machinegun = 1,
	)

/datum/human_ai_squad_preset/twe/support
	name = "TWE, Support Group"
	desc = "TWE specialist team armed with NSG L23A1 rifles, carrying ample medical & engineering supplies."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/medic = 1,
		/datum/equipment_preset/royal_marine/engi = 1,
	)

/datum/human_ai_squad_preset/twe/command
	name = "TWE, Headquarters Section"
	desc = "TWE command team armed with NSG L23A1 rifles, carrying ample ammunition."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/lieuteant = 1,
		/datum/equipment_preset/royal_marine/troopsergeant = 1,
		/datum/equipment_preset/royal_marine/standard = 1,
	)
