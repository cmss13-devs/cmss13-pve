/datum/ai_action/melee_atom
	name = "Melee Atom"
	var/atom/target

/datum/ai_action/melee_atom/New(datum/human_ai_brain/brain)
	. = ..()
	//target = arguments[2]

/datum/ai_action/melee_atom/Destroy(force, ...)
	target = null
	return ..()

/datum/ai_action/melee_atom/trigger_action()
	if(QDELETED(target) || brain.in_combat || !brain.primary_weapon) // Lower priority than getting shot at
		return ONGOING_ACTION_COMPLETED

	if(get_dist(target, brain.tied_human) > 1)
		if(!brain.move_to_next_turf(get_turf(target)))
			return ONGOING_ACTION_COMPLETED

	if(get_dist(target, brain.tied_human) > 1)
		return ONGOING_ACTION_UNFINISHED

	//if(brain.primary_melee)
	//	brain.unholster_melee()

	//X.do_click(src, "", list())

	brain.unholster_primary() // this should eventually have support for melee weapons
	brain.wield_primary()
	//brain.ensure_primary_hand(brain.primary_weapon)
	//brain.tied_human.do_click(target, "", list())

	return ONGOING_ACTION_COMPLETED
