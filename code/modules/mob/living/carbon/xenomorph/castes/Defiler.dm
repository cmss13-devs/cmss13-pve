/datum/caste_datum/defiler
	caste_type = XENO_CASTE_DEFILER
	tier = 3

	melee_damage_lower = XENO_DAMAGE_TIER_5
	melee_damage_upper = XENO_DAMAGE_TIER_5
	melee_vehicle_damage = XENO_DAMAGE_TIER_5 * 8
	max_health = XENO_HEALTH_IMMORTAL * XENO_HEALTH_IMMORTAL
	plasma_gain = XENO_PLASMA_GAIN_TIER_7
	plasma_max = XENO_PLASMA_TIER_8 * 8
	xeno_explosion_resistance = XENO_EXPLOSIVE_ARMOR_TIER_10
	armor_deflection = XENO_ARMOR_TIER_3
	evasion = XENO_EVASION_NONE
	speed = XENO_SPEED_TIER_4
	heal_standing = 0.66

	spit_types = list(/datum/ammo/xeno/acid/defiler)

	minimum_evolve_time = 15 MINUTES

	tackle_min = 1
	tackle_max = 2
	tackle_chance = 90

	evolution_allowed = TRUE
	caste_desc = "Crawling, oozing horror."
	fire_intensity_resistance = 20
	fire_vulnerability_mult = 0.25

	minimap_icon = "crusher"

/mob/living/carbon/xenomorph/defiler
	caste_type = XENO_CASTE_DEFILER
	name = XENO_CASTE_DEFILER
	desc = "Huge alien monstrosity."
	icon_size = 64
	icon_state = "Defiler Walking"
	plasma_types = list(PLASMA_CHITIN)
	tier = 3
	drag_delay = 6 //pulling a big dead xeno is hard
	melee_sentry_damage_multiplier = 2

	small_explosives_stun = FALSE

	mob_size = MOB_SIZE_IMMOBILE

	pixel_x = -16
	pixel_y = -3
	old_x = -16
	old_y = -3
	base_pixel_x = 0
	base_pixel_y = -16

	rebounds = FALSE // no more fucking pinball crooshers
	organ_value = 3000
	base_actions = list(
		/datum/action/xeno_action/onclick/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/tail_stab,
		/datum/action/xeno_action/activable/fling/charger,
		/datum/action/xeno_action/activable/xeno_spit,
		/datum/action/xeno_action/activable/spray_acid,
		/datum/action/xeno_action/activable/corrosive_acid,
		/datum/action/xeno_action/onclick/tacmap,
		/datum/action/xeno_action/onclick/acid_shroud,
	)

	claw_type = CLAW_TYPE_VERY_SHARP

	icon_xeno = 'icons/mob/xenos/defiler.dmi'
	var/datum/effect_system/smoke_spread/xeno_acid/smoke

/mob/living/carbon/xenomorph/defiler/Initialize(mapload, mob/living/carbon/xenomorph/oldxeno, h_number)
	. = ..()
	smoke = new /datum/effect_system/smoke_spread/xeno_acid
	smoke.attach(src)
	smoke.cause_data = create_cause_data(initial(caste_type), src)
	AddComponent(/datum/component/footstep, 2, 25, 11, 2, "alien_footstep_medium")

/mob/living/carbon/xenomorph/defiler/bullet_act(obj/projectile/Proj)
	..()
	if(prob(25))
		visible_message(SPAN_WARNING("<font size=5>Bullets seem to <b>instantly melt</b> upon penetrating <b>Defiler's</b> chitin!</font>"))
