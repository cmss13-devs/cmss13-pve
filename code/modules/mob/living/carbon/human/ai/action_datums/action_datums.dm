/datum/ongoing_action
	var/name
	var/datum/human_ai_brain/brain
	var/order = FALSE
	var/should_display = TRUE

/datum/ongoing_action/New(datum/human_ai_brain/brain, list/arguments)
	. = ..()
	src.brain = brain

/datum/ongoing_action/Destroy(force, ...)
	brain = null
	return ..()

/datum/ongoing_action/proc/trigger_action()
	return

/datum/ongoing_action/proc/tgui_data()
	return list()
