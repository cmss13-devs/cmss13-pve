/client/proc/enable_fire_support()
	set name = "Enable a Fire Support"
	set category = "Game Master.Fire Support Binos"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	var/list/selectable_faction = list(FACTION_MARINE, FACTION_UPP)
	var/faction = tgui_input_list(src, "Choose faction fire support to enable.", "Faction", selectable_faction)
	if(!faction)
		return
	while(TRUE)
		var/list/selectable = list()
		for(var/firesupport_type in GLOB.fire_support_types)
			var/datum/fire_support/fire_support_option = GLOB.fire_support_types[firesupport_type]
			if(!(fire_support_option.fire_support_flags & FIRESUPPORT_AVAILABLE) && fire_support_option.faction == faction)
				selectable += fire_support_option
		if(!selectable)
			to_chat(usr, SPAN_WARNING("No fire support options to enable!"))
			break
		var/datum/fire_support/support_to_enable = tgui_input_list(src, "Choose fire support to enable, leave blank to stop.", "Fire support", selectable)
		if(!support_to_enable)
			break
		support_to_enable.enable_firesupport()
		message_admins("[key_name_admin(src)] has enabled [support_to_enable] fire support for [faction].")

/client/proc/disable_fire_support()
	set name = "Disable a Fire Support"
	set category = "Game Master.Fire Support Binos"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	var/list/selectable_faction = list(FACTION_MARINE, FACTION_UPP)
	var/faction = tgui_input_list(src, "Choose faction fire support to disable.", "Faction", selectable_faction)
	if(!faction)
		return
	while(TRUE)
		var/list/selectable = list()
		for(var/firesupport_type in GLOB.fire_support_types)
			var/datum/fire_support/fire_support_option = GLOB.fire_support_types[firesupport_type]
			if(fire_support_option.fire_support_flags & FIRESUPPORT_AVAILABLE && fire_support_option.faction == faction)
				selectable += fire_support_option
		if(!selectable)
			to_chat(usr, SPAN_WARNING("No fire support options to disable!"))
			break
		var/datum/fire_support/support_to_enable = tgui_input_list(src, "Choose fire support to disable, leave blank to stop.", "Fire support", selectable)
		if(!support_to_enable)
			break
		support_to_enable.disable()
		message_admins("[key_name_admin(src)] has disabled [support_to_enable] fire support for [faction].")
