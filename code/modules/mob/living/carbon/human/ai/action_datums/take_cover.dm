/datum/ongoing_action/take_cover
	name = "Take Cover"
	var/turf/target_turf
	var/atom/cover_atom
	var/hard_cover

/datum/ongoing_action/take_cover/New(datum/human_ai_brain/brain, list/arguments)
	. = ..()
	target_turf = arguments[2]
	cover_atom = arguments[3]
	hard_cover = arguments[4]

/datum/ongoing_action/take_cover/Destroy(force, ...)
	target_turf = null
	cover_atom = null
	return ..()

/datum/ongoing_action/take_cover/trigger_action()
	if(!isturf(target_turf))
		return ONGOING_ACTION_COMPLETED

	if(get_dist(target_turf, brain.tied_human) > 0)
		if(!brain.move_to_next_turf(target_turf))
			return ONGOING_ACTION_COMPLETED

		if(get_dist(target_turf, brain.tied_human) > 0)
			return ONGOING_ACTION_UNFINISHED

	brain.in_cover = TRUE
	brain.hard_cover = hard_cover
	brain.RegisterSignal(cover_atom, COMSIG_PARENT_QDELETING, TYPE_PROC_REF(/datum/human_ai_brain, on_cover_destroyed))
	return ONGOING_ACTION_COMPLETED
