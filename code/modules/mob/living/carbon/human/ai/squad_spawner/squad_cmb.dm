/datum/human_ai_squad_preset/cmb
	faction = FACTION_MARSHAL

/datum/human_ai_squad_preset/cmb/patrol
	name = "CMB, Patrol"
	desc = "CMB patrol armed with Spearhead revolvers and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/cmb/standard = 2,
	)

/datum/human_ai_squad_preset/cmb/smg
	name = "CMB, Colony Emergency"
	desc = "CMB team armed with Viper 9 SMGs or M41A rifles and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/cmb/standard/emergency = 2,
	)

/datum/human_ai_squad_preset/cmb/breach
	name = "CMB, Breach Team"
	desc = "CMB team armed with a HG-37 pump-shotgun and a Viper 9 SMG or M41A rifle and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/cmb/standard/emergency/shotgunner = 1,
		/datum/equipment_preset/cmb/standard/emergency = 1,
	)

/datum/human_ai_squad_preset/cmb/lead
	name = "CMB, Marshal Team"
	desc = "CMB team armed with Viper 9 SMGs or M41A rifles and carrying IFAKs containing gauze, ointment, splints and an injector."
	ai_to_spawn = list(
		/datum/equipment_preset/cmb/leader = 1,
		/datum/equipment_preset/cmb/standard/emergency = 2,
	)
