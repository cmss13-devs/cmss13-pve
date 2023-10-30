
/datum/component/ai_behavior_override/kidnap
//	behavior_icon_state = "capture order"

/datum/component/ai_behavior_override/kidnap/Initialize(...)
	. = ..()

	if(!istype(parent, /mob) || isxeno(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/ai_behavior_override/kidnap/check_behavior_validity(mob/living/carbon/xenomorph/checked_xeno, distance)
	. = ..()

	var/stat = parent?:stat
	var/mob/pulledby = parent?:pulledby

	if(stat == DEAD)
		return OVERRIDE_BEHAVIOR_QDEL

	if(HAS_TRAIT(parent, TRAIT_NESTED))
		return OVERRIDE_BEHAVIOR_QDEL

	if(distance > 10)
		return FALSE

	if(stat == CONSCIOUS)
		return FALSE

	if(isxeno(pulledby) && pulledby != checked_xeno)
		return FALSE

	return TRUE

/datum/component/ai_behavior_override/kidnap/process_override_behavior(mob/living/carbon/xenomorph/processing_xeno, delta_time)
	. = ..()

	processing_xeno.current_target = parent
	processing_xeno.resting = FALSE

	if(processing_xeno.get_active_hand())
		processing_xeno.swap_hand()

	var/datum/xeno_ai_movement/AI = processing_xeno.ai_movement_handler
	if(processing_xeno.pulling == parent)
		AI.ai_move_hive(delta_time)
		return TRUE

	var/atom/movable/target = processing_xeno.current_target
	if(get_dist(processing_xeno, target) <= 1)
		INVOKE_ASYNC(processing_xeno, TYPE_PROC_REF(/mob, start_pulling), target)
		processing_xeno.face_atom(target)
		processing_xeno.swap_hand()

	processing_xeno.ai_move_target(delta_time)
	return TRUE

/*
This is where we do our target setting and such, instead of moving in here:.
If pulling our target should be the hive landmark so we just keep pulling all the way there
If in certain range of hive landmark and are pulling we try to find a wall to place the person

If we are not pulling we want to set target to the parent of this component so we walk towards the person
If distance <= 1 we start pulling

As a note you'll likely need to implement some sort of "target stat_check bypass" variable so we don't get our target cleaned up when he's unconscious

*/
