/client/proc/set_cooldown()
	set name = "Set Cooldowns"
	set category = "Game Master.Fire Support Binos"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	var/list/selectable = list(FIRESUPPORT_ARTY, FIRESUPPORT_CAS, FIRESUPPORT_ORBITAL, FIRESUPPORT_ARTY_UPP, FIRESUPPORT_CAS_UPP, FIRESUPPORT_ORBITAL_UPP)
	var/fire_support_changed = tgui_input_list(src, "Choose fire support cooldown to change.", "Cooldown", selectable)
	if(!fire_support_changed)
		return
	var/new_cooldown = tgui_input_number(src, "New cooldown(seconds).", "Cooldown")
	for(var/firesupport_type in GLOB.fire_support_types)
		var/datum/fire_support/fire_support_option = GLOB.fire_support_types[firesupport_type]
		if(fire_support_option.fire_support_firer == fire_support_changed)
			fire_support_option.cooldown_duration = new_cooldown SECONDS
	message_admins("[key_name_admin(src)] has set [fire_support_changed] fire support cooldown to [new_cooldown] seconds.")
