/datum/human_ai_squad_preset/clf
	faction = FACTION_CLF

/datum/human_ai_squad_preset/clf/patrol
	name = "Patrol Squad"
	desc = "A small squad of CLF for patrolling."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier/ai = 3,
		/datum/equipment_preset/clf/soldier/ai/shotgunner = 1,
	)

/datum/human_ai_squad_preset/clf/breach
	name = "Breacher Squad"
	desc = "A small squad of CLF for close-quarters combat."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/engineer/ai = 1,
		/datum/equipment_preset/clf/soldier/ai/shotgunner = 2,
	)

/datum/human_ai_squad_preset/clf/at
	name = "Anti-Tank Team"
	desc = "A team consisting of a SADAR specialist and a rifleman, good for jumping a vehicle or unaware marines."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/specialist/ai = 1,
		/datum/equipment_preset/clf/soldier/ai = 1,
	)

/datum/human_ai_squad_preset/clf/ambush
	name = "Ambush Squad"
	desc = "A small squad of CLF for ambushing unaware targets in close-quarters."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/specialist/ai/flamer = 1,
		/datum/equipment_preset/clf/soldier/ai/shotgunner = 2,
	)

/datum/human_ai_squad_preset/clf/fortified
	name = "Fortified Squad"
	desc = "A decently-sized squad of CLF for holding a fortified position."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier/ai = 3,
		/datum/equipment_preset/clf/medic = 1,
		/datum/equipment_preset/clf/engineer/ai = 1,
	)

/datum/human_ai_squad_preset/clf/kill_team
	name = "Kill Team"
	desc = "A small kill-team of CLF for going into enemy territory."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier/ai = 2,
		/datum/equipment_preset/clf/soldier/ai/shotgunner = 2,
		/datum/equipment_preset/clf/medic = 1,
	)

/datum/human_ai_squad_preset/clf/leader_escort
	name = "Leader Escort"
	desc = "A small squad of CLF for escorting a CLF leader."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/leader = 1,
		/datum/equipment_preset/clf/soldier/ai = 2,
	)


/datum/human_ai_squad_preset/clf/honor_guard
	name = "Honor Guard"
	desc = "A team of CLF headed by a smartgun-wielding cell commander. Use carefully."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/commander = 1,
		/datum/equipment_preset/clf/soldier/ai = 3,
		/datum/equipment_preset/clf/medic = 1,
	)
