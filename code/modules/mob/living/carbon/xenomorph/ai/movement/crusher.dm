#define CRUSHER_MOMENTUM_MOBILITY 3
#define CRUSHER_CHARGE_DISTANCE 10
#define CROOSH_MODE_TIME 16 SECONDS
#define CROOSH_MODE_CD 4 SECONDS

/datum/xeno_ai_movement/crusher
	var/datum/action/xeno_action/onclick/charger_charge/charge_action
	var/croosh_mode = FALSE

	COOLDOWN_DECLARE(croosh_mode_cooldown)
	COOLDOWN_DECLARE(croosh_mode_timer)

/datum/xeno_ai_movement/crusher/New(mob/living/carbon/xenomorph/parent)
	. = ..()
	charge_action = get_xeno_action_by_type(parent, /datum/action/xeno_action/onclick/charger_charge)

/datum/xeno_ai_movement/crusher/ai_move_target(delta_time)
	var/mob/living/carbon/xenomorph/moving_xeno = parent
	if(moving_xeno.throwing)
		return

	check_ai_mode()

	if(HAS_TRAIT(moving_xeno, TRAIT_CHARGING))
		var/turf/current_loc = moving_xeno.loc
		var/mob/target = moving_xeno.current_target
		var/moving_dir = moving_xeno.dir

		if(!(get_dir(target, moving_xeno) in reverse_nearby_direction(moving_dir) + NONE))
			if(charge_action.momentum <= CRUSHER_MOMENTUM_MOBILITY)
				charge_action.stop_momentum()
				return ..()

			charge_action.lose_momentum(1.5)

		var/turf/charge_turf = current_loc
		var/list/to_ram = list()

		for(var/i=0, i<=CRUSHER_CHARGE_DISTANCE, i++)
			var/turf/T = get_step(charge_turf, moving_dir)
			for(var/atom/A in T)
				to_ram += A

			if(LinkBlocked(moving_xeno, moving_xeno.loc, T, list(target, moving_xeno) + to_ram))
				break

			charge_turf = T

		if(!moving_xeno.move_to_next_turf(charge_turf, ignore = to_ram))
			return ..()

		var/turf/next_turf = get_step(moving_xeno.loc, moving_dir)

		if(next_turf.density)
			if(!moving_xeno.Move(next_turf, moving_dir))
				charge_action.stop_momentum()

		return

	return ..()

/datum/xeno_ai_movement/crusher/proc/check_ai_mode()
	var/mob/living/carbon/xenomorph/croosher = parent

	if(COOLDOWN_FINISHED(src, croosh_mode_cooldown) && !croosh_mode)
		INVOKE_ASYNC(charge_action, TYPE_PROC_REF(/datum/action/xeno_action/onclick/charger_charge, use_ability_wrapper))
		COOLDOWN_START(src, croosh_mode_timer, CROOSH_MODE_TIME)
		croosher.emote("roar")
		croosh_mode = TRUE

	if(COOLDOWN_FINISHED(src, croosh_mode_timer) && croosh_mode && !HAS_TRAIT(croosher, TRAIT_CHARGING))
		INVOKE_ASYNC(charge_action, TYPE_PROC_REF(/datum/action/xeno_action/onclick/charger_charge, use_ability_wrapper))
		COOLDOWN_START(src, croosh_mode_cooldown, CROOSH_MODE_CD)
		croosher.emote("growl")
		croosh_mode = FALSE

#undef CROOSH_MODE_CD
#undef CROOSH_MODE_TIME
#undef CRUSHER_CHARGE_DISTANCE
#undef CRUSHER_MOMENTUM_MOBILITY

/mob/living/carbon/xenomorph/crusher/Move(NewLoc, direct)
	if(direct == 0)
		direct = last_move_dir

	return ..()
