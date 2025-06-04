/datum/human_ai_squad_preset/contractor

	faction = "Contractors"

// VAIPO Mercs

/datum/human_ai_squad_preset/contractor/duty/rifleteam
	name = "Contractor, Rifle Team"
	desc = "A patrol group of 2 VAIPO Contractor Rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/contractor/duty/standard = 2,
	)

/datum/human_ai_squad_preset/contractor/duty/gunteam
	name = "Contractor, Gun Team"
	desc = "A VAIPO fireteam, with LMG operator and rifle support."
	ai_to_spawn = list(
		/datum/equipment_preset/contractor/duty/heavy = 1,
		/datum/equipment_preset/contractor/duty/standard = 1,
	)

/datum/human_ai_squad_preset/contractor/duty/squad
	name = "Contractor, Squad"
	desc = "A VAIPO squad with support elements, a LMG operator, and a leader."
	ai_to_spawn = list(
		/datum/equipment_preset/contractor/duty/leader = 1,
		/datum/equipment_preset/contractor/duty/heavy = 1,
		/datum/equipment_preset/contractor/duty/standard = 1,
		/datum/equipment_preset/contractor/duty/medic = 1,
	)

/datum/human_ai_squad_preset/contractor/duty/support
	name = "Contractor, Support Team"
	desc = "A VAIPO fireteam of support elements; medic and engineer."
	ai_to_spawn = list(
		/datum/equipment_preset/contractor/duty/engi = 1,
		/datum/equipment_preset/contractor/duty/medic = 1,
	)

// VAISO Mercs

/datum/human_ai_squad_preset/contractor/covert/rifleteam
	name = "Covert Contractor, Rifle Team"
	desc = "A patrol group of 2 VAISO Contractor Rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/contractor/covert/standard = 2,
	)

/datum/human_ai_squad_preset/contractor/covert/gunteam
	name = "Covert Contractor, Gun Team"
	desc = "A VAISO fireteam, with LMG operator and rifle support."
	ai_to_spawn = list(
		/datum/equipment_preset/contractor/covert/heavy = 1,
		/datum/equipment_preset/contractor/covert/standard = 1,
	)

/datum/human_ai_squad_preset/contractor/covert/squad
	name = "Covert Contractor, Squad"
	desc = "A VAISO squad with support elements, a LMG operator, and a leader."
	ai_to_spawn = list(
		/datum/equipment_preset/contractor/covert/leader = 1,
		/datum/equipment_preset/contractor/covert/heavy = 1,
		/datum/equipment_preset/contractor/covert/standard = 1,
		/datum/equipment_preset/contractor/covert/medic = 1,
	)

/datum/human_ai_squad_preset/contractor/covert/support
	name = "Covert Contractor, Support Team"
	desc = "A VAISO fireteam of support elements; medic and engineer."
	ai_to_spawn = list(
		/datum/equipment_preset/contractor/covert/engi = 1,
		/datum/equipment_preset/contractor/covert/medic = 1,
	)
