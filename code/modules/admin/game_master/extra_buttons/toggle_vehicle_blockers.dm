/// For PvE CM a convenient button to enable/disable the invisible vehicle blockers.
/client/proc/toggle_vehicle_blockers()
	set name = "Toggle Vehicle Blockers"
	set category = "Game Master.Flags"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	GLOB.vehicle_blockers = !GLOB.vehicle_blockers
	message_admins("[src] has [GLOB.vehicle_blockers ? "enabled" : "disabled"] vehicle blockers.")
