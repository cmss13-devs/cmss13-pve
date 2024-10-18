/datum/human_ai_squad
	/// Numeric ID of the squad
	var/id
	/// The AI humans in the squad
	var/list/ai_in_squad = list()
	/// Primary order assigned to this squad
	var/datum/ongoing_action/order/assigned_order
	/// Ref to the squad leader brain
	var/datum/human_ai_brain/squad_leader

/datum/human_ai_squad/New()
	. = ..()
	id = SShuman_ai.highest_squad_id

/datum/human_ai_squad/Destroy(force, ...)
	for(var/datum/human_ai_brain/brain as anything in ai_in_squad)
		remove_from_squad(brain)
	SShuman_ai.squads -= src
	squad_leader = null
	return ..()

/datum/human_ai_squad/proc/add_to_squad(datum/human_ai_brain/adding)
	if(adding.squad_id && (adding.squad_id in SShuman_ai.squad_id_dict))
		var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict[adding.squad_id]
		squad.remove_from_squad(adding)
	adding.squad_id = id
	ai_in_squad += adding

	adding.set_ongoing_order(assigned_order)
	RegisterSignal(adding.tied_human, COMSIG_MOB_DEATH, PROC_REF(on_squad_member_death))
	RegisterSignal(adding, COMSIG_PARENT_QDELETING, PROC_REF(on_squad_member_delete))

/datum/human_ai_squad/proc/remove_from_squad(datum/human_ai_brain/removing)
	if(removing == squad_leader)
		set_squad_leader(null)
	removing.ongoing_order = null
	removing.squad_id = null
	removing.is_squad_leader = FALSE
	ai_in_squad -= removing
	UnregisterSignal(removing?.tied_human, COMSIG_MOB_DEATH)
	UnregisterSignal(removing, COMSIG_PARENT_QDELETING)

/datum/human_ai_squad/proc/set_order(datum/ongoing_action/order)
	assigned_order = order
	RegisterSignal(order, COMSIG_PARENT_QDELETING, PROC_REF(on_order_delete))
	for(var/datum/human_ai_brain/brain as anything in ai_in_squad)
		brain.set_ongoing_order(order)

/datum/human_ai_squad/proc/set_squad_leader(datum/human_ai_brain/new_leader)
	if(squad_leader)
		squad_leader.is_squad_leader = FALSE
	squad_leader = new_leader
	if(squad_leader)
		new_leader.is_squad_leader = TRUE

/datum/human_ai_squad/proc/on_squad_member_death(mob/living/carbon/human/dead_mob)
	SIGNAL_HANDLER

	var/datum/human_ai_brain/brain = dead_mob.get_ai_brain()
	if(brain && (squad_leader == brain))
		set_squad_leader(null)

	for(var/datum/human_ai_brain/squaddie as anything in ai_in_squad)
		if(squaddie?.tied_human.client)
			continue

		if(squaddie.tied_human.is_mob_incapacitated())
			continue

		squaddie.on_squad_member_death(dead_mob)

/datum/human_ai_squad/proc/on_squad_member_delete(datum/human_ai_brain/deleting)
	SIGNAL_HANDLER

	remove_from_squad(deleting)

/datum/human_ai_squad/proc/on_order_delete(datum/source, force)
	SIGNAL_HANDLER

	for(var/datum/human_ai_brain/squaddie as anything in ai_in_squad)
		squaddie.clear_ongoing_order()

	assigned_order = null

/datum/human_ai_brain
	/// Numeric ID of the squad this AI is in, if any
	var/squad_id
	var/is_squad_leader = FALSE

/datum/human_ai_brain/proc/add_to_squad(new_id)
	if(isnull(new_id) || (new_id == squad_id))
		return

	if(!("[new_id]" in SShuman_ai.squad_id_dict))
		return

	var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict["[new_id]"]
	squad.add_to_squad(src)

/datum/human_ai_brain/proc/approach_squad_leader()
	if(is_squad_leader || !("[squad_id]" in SShuman_ai.squad_id_dict))
		return FALSE

	var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict["[squad_id]"]
	if(!squad.squad_leader?.tied_human)
		return FALSE

	if(get_dist(tied_human, squad.squad_leader.tied_human) > 2)
		if(!move_to_next_turf(squad.squad_leader.tied_human))
			return FALSE
		return FALSE
	return TRUE
