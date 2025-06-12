/client/proc/game_master_toggle_light()
	set name = "Toggle Light"
	set category = "Game Master.Extras"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	toggle_daylight()
/proc/toggle_daylight()
	var/list/turfs_to_change = list(/turf/open/desert/dirt, /turf/open/desert/rock, /turf/open/asphalt)
	for(var/turf/open/turf in world)
		if(is_type_in_list(turf, turfs_to_change))
			turf.set_light(1.4, 0.2, "#ffcc66")