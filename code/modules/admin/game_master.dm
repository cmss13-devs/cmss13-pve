/proc/open_game_master_panel(client/using_client)
	set name = "Game Master Panel"
	set category = "Game Master"

	new /datum/game_master(using_client)


/client/proc/toggle_game_master()
	set name = "Game Master Panel"
	set category = "Game Master"
	if(!check_rights(R_ADMIN))
		return

	if(src)
		open_game_master_panel(src)


#define DEFAULT_SPAWN_XENO_STRING XENO_CASTE_DRONE
#define GAME_MASTER_AI_XENOS list(XENO_CASTE_DRONE, XENO_CASTE_RUNNER, XENO_CASTE_CRUSHER)

#define DEFAULT_XENO_AMOUNT_TO_SPAWN 1

#define SPAWN_CLICK_INTERCEPT_ACTION "spawn_click_intercept_action"

/datum/game_master

	var/selected_xeno = DEFAULT_SPAWN_XENO_STRING
	var/xenos_to_spawn = DEFAULT_XENO_AMOUNT_TO_SPAWN
	var/spawn_ai = TRUE
	var/spawn_click_intercept = FALSE

	var/current_click_intercept_action

/datum/game_master/New(client/using_client)
	. = ..()

	if(using_client.mob)
		tgui_interact(using_client.mob)

/datum/game_master/Destroy(force, ...)
	. = ..()

/datum/game_master/ui_data(mob/user)
	. = ..()

	var/list/data = list()

	data["selected_xeno"] = selected_xeno
	data["spawn_ai"] = spawn_ai
	data["spawn_click_intercept"] = spawn_click_intercept

	return data


/datum/game_master/ui_static_data(mob/user)
	. = ..()

	var/list/data = list()

	data["default_spawnable_xeno_string"] = DEFAULT_SPAWN_XENO_STRING
	data["spawnable_xenos"] = GAME_MASTER_AI_XENOS

	return data


/datum/game_master/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()

	switch(action)
		if("toggle_click_spawn")
			var/client/user_client = ui.user.client
			if(user_client.click_intercept == src)
				user_client.click_intercept = null
				spawn_click_intercept = FALSE
				current_click_intercept_action = null
				return

			user_client.click_intercept = src
			spawn_click_intercept = TRUE
			current_click_intercept_action = SPAWN_CLICK_INTERCEPT_ACTION
			return

		if("xeno_spawn_ai_toggle")
			spawn_ai = !spawn_ai
			return

		if("set_selected_xeno")
			selected_xeno = params["new_xeno"]
			xenos_to_spawn = DEFAULT_XENO_AMOUNT_TO_SPAWN
			return

		if("set_xeno_spawns")
			var/new_number = text2num(params["value"])
			if(!new_number)
				return

			xenos_to_spawn = clamp(new_number, 1, 10)
			return

/datum/game_master/ui_close(mob/user)
	. = ..()

	var/client/user_client = user.client
	if(user_client?.click_intercept == src)
		user_client.click_intercept = null

	qdel(src)

/datum/game_master/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE

/datum/game_master/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GameMaster", "Game Master Menu")
		ui.open()

/datum/game_master/proc/InterceptClickOn(mob/user, params, atom/object)
	switch(current_click_intercept_action)
		if(SPAWN_CLICK_INTERCEPT_ACTION)
			var/spawning_xeno_type = RoleAuthority.get_caste_by_text(selected_xeno)

			if(!spawning_xeno_type)
				to_chat(user, SPAN_NOTICE(SPAN_BOLD("Unable to find xeno type by name: [selected_xeno]")))
				return

			var/turf/spawn_turf = get_turf(object)

			for(var/i = 1 to xenos_to_spawn)
				new spawning_xeno_type(spawn_turf, null, XENO_HIVE_NORMAL, !spawn_ai)

			return

#undef DEFAULT_SPAWN_XENO_STRING
#undef GAME_MASTER_AI_XENOS
#undef DEFAULT_XENO_AMOUNT_TO_SPAWN
#undef SPAWN_CLICK_INTERCEPT_ACTION
