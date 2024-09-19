/datum/ongoing_action/approach_target
	name = "Approach Target"
	var/atom/movable/target
	var/acceptable_distance
	var/do_target_dead

/datum/ongoing_action/approach_target/New(datum/human_ai_brain/brain, list/arguments)
	. = ..()
	target = arguments[2]
	acceptable_distance = arguments[3]
	do_target_dead = length(arguments) < 4 ? TRUE : arguments[4]

/datum/ongoing_action/approach_target/Destroy(force, ...)
	target = null
	return ..()

/datum/ongoing_action/approach_target/trigger_action()
	if(QDELETED(target))
		return ONGOING_ACTION_COMPLETED

	if(ismob(target) && do_target_dead)
		var/mob/M = target
		if(M.is_dead())
			return ONGOING_ACTION_COMPLETED

	if(get_dist(target, brain.tied_human) > acceptable_distance)
		if(!brain.move_to_next_turf(get_turf(target)))
			return ONGOING_ACTION_COMPLETED

		if(get_dist(target, brain.tied_human) > acceptable_distance)
			return ONGOING_ACTION_UNFINISHED
	return ONGOING_ACTION_COMPLETED
