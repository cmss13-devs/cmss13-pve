/datum/human_ai_squad_preset/civ
	faction = FACTION_COLONIST

// Generic civs

/datum/human_ai_squad_preset/civ/gathering
	name = "Civilian Gathering"
	desc = "A small gathering of English-speaking UA colonists."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/bluecollar = 2,
		/datum/equipment_preset/colonist/whitecollar = 1,
	)

/datum/human_ai_squad_preset/civ/gathering/latam
	name = "Civilian Gathering (LatAm)"
	desc = "A small gathering of Spanish-speaking UA colonists."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/bluecollar/spanish = 2,
		/datum/equipment_preset/colonist/whitecollar/spanish = 1,
	)

/datum/human_ai_squad_preset/civ/gathering/upp
	name = "Civilian Gathering (UPP)"
	desc = "A small gathering of UPP colonists."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/colonist = 3,
	)

/datum/human_ai_squad_preset/civ/gathering/twe
	name = "Civilian Gathering (TWE)"
	desc = "A small gathering of Japanese-speaking TWE colonists."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/bluecollar/japanese = 2,
		/datum/equipment_preset/colonist/whitecollar/japanese = 1,
	)

// Miners

/datum/human_ai_squad_preset/civ/mining
	name = "Civilian Mining Team"
	desc = "A small group of English-speaking UA miners."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/miner = 3,
	)

/datum/human_ai_squad_preset/civ/mining/latam
	name = "Civilian Mining Team (LatAm)"
	desc = "A small group of Spanish-speaking UA miners."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/miner/spanish = 3,
	)

/datum/human_ai_squad_preset/civ/mining/twe
	name = "Civilian Mining Team (TWE)"
	desc = "A small group of Spanish-speaking TWE miners."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/miner/japanese = 3,
	)

// MedSci

/datum/human_ai_squad_preset/civ/medsci
	name = "Civilian MedSci Team"
	desc = "A small group of English-speaking UA doctors."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/researcher = 2,
		/datum/equipment_preset/colonist/doctor = 2,
	)

/datum/human_ai_squad_preset/civ/medsci/latam
	name = "Civilian MedSci Team (LatAm)"
	desc = "A small group of Spanish-speaking UA doctors."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/researcher/spanish = 2,
		/datum/equipment_preset/colonist/doctor/spanish = 2,
	)

/datum/human_ai_squad_preset/civ/medsci/upp
	name = "Civilian MedSci Team (UPP)"
	desc = "A small group of UPP doctors."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/researcher = 2,
		/datum/equipment_preset/upp/doctor = 2,
	)

/datum/human_ai_squad_preset/civ/medsci/twe
	name = "Civilian MedSci Team (TWE)"
	desc = "A small group of Japanese-speaking TWE doctors."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/researcher/japanese = 2,
		/datum/equipment_preset/colonist/doctor/japanese = 2,
	)

// Engineering/Construction

/datum/human_ai_squad_preset/civ/laborers
	name = "Civilian Laborer Team"
	desc = "A small group of English-speaking UA engineers & general laborers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/construction = 3,
		/datum/equipment_preset/colonist/technician = 1,
		/datum/equipment_preset/colonist/engineer = 1,
	)

/datum/human_ai_squad_preset/civ/laborers/latam
	name = "Civilian Laborer Team (LatAm)"
	desc = "A small group of Spanish-speaking UA engineers & general laborers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/construction/spanish = 3,
		/datum/equipment_preset/colonist/technician/spanish = 1,
		/datum/equipment_preset/colonist/engineer/spanish = 1,
	)

/datum/human_ai_squad_preset/civ/laborers/upp
	name = "Civilian Laborer Team (UPP)"
	desc = "A small group of UPP engineers & general laborers."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/engineer = 4,
	)

/datum/human_ai_squad_preset/civ/laborers/twe
	name = "Civilian Laborer Team (TWE)"
	desc = "A small group of Japanese-speaking TWE engineers & general laborers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/construction/japanese = 3,
		/datum/equipment_preset/colonist/technician/japanese = 1,
		/datum/equipment_preset/colonist/engineer/japanese = 1,
	)

// Logistics

/datum/human_ai_squad_preset/civ/logi
	name = "Civilian Logistics Group"
	desc = "A small group of English-speaking UA cargo & logistics workers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/cargo = 3,
		/datum/equipment_preset/colonist/operations = 1,
	)

/datum/human_ai_squad_preset/civ/logi/latam
	name = "Civilian Logistics Group (LatAm)"
	desc = "A small group of Spanish-speaking UA cargo & logistics workers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/cargo/spanish = 3,
		/datum/equipment_preset/colonist/operations/spanish = 1,
	)

/datum/human_ai_squad_preset/civ/logi/upp
	name = "Civilian Logistics Group (UPP)"
	desc = "A small group of UPP cargo & logistics workers."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/cargo = 3,
		/datum/equipment_preset/upp/operations = 1,
	)

/datum/human_ai_squad_preset/civ/logi/twe
	name = "Civilian Logistics Group (TWE)"
	desc = "A small group of Japanese-speaking TWE cargo & logistics workers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/cargo/japanese = 3,
		/datum/equipment_preset/colonist/operations/japanese = 1,
	)

// Operations

/datum/human_ai_squad_preset/civ/ops
	name = "Civilian Operations Group"
	desc = "A small group of English-speaking UA admin & operations workers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/admin = 1,
		/datum/equipment_preset/colonist/operations = 2,
	)

/datum/human_ai_squad_preset/civ/ops/latam
	name = "Civilian Operations Group (LatAm)"
	desc = "A small group of Spanish-speaking UA admin & operations workers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/admin/spanish = 1,
		/datum/equipment_preset/colonist/operations/spanish = 2,
	)

/datum/human_ai_squad_preset/civ/ops/upp
	name = "Civilian Operations Group (UPP)"
	desc = "A small group of UPP admin & operations workers."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/admin = 1,
		/datum/equipment_preset/upp/operations = 2,
	)

/datum/human_ai_squad_preset/civ/ops/twe
	name = "Civilian Operations Group (TWE)"
	desc = "A small group of Japanese-speaking TWE admin & operations workers."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/admin/japanese = 1,
		/datum/equipment_preset/colonist/operations/japanese = 2,
	)
