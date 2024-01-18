
/// For PvE CM we start without the ability for people to join as xenos. This can be toggled by game masters.
/client/proc/toggle_join_xeno()
	set name = "Toggle Player Xeno Joins"
	set category = "Game Master.Flags"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	SSticker.mode.toggleable_flags ^= MODE_NO_JOIN_AS_XENO
	message_admins("[src] has [MODE_HAS_TOGGLEABLE_FLAG(MODE_NO_JOIN_AS_XENO) ? "disallowed players from joining" : "allowed players to join"] as xenos.")
