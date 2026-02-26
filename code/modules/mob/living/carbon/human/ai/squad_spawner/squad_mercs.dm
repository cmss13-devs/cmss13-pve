/datum/human_ai_squad_preset/mercs
	faction = FACTION_MERCENARY

/datum/human_ai_squad_preset/mercs/grunts
	name = "Grunt Technician Duo"
	desc = "A duo of mercenary logistics grunts, armed with sidearms."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/grunt = 2,
	)

/datum/human_ai_squad_preset/mercs/grunts/doctors
	name = "Grunt Medical Duo"
	desc = "A duo of mercenary medical grunts, armed with sidearms."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/grunt/doctor = 2,
	)

/datum/human_ai_squad_preset/mercs/patrol
	name = "Sentinel Patrol Team"
	desc = "A basic sentinel patrol team, consisting of two sentinels with modified FP9000 SMGs and light armor."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/sentinel = 2,
	)

/datum/human_ai_squad_preset/mercs/patrol/squad
	name = "Sentinel Patrol Squad"
	desc = "A basic sentinel patrol squad, consisting of four sentinels with modified FP9000 SMGs and light armor."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/sentinel = 4,
	)

/datum/human_ai_squad_preset/mercs/response
	name = "Sentinel Response Team"
	desc = "A team of sentinels armed with better equipment and armour to respond to hostile action, though their weapon makeup is the same."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/sentinel/response = 2,
	)

/datum/human_ai_squad_preset/mercs/response/squad
	name = "Sentinel Response Squad"
	desc = "A squad of sentinels, better armed to respond to hostile action. With better armour and equipment, they're a tougher foe to go up against, with a squad leader with an M20CW Carbine as well."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/sentinel/response/carbine = 1,
		/datum/equipment_preset/mercenary/sentinel/response = 3,
	)

/datum/human_ai_squad_preset/mercs/response/command
	name = "Sentinel Response Command Team"
	desc = "A sentinel and supervisor duo, alongside a Synthetic, responsible for the oversight of a sentinel response platoon."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/supervisor/response = 1,
		/datum/equipment_preset/mercenary/sentinel/response/medic = 1,
		/datum/equipment_preset/mercenary/synth/response = 1,
	)

/datum/human_ai_squad_preset/mercs/response/heavy
	name = "Bulwark Heavy Suppression Response Team (USE WITH CAUTION)"
	desc = "A team of heavy Bulwark operatives, armed with machineguns and enough armor to hold against most threats encountered, for when everything goes to hell.."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/bulwark/machinegun = 2,
	)

/datum/human_ai_squad_preset/mercs/response/heavy/shotgun
	name = "Bulwark Heavy Breacher Response Team (USE WITH CAUTION)"
	desc = "A team of heavy Bulwark operatives, armed with slug shotguns and enough armor to hold against most threats encountered, for when everything goes to hell.."
	ai_to_spawn = list(
		/datum/equipment_preset/mercenary/bulwark = 2,
	)
