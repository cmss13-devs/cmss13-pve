/datum/ongoing_action/throw_grenade
	name = "Throw Grenade"
	var/obj/item/explosive/grenade/throwing
	var/turf/target_turf
	var/mid_throw = FALSE

/datum/ongoing_action/throw_grenade/New(datum/human_ai_brain/brain, list/arguments)
	. = ..()
	throwing = arguments[2]
	target_turf = arguments[3]

/datum/ongoing_action/throw_grenade/Destroy(force, ...)
	throwing = null
	target_turf = null
	return ..()

/datum/ongoing_action/throw_grenade/trigger_action()
	if(QDELETED(throwing) || !target_turf)
		return ONGOING_ACTION_COMPLETED

	if(mid_throw)
		return ONGOING_ACTION_UNFINISHED_BLOCK

	mid_throw = TRUE
	brain.holster_primary()
	brain.equip_item_from_equipment_map(HUMAN_AI_GRENADES, throwing)
	sleep(brain.short_action_delay * brain.action_delay_mult)
	if(QDELETED(throwing) || (throwing.loc != brain.tied_human))
		return ONGOING_ACTION_COMPLETED
	throwing.ai_use(brain.tied_human, brain, target_turf)
	return ONGOING_ACTION_COMPLETED
