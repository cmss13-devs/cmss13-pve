/datum/ongoing_action/retreat_from_target
	name = "Retreat From Target"
	var/atom/movable/target
	var/acceptable_distance
	var/do_target_dead

/datum/ongoing_action/retreat_from_target/New(datum/human_ai_brain/brain, list/arguments)
	. = ..()
	target = arguments[2]
	acceptable_distance = arguments[3]
	do_target_dead = length(arguments) < 4 ? TRUE : arguments[4]

/datum/ongoing_action/retreat_from_target/Destroy(force, ...)
	target = null
	return ..()

/datum/ongoing_action/retreat_from_target/trigger_action()
	if(QDELETED(target))
		return ONGOING_ACTION_COMPLETED

	if(ismob(target) && do_target_dead)
		var/mob/M = target
		if(M.is_dead())
			return ONGOING_ACTION_COMPLETED

	if(get_dist(target, brain.tied_human) < acceptable_distance)
		var/relative_dir = Get_Compass_Dir(target, brain.tied_human)
		var/moved = FALSE
		for(var/D in list(relative_dir, turn(relative_dir, 90), turn(relative_dir, -90)))
			if(brain.move_to_next_turf(get_step(get_turf(brain.tied_human), D)))
				moved = TRUE
				break

		if(!moved)
			return ONGOING_ACTION_COMPLETED

		if(get_dist(target, brain.tied_human) < acceptable_distance)
			return ONGOING_ACTION_UNFINISHED

	return ONGOING_ACTION_COMPLETED
