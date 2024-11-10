/datum/ai_action/throw_grenade
	name = "Throw Grenade"
	action_flags = ACTION_USING_HANDS
	var/obj/item/explosive/grenade/throwing
	var/mid_throw

/datum/ai_action/throw_grenade/get_weight(datum/human_ai_brain/brain)
	if(!brain.in_combat)
		return 0

	var/turf/target_turf = brain.target_turf
	if(!target_turf)
		return 0

	if(!length(brain.equipment_map[HUMAN_AI_GRENADES]))
		return 0

	if(!brain.primary_weapon)
		return 10

	if(locate(/turf/closed) in get_line(brain.tied_human, target_turf))
		return 10

	return 0

/datum/ai_action/throw_grenade/get_conflicts(datum/human_ai_brain/brain)
	. = ..()
	. += /datum/ai_action/chase_target
	. += /datum/ai_action/sniper_nest

/datum/ai_action/throw_grenade/Added()
	throwing = locate() in brain.equipment_map[HUMAN_AI_GRENADES]

/datum/ai_action/throw_grenade/Destroy(force, ...)
	throwing = null
	return ..()

/datum/ai_action/throw_grenade/trigger_action()
	. = ..()

	var/turf/target_turf = brain.target_turf
	if(QDELETED(throwing) || !target_turf)
		return ONGOING_ACTION_COMPLETED

	if(mid_throw)
		return ONGOING_ACTION_UNFINISHED

	var/mob/living/carbon/human/tied_human = brain.tied_human
	if(brain.primary_weapon)
		brain.primary_weapon.unwield(tied_human)
		if(tied_human.get_active_hand() == brain.primary_weapon)
			tied_human.swap_hand()

	mid_throw = TRUE
	brain.equip_item_from_equipment_map(HUMAN_AI_GRENADES, throwing)

	if(QDELETED(throwing) || (throwing.loc != tied_human))
		return ONGOING_ACTION_COMPLETED

	var/turf/throw_target
	for(var/turf/turf in shuffle(RANGE_TURFS(2, target_turf)))
		var/distance = get_dist(tied_human, turf)
		if(distance <= 2) // basic precautions
			continue

		if(distance > brain.view_distance)
			continue

		if(locate(/turf/closed) in get_line(tied_human, turf))
			continue

		throw_target = turf
		break

	if(!throw_target)
		return ONGOING_ACTION_COMPLETED

	tied_human.face_atom(throw_target)
	INVOKE_ASYNC(throwing, TYPE_PROC_REF(/obj/item, ai_use), tied_human, brain, throw_target)
	return ONGOING_ACTION_UNFINISHED
