/datum/ongoing_action/throw_back_nade
	name = "Throw Back Grenade"
	var/obj/item/explosive/grenade/throwing
	var/turf/target_turf

/datum/ongoing_action/throw_back_nade/New(datum/human_ai_brain/brain, list/arguments)
	. = ..()
	throwing = arguments[2]
	target_turf = arguments[3]

/datum/ongoing_action/throw_back_nade/Destroy(force, ...)
	throwing = null
	target_turf = null
	return ..()

/datum/ongoing_action/throw_back_nade/trigger_action()
	if(QDELETED(throwing) || !isturf(throwing.loc))
		return ONGOING_ACTION_COMPLETED

	if(get_dist(throwing, brain.tied_human) > 1)
		if(!brain.move_to_next_turf(get_turf(throwing)))
			return ONGOING_ACTION_COMPLETED

		if(get_dist(throwing, brain.tied_human) > 1)
			return ONGOING_ACTION_UNFINISHED
	brain.end_gun_fire()
	brain.clear_main_hand()
	brain.tied_human.put_in_active_hand(throwing)
	if(target_turf)
		brain.tied_human.toggle_throw_mode(THROW_MODE_NORMAL)
		brain.tied_human.throw_item(target_turf)
	return ONGOING_ACTION_COMPLETED
