
/// Assoc list that holds our custom game master objectives, formatted as atom = objective_string
GLOBAL_LIST_EMPTY(game_master_objectives)

/// Percentage of characters end up clear when sent via radio message
GLOBAL_VAR_INIT(radio_communication_clarity, 100)

/proc/open_game_master_panel(client/using_client)
	set name = "Game Master Panel"
	set category = "Game Master"

	if(using_client.game_master_menu)
		using_client.game_master_menu.tgui_interact(using_client.mob)
		return

	using_client.game_master_menu = new /datum/game_master(using_client)

/client/proc/toggle_game_master()
	set name = "Game Master Panel"
	set category = "Game Master"
	if(!check_rights(R_ADMIN))
		return

	if(src)
		open_game_master_panel(src)

// Spawn stuff
#define DEFAULT_SPAWN_XENO_STRING XENO_CASTE_DRONE
#define GAME_MASTER_AI_XENOS list(XENO_CASTE_DRONE, XENO_CASTE_RUNNER, XENO_CASTE_CRUSHER)

#define DEFAULT_XENO_AMOUNT_TO_SPAWN 1

// Objective stuff
#define OBJECTIVE_NUMBER_OPTIONS list("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine")
#define OBJECTIVE_COLOR_OPTIONS list("red", "purple", "blue")
#define OBJECTIVE_COLOR_OPTIONS_ASSOC list("red" = COLOR_RED, "purple" = COLOR_PURPLE, "blue" = COLOR_BLUE)

/// Types of click intercepts used by /datum/game_master variable current_click_intercept_action
#define SPAWN_CLICK_INTERCEPT_ACTION "spawn_click_intercept_action"
#define OBJECTIVE_CLICK_INTERCEPT_ACTION "objective_click_intercept_action"


/datum/game_master

	/// Associated list of game master submenus organized by object_type = game_master_submenu
	var/list/submenu_types = list(
		/obj/structure/pipes/vents/scrubber = /datum/game_master_submenu/vents,
		/obj/structure/pipes/vents/pump = /datum/game_master_submenu/vents,
	)

	/// List of current submenus
	var/list/current_submenus


	/// Spawn stuff

	/// The xeno selected to be spawned in the spawn section
	var/selected_xeno = DEFAULT_SPAWN_XENO_STRING

	/// The amount of xenos to spawn in the spawn section
	var/xeno_spawn_count = DEFAULT_XENO_AMOUNT_TO_SPAWN

	/// If the spawned xeno is an AI in the spawn section
	var/spawn_ai = TRUE

	/// If we are currently using the click intercept for the spawn section
	var/spawn_click_intercept = FALSE

	/// End Spawn Stuff

	/// Objective stuff

	/// If we are currently using the click intercept for the objective section
	var/objective_click_intercept = FALSE

	/// End Objective Stuff


	/// Communication stuff

	var/atom/movable/game_master_phone

	/// End Communication stuff

	/// Holds what type of click intercept we are using
	var/current_click_intercept_action

/datum/game_master/New(client/using_client)
	. = ..()

	tgui_interact(using_client.mob)

	current_submenus = list()

	game_master_phone = new(null)
	game_master_phone.AddComponent(/datum/component/phone/virtual, "Game Master", "white", "Company Command", null, PHONE_DO_NOT_DISTURB_ON, list(FACTION_MARINE, FACTION_COLONIST, FACTION_WY), list(FACTION_MARINE, FACTION_COLONIST, FACTION_WY), null, using_client)

	using_client.click_intercept = src

/datum/game_master/Destroy(force, ...)
	. = ..()
	submenu_types = null
	current_submenus = null
	QDEL_NULL(game_master_phone)

/datum/game_master/ui_data(mob/user)
	. = ..()

	var/list/data = list()

	// Spawn stuff
	data["selected_xeno"] = selected_xeno
	data["spawn_ai"] = spawn_ai
	data["spawn_click_intercept"] = spawn_click_intercept
	data["xeno_spawn_count"] = xeno_spawn_count

	// Objective stuff
	data["objective_click_intercept"] = objective_click_intercept

	// Communication stuff
	data["communication_clarity"] = GLOB.radio_communication_clarity

	return data

/datum/game_master/ui_static_data(mob/user)
	. = ..()

	var/list/data = list()

	data["spawnable_xenos"] = GAME_MASTER_AI_XENOS

	return data

/datum/game_master/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()

	switch(action)

		//Spawn Section
		if("toggle_click_spawn")
			if(spawn_click_intercept)
				spawn_click_intercept = FALSE
				current_click_intercept_action = null
				return

			spawn_click_intercept = TRUE
			current_click_intercept_action = SPAWN_CLICK_INTERCEPT_ACTION
			return

		if("xeno_spawn_ai_toggle")
			spawn_ai = !spawn_ai
			return

		if("set_selected_xeno")
			selected_xeno = params["new_xeno"]
			xeno_spawn_count = DEFAULT_XENO_AMOUNT_TO_SPAWN
			return

		if("set_xeno_spawns")
			var/new_number = text2num(params["value"])
			if(!new_number)
				return

			xeno_spawn_count = clamp(new_number, 1, 10)
			return

		if("delete_all_xenos")
			if(tgui_alert(ui.user, "Do you want to delete all xenos?", "Confirmation", list("Yes", "No")) != "Yes")
				return

			for(var/mob/living/carbon/xenomorph/cycled_xeno in GLOB.alive_mob_list)
				qdel(cycled_xeno)

			return

		//Objective Section
		if("toggle_click_objective")
			if(objective_click_intercept)
				objective_click_intercept = FALSE
				current_click_intercept_action = null
				return

			objective_click_intercept = TRUE
			current_click_intercept_action = OBJECTIVE_CLICK_INTERCEPT_ACTION
			return

		//Communication Section
		if("use_game_master_phone")
			game_master_phone.attack_hand(ui.user)

		if("set_communication_clarity")
			var/new_clarity = text2num(params["clarity"])
			if(!isnum(new_clarity))
				return

			GLOB.radio_communication_clarity = clamp(new_clarity, 0, 100)

/datum/game_master/ui_close(mob/user)
	. = ..()

	var/client/user_client = user.client
	if(user_client?.click_intercept == src)
		user_client.click_intercept = null

	spawn_click_intercept = FALSE
	objective_click_intercept = FALSE
	current_click_intercept_action = null

/datum/game_master/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE

/datum/game_master/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GameMaster", "Game Master Menu")
		ui.open()

	user.client?.click_intercept = src

/datum/game_master/proc/InterceptClickOn(mob/user, params, atom/object)

	var/list/modifiers = params2list(params)

	switch(current_click_intercept_action)
		if(SPAWN_CLICK_INTERCEPT_ACTION)
			if(LAZYACCESS(modifiers, MIDDLE_CLICK))
				if(isxeno(object))
					qdel(object)
				return

			var/spawning_xeno_type = RoleAuthority.get_caste_by_text(selected_xeno)

			if(!spawning_xeno_type)
				to_chat(user, SPAN_NOTICE(SPAN_BOLD("Unable to find xeno type by name: [selected_xeno]")))
				return

			var/turf/spawn_turf = get_turf(object)

			for(var/i = 1 to xeno_spawn_count)
				new spawning_xeno_type(spawn_turf, null, XENO_HIVE_NORMAL, !spawn_ai)

			return TRUE

		if(OBJECTIVE_CLICK_INTERCEPT_ACTION)
			var/turf/object_turf = get_turf(object)

			if(!object_turf)
				return TRUE

			if(SSminimaps.has_marker(object))
				if(tgui_alert(user, "Do you want to remove [object] as an objective?", "Confirmation", list("Yes", "No")) != "Yes")
					return TRUE

				SSminimaps.remove_marker(object)
				GLOB.game_master_objectives -= object
				return TRUE

			if(tgui_alert(user, "Do you want to make [object] an objective?", "Confirmation", list("Yes", "No")) != "Yes")
				return TRUE

			var/number_option = tgui_input_list(user, "Number on tacmap marker?", "Marker Number", OBJECTIVE_NUMBER_OPTIONS)
			if(!number_option)
				return TRUE

			var/color_option = tgui_input_list(user, "Color of tacmap marker?", "Marker Color", OBJECTIVE_COLOR_OPTIONS)
			if(!color_option)
				return TRUE

			color_option = OBJECTIVE_COLOR_OPTIONS_ASSOC[color_option]

			var/image/background = mutable_appearance('icons/ui_icons/map_blips.dmi', "background")
			background.color = color_option

			var/mutable_appearance/icon = image('icons/ui_icons/map_blips.dmi', icon_state = number_option)
			icon.appearance_flags = RESET_COLOR

			background.overlays += icon

			var/z_level = object_turf?.z

			if(!object || !z_level)
				return

			SSminimaps.add_marker(object, z_level, MINIMAP_FLAG_USCM, given_image = background)

			/// objective_info needs to be implemented both in the game master menu and overwatch TGUI
			/// GLOB.game_master_objectives should also probably hold a datum with more info including the icon here for TGUI usage
			/// - Morrow
			var/objective_info = tgui_input_text(user, "Objective info?", "Objective Info")

			GLOB.game_master_objectives[object] = objective_info || ""
			return TRUE

		else
			if(LAZYACCESS(modifiers, MIDDLE_CLICK) && (object.type in submenu_types))
				for(var/datum/game_master_submenu/submenu in current_submenus)
					if(submenu.referenced_atom == object)
						submenu.tgui_interact(user)
						return TRUE

				var/new_menu_type = submenu_types[object.type]

				current_submenus += new new_menu_type(user, object)
				return TRUE


#undef DEFAULT_SPAWN_XENO_STRING
#undef GAME_MASTER_AI_XENOS
#undef DEFAULT_XENO_AMOUNT_TO_SPAWN
#undef OBJECTIVE_NUMBER_OPTIONS
#undef OBJECTIVE_COLOR_OPTIONS
#undef OBJECTIVE_COLOR_OPTIONS_ASSOC
#undef SPAWN_CLICK_INTERCEPT_ACTION
#undef OBJECTIVE_CLICK_INTERCEPT_ACTION
