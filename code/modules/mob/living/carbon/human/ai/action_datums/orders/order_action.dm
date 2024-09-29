/datum/ongoing_action/order
	order = TRUE
	var/can_perform_in_combat = FALSE

/datum/ongoing_action/order/New(list/arguments)
	return

/datum/ongoing_action/order/Destroy(force, ...)
	SShuman_ai.existing_orders -= src
	return ..()
