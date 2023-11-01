
#define DEFAULT_SPAWN_XENO_STRING XENO_CASTE_DRONE
#define GAME_MASTER_VENT_AI_XENOS list(XENO_CASTE_DRONE, XENO_CASTE_RUNNER, XENO_CASTE_LURKER, XENO_CASTE_FACEHUGGER)

#define DEFAULT_XENO_AMOUNT_TO_SPAWN 1


/// Created by /datum/game_master when right clicking on a /obj/structure/pipes/vents/scrubber or /obj/structure/pipes/vents/pump
/datum/game_master_submenu/vents
	tgui_menu_name = "GameMasterSubmenuVents"
	tgui_menu_title = "Vent Control"

	/// Amount of xenos we want to spawn when we hit spawn
	var/xeno_spawn_count = DEFAULT_XENO_AMOUNT_TO_SPAWN

	/// Current selected xeno string to spawn when we hit spawn
	var/selected_xeno = DEFAULT_SPAWN_XENO_STRING

	/// Current xenos to spawn in an ambush, organized as xeno_type = number_to_spawn
	var/list/current_ambush

	/// Current info on the ambush passed to the menu
	var/ambush_info = "No Current Ambush"

	/// Are we currently ambushing?
	var/ambushing = FALSE

/datum/game_master_submenu/vents/New(client/using_client)
	. = ..()
	current_ambush = list()

	var/turf/reference_turf = get_turf(referenced_atom)

	var/list/ambush_turfs = block(locate(max(reference_turf.x - 4, 1), max(reference_turf.y - 4, 1), reference_turf.z), locate(reference_turf.x + 4, reference_turf.y + 4, reference_turf.z))

	for(var/turf/cycled_turf as anything in ambush_turfs)
		RegisterSignal(cycled_turf, COMSIG_TURF_ENTERED, PROC_REF(ambush_turf_movement))

/datum/game_master_submenu/vents/Destroy(force, ...)
	. = ..()
	current_ambush = null

/datum/game_master_submenu/vents/ui_data(mob/user)
	. = ..()

	var/list/data = list()

	data["xeno_spawn_count"] = xeno_spawn_count
	data["selected_xeno"] = selected_xeno
	data["ambush_info"] = ambush_info

	return data

/datum/game_master_submenu/vents/ui_static_data(mob/user)
	. = ..()

	var/list/data = list()

	data["spawnable_xenos"] = GAME_MASTER_VENT_AI_XENOS

	return data

/datum/game_master_submenu/vents/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()

	switch(action)
		if("set_xeno_spawns")
			var/new_number = text2num(params["value"])
			if(!new_number)
				return

			xeno_spawn_count = clamp(new_number, 1, 10)
			return

		if("set_selected_xeno")
			selected_xeno = params["new_xeno"]
			xeno_spawn_count = DEFAULT_XENO_AMOUNT_TO_SPAWN
			return

		if("ambush")
			setup_ambush()
			return

		if("spawn")
			handle_vent_spawn()
			return

		if("clear_ambush")
			current_ambush = list()
			ambush_info = initial(ambush_info)
			return

/// Callback for when one of our registered turfs has something move across it, tells the ambush to start if set up
/datum/game_master_submenu/vents/proc/ambush_turf_movement(turf/crossed_turf, atom/movable/entering_movable)
	SIGNAL_HANDLER

	if(length(current_ambush) && !ambushing && ishuman(entering_movable))
		ambushing = TRUE
		handle_vent_spawn(TRUE)

/// Sets current ambush data for a potential ambush
/datum/game_master_submenu/vents/proc/setup_ambush()
	current_ambush[selected_xeno] = xeno_spawn_count

	var/temp_string = "Current Ambush: "
	for(var/ambusher_type in current_ambush)
		temp_string += "[current_ambush[ambusher_type]] [ambusher_type], "

	temp_string = copytext(temp_string, 1, -2)

	ambush_info = temp_string

#define VENT_ESCAPE_INCREMENT_TIME (1 SECONDS)

/// Shakes the vent and creates timers to spawn multiple xenos in succession
/datum/game_master_submenu/vents/proc/handle_vent_spawn(ambush)
	var/obj/structure/pipes/vents/referenced_vent = referenced_atom
	if(!istype(referenced_vent))
		log_debug("Vent game master submenu has reference atom that is not a vent. Referenced atom: [referenced_atom]")
		return

	referenced_vent.animate_ventcrawl()
	playsound(referenced_vent, pick('sound/effects/alien_ventcrawl1.ogg', 'sound/effects/alien_ventcrawl2.ogg'), 25, 1)
	var/timer_increment = VENT_ESCAPE_INCREMENT_TIME
	referenced_vent.visible_message(SPAN_NOTICE("Something begins climbing out of [referenced_vent]!"))

	if(ambush)
		for(var/ambusher_type in current_ambush)
			for(var/i = 1 to current_ambush[ambusher_type])
				addtimer(CALLBACK(src, PROC_REF(spawn_xeno), ambusher_type), timer_increment)
				timer_increment += VENT_ESCAPE_INCREMENT_TIME

		addtimer(CALLBACK(referenced_vent, TYPE_PROC_REF(/obj/structure/pipes/vents, animate_ventcrawl_reset)), timer_increment)
		current_ambush = list()
		ambush_info = initial(ambush_info)
		ambushing = FALSE
		return

	for(var/i = 1 to xeno_spawn_count)
		addtimer(CALLBACK(src, PROC_REF(spawn_xeno), selected_xeno), timer_increment)
		timer_increment += VENT_ESCAPE_INCREMENT_TIME

	addtimer(CALLBACK(referenced_vent, TYPE_PROC_REF(/obj/structure/pipes/vents, animate_ventcrawl_reset)), timer_increment)

#undef VENT_ESCAPE_INCREMENT_TIME

/// Actually spawns the xeno at the vent
/datum/game_master_submenu/vents/proc/spawn_xeno(spawning_xeno_name)
	var/turf/spawn_turf = get_turf(referenced_atom)

	if(!spawn_turf)
		log_debug("Vent game master submenu unable to find turf of referenced atom. Referenced atom: [referenced_atom]")
		return

	var/xeno_type = RoleAuthority.get_caste_by_text(spawning_xeno_name)

	if(!xeno_type)
		log_debug("Vent game master submenu unable to find xeno type. Xeno type name: [spawning_xeno_name]")
		return

	playsound(referenced_atom, pick('sound/effects/alien_ventpass1.ogg', 'sound/effects/alien_ventpass2.ogg'), 25, 1)

	new xeno_type(spawn_turf, null, XENO_HIVE_NORMAL)


#undef DEFAULT_SPAWN_XENO_STRING
#undef GAME_MASTER_VENT_AI_XENOS
#undef DEFAULT_XENO_AMOUNT_TO_SPAWN
