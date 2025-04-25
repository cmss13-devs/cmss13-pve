/datum/human_ai_squad_preset/twe
	faction = "Royal Marine Commandos"

/datum/human_ai_squad_preset/twe/rifleteam
	name = "TWE, Rifle Team"
	desc = "TWE patrol armed with NSG L23A1 rifles and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/team_leader = 1,
		/datum/equipment_preset/royal_marine/standard = 1,
	)

/datum/human_ai_squad_preset/twe/gunteam
	name = "TWE, Gun Team"
	desc = "TWE patrol armed with a NSG L23A1 rifle and an L56A2 smartgun, and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/machinegun = 1,
		/datum/equipment_preset/royal_marine/standard = 1,
	)

/datum/human_ai_squad_preset/twe/squad
	name = "TWE, Squad"
	desc = "TWE patrol armed with 3 NSG L23A1 rifles and an M56A2 smartgun, and carrying IFAKs containing gauze, ointment and injectors."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/team_leader = 1,
		/datum/equipment_preset/royal_marine/standard = 2,
		/datum/equipment_preset/royal_marine/machinegun = 1,
	)

/datum/human_ai_squad_preset/twe/medical
	name = "TWE, Support Element"
	desc = "TWE team armed with NSG L23A1 rifles, carrying ample medical & engineering supplies."
	ai_to_spawn = list(
		/datum/equipment_preset/royal_marine/medic = 1,
		/datum/equipment_preset/royal_marine/engi = 1,
	)
