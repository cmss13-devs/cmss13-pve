/datum/human_ai_squad_preset/pmc
	faction = FACTION_PMC

/datum/human_ai_squad_preset/pmc/rifleteam
	name = "PMC Rifle Team"
	desc = "A patrol group of 2 Standard PMCs."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/pmc_standard = 2,
	)

/datum/human_ai_squad_preset/pmc/gunteam
	name = "PMC, Gun Team"
	desc = "A PMC squad, with support elements and a leader."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/pmc_standard = 1,
		/datum/equipment_preset/pmc/pmc_gunner = 1,
	)

/datum/human_ai_squad_preset/pmc/squad
	name = "PMC, Squad"
	desc = "A PMC squad, with support elements, a heavy smartgunner, and a leader. Use carefully."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/pmc_standard = 2,
		/datum/equipment_preset/pmc/pmc_gunner = 1,
		/datum/equipment_preset/pmc/pmc_leader = 1,
	)

/datum/human_ai_squad_preset/pmc/medical
	name = "PMC, Medical Element"
	desc = "A PMC medical element with 2 medics."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/pmc_medic = 2,
	)
