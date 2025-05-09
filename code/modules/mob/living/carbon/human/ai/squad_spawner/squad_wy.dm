/datum/human_ai_squad_preset/wy
	faction = "Weyland-Yutani Security"

/datum/human_ai_squad_preset/wy/patrol
	name = "W-Y Security, Patrol Team"
	desc = "A team comprised of 2 corporate security officers armed with VP70s."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/security/weyland = 2,
	)

/datum/human_ai_squad_preset/wy/tactical
	name = "W-Y Security, Tactical Team"
	desc = "A team comprised of 2 corporate tactical response officers armed with M39s."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/security/weyland/tactical = 2,
	)

/datum/human_ai_squad_preset/wy/squad
	name = "W-Y Security, Tactical Squad"
	desc = "A squad comprised of 2 corporate tactical response officers armed with M39s and 1 corporate tactical response officer armed with a HG-37 loaded with slugs."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/security/weyland/tactical/lead = 1,
		/datum/equipment_preset/colonist/security/weyland/tactical = 2,
	)

/datum/human_ai_squad_preset/wy/rifleteam
	name = "PMC Rifle Team"
	desc = "A patrol group of 2 Standard PMCs."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/standard = 2,
	)

/datum/human_ai_squad_preset/wy/gunteam
	name = "PMC, Gun Team"
	desc = "A PMC squad, with support elements and a leader."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/gunner = 1,
		/datum/equipment_preset/pmc/standard = 1,
	)

/datum/human_ai_squad_preset/wy/squad
	name = "PMC, Squad"
	desc = "A PMC squad, with support elements, a heavy smartgunner, and a leader. Use carefully."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/leader = 1,
		/datum/equipment_preset/pmc/standard = 2,
		/datum/equipment_preset/pmc/gunner = 1,
	)

/datum/human_ai_squad_preset/wy/medical
	name = "PMC, Medical Element"
	desc = "A PMC medical element with 2 medics."
	ai_to_spawn = list(
		/datum/equipment_preset/pmc/medic = 2,
	)
