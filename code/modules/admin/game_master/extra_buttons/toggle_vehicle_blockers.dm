/// For PvE CM a convenient button to enable/disable the invisible vehicle blockers.
/client/proc/toggle_vehicle_blockers()
	set name = "Toggle Vehicle Blockers"
	set category = "Game Master.Extras"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	SSticker.mode.toggleable_flags ^= MODE_BYPASS_VEHICLE_BLOCKERS
	message_admins("[src] has [MODE_HAS_TOGGLEABLE_FLAG(MODE_BYPASS_VEHICLE_BLOCKERS) ? "allowed vehicles to bypass" : "prevented vehicles from bypassing"] vehicle blockers.")
