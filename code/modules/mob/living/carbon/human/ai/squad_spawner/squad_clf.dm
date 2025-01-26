/datum/human_ai_squad_preset/clf
	faction = FACTION_CLF

/datum/human_ai_squad_preset/clf/patrol
	name = "TWE Rebel, Patrol"
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier = 2,
	)

/datum/human_ai_squad_preset/clf/at
	name = "TWE Rebel, Anti-Tank Team"
	ai_to_spawn = list(
		/datum/equipment_preset/clf/engineer = 1,
		/datum/equipment_preset/clf/soldier = 1,
	)

/datum/human_ai_squad_preset/clf/fortified
	name = "TWE Rebel, Defensive Team"
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier = 2,
		/datum/equipment_preset/clf/soldier/flamer = 1,
		/datum/equipment_preset/clf/medic = 1,
	)

/datum/human_ai_squad_preset/clf/leader_escort
	name = "TWE Rebel, Squad"
	ai_to_spawn = list(
		/datum/equipment_preset/clf/leader = 1,
		/datum/equipment_preset/clf/soldier = 2,
		/datum/equipment_preset/clf/medic = 1,
	)

/datum/human_ai_squad_preset/clf/honor_guard
	name = "TWE Rebel, Command Element"
	desc = "1 TWE rebel cell commander, 2 riflemen, 1 medic."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/commander = 1,
		/datum/equipment_preset/clf/soldier = 2,
		/datum/equipment_preset/clf/medic = 1,
	)

//UA Rebels

/datum/human_ai_squad_preset/clf/patrol
	name = "UA Rebel, Patrol"
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/bluecollar/rebel/soldier = 2,
	)

/datum/human_ai_squad_preset/clf/at
	name = "UA Rebel, Anti-Tank Team"
	ai_to_spawn = list(
		/datum/equipment_preset/clf/engineer = 1,
		/datum/equipment_preset/colonist/bluecollar/rebel/soldier = 1,
	)

/datum/human_ai_squad_preset/clf/fortified
	name = "UA Rebel, Flamethrower Team"
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/bluecollar/rebel/soldier = 2,
		/datum/equipment_preset/clf/soldier/flamer = 1,
		/datum/equipment_preset/clf/medic = 1,
	)

/datum/human_ai_squad_preset/clf/leader_escort
	name = "UA Rebel, Squad"
	ai_to_spawn = list(
		/datum/equipment_preset/clf/leader = 1,
		/datum/equipment_preset/colonist/bluecollar/rebel/soldier = 2,
		/datum/equipment_preset/clf/medic = 1,
	)

/datum/human_ai_squad_preset/clf/honor_guard
	name = "UA Rebel, Command Element"
	desc = "1 TWE rebel cell commander, 2 riflemen, 1 medic."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/commander = 1,
		/datum/equipment_preset/colonist/bluecollar/rebel/soldier = 2,
		/datum/equipment_preset/clf/medic = 1,
	)
