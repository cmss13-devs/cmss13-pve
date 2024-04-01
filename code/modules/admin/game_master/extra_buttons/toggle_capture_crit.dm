
/// As long as this toggled - xenos will try and steal crit marines to nearest hive
/client/proc/toggle_xeno_kidnapping()
	set name = "Toggle Xeno Kidnapping"
	set category = "Game Master.Flags"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(!GLOB.ai_capture_crit && !LAZYLEN(GLOB.ai_hives))
		to_chat(src, SPAN_NOTICE("Xeno Kidnapping requires at least one valid hive placed"))
		return

	GLOB.ai_capture_crit = !GLOB.ai_capture_crit
	message_admins("[src] has [GLOB.ai_capture_crit ? "enabled" : "disabled"] AI kidnapping feature.")

GLOBAL_VAR(ai_capture_crit)
