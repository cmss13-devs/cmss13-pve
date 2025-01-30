/datum/human_ai_squad_preset/joes
	faction = FACTION_WJ

/datum/human_ai_squad_preset/joes/three
	name = "3 Joes"
	desc = "What it says on the tin."
	ai_to_spawn = list(
		/datum/equipment_preset/synth/working_joe/evil = 3,
	)

/datum/human_ai_squad_preset/joes/five
	name = "5 Joes"
	desc = "What it says on the tin."
	ai_to_spawn = list(
		/datum/equipment_preset/synth/working_joe/evil = 5,
	)

/datum/human_ai_squad_preset/joes/twoplusone
	name = "2 Melee 1 Nailgun"
	desc = "What it says on the tin."
	ai_to_spawn = list(
		/datum/equipment_preset/synth/working_joe/evil = 2,
		/datum/equipment_preset/synth/working_joe/evil/gun = 1
	)

/datum/human_ai_squad_preset/joes/repaircrew
	name = "Repair Crew"
	desc = "3 Nailgun Joes."
	ai_to_spawn = list(
		/datum/equipment_preset/synth/working_joe/evil/gun = 3
	)

/datum/human_ai_squad_preset/joes/twoplusoneflamer
	name = "2 Melee 1 Flamer"
	desc = "What it says on the tin."
	ai_to_spawn = list(
		/datum/equipment_preset/synth/working_joe/evil = 2,
		/datum/equipment_preset/synth/working_joe/evil/flamer = 1
	)

/datum/human_ai_squad_preset/joes/exterminators
	name = "Exterminators"
	desc = "3 Flamers."
	ai_to_spawn = list(
		/datum/equipment_preset/synth/working_joe/evil/flamer = 3
	)

/datum/human_ai_squad_preset/joes/security
	name = "Cop Buddies"
	desc = "2 Stunbatons."
	ai_to_spawn = list(
		/datum/equipment_preset/synth/working_joe/evil/security = 2
	)
