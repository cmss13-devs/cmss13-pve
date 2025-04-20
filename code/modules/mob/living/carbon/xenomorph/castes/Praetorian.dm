/datum/caste_datum/praetorian
	caste_type = XENO_CASTE_PRAETORIAN
	tier = 3

	melee_damage_lower = XENO_DAMAGE_TIER_5
	melee_damage_upper = XENO_DAMAGE_TIER_5
	melee_vehicle_damage = XENO_DAMAGE_TIER_7
	max_health = XENO_HEALTH_PRAE
	plasma_gain = XENO_PLASMA_GAIN_TIER_5
	plasma_max = XENO_PLASMA_TIER_8
	xeno_explosion_resistance = XENO_EXPLOSIVE_ARMOR_TIER_4
	armor_deflection = XENO_ARMOR_TIER_4
	evasion = XENO_EVASION_MEDIUM
	speed = XENO_SPEED_TIER_6

	evolution_allowed = FALSE
	deevolves_to = list(XENO_CASTE_WARRIOR, XENO_CASTE_SPITTER)
	caste_desc = "The warleader of the hive."
	spit_types = list(/datum/ammo/xeno/acid/praetorian)
	acid_level = 2

	aura_strength = 3
	spit_delay = 20

	tackle_min = 2
	tackle_max = 5
	tackle_chance = 45

	available_strains = list(
		/datum/xeno_strain/dancer,
		/datum/xeno_strain/oppressor,
		/datum/xeno_strain/vanguard,
		/datum/xeno_strain/warden,
	)
	behavior_delegate_type = /datum/behavior_delegate/praetorian_base

	minimum_evolve_time = 15 MINUTES

	minimap_icon = "praetorian"

	royal_caste = TRUE

/mob/living/carbon/xenomorph/praetorian
	caste_type = XENO_CASTE_PRAETORIAN
	name = XENO_CASTE_PRAETORIAN
	desc = "A huge, looming beast of an alien."
	icon_size = 64
	icon_state = "Praetorian Walking"
	plasma_types = list(PLASMA_PHEROMONE,PLASMA_NEUROTOXIN)
	pixel_x = -16
	old_x = -16
	mob_size = MOB_SIZE_BIG
	drag_delay = 6 //pulling a big dead xeno is hard
	tier = 3
	organ_value = 3000

	base_actions = list(
		/datum/action/xeno_action/onclick/xeno_resting,
		/datum/action/xeno_action/onclick/regurgitate,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/tail_stab,
		/datum/action/xeno_action/activable/corrosive_acid,
		/datum/action/xeno_action/activable/xeno_spit,
		/datum/action/xeno_action/activable/pounce/base_prae_dash,
		/datum/action/xeno_action/activable/prae_acid_ball,
		/datum/action/xeno_action/activable/spray_acid/base_prae_spray_acid,
		/datum/action/xeno_action/onclick/tacmap,
	)

	gib_chance = 20
	claw_type = CLAW_TYPE_VERY_SHARP
	pull_multiplier = 0.3 // Big bloody bug, pulls even quicker than a solider

	acid_blood_damage = 50 /// Strong acid blood. Should be a define in the future.
	acid_blood_spatter = TRUE /// Testing variable, means that their blood can melt objects in the environment. Primarily barricades.

	icon_xeno = 'icons/mob/xenos/praetorian.dmi'
	icon_xenonid = 'icons/mob/xenonids/praetorian.dmi'

	weed_food_icon = 'icons/mob/xenos/weeds_64x64.dmi'
	weed_food_states = list("Praetorian_1","Praetorian_2","Praetorian_3")
	weed_food_states_flipped = list("Praetorian_1","Praetorian_2","Praetorian_3")

/*
 * ==========================================================================|
 * 							BASE DEFINES AND PROCS
 * --------------------------------------------------------------------------|
 * ==========================================================================|
*/

/// The aggression the alien starts with by default.
#define AGGRESSION_MINIMUM 10 /// Big bug is always a little angry
/// The maximum aggression it is possible to accumulate.
#define AGGRESSION_MAXIMUM 100
/// Aggression required to go full-on lethals instead of capture.
#define AGGRESSION_ENABLE_LETHAL 50
/// If there is no hive to drag people to, this is the aggression the alien starts with.
#define AGGRESSION_NO_HIVE AGGRESSION_ENABLE_LETHAL
/// The cap on aggression increase when something significant happens, like taking damage.
#define AGGRESSION_INCREMENT_CAP 10

/// Threshold for lunging at a target. Low as the alien wants to do this early.
#define AGGRESSION_LUNGE 10
/// Threshold for throwing humans around.
#define AGGRESSION_FLING 35
/// Threshold for headbiting/instakilling a downed human.
#define AGGRESSION_HEADBITE 90

	/// AI behavior variables should probably go into their own datum. I thought about placing this into movement handler, but these govern general behavior.
	var/aggression_cur = AGGRESSION_MINIMUM ///How angry this alien is. Higher aggression means more lethal options are open.
	var/aggression_min = AGGRESSION_MINIMUM ///Aggression cannot fall below this value.

/mob/living/carbon/xenomorph/praetorian/Initialize()
	base_actions = list(
		/datum/action/xeno_action/onclick/xeno_resting,
		/datum/action/xeno_action/onclick/regurgitate,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/fling/praetorian,
		/datum/action/xeno_action/activable/lunge/praetorian,
		/datum/action/xeno_action/activable/headbite/praetorian,
		/datum/action/xeno_action/onclick/tacmap,
	)
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)

	. = ..()

	if(!length(GLOB.ai_hives)) ///We check for this first. If there is a hive, we want to make sure the aliens drag people there.
		aggression_cur = AGGRESSION_NO_HIVE ///If we do not have a hive, bump up aggression to go lethal instead.
		aggression_min = AGGRESSION_NO_HIVE

/mob/living/carbon/xenomorph/praetorian/apply_damage(damage = 0, damagetype = BRUTE, def_zone = null, used_weapon = null, sharp = 0, edge = 0, force = FALSE)
	. = ..() //It will take the previous arguments.

	if(.)
		/// Fire gives the largest aggression increase.
		aggression_cur = min(AGGRESSION_MAXIMUM, aggression_cur + min(AGGRESSION_INCREMENT_CAP, damage * (damagetype == BURN ? 0.25 : 0.17) ) ) /// Multiplying is faster than dividing. Go figure.

/*
 * ==========================================================================|
 * 						MOVEMENT LOOPS AND BEHAVIOR LOGIC
 * --------------------------------------------------------------------------|
 * ==========================================================================|
*/

/mob/living/carbon/xenomorph/praetorian/process_ai(delta_time)
	var/mob/living/pulling_target = pulling /// Let's see if the alien is pulling anyone.
	var/mob/living/potential_target = current_target

	if(istype(pulling_target)) /// Our praetorian is pulling someone.
		if(get_active_hand()) swap_hand() /// Swap hand to either tackle or harm.
		ai_active_intent = INTENT_DISARM /// If we are pulling someone and are not too aggressive, switch to disarm.
		if(prob(5)) emote("tail")

	else if(istype(potential_target)) /// We have a target. We'll do more thorough checking in the main loop, for now we only need to know if they are being pulled by a hostile or friendly xeno.
		var/mob/living/carbon/xenomorph/other_xenomorph = potential_target.pulledby /// Are they being pulled by an alien?
		/// Need to make sure the alien dragging is friendly to us. If it is not friendly, or not a xeno, our alien will try to grab back.
		ai_active_intent = (istype(other_xenomorph) && IS_SAME_HIVENUMBER(src, other_xenomorph)) ? INTENT_DISARM : INTENT_GRAB

	/// I had it set up for slightly faster assignment, but this is easier to read.
	ai_active_intent = (aggression_cur >= AGGRESSION_ENABLE_LETHAL) ? INTENT_HARM : ai_active_intent /// Override harm or continue with the previous intent.

	return ..()

/datum/xeno_ai_movement/assault
	do_climb_structures = TRUE /// The alien will climb structures, if able.

/mob/living/carbon/xenomorph/praetorian/init_movement_handler()
	return new /datum/xeno_ai_movement/assault(src)

/mob/living/carbon/xenomorph/praetorian/ai_move_idle(delta_time)
	if(!ai_movement_handler)
		CRASH("No valid movement handler for [src]!")

	var/mob/living/pulling_target = pulling
	return (istype(pulling_target) && length(GLOB.ai_hives)) ? ai_movement_handler.ai_move_hive(delta_time) : ai_movement_handler.ai_move_idle(delta_time)

/mob/living/carbon/xenomorph/praetorian/ai_move_target(delta_time)
	if(!ai_movement_handler)
		CRASH("No valid movement handler for [src]!")

	var/mob/living/pulling_target = pulling
	return (istype(pulling_target) && length(GLOB.ai_hives)) ? ai_movement_handler.ai_move_hive(delta_time) : ai_movement_handler.ai_move_target(delta_time)

/datum/xeno_ai_movement/assault/ai_move_target(delta_time)
	var/mob/living/carbon/xenomorph/praetorian/current_parent = parent

	/// Moving toward target grows aggression.
	current_parent.aggression_cur = min(AGGRESSION_MAXIMUM, current_parent.aggression_cur + 0.1) ///Fractions for a more gradual aggression gain/loss.
	return ..()

/datum/xeno_ai_movement/assault/ai_move_idle(delta_time)
	var/mob/living/carbon/xenomorph/praetorian/current_parent = parent

	/// Being idle drains aggression.
	current_parent.aggression_cur = max(current_parent.aggression_min, current_parent.aggression_cur - 0.1)
	return ..()

/datum/xeno_ai_movement/assault/ai_move_hive(delta_time)
	. = ..()

	/// This will mean if the alien is pulling someone to the hive, they will keep tackling them with their free claw.
	if(. && parent.pulling && DT_PROB(XENO_SLASH, delta_time)) INVOKE_ASYNC(parent, TYPE_PROC_REF(/mob, do_click), parent.pulling, "", list())

/datum/xeno_ai_movement/assault/ai_strap_host(turf/closest_hive, hive_radius, delta_time)
	/// Want to make sure when nesting, they actually have the grab active in their main claw.
	/// This can lead to some funny behavior of the alien standing around with the victim next to them, but it should be fine for the moment.
	/// Something to address later perhaps.
	if(parent.pulling && parent.get_active_hand()) parent.swap_hand()
	return ..()

/*
 * ==========================================================================|
 * 							SPECIAL ACTIONS
 * --------------------------------------------------------------------------|
 * ==========================================================================|
*/

/mob/living/carbon/xenomorph/praetorian/check_additional_ai_activation(activation_threshold)
	return (aggression_cur >= activation_threshold)

/datum/action/xeno_action/activable/fling/praetorian
	default_ai_action = TRUE
	ai_prob_chance = 70
	xeno_cooldown = 8 SECONDS

/datum/action/xeno_action/activable/fling/process_ai(mob/living/carbon/xenomorph/parent, delta_time)
	/// We have a home turf to fling to.
	if(parent.check_additional_ai_activation(AGGRESSION_FLING) && DT_PROB(ai_prob_chance, delta_time))
		parent.dir = parent.ai_movement_handler.home_turf ? get_dir(parent, parent.ai_movement_handler.home_turf) : pick(NORTH, SOUTH, EAST, WEST) /// Pick at random if there is no valid direction.
		use_ability_async(parent.current_target)

/datum/action/xeno_action/activable/lunge/praetorian
	default_ai_action = TRUE
	grab_range = 4
	ai_prob_chance = 90 // Want to do this often, as it's their way of saying hello.
	xeno_cooldown = 15 SECONDS

/datum/action/xeno_action/activable/lunge/process_ai(mob/living/carbon/xenomorph/parent, delta_time)
	/// Want to make sure no obstacles are in the way so that the alien is not lunging for no reason, or bonking into barricades like an idiot.
	/// Maybe in the future the actual lunge can be stripped down for the AI only?
	if( parent.check_additional_ai_activation(AGGRESSION_LUNGE) && DT_PROB(ai_prob_chance, delta_time) && get_dist(parent, parent.current_target) == grab_range )
		/// get_step_to() should return the turf nearest the target if successful, with no obstacles to block movement there with the lunge.
		var/turf/T = get_step_to(parent, parent.current_target)
		return T?.AdjacentQuick(parent.current_target.loc) && use_ability_async(parent.current_target)

/mob/living/carbon/xenomorph/praetorian/start_pulling(atom/movable/AM, lunge)
	if (!check_state() || agility || !isliving(AM)) return FALSE

	var/mob/living/L = AM
	var/should_neckgrab = !can_not_harm(L) && lunge

	if(!QDELETED(L) && !QDELETED(L.pulledby) && L != src ) //override pull of other mobs
		visible_message(SPAN_WARNING("[src] has broken [L.pulledby]'s grip on [L]!"), null, null, 5)
		L.pulledby.stop_pulling()

	. = ..(L, lunge, should_neckgrab)

	if(.)
		var/pain_to_cause = PAIN_XENO_DRAG /// Basic amount of pain caused with each grab.
		if(should_neckgrab && L.mob_size < MOB_SIZE_BIG)
			pain_to_cause += PAIN_XENO_GRAB /// Neck grabs cause even more pain.
			L.pulledby = src
			visible_message(SPAN_XENOWARNING("\The [src] grabs [L] by the throat!"), \
			SPAN_XENOWARNING("You grab [L] by the throat!"))

		L.pain.apply_pain(pain_to_cause)
		grab_level = GRAB_XENO /// Alien-specific grab level, with its own logic for escaping. AI only for the moment. See /mob/living/resist_grab()
		if(prob(10)) emote("growl")
		///	The actual pain processing for humans is handled in: /mob/living/carbon/proc/handle_grabbed() Other mobs don't process the effects of the grab, like other xenomorphs.

/mob/living/carbon/xenomorph/praetorian/stop_pulling(bumped_movement = FALSE)
	//Let's see if we can ignore this. If our direction is the same as where the mob went, we likely bumped into them. So we lasso them back.
	if(bumped_movement && grab_level == GRAB_XENO && get_dir(src, pulling) == dir) /// Only on xeno grabs, so if they are on GRAB_PASSIVE, this doesn't trigger.
		pulling.loc = get_step_towards(src, pulling) // GET OVER HERE!
	else return ..()

/datum/action/xeno_action/activable/headbite/praetorian
	default_ai_action = TRUE
	ai_prob_chance = 98 // Absolutely DEAD if the alien is angry enough.
	xeno_cooldown = 30 SECONDS // Don't want to chain these, as unlikely as that could be.

/datum/action/xeno_action/activable/headbite/praetorian/process_ai(mob/living/carbon/xenomorph/parent, delta_time)
	return parent.check_additional_ai_activation(AGGRESSION_HEADBITE) && DT_PROB(ai_prob_chance, delta_time) && use_ability_async(parent.current_target)

#undef AGGRESSION_MINIMUM
#undef AGGRESSION_MAXIMUM
#undef AGGRESSION_INCREMENT_CAP
#undef AGGRESSION_ENABLE_LETHAL
#undef AGGRESSION_NO_HIVE

#undef AGGRESSION_LUNGE
#undef AGGRESSION_FLING
#undef AGGRESSION_HEADBITE

/datum/behavior_delegate/praetorian_base
	name = "Base Praetorian Behavior Delegate"
	///reward for hitting shots instead of spamming acid ball
	var/reward_shield = 15

/datum/behavior_delegate/praetorian_base/ranged_attack_additional_effects_target(atom/A)
	if (!ishuman(A))
		return

	var/mob/living/carbon/human/H = A

	var/datum/effects/prae_acid_stacks/PAS = null
	for (var/datum/effects/prae_acid_stacks/prae_acid_stacks in H.effects_list)
		PAS = prae_acid_stacks
		break

	if (PAS == null)
		new /datum/effects/prae_acid_stacks(H)
		return
	else
		PAS.increment_stack_count()
		return

/datum/behavior_delegate/praetorian_base/ranged_attack_additional_effects_self(atom/A)
	if(!ismob(A))
		return
	bound_xeno.add_xeno_shield(reward_shield, XENO_SHIELD_SOURCE_BASE_PRAE, add_shield_on = TRUE, max_shield = 45)
	to_chat(bound_xeno, SPAN_NOTICE("Your exoskeleton shimmers for a fraction of a second as the acid coats your target."))
	return
