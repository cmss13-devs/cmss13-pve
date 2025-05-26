
/datum/human_ai_squad_preset/uscm
	faction = FACTION_MARINE

/datum/human_ai_squad_preset/uscm/rifleteam
	name = "USCM, Rifle Team"
	desc = "USCM patrol armed with M41A rifles and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/uscm/tl_equipped = 1,
		/datum/equipment_preset/uscm/private_equipped = 1,
	)

/datum/human_ai_squad_preset/uscm/gunteam
	name = "USCM, Gun Team"
	desc = "USCM patrol armed with a M41A rifle and an M56A2 smartgun, and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/uscm/smartgunner_equipped = 1,
		/datum/equipment_preset/uscm/private_equipped = 1,
	)

/datum/human_ai_squad_preset/uscm/squad
	name = "USCM, Squad"
	desc = "USCM patrol armed with 3 M41A rifle and an M56A2 smartgun, and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/uscm/tl_equipped = 1,
		/datum/equipment_preset/uscm/smartgunner_equipped = 1,
		/datum/equipment_preset/uscm/private_equipped = 2,
	)

/datum/human_ai_squad_preset/uscm/medical
	name = "USCM, Medical Element"
	desc = "USCM team armed with M41A rifles and carrying ample medical supplies."
	ai_to_spawn = list(
		/datum/equipment_preset/uscm/medic_equipped = 2,
	)

/datum/human_ai_squad_preset/uscm/command
	name = "USCM, Command Element"
	desc = "Best utilized as defended objective, PltCo is not armed effectively."
	ai_to_spawn = list(
		/datum/equipment_preset/uscm_ship/so_equipped = 1,
		/datum/equipment_preset/uscm/leader_equipped = 1,
		/datum/equipment_preset/uscm/private_equipped = 2,
	)

