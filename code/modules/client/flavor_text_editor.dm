/datum/flavor_text_editor/ui_data(mob/user)
	. = ..()

	var/datum/preferences/prefs = user.client?.prefs
	if(!prefs)
		return

	.["general"] = prefs.flavor_texts["general"]
	/*prefs.flavor_texts["head"]
	prefs.flavor_texts["face"]
	prefs.flavor_texts["eyes"]
	prefs.flavor_texts["torso"]
	prefs.flavor_texts["arms"]
	prefs.flavor_texts["hands"]
	prefs.flavor_texts["legs"]*/
	.["armor"] = prefs.flavor_texts["armor"]

/datum/flavor_text_editor/tgui_interact(mob/user, datum/tgui/ui)
	. = ..()

	ui = SStgui.try_update_ui(user, src, ui)

	if(!ui)
		ui = new(user, src, "FlavorTextEditor", "Flavor Text Editor")
		ui.open()
		ui.set_autoupdate(FALSE)

	winset(user, ui.window.id, "focus=true")

/datum/flavor_text_editor/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()

	var/datum/preferences/prefs = ui.user.client?.prefs
	if(!prefs)
		return

	switch(action)
		if("set_flavor_text")
			if(!params["category"])
				to_chat(ui.user, "no parameters")
				return
			prefs.flavor_texts[params["category"]] = params["text"]
			to_chat(ui.user, "it worked")
			return TRUE

	return TRUE


/datum/flavor_text_editor/ui_state(mob/user)
	return GLOB.always_state
