/datum/human_ai_squad_preset/pmc
	faction = FACTION_PMC

/datum/human_ai_squad_preset/pmc/standard
	name = "PMC Patrol Group"
	desc = "A patrol group of 3 Standard PMCs."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/pmc_standard = 3,
	)

/datum/human_ai_squad_preset/pmc/squad
	name = "PMC Squad"
	desc = "A PMC squad, with support elements and a leader."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/pmc_standard = 5,
		/datum/equipment_preset/pmc/pmc_leader = 1,
		/datum/equipment_preset/pmc/pmc_medic = 1,
	)

/datum/human_ai_squad_preset/pmc/squad_gunner
	name = "PMC Squad, Gunner"
	desc = "A PMC squad, with support elements, a heavy smartgunner, and a leader. Use carefully."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/pmc_standard = 4,
		/datum/equipment_preset/pmc/pmc_gunner = 1,
		/datum/equipment_preset/pmc/pmc_medic = 1,
		/datum/equipment_preset/pmc/pmc_leader = 1,
	)
