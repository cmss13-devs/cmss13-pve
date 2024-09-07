/datum/ongoing_action/take_inside_cover
	name = "Take Cover (Inside)"
	var/turf/target_turf

/datum/ongoing_action/take_inside_cover/New(datum/human_ai_brain/brain, list/arguments)
	. = ..()
	target_turf = arguments[2]

/datum/ongoing_action/take_inside_cover/Destroy(force, ...)
	target_turf = null
	return ..()

/datum/ongoing_action/take_inside_cover/trigger_action()
	if(!isturf(target_turf))
		return ONGOING_ACTION_COMPLETED

	if(get_dist(target_turf, brain.tied_human) > 0)
		if(!brain.move_to_next_turf(target_turf))
			return ONGOING_ACTION_COMPLETED

		if(get_dist(target_turf, brain.tied_human) > 0)
			return ONGOING_ACTION_UNFINISHED

	brain.in_cover = TRUE
	brain.hard_cover = TRUE
	brain.RegisterSignal(brain.tied_human, COMSIG_HUMAN_BULLET_ACT, TYPE_PROC_REF(/datum/human_ai_brain, on_shot_inside_cover))
	return ONGOING_ACTION_COMPLETED
