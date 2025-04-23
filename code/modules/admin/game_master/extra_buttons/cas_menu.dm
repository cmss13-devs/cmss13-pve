GLOBAL_LIST_EMPTY(game_master_targets)
GLOBAL_DATUM_INIT(target_panel, /datum/target_menu, new)
#define target_click_intercept_ACTION "target_click_intercept_action"

/client/proc/toggle_marker_menu()
	set name = "CAS Marker Menu"
	set category = "Game Master.Extras"
	if(!check_rights(R_ADMIN))
		return

	GLOB.target_panel.tgui_interact(mob)

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
			for(var/obj/effect/landmark/target/R in object_turf)
				GLOB.game_master_targets -= R
				QDEL_NULL(R)
			return TRUE

		var/obj/effect/landmark/target/target = new(object_turf)
		var/target_ref = REF(target)
		GLOB.game_master_targets += list(list(
			"target" = target,
			"target_name" = target.name,
			"target_ref" = target_ref,
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
		if("remove_target")
			if(!params["val"])
				return

			var/list/target = params["val"]

			var/atom/target_atom = locate(target["target_ref"])

			if(!target_atom)
				return TRUE

			if(tgui_alert(ui.user, "Do you want to remove [target_atom] ?", "Confirmation", list("Yes", "No")) != "Yes")
				return TRUE

			remove_target(target_atom)

		if("jump_to_target")
			if(!params["val"])
				return

			var/list/target = params["val"]

			var/atom/target_atom = locate(target["target_ref"])

			var/turf/target_turf = get_turf(target_atom)

			if(!target_turf)
				return TRUE

			var/client/jumping_client = ui.user.client
			jumping_client.jump_to_turf(target_turf)
			return TRUE

		if("toggle_click_target")
			target_click_intercept = !target_click_intercept
			return

/datum/target_menu/ui_close(mob/user)
	var/client/user_client = user.client
	if(user_client?.click_intercept == src)
		user_client.click_intercept = null

	target_click_intercept = FALSE

/datum/target_menu/proc/remove_target(obj/removing_datum)
	SIGNAL_HANDLER

	for(var/list/cycled_target in GLOB.game_master_targets)
		if(cycled_target["target"] == removing_datum)
			GLOB.game_master_targets.Remove(list(cycled_target))
			QDEL_NULL(removing_datum)
