/// 3 x 3 damage centred on the xenomorph
/datum/action/xeno_action/onclick/rend
	name = "Rend"
	action_icon_state = "rav_eviscerate"
	ability_name = "rend"
	macro_path = /datum/action_xeno_action/verb/verb_rend
	xeno_cooldown = 2.5 SECONDS
	plasma_cost = 25
	ability_primacy = XENO_PRIMARY_ACTION_1

	var/damage = 25
	var/list/humans_near = list()

	default_ai_action = TRUE
	ai_prob_chance = 100

	var/slash_sounds = list('sound/weapons/alien_claw_flesh1.ogg', 'sound/weapons/alien_claw_flesh2.ogg', 'sound/weapons/alien_claw_flesh3.ogg', 'sound/weapons/alien_claw_flesh4.ogg', 'sound/weapons/alien_claw_flesh5.ogg', 'sound/weapons/alien_claw_flesh6.ogg')

/datum/action/xeno_action/onclick/rend/process_ai(mob/living/carbon/xenomorph/X, delta_time)
	for(var/mob/living/carbon/human/inrange in view(X))
		var/distance_check = get_dist(X, inrange)

		if(distance_check < 3)
			humans_near |= inrange
			continue

		if(!DT_PROB(ai_prob_chance, delta_time) || length(humans_near) < 2 || get_dist(X, X.current_target) < 3 || X.action_busy)
			humans_near.RemoveAll()
			return

		use_ability_async()
		humans_near.RemoveAll()


/// Screech which puts out lights in a 7 tile radius, slows and dazes.
/datum/action/xeno_action/onclick/doom
	name = "Doom"
	action_icon_state = "screech"
	ability_name = "doom"
	macro_path = /datum/action_xeno_action/verb/verb_doom
	xeno_cooldown = 45 SECONDS
	plasma_cost = 50
	ability_primacy = XENO_PRIMARY_ACTION_2

	var/daze_length_seconds = 1
	var/slow_length_seconds = 4
	var/list/humans_near = list()

	default_ai_action = TRUE
	ai_prob_chance = 80

/datum/action/xeno_action/onclick/doom/process_ai(mob/living/carbon/xenomorph/X, delta_time)
	for(var/mob/living/carbon/human/inrange in view(X))
		var/distance_check = get_dist(X, inrange)

		if(distance_check < 5)
			humans_near |= inrange
			continue

		if(!DT_PROB(ai_prob_chance, delta_time) || length(humans_near) < 3 || get_dist(X, X.current_target) > 3 || X.action_busy)
			humans_near.RemoveAll()
			return

		use_ability_async()
		humans_near.RemoveAll()

/// Leap ability, crashing down dealing major damage to mobs and structures in the area.
/datum/action/xeno_action/onclick/destroy
	name = "Destroy"
	action_icon_state = "charge"
	ability_name = "destroy"
	macro_path = /datum/action/xeno_action/verb/verb_destroy
	action_type = XENO_ACTION_ACTIVATE
	xeno_cooldown = 15 SECONDS
	plasma_cost = 0
	ability_primacy = XENO_PRIMARY_ACTION_3

	var/range = 7
	var/leaping = FALSE

	default_ai_action = TRUE
	ai_prob_chance = 60

/datum/action/xeno_action/onclick/destroy/process_ai(mob/living/carbon/xenomorph/X, delta_time)
	var/distance_check = get_dist(X, X.current_target)

	if(distance_check > 7)
		return

	if(!DT_PROB(ai_prob_chance, delta_time) || get_dist(X, X.current_target) < 2 || X.action_busy)
		return

	use_ability_async()

/// Shield ability, limits the amount of damage from a single instance of damage to 10% of the xenomorph's max health.
/datum/action/xeno_action/onclick/king_shield
	name = "Bulwark of the Hive"
	action_icon_state = "soak"
	ability_name = "legion_shield"
	macro_path = /datum/action_xeno_action/verb/king_shield
	action_type = XENO_ACTION_ACTIVATE
	xeno_cooldown = 60 SECONDS
	plasma_cost = 0
	ability_primacy = XENO_PRIMARY_ACTION_4

	default_ai_action = TRUE
	ai_prob_chance = 80

	var/shield_duration = 10 SECONDS
	var/area_of_effect = 6
	var/shield_amount = 100
	var/list/xenos_near = list()

/datum/action/xeno_action/onclick/king_shield/process_ai(mob/living/carbon/xenomorph/X, delta_time)
	for(var/mob/living/carbon/xenomorph/inrange in view(X))
		var/distance_check = get_dist(X, inrange)

		if(distance_check < 5)
			xenos_near |= inrange
			continue

		if(!DT_PROB(ai_prob_chance, delta_time) || length(xenos_near) < 4 || X.action_busy)
			xenos_near.RemoveAll()
			return

		use_ability_async()
		xenos_near.RemoveAll()

/datum/action/xeno_action/onclick/king_frenzy
	name = "King_frenzy"
	action_icon_state = "charge_spit"
	ability_name = "King Frenzy"
	macro_path = /datum/action/xeno_action/verb/verb_charge_spit
	ability_primacy = XENO_PRIMARY_ACTION_5
	action_type = XENO_ACTION_ACTIVATE
	plasma_cost = 50
	xeno_cooldown = 6 SECONDS

	// Config
	var/duration = 40
	var/speed_buff_amount = 1.2 // Go from shit slow to kindafast

	var/buffs_active = FALSE

	default_ai_action = TRUE
	ai_prob_chance = 80

/datum/action/xeno_action/onclick/king_frenzy/process_ai(mob/living/carbon/xenomorph/X, delta_time)

	if(!DT_PROB(ai_prob_chance, delta_time) || get_dist(X, X.current_target) < 2 || X.action_busy)
		return

	use_ability_async()
