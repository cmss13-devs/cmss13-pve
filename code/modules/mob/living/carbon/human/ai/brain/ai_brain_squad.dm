/datum/human_ai_squad
	/// Numeric ID of the squad
	var/id
	/// The AI humans in the squad
	var/list/ai_in_squad = list()
	/// List of orders assigned to this squad
	var/list/assigned_orders = list()

/datum/human_ai_squad/New()
	. = ..()
	SShuman_ai.squads += src
	SShuman_ai.highest_squad_id++
	id = SShuman_ai.highest_squad_id

/datum/human_ai_squad/Destroy(force, ...)
	SShuman_ai.squads -= src
	return ..()

/datum/human_ai_squad/proc/add_to_squad(datum/human_ai_brain/adding)
	if(adding.squad_id && (adding.squad_id in SShuman_ai.squad_id_dict))
		var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict[adding.squad_id]
		squad.remove_from_squad(adding)
	adding.squad_id = id
	ai_in_squad += adding

	for(var/datum/ongoing_action/order as anything in assigned_orders)
		adding.add_ongoing_order(order)

/datum/human_ai_squad/proc/remove_from_squad(datum/human_ai_brain/removing)
	for(var/datum/ongoing_action/order as anything in assigned_orders)
		removing.ongoing_orders -= order
	removing.squad_id = null
	ai_in_squad -= removing

/datum/human_ai_squad/proc/add_order(datum/ongoing_action/order)
	for(var/datum/human_ai_brain/brain as anything in ai_in_squad)
		brain.add_ongoing_order(order)

/datum/human_ai_squad/proc/tgui_data()
	var/list/order_name_list = list()
	for(var/datum/ongoing_action/order/order as anything in assigned_orders)
		order_name_list += order.name
	return list(
		"id" = id,
		"orders" = order_name_list,
	)

/datum/human_ai_brain
	/// Numeric ID of the squad this AI is in, if any
	var/squad_id

/datum/human_ai_brain/proc/add_to_squad(new_id)
	if(isnull(new_id))
		return

	if(!("[new_id]" in SShuman_ai.squad_id_dict))
		return

	var/datum/human_ai_squad/squad = SShuman_ai.squad_id_dict[new_id]
	squad.add_to_squad(src)
