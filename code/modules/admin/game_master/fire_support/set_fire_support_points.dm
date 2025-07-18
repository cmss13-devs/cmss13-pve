/client/proc/set_fire_support_points()
	set name = "Set Fire Support Points"
	set category = "Game Master.Fire Support Binos"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	var/list/selectable_faction = list(FACTION_MARINE, FACTION_UPP, FACTION_PMC)
	var/faction = tgui_input_list(src, "Choose faction fire support point to set.", "Faction", selectable_faction)
	if(!faction)
		return
	var/amount = tgui_input_number(src, "Set fire support points.")
	GLOB.fire_support_points[faction] = amount
	message_admins("[key_name_admin(src)] has set [faction] fire support points to [amount].")
