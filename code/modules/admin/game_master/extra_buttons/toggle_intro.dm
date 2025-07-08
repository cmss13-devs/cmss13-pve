/client/proc/toggle_intro()
	set name = "Toggle Intro Blurb"
	set category = "Game Master.Flags"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!SSticker.mode)
		to_chat(usr, SPAN_WARNING("A mode hasn't been selected yet!"))
		return

	SSticker.mode.toggleable_flags ^= MODE_DISABLE_INTRO_BLURB
	message_admins("[src] has [MODE_HAS_TOGGLEABLE_FLAG(MODE_DISABLE_INTRO_BLURB) ? "turned off" : "turned on"] intro blurb.")

