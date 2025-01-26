/datum/human_ai_squad_preset/clf
	faction = FACTION_CLF

/datum/human_ai_squad_preset/clf/patrol
	name = "TWE Rebel, Patrol"
	desc = "3 TWE rebel riflemen."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier = 3,
	)

/datum/human_ai_squad_preset/clf/at
	name = "Anti-Tank Team"
	desc = "1 TWE rebel anti-tanker, 1 rifleman."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/engineer = 1,
		/datum/equipment_preset/clf/soldier = 1,
	)

/datum/human_ai_squad_preset/clf/fortified
	name = "Fortified Squad"
	desc = "2 TWE rebel riflemen, 1 flamethrower, 1 medic."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier = 2,
		/datum/equipment_preset/clf/soldier/flamer = 1,
		/datum/equipment_preset/clf/medic = 1,
	)

/datum/human_ai_squad_preset/clf/leader_escort
	name = "Leader Escort"
	desc = "1 TWE rebel leader, 2 riflemen."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/leader = 1,
		/datum/equipment_preset/clf/soldier = 2,
	)


/datum/human_ai_squad_preset/clf/honor_guard
	name = "TWE Rebel, Command Element"
	desc = "1 TWE rebel cell commander, 2 riflemen, 1 medic."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/commander = 1,
		/datum/equipment_preset/clf/soldier = 2,
		/datum/equipment_preset/clf/medic = 1,
	)
