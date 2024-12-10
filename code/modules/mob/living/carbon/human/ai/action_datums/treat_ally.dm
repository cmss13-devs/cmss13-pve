/datum/ai_action/treat_ally
	name = "Treat Ally"
	action_flags = ACTION_USING_HANDS | ACTION_USING_LEGS

/datum/ai_action/treat_ally/get_weight(datum/human_ai_brain/brain)
	if(!brain.treat_allies)
		return 0

	if(!brain.found_injured_ally)
		return 0

	if(brain.healing_someone)
		return 0

	var/should_fire_offscreen = (brain.target_turf && !COOLDOWN_FINISHED(brain, fire_offscreen))
	if(brain.current_target || should_fire_offscreen)
		return 0

	if(length(brain.to_pickup))
		return 0

	if(!length(brain.equipment_map[HUMAN_AI_HEALTHITEMS]))
		return 0

	return 2

/datum/ai_action/treat_ally/Destroy(force, ...)
	brain.healing_someone = FALSE
	return ..()

/datum/ai_action/treat_ally/trigger_action()
	. = ..()

	if(brain.current_target)
		return ONGOING_ACTION_COMPLETED

	if(!brain.found_injured_ally)
		return ONGOING_ACTION_COMPLETED

	if(brain.healing_someone)
		return ONGOING_ACTION_UNFINISHED

	var/mob/tied_human = brain.tied_human
	if(get_dist(brain.found_injured_ally, tied_human) > 1)
		if(!brain.move_to_next_turf(get_turf(brain.found_injured_ally)))
			return ONGOING_ACTION_COMPLETED
		return ONGOING_ACTION_UNFINISHED

	if(brain.healing_start_check(brain.found_injured_ally))
		brain.start_healing(brain.found_injured_ally)
		return ONGOING_ACTION_UNFINISHED

	return ONGOING_ACTION_COMPLETED
