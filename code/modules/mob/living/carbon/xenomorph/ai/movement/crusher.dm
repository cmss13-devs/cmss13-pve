/datum/xeno_ai_movement/crusher

	/// The turf we force our crusher to walk to when he charges
	var/turf/charge_turf


#define AI_NEW_TARGET_COOLDOWN 1 SECONDS

/datum/xeno_ai_movement/crusher/New(mob/living/carbon/xenomorph/parent)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(get_new_target), parent), AI_NEW_TARGET_COOLDOWN, TIMER_UNIQUE|TIMER_LOOP|TIMER_DELETE_ME)

/datum/xeno_ai_movement/crusher/proc/get_new_target(mob/living/carbon/xenomorph/parent)
	parent.current_target = parent.get_target(parent.ai_range)

#undef AI_NEW_TARGET_COOLDOWN


#define MIN_TARGETS_TO_CHARGE 2
#define MIN_CHARGE_DISTANCE 4
#define FLOCK_SCAN_RADIUS 5
#define CHARGE_DEVIATION 1

/datum/xeno_ai_movement/crusher/ai_move_target(delta_time)
	var/mob/living/carbon/xenomorph/moving_xeno = parent
	if(moving_xeno.throwing)
		return

	var/ai_range = moving_xeno.ai_range
	var/target = moving_xeno.current_target

	/// If we are charging - override everything and just move straight towards charge_turf
	if(charge_turf)
		if(get_dist(target, moving_xeno) >= ai_range)
			toggle_charging(FALSE)
			return TRUE

		var/list/to_ram = list()
		for(var/turf/turfs in getline2(moving_xeno, charge_turf))
			to_ram += turfs.contents

		var/charging_dir = get_dir(moving_xeno, charge_turf)
		if(moving_xeno.move_to_next_turf(charge_turf, world.maxx, to_ram))
			if(charging_dir in cardinal)
				return TRUE

		var/turf/next_turf = get_step(moving_xeno, charging_dir)
		if(LinkBlocked(moving_xeno, get_turf(moving_xeno), next_turf))
			if(moving_xeno.Move(next_turf, 0))
				return TRUE

		toggle_charging(FALSE)
		return TRUE

	if(get_dist(moving_xeno, target) <= MIN_CHARGE_DISTANCE)
		return ..()

	var/humans_x = 0
	var/humans_y = 0
	var/humans_count = 0

	/// Now we getting medium coordinates from all humans standing around our target
	for(var/mob/living/carbon/human/humie in view(FLOCK_SCAN_RADIUS, target))
		if(humie.stat)
			continue

		humans_x += humie.x
		humans_y += humie.y
		humans_count++

	if(humans_count < MIN_TARGETS_TO_CHARGE)
		return ..()

	humans_x = Floor(humans_x / humans_count) + rand(-CHARGE_DEVIATION, CHARGE_DEVIATION)
	humans_y = Floor(humans_y / humans_count) + rand(-CHARGE_DEVIATION, CHARGE_DEVIATION)

	var/turf/middle = locate(humans_x, humans_y, moving_xeno.z)

	var/turf/WE_move_variant = locate(moving_xeno.x, middle.y, moving_xeno.z)
	var/turf/NS_move_variant = locate(middle.x, moving_xeno.y, moving_xeno.z)

	var/list/possible_blocked_turfs = list(WE_move_variant, NS_move_variant)
	var/list/non_blocked_turfs = list()

	/// Checking which one of two ways is non-blocked in distance of MIN_CHARGE_DISTANCE
	for(var/i=1 to LAZYLEN(possible_blocked_turfs))
		var/turf/next_turf = possible_blocked_turfs[i]
		var/blocked = FALSE

		for(var/I=0 to MIN_CHARGE_DISTANCE)
			var/turf/last_turf = next_turf
			next_turf = get_step(next_turf, get_dir(next_turf, middle))

			var/list/ignore = list()
			for(var/mob/living/carbon/xenomorph/xeno_blocker in next_turf)
				ignore += xeno_blocker

			if(LinkBlocked(moving_xeno, last_turf, next_turf, ignore))
				blocked = TRUE

		if(blocked)
			continue

		non_blocked_turfs += possible_blocked_turfs[i]

	var/length = LAZYLEN(non_blocked_turfs)
	if(!length)
		return ..()

	var/turf/to_move
	if(length == 1)
		to_move = non_blocked_turfs[1]

	if(!to_move)
		var/dist_check = get_dist(WE_move_variant, parent) > get_dist(NS_move_variant, parent)
		to_move = dist_check ? NS_move_variant : WE_move_variant

	if(!moving_xeno.move_to_next_turf(to_move))
		return ..()

	if(get_turf(moving_xeno) != to_move)
		return TRUE

	/// When we eventially get to our move_variant - get an edge_turf in middle direction and toggle charging
	var/step_dir = get_dir(to_move, middle)
	var/turf/edge_turf = get_step(moving_xeno, step_dir)

	for(var/i=1 to ai_range * 2)
		if(edge_turf.density)
			break
		edge_turf = get_step(edge_turf, step_dir)

	toggle_charging(TRUE)
	charge_turf = edge_turf

	return TRUE

#undef CHARGE_DEVIATION
#undef FLOCK_SCAN_RADIUS
#undef MIN_CHARGE_DISTANCE
#undef MIN_TARGETS_TO_CHARGE


/datum/xeno_ai_movement/crusher/proc/toggle_charging(toggle)
	var/datum/action/xeno_action/onclick/charger_charge/charge_action = get_xeno_action_by_type(parent, /datum/action/xeno_action/onclick/charger_charge)

	if(toggle && !charge_action.activated)
		INVOKE_ASYNC(charge_action, TYPE_PROC_REF(/datum/action/xeno_action/onclick/charger_charge, use_ability_wrapper))

	if(!toggle && charge_action.activated)
		INVOKE_ASYNC(charge_action, TYPE_PROC_REF(/datum/action/xeno_action/onclick/charger_charge, use_ability_wrapper))
		charge_turf = null

/mob/living/carbon/xenomorph/crusher/Move(NewLoc, direct)
	if(direct == 0)
		direct = last_move_dir

	return ..()
