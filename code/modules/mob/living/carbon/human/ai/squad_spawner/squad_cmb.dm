/datum/human_ai_squad_preset/cmb
	faction = FACTION_MARSHAL

/datum/human_ai_squad_preset/cmb/patrol
	name = "CMB, Patrol"
	desc = "CMB patrol armed with Spearhead revolvers and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/cmb/deputy = 2,
	)

/datum/human_ai_squad_preset/cmb/smg
	name = "CMB, Colony Emergency"
	desc = "CMB team armed with Viper 9 SMGs or M41A rifles and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/cmb/deputy/emergency = 2,
	)

/datum/human_ai_squad_preset/cmb/breach
	name = "CMB, Breach Team"
	desc = "CMB team armed with a HG-37 pump-shotgun and a Viper 9 SMG or M41A rifle and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/cmb/deputy/emergency/shotgunner = 1,
		/datum/equipment_preset/cmb/deputy/emergency = 1,
	)

/datum/human_ai_squad_preset/cmb/lead
	name = "CMB, Marshal Team"
	desc = "CMB team armed with Viper 9 SMGs or M41A rifles and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/cmb/marshal = 1,
		/datum/equipment_preset/cmb/deputy/emergency = 2,
	)

/datum/human_ai_squad_preset/cmb/uacg
	name = "UACG, Patrol"
	desc = "Small Colonial Guard militia patrol armed with M20A rifles and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/colonist/security/guard = 3,
	)
