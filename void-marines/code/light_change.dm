/area/
	var/daytime_affected = FALSE

/client/proc/gm_lighting()
	set name = "Change Daytime"
	set category = "Game Master.Extras"

	if(!check_rights(R_ADMIN))
		return
	var/list/lightturfs
	var/light_str = tgui_input_number(usr, "Set the light power.", "Daytime Brightness", 0.3, integer_only = FALSE)
	var/daytime_color = input(usr, "Please select the color to use.", "Daytime Color") as color|null
	var/confirm = tgui_alert(usr, "Are you sure you wish to change daytime on the map to this settings?", "Confirm", list("Yes", "No"), 1 HOURS)
	if(confirm != "Yes")
		return FALSE
	message_admins("[key_name(usr)] changed lighting on map to [daytime_color] color with [light_str] strength.")
	lightturfs = block(locate(world.maxx, world.maxy, 2), locate(1, 1, 2))
	for(var/atom/A as anything in lightturfs)
		if(istype(A.loc,/area/))
			var/area/targeted = A.loc
			if(!targeted.daytime_affected)
				lightturfs -= A
	for(var/turf/T as anything in lightturfs)
		T.set_light(1, light_str, l_color = daytime_color)
