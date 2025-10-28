GLOBAL_LIST_EMPTY(human_ai_equipment_presets)

/datum/human_ai_spawner_menu
	var/static/list/lazy_ui_data = list()

/datum/human_ai_spawner_menu/New()
	if(!length(GLOB.human_ai_equipment_presets))
		for(var/datum/human_ai_equipment_preset/preset_type as anything in subtypesof(/datum/human_ai_equipment_preset))
			if(!preset_type::name || !preset_type::path)
				continue

			if(!lazy_ui_data[preset_type::faction])
				lazy_ui_data[preset_type::faction] = list()

			var/datum/human_ai_equipment_preset/preset_obj = new preset_type()
			GLOB.human_ai_equipment_presets["[preset_type]"] = preset_obj

			lazy_ui_data[preset_type::faction] += list(list(
				"name" = preset_obj.name,
				"description" = preset_obj.desc,
				"path" = preset_type,
			))


/datum/human_ai_spawner_menu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HumanAISpawner")
		ui.open()

/datum/human_ai_spawner_menu/ui_state(mob/user)
	return GLOB.admin_state

/datum/human_ai_spawner_menu/ui_data(mob/user)
	var/list/data = list()

	return data

/datum/human_ai_spawner_menu/ui_static_data(mob/user)
	var/list/data = list()

	data["presets"] = lazy_ui_data

	return data

/datum/human_ai_spawner_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("create_ai")
			if(!params["path"])
				return

			var/datum/human_ai_equipment_preset/gotten_path = text2path(params["path"])
			if(!gotten_path)
				return

			var/mob/living/carbon/human/ai_human = new()
			ai_human.AddComponent(/datum/component/human_ai)

			arm_equipment(ai_human, gotten_path::path, TRUE)

			ai_human.face_dir(ui.user.dir)
			ai_human.forceMove(get_turf(ui.user))

			ai_human.get_ai_brain().appraise_inventory(armor = TRUE)
			return TRUE

/client/proc/open_human_ai_spawner_panel()
	set name = "Create Human AI"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	if(!SSticker.mode)
		to_chat(src, SPAN_WARNING("The round hasn't started yet!"))
		return

	if(human_spawn_menu)
		human_spawn_menu.tgui_interact(mob)
		return

	human_spawn_menu = new /datum/human_ai_spawner_menu(src)
	human_spawn_menu.tgui_interact(mob)


/datum/human_ai_equipment_preset
	/// The GM-visible name of the equipment preset
	var/name = ""
	/// A short description of what the preset does. Including important equipment or usecases is a good idea
	var/desc = ""
	/// What faction the preset is related to
	var/faction = FACTION_NEUTRAL
	/// The /datum/equipment_preset that this preset should create
	var/path
