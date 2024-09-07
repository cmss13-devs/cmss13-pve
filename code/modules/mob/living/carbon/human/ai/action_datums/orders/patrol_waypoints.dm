/datum/ongoing_action/order/patrol_waypoints
	name = "Patrol Waypoints"
	var/list/waypoints = list()
	var/time_at_waypoint = 10 SECONDS
	var/current_waypoint_index = 1
	var/turf/current_waypoint_target
	var/waiting = FALSE
	var/desc = ""

/datum/ongoing_action/order/patrol_waypoints/New(list/arguments)
	. = ..()
	waypoints = arguments[2]
	time_at_waypoint = (length(arguments) >= 3 ? arguments[3] : 10 SECONDS)
	current_waypoint_target = waypoints[current_waypoint_index]

/datum/ongoing_action/order/patrol_waypoints/Destroy(force, ...)
	current_waypoint_target = null
	return ..()

/datum/ongoing_action/order/patrol_waypoints/trigger_action(datum)
	if(waiting || QDELETED(current_waypoint_target) || !isturf(current_waypoint_target))
		return ONGOING_ACTION_COMPLETED

	if(get_dist(current_waypoint_target, brain.tied_human) > 1)
		if(!brain.move_to_next_turf(current_waypoint_target))
			return ONGOING_ACTION_COMPLETED

		if(get_dist(current_waypoint_target, brain.tied_human) > 1)
			return ONGOING_ACTION_UNFINISHED
	waiting = TRUE
	addtimer(CALLBACK(src, PROC_REF(set_next_waypoint)), time_at_waypoint)
	return ONGOING_ACTION_COMPLETED

/datum/ongoing_action/order/patrol_waypoints/proc/set_next_waypoint()
	if(current_waypoint_index >= length(waypoints))
		current_waypoint_index = 1
	else
		current_waypoint_index++
	current_waypoint_target = waypoints[current_waypoint_index]
	waiting = FALSE

/datum/ongoing_action/order/patrol_waypoints/tgui_data()
	return list(
		list(
			"waypoint_amount",
			"waiting",
			"desc",
		),
		list(
			length(waypoints),
			waiting,
			desc,
		)
	)

/datum/admins/proc/create_human_ai_patrol()
	set name = "Create Human AI Patrol Waypoints"
	set category = "Debug.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	var/list/turf/waypoint_list = list()
	while(TRUE)
		if(tgui_input_list(usr, "Press Enter to save the turf you are on to the patrol datum. Press Cancel to finalize.", "Save Turf", list("Enter", "Cancel")) == "Enter")
			waypoint_list += get_turf(usr)
			continue
		break

	if(length(waypoint_list) <= 0)
		return

	var/datum/ongoing_action/order/patrol_waypoints/patrol = new(list(null, waypoint_list, 10 SECONDS))
	patrol.desc = tgui_input_text(usr, "Input a description of the patrol.", "Description")
	SShuman_ai.existing_orders += patrol
	to_chat(usr, SPAN_NOTICE("Patrol order has been created."))
