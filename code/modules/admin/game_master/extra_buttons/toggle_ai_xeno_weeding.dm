/// For PvE CM a convenient button to enable/disable AI xenos weeding.
/client/proc/toggle_ai_xeno_weeding()
	set name = "Toggle AI Xeno Weeding"
	set category = "Game Master.Flags"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	GLOB.ai_xeno_weeding = !GLOB.ai_xeno_weeding
	message_admins("[src] has [GLOB.ai_xeno_weeding ? "enabled" : "disabled"] AI xeno weeding.")
