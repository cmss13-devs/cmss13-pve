/datum/human_ai_squad_preset/clf
	faction = FACTION_CLF

/datum/human_ai_squad_preset/clf/jovian
	name = "Jovian Squad"
	desc = "A small squad of UJL."
	ai_to_spawn = list(
		/datum/equipment_preset/jovian = 3,
	)

/datum/human_ai_squad_preset/clf/shotgun
	name = "Jovian Squad+Shotgun"
	desc = "A small squad of UJL."
	ai_to_spawn = list(
		/datum/equipment_preset/jovian = 2,
		/datum/equipment_preset/jovian/shotgunner = 1
	)

