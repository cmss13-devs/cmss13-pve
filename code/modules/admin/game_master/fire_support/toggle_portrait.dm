/client/proc/toggle_portrait()
	set name = "Toggle Fire Support Portrait"
	set category = "Game Master.Fire Support Binos"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	SSticker.mode.toggleable_flags ^= MODE_ENABLE_FS_PORTRAIT
	message_admins("[src] has [MODE_HAS_TOGGLEABLE_FLAG(MODE_ENABLE_FS_PORTRAIT) ? "turned on" : "turned off"] fire support portraits.")

