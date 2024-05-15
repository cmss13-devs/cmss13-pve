//GLOBAL_DATUM_INIT(sound_panel, /datum/sound_panel_tgui, new)

/client/proc/open_sound_panel()
	set name = "Sound Panel"
	//set category = "Admin.Events"
	set category = "Game Master"

	if(!check_rights(R_SOUNDS))
		return

	new /datum/sound_panel(usr)

/datum/sound_panel
	var/static/list/sound_list
	var/static/list/category_list
	var/static/list/category_lookup
	var/static/list/zlevel_list
	var/static/list/zlevel_lookup
	var/static/list/group_list
	var/client/holder
	var/mob/target_player
	var/loc_click_intercept = FALSE
	var/turf/target_loc

/datum/sound_panel/New(user)
	//. = ..()
	if(isnull(sound_list)) //first run, init statics
		sound_list = get_sounds()

		category_list = list("Sound FX", "Ambience", "Admin")
		category_lookup = list("Sound FX" = VOLUME_SFX, "Ambience" = VOLUME_AMB, "Admin" = VOLUME_ADM)

		zlevel_list = list()
		zlevel_lookup = list()
		for(var/datum/space_level/level as anything in SSmapping.z_list)
			zlevel_list += level.name
			zlevel_lookup[level.name] = level.z_value

		group_list = list("Global", "Humans", "Xenos", "Ghosts")

	if(isclient(user))
		holder = user
	else
		var/mob/mob = user
		holder = mob.client

	holder.click_intercept = src
	tgui_interact(holder.mob)

/datum/sound_panel/proc/get_sounds()
	var/static/list/extensions = list("mid", "midi", "mod", "it", "s3m", "xm", "oxm", "wav", "ogg", "mp3", "raw", "wma", "aiff")
	var/static/regex/ext_rgx = new("\\.(?:[jointext(extensions, "|")])$", "i")

	var/list/dirs = list("sound/")
	var/list/file_paths = list()
	for(var/i = 1, i <= length(dirs), i++)
		var/path = dirs[i]
	//while(length(dirs))
		//var/path = popleft(dirs)

		var/list/filenames = flist(path)
		for(var/filename as anything in filenames)
			if(findtext(filename, "/", -1)) //found directory, add to search
				dirs += "[path][filename]"
				continue
			if(!findtext(filename, ext_rgx)) //extension check
				continue
			file_paths += "[path][filename]"

	return file_paths

/*
/datum/sound_panel/Destroy(force, ...)
	. = ..()
*/

/datum/sound_panel/ui_static_data(mob/user)
	//. = ..()

	var/list/data = list()

	data["sound_list"] = sound_list
	data["category_list"] = category_list
	data["zlevel_list"] = zlevel_list
	data["group_list"] = group_list

	return data

/datum/sound_panel/ui_data(mob/user)
	var/list/data = list()

	data["target_player_desc"] = target_player?.name
	data["target_loc_desc"] = target_loc ? "[target_loc.name]: [target_loc.x],[target_loc.y],[target_loc.z]" : null
	data["loc_click_intercept"] = loc_click_intercept

	return data

/datum/sound_panel/ui_close(mob/user)
	holder = null
	target_loc = null
	target_player = null
	loc_click_intercept = FALSE
	qdel(src)

/datum/sound_panel/ui_state(mob/user)
	return GLOB.admin_state

/datum/sound_panel/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE

/datum/sound_panel/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "SoundPanel", "Sound Panel")
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/sound_panel/proc/InterceptClickOn(mob/user, params, atom/object)
	//var/list/modifiers = params2list(params)
	if(loc_click_intercept)
		var/turf/chosen_loc = get_turf(object)
		if(QDELETED(chosen_loc))
			return

		target_loc = chosen_loc
		SStgui.update_uis(src)
		return TRUE

/*
#define IS_VALID_SOUND(sound) ((sound) in sound_list)
#define IS_VALID_CATEGORY(category) ((category) in category_list)
#define IS_VALID_VOLUME(volume) (ISINRANGE((volume), 0, 100))
*/

/datum/sound_panel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	if(!check_rights(R_SOUNDS))
		return

	switch(action)
		if("play_preview")
			var/sound = params["sound_path"]
			if(!(sound in sound_list))
				return

			var/category = category_lookup[params["sound_category"]]
			if(!category)
				return

			var/volume = clamp(text2num(params["sound_volume"]), 0, 100)
			var/pitch = clamp(text2num(params["sound_pitch"]), 0.5, 2)
			var/duration = clamp(text2num(params["sound_duration"]), 0.5, 2)

			var/sound/sound_datum = sound(sound)
			sound_datum.frequency = 1 / duration
			sound_datum.pitch = pitch * duration

			playsound_client(holder, sound_datum, vol = volume, vol_cat = category, channel = SOUND_CHANNEL_TEST)
			return TRUE
		if("stop_preview")
			var/sound/sound_datum = sound()
			sound_datum.channel = SOUND_CHANNEL_TEST
			sound_datum.status = SOUND_MUTE|SOUND_UPDATE
			sound_to(holder, sound_datum)
			return TRUE
		if("select_client")
			var/mob/chosen_player = tgui_input_list(holder.mob, "Who should hear the sound?", "Player Select", GLOB.player_list)
			if(QDELETED(chosen_player))
				return

			target_player = chosen_player
			return TRUE
		if("play_client")
			var/sound = params["sound_path"]
			if(!(sound in sound_list))
				return

			var/category = category_lookup[params["sound_category"]]
			if(!category)
				return

			var/volume = clamp(text2num(params["sound_volume"]), 0, 100)
			var/pitch = clamp(text2num(params["sound_pitch"]), 0.5, 2)
			var/duration = clamp(text2num(params["sound_duration"]), 0.5, 2)

			var/sound/sound_datum = sound(sound)
			sound_datum.frequency = 1 / duration
			sound_datum.pitch = pitch * duration

			if(QDELETED(target_player))
				return

			playsound_client(target_player.client, sound_datum, vol = volume, vol_cat = category)
			return TRUE
		if("toggle_loc_click")
			loc_click_intercept = !loc_click_intercept
			return TRUE
		if("play_local")
			var/sound = params["sound_path"]
			if(!(sound in sound_list))
				return

			var/category = category_lookup[params["sound_category"]]
			if(!category)
				return

			var/volume = clamp(text2num(params["sound_volume"]), 0, 100)
			var/pitch = clamp(text2num(params["sound_pitch"]), 0.5, 2)
			var/duration = clamp(text2num(params["sound_duration"]), 0.5, 2)

			var/sound/sound_datum = sound(sound)
			sound_datum.frequency = 1 / duration
			sound_datum.pitch = pitch * duration

			if(QDELETED(target_loc))
				return

			playsound(target_loc, sound_datum, volume, vol_cat = category)
			return TRUE
		if("play_zlevel")
			var/sound = params["sound_path"]
			if(!(sound in sound_list))
				return

			var/category = category_lookup[params["sound_category"]]
			if(!category)
				return

			var/volume = clamp(text2num(params["sound_volume"]), 0, 100)
			var/pitch = clamp(text2num(params["sound_pitch"]), 0.5, 2)
			var/duration = clamp(text2num(params["sound_duration"]), 0.5, 2)

			var/sound/sound_datum = sound(sound)
			sound_datum.frequency = 1 / duration
			sound_datum.pitch = pitch * duration

			var/target_z = zlevel_lookup[params["target_zlevel"]]
			if(isnull(target_z))
				return

			playsound_z(list(target_z), sound_datum, volume, vol_cat = category)
			return TRUE
		if("play_group")
			var/sound = params["sound_path"]
			if(!(sound in sound_list))
				return

			var/category = category_lookup[params["sound_category"]]
			if(!category)
				return

			var/volume = clamp(text2num(params["sound_volume"]), 0, 100)
			var/pitch = clamp(text2num(params["sound_pitch"]), 0.5, 2)
			var/duration = clamp(text2num(params["sound_duration"]), 0.5, 2)

			var/sound/sound_datum = sound(sound)
			sound_datum.frequency = 1 / duration
			sound_datum.pitch = pitch * duration

			var/target_group = params["target_group"]
			if(!(target_group in group_list))
				return

			var/list/targets = list()
			switch(target_group)
				if("Global")
					targets = GLOB.mob_list
				if("Humans")
					targets = GLOB.human_mob_list + GLOB.dead_mob_list
				if("Xenos")
					targets = GLOB.xeno_mob_list + GLOB.dead_mob_list
				if("Ghosts")
					targets = GLOB.observer_list + GLOB.dead_mob_list

			for(var/mob/target as anything in targets)
				playsound_client(target.client, sound_datum, vol = volume, vol_cat = category)
			return TRUE

/*
#undef IS_VALID_SOUND
#undef IS_VALID_CATEGORY
#undef IS_VALID_VOLUME
*/
