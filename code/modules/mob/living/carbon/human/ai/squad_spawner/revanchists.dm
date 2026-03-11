/datum/human_ai_squad_preset/revanchists
	faction = FACTION_REVANCHISTS

/datum/human_ai_squad_preset/revanchists/squad
	name = "Revanchists, Squad"
	desc = "2x Riflemen 1x Sgt."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/revanchist/rifleman = 2,
		/datum/equipment_preset/upp/revanchist/sl = 1
	)

/datum/human_ai_squad_preset/revanchists/patrol
	name = "Revanchists, Patrol"
	desc = "2x Riflemen."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/revanchist/rifleman = 2,
	)

/datum/human_ai_squad_preset/revanchists/cryo
	name = "Revanchists, Fresh Outa Cryo"
	desc = "2x Noobs."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/revanchist/rifleman/cryo = 2,
	)

/datum/human_ai_squad_preset/revanchists/flamer
	name = "Revanchists, Flamer"
	desc = "1x Flamer."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/revanchist/flamer = 1,
	)

/datum/human_ai_squad_preset/revanchists/shotgunner
	name = "Revanchists, Shotgunner"
	desc = "1x Shotgunner."
	ai_to_spawn = list(
		/datum/equipment_preset/upp/revanchist/shotgunner = 1,
	)
