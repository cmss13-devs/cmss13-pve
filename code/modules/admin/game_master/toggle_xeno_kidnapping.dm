
/// As long as this toggled xenos will try and steal crit marines to nest them on nearest ai_hive landmark. This can be toggled by game masters.
/client/proc/toggle_xeno_kidnapping()
	set name = "Toggle Xeno Kidnapping"
	set category = "Game Master"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	GLOB.xeno_kidnapping = !GLOB.xeno_kidnapping
	message_admins("[src] has [GLOB.xeno_kidnapping ? "enabled" : "disabled"] AI kidnapping feature.")

GLOBAL_VAR(xeno_kidnapping)
