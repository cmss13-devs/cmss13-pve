/datum/ai_order/patrol
	name = "Patrol Waypoints"
	var/turf/current_waypoint
	var/list/waypoints = list()

	var/time_at_waypoint = 10 SECONDS
	var/current_waypoint_index = 1

	var/increment = 1
	var/waiting = FALSE

/datum/ai_order/patrol/New(list/arguments)
	. = ..()
	waypoints = arguments[1]
	current_waypoint = waypoints[1]

	time_at_waypoint = length(arguments) > 1 ? arguments[2] : 10 SECONDS

/datum/ai_order/patrol/tgui_data()
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

/datum/ai_order/patrol/proc/set_next_waypoint()
	var/patrol_length = length(waypoints)
	if(patrol_length == 1)
		increment = 0
	else if(current_waypoint_index <= 1)
		increment = 1
	else if(current_waypoint_index >= patrol_length)
		increment = -1
	current_waypoint_index += increment
	current_waypoint = waypoints[current_waypoint_index]
	waiting = FALSE

/datum/admins/proc/create_human_ai_patrol()
	set name = "Create Human AI Patrol Waypoints"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	var/list/turf/waypoint_list = list()
	while(TRUE)
		if(tgui_input_list(usr, "Press Enter to save the turf you are on to the patrol datum. Press Cancel to finalize.", "Save Turf", list("Enter", "Cancel")) == "Enter")
			var/turf/user_turf = get_turf(usr)
			var/dist = length(waypoint_list) ? get_dist(waypoint_list[length(waypoint_list)], user_turf) : 0
			if(length(waypoint_list) && (dist > HUMAN_AI_MAX_PATHFINDING_RANGE))
				to_chat(usr, SPAN_WARNING("This waypoint is too far from the previous one. Maximum distance is [HUMAN_AI_MAX_PATHFINDING_RANGE] while this node's was [dist]."))
				continue
			waypoint_list += user_turf
			continue
		break

	if(length(waypoint_list) <= 0)
		return

	var/description = tgui_input_text(usr, "Input a description of the patrol.", "Description")
	if(!description)
		return

	var/datum/ai_order/patrol/order = new(list(waypoint_list, 10 SECONDS))
	order.desc = description

	to_chat(usr, SPAN_NOTICE("Patrol order has been created."))
