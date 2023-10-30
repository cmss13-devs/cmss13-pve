
/datum/component/ai_behavior_override/kidnap

/datum/component/ai_behavior_override/kidnap/Initialize(...)
	. = ..()

	if(!istype(parent, /mob))
		return COMPONENT_INCOMPATIBLE

/datum/component/ai_behavior_override/kidnap/check_behavior_validity(mob/living/carbon/xenomorph/checked_xeno, distance)
	. = ..()

	if(distance > 10) // Probably want checks like if(!target) and not already pulling someone and such
		return FALSE

	return TRUE

/datum/component/ai_behavior_override/kidnap/process_override_behavior(mob/living/carbon/xenomorph/processing_xeno, delta_time)
	. = ..()

/*
	if(get_active_hand())
		swap_hand()

	if(stat_check && GLOB.xeno_kidnapping)
		if(pulling)
			if(ai_move_hive(delta_time))
				return TRUE

		if(isxeno(current_target.pulledby) || HAS_TRAIT(current_target, TRAIT_NESTED))
			current_target = null
			ai_move_idle(delta_time)
			return TRUE

		if(get_dist(current_target, src) <= 1)
			INVOKE_ASYNC(src, PROC_REF(start_pulling), current_target)
			face_atom(current_target)
			swap_hand()

		ai_move_target(delta_time)
		return TRUE

	return FALSE
*/

/*
This is where we do our target setting and such, instead of moving in here:.
If pulling our target should be the hive landmark so we just keep pulling all the way there
If in certain range of hive landmark and are pulling we try to find a wall to place the person

If we are not pulling we want to set target to the parent of this component so we walk towards the person
If distance <= 1 we start pulling

As a note you'll likely need to implement some sort of "target stat_check bypass" variable so we don't get our target cleaned up when he's unconscious

*/
