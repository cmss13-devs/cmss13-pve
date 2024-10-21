/datum/ongoing_action/take_cover
	name = "Take Cover"
	var/turf/cover_turf

/datum/ongoing_action/take_cover/New(datum/human_ai_brain/brain, list/arguments)
	. = ..()
	cover_turf = arguments[2]
	brain.current_cover = cover_turf

/datum/ongoing_action/take_cover/Destroy(force, ...)
	cover_turf = null
	return ..()

/datum/ongoing_action/take_cover/trigger_action()
	if(!brain.current_cover)
		return ONGOING_ACTION_COMPLETED

	if(get_dist(cover_turf, brain.tied_human) > 0)
		if(!brain.move_to_next_turf(cover_turf))
			brain.end_cover()
			return ONGOING_ACTION_COMPLETED

		if(get_dist(cover_turf, brain.tied_human) > 0)
			return ONGOING_ACTION_UNFINISHED

	brain.in_cover = TRUE
	return ONGOING_ACTION_COMPLETED
