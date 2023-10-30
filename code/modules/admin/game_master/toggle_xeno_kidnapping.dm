
/// As long as this toggled xeno will try and steal crit marines to their "home"
/client/proc/toggle_xeno_kidnapping()
	set name = "Toggle Xeno Kidnapping"
	set category = "Game Master"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	GLOB.xeno_kidnapping = !GLOB.xeno_kidnapping
	message_admins("[src] has [GLOB.xeno_kidnapping ? "enabled" : "disabled"] AI kidnapping feature.")

GLOBAL_VAR(xeno_kidnapping)
