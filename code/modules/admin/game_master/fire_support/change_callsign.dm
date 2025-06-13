/client/proc/change_callsign()
	set name = "Change Callsigns"
	set category = "Game Master.Fire Support Binos"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	var/list/selectable = list(FIRESUPPORT_ARTY, FIRESUPPORT_CAS, FIRESUPPORT_ORBITAL, FIRESUPPORT_ARTY_UPP, FIRESUPPORT_CAS_UPP, FIRESUPPORT_ORBITAL_UPP)
	var/callsign_to_change = tgui_input_list(src, "Choose fire support callsign to change.", "Callsign", selectable)
	if(!callsign_to_change)
		return
	var/new_callsign = tgui_input_text(src, "New callsign.", "Callsign")
	for(var/firesupport_type in GLOB.fire_support_types)
		var/datum/fire_support/fire_support_option = GLOB.fire_support_types[firesupport_type]
		if(fire_support_option.fire_support_firer == callsign_to_change)
			fire_support_option.initiate_title = new_callsign
	message_admins("[key_name_admin(src)] has set [callsign_to_change] fire support callsign to [new_callsign].")
