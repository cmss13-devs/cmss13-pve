/datum/ongoing_action/approach_target/carefully
	name = "Approach Target Carefully"

/datum/ongoing_action/approach_target/carefully/trigger_action()
	if(brain.current_target)
		return ONGOING_ACTION_COMPLETED
	. = ..()
