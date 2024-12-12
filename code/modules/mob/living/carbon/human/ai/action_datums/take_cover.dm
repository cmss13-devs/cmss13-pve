/datum/ai_action/take_cover
	name = "Take Cover"
	action_flags = ACTION_USING_LEGS

/datum/ai_action/take_cover/get_weight(datum/human_ai_brain/brain)
	if(!brain.current_cover)
		return 0

	if(brain.in_cover)
		return 0

	return 15

/datum/ai_action/take_cover/trigger_action()
	. = ..()

	var/turf/current_cover = brain.current_cover
	if(!brain.current_cover)
		return ONGOING_ACTION_COMPLETED

	var/mob/living/carbon/human/tied_human = brain.tied_human
	if(get_dist(current_cover, tied_human) > 0)
		if(!brain.move_to_next_turf(current_cover))
			brain.end_cover()
			return ONGOING_ACTION_COMPLETED

		if(get_dist(current_cover, tied_human) > 0)
			return ONGOING_ACTION_UNFINISHED

	brain.in_cover = TRUE
	return ONGOING_ACTION_COMPLETED
