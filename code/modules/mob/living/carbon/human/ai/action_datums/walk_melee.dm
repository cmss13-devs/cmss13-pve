/datum/ai_action/walk_melee
	name = "Walk Melee"
	action_flags = ACTION_USING_LEGS

/datum/ai_action/walk_melee/get_weight(datum/human_ai_brain/brain)
	if(!brain.current_target)
		return 0

	if(brain.hold_position)
		return 0

	if(brain.sniper_home)
		return 0

	if(!brain.tried_reload && (brain.primary_weapon || length(brain.secondary_weapons)))
		return 0

	return 3

/datum/ai_action/walk_melee/trigger_action()
	. = ..()

	if(!brain.current_target)
		return ONGOING_ACTION_COMPLETED

	if(brain.active_grenade_found)
		return ONGOING_ACTION_COMPLETED

	if(brain.current_cover && !brain.in_cover)
		return ONGOING_ACTION_COMPLETED

	if(!brain.tried_reload && (brain.primary_weapon || length(brain.secondary_weapons)))
		return ONGOING_ACTION_COMPLETED

	var/mob/tied_human = brain.tied_human
	if(get_dist(tied_human, brain.current_target) <= 1)
		tied_human.a_intent_change(INTENT_HARM)
		brain.unholster_any_weapon()
		INVOKE_ASYNC(tied_human, TYPE_PROC_REF(/mob, do_click), brain.current_target, "", list())
		tied_human.face_atom(brain.current_target)

	if(!brain.move_to_next_turf(get_turf(brain.current_target)))
		return ONGOING_ACTION_COMPLETED

	return ONGOING_ACTION_COMPLETED
