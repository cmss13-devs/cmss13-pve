/datum/caste_datum/soldier
	caste_type = XENO_CASTE_SOLDIER
	tier = 2
	melee_damage_lower = XENO_DAMAGE_TIER_3
	melee_damage_upper = XENO_DAMAGE_TIER_4
	melee_vehicle_damage = XENO_DAMAGE_TIER_2
	max_health = 360
	plasma_gain = XENO_PLASMA_GAIN_TIER_8
	plasma_max = XENO_PLASMA_TIER_10
	crystal_max = XENO_CRYSTAL_LOW
	xeno_explosion_resistance = XENO_EXPLOSIVE_ARMOR_TIER_1
	armor_deflection = XENO_ARMOR_TIER_1
	evasion = XENO_EVASION_MEDIUM
	speed = XENO_SPEED_TIER_7

	caste_desc = "A warrior of hives."
	evolves_to = list(XENO_CASTE_QUEEN, XENO_CASTE_BURROWER, XENO_CASTE_CARRIER, XENO_CASTE_HIVELORD) //Add more here separated by commas
	deevolves_to = list("Drone")

	minimap_icon = "warrior"

/mob/living/carbon/xenomorph/soldier
	caste_type = XENO_CASTE_SOLDIER
	name = XENO_CASTE_SOLDIER
	desc = "An alien warrior."
	icon = 'icons/mob/xenos/soldier.dmi'
	icon_size = 48
	icon_state = "Soldier Walking"
	plasma_types = list(PLASMA_PURPLE)
	tier = 2
	pixel_x = -12
	old_x = -12
	base_actions = list(
		/datum/action/xeno_action/onclick/xeno_resting,
		/datum/action/xeno_action/onclick/regurgitate,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/tail_stab,
		/datum/action/xeno_action/activable/transfer_plasma, //fourth macro
		/datum/action/xeno_action/onclick/tacmap,
		)
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)
	gib_chance = 100
	claw_type = CLAW_TYPE_SHARP

	mutation_type = SOLDIER_NORMAL
	icon_xeno = 'icons/mob/xenos/soldier.dmi'
	icon_xenonid = 'icons/mob/xenonids/drone.dmi'
