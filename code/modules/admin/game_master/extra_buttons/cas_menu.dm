GLOBAL_LIST_EMPTY(game_master_targets)
GLOBAL_DATUM_INIT(rappel_panel, /datum/target_menu, new)
#define target_click_intercept_ACTION "target_click_intercept_action"

/client/proc/toggle_marker_menu()
	set name = "CAS Marker Menu"
	set category = "Game Master.Extras"
	if(!check_rights(R_ADMIN))
		return

	GLOB.rappel_panel.tgui_interact(mob)

/datum/target_menu
	var/target_click_intercept = FALSE

/datum/target_menu/ui_data(mob/user)
	. = ..()

	var/list/data = list()

	data["game_master_targets"] = length(GLOB.game_master_targets) ? GLOB.game_master_targets : ""
	data["target_click_intercept"] = target_click_intercept
	return data

/datum/target_menu/proc/InterceptClickOn(mob/user, params, atom/object)
	var/list/modifiers = params2list(params)
	if(target_click_intercept)
		var/turf/object_turf = get_turf(object)
		if(LAZYACCESS(modifiers, MIDDLE_CLICK))
			for(var/obj/effect/landmark/rappel/R in object_turf)
				GLOB.game_master_targets -= R
				QDEL_NULL(R)
			return TRUE

		var/obj/effect/landmark/rappel/rappel = new(object_turf)
		var/rappel_ref = REF(rappel)
		GLOB.game_master_targets += list(list(
			"rappel" = rappel,
			"rappel_name" = rappel.name,
			"rappel_ref" = rappel_ref,
			))
		return TRUE

/datum/target_menu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GameMasterTargetMenu", "CAS Marker Menu")
		ui.open()
	user.client?.click_intercept = src

/datum/target_menu/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE


/datum/target_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()

	switch(action)
		if("remove_rappel")
			if(!params["val"])
				return

			var/list/rappel = params["val"]

			var/atom/rappel_atom = locate(rappel["rappel_ref"])

			if(!rappel_atom)
				return TRUE

			if(tgui_alert(ui.user, "Do you want to remove [rappel_atom] ?", "Confirmation", list("Yes", "No")) != "Yes")
				return TRUE

			remove_rappel(rappel_atom)

		if("jump_to_rappel")
			if(!params["val"])
				return

			var/list/rappel = params["val"]

			var/atom/rappel_atom = locate(rappel["rappel_ref"])

			var/turf/rappel_turf = get_turf(rappel_atom)

			if(!rappel_turf)
				return TRUE

			var/client/jumping_client = ui.user.client
			jumping_client.jump_to_turf(rappel_turf)
			return TRUE

		if("toggle_click_rappel")
			target_click_intercept = !target_click_intercept
			return

/datum/target_menu/ui_close(mob/user)
	var/client/user_client = user.client
	if(user_client?.click_intercept == src)
		user_client.click_intercept = null

	target_click_intercept = FALSE

/datum/target_menu/proc/remove_rappel(obj/removing_datum)
	SIGNAL_HANDLER

	for(var/list/cycled_rappel in GLOB.game_master_targets)
		if(cycled_rappel["rappel"] == removing_datum)
			GLOB.game_master_targets.Remove(list(cycled_rappel))
			QDEL_NULL(removing_datum)
