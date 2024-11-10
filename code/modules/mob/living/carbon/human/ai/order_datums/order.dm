/datum/ai_order
	var/name = "You shouldn't see this"
	var/desc = ""
	var/list/datum/human_ai_brain/brains = list()
	var/should_display = TRUE

/datum/ai_order/New(list/arguments)
	. = ..()
	SShuman_ai.existing_orders += src

/datum/ai_order/Destroy(force, ...)
	SShuman_ai.existing_orders -= src
	return ..()

/datum/ai_order/proc/tgui_data()
	return list()
