/datum/human_ai_squad_preset/wy
	faction = FACTION_WY

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
