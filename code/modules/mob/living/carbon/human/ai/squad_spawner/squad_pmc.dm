/datum/human_ai_squad_preset/pmc
	faction = FACTION_PMC

/datum/human_ai_squad_preset/pmc/rifleteam
	name = "WY PMC Rifle Team"
	desc = "A patrol group of 2 Standard Weyland-Yutani PMCs."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/standard = 2,
	)

/datum/human_ai_squad_preset/pmc/gunteam
	name = "WY PMC, Gun Team"
	desc = "A Weyland-Yutani PMC fireteam, with a smartgunner and rifle support."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/gunner = 1,
		/datum/equipment_preset/pmc/standard = 1,
	)

/datum/human_ai_squad_preset/pmc/squad
	name = "WY PMC, Squad"
	desc = "A Weyland-Yutani PMC squad, with support elements, a heavy smartgunner, and a leader. Use carefully."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/leader = 1,
		/datum/equipment_preset/pmc/gunner = 1,
		/datum/equipment_preset/pmc/standard = 2,
	)

/datum/human_ai_squad_preset/pmc/medical
	name = "WY PMC, Medical Element"
	desc = "A Weyland-Yutani PMC medical element with 2 medics."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/medic = 2,
	)
