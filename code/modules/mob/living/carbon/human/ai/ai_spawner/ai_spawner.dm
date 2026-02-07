/// Types of click intercepts used by /datum/game_master variable current_click_intercept_action
#define SPAWN_CLICK_INTERCEPT_ACTION "spawn_click_intercept_action"

GLOBAL_LIST_EMPTY(human_ai_equipment_presets)

/datum/human_ai_spawner_menu
	var/static/list/lazy_ui_data = list()
	//var/static/list/lazy_ui_data_
	var/static/list/super_silly_pref_save = list()
	var/current_path
	var/spawn_ai = TRUE
	var/paradrop = FALSE
	var/desc = TRUE
	var/species = SPECIES_HUMAN
	var/current_click_intercept_action
	var/spawn_click_intercept = FALSE
	var/selected_equipment
	var/selected_faction
	var/outfit = FALSE

/datum/human_ai_spawner_menu/New()
	usr.client.click_intercept = src
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
				"faction" = preset_obj.faction,
				"selected_equipment" = "Full Equipment"
			))

/datum/human_ai_spawner_menu/ui_close(mob/user)
	. = ..()

	var/client/user_client = user.client
	if(user_client?.click_intercept == src)
		user_client.click_intercept = null
		spawn_click_intercept = FALSE

/datum/human_ai_spawner_menu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HumanAISpawner")
		ui.open()

/datum/human_ai_spawner_menu/ui_state(mob/user)
	return GLOB.admin_state

/datum/human_ai_spawner_menu/ui_data(mob/user)
	var/list/data = list()
	var/datum/human_ai_equipment_preset/gotten_path = text2path(current_path)
	var/list/faction_list = lazy_ui_data[gotten_path.faction]
	for(var/list/preset_data in faction_list)
		if(preset_data["path"] == gotten_path)
			data["selected_faction"] = preset_data["faction"] //update the dropdown to the value the faction is in our big list
			data["selected_equipment"] = preset_data["selected_equipment"]
			break
	data["spawn_ai"] = spawn_ai
	data["paradrop"] = paradrop
	data["desc"] = desc
	data["outfit"] = outfit
	data["species_selected"] = species
	if(user.client.click_intercept != src && spawn_click_intercept)
		user.client.click_intercept = src
	data["spawn_click_intercept"] = spawn_click_intercept
	return data

/datum/human_ai_spawner_menu/ui_static_data(mob/user)
	var/list/data = list()

	data["presets"] = lazy_ui_data
	//data["defense_presets"]
	data["selectable_factions"] = FACTION_LIST_HUMANOID + "Normal Hive"
	data["equipment_settings"] = list("Full Equipment", "No Weapons", "Birthday Suit")
	data["species_settings"] = SYNTH_TYPES + SPECIES_HUMAN + SPECIES_ZOMBIE
	return data

/datum/human_ai_spawner_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("set_selected_faction")
			if(!params["path"])
				return
			if(!params["selected_faction"])
				return
			var/datum/human_ai_equipment_preset/gotten_path = text2path(params["path"])
			if(!gotten_path)
				return
			var/list/faction_list = lazy_ui_data[gotten_path.faction]
			for(var/list/preset_data in faction_list)
				if(preset_data["path"] == gotten_path)
					preset_data["faction"] = params["selected_faction"]
					selected_faction = params["selected_faction"]
					return

		if("remember_path")
			current_path = params["path"]
			selected_equipment = params["selected_equipment"]
			selected_faction = params["selected_faction"]
			SStgui.try_update_ui(usr, src, ui)
		if("human_spawn_ai_toggle")
			spawn_ai = !spawn_ai
		if("paradrop_toggle")
			paradrop = !paradrop
		if("hide_desc")
			desc = !desc
		if("outfit")
			outfit = !outfit
		if("set_selected_species")
			species = params["species_selected"]
		if("set_selected_equipment")
			var/datum/human_ai_equipment_preset/gotten_path = text2path(params["path"])
			if(!gotten_path)
				return
			var/list/faction_list = lazy_ui_data[gotten_path.faction]
			for(var/list/preset_data in faction_list)
				if(preset_data["path"] == gotten_path)
					preset_data["selected_equipment"] = params["selected_equipment"]
					return
			selected_equipment = params["selected_equipment"]
		if("create_ai")
			if(!params["path"])
				return

			if(spawn_click_intercept)
				spawn_click_intercept = FALSE
				current_click_intercept_action = FALSE
				return

			selected_equipment = params["selected_equipment"]
			selected_faction = params["selected_faction"]
			spawn_click_intercept = TRUE
			current_click_intercept_action = SPAWN_CLICK_INTERCEPT_ACTION





			return TRUE

/datum/human_ai_spawner_menu/proc/InterceptClickOn(mob/user, params, atom/object)

	var/list/modifiers = params2list(params)
	if(spawn_click_intercept)
		switch(current_click_intercept_action)
			if(SPAWN_CLICK_INTERCEPT_ACTION)
				var/datum/human_ai_equipment_preset/gotten_path = text2path(current_path)
				var/randomise_appearance = TRUE
				var/mob/living/carbon/human/ai_human

				if(!outfit)
					ai_human = new()
				else
					randomise_appearance = FALSE
					if(!ishuman(object))
						var/mob/living/carbon/human/selected = object
						selected = selected.change_mob_type(/mob/living/carbon/human, null, null, TRUE, "Human")
						object = selected
						if(!ishuman(selected))
							return
					ai_human = object

				for(var/item in ai_human.get_equipped_items(TRUE))
					qdel(item)
				arm_equipment(ai_human, gotten_path::path, randomise_appearance, FALSE, mob_client = ai_human.client)
				if(selected_equipment == "No Weapons")
					ai_human.strip_weapons()
				else if(selected_equipment == "Birthday Suit")
					ai_human.strip_all()


				ai_human.face_dir(user.dir)
				ai_human.forceMove(get_turf(object))
				if(paradrop)
					ai_human.paradrop()
				if(species != ai_human.species) //might be redundant
					ai_human.set_species(species)
					if(issynth(ai_human))
						ai_human.set_skills(/datum/skills/synthetic)
				if(selected_faction != gotten_path.faction)
					ai_human.faction = selected_faction
					var/obj/item/card/id/faction_tags = ai_human.wear_id
					if(faction_tags)
						faction_tags.faction = selected_faction
					if(selected_faction in FACTION_LIST_UA)
						ai_human.faction_group = FACTION_LIST_UA
						if(faction_tags)
							faction_tags.faction_group = FACTION_LIST_UA
					else
						if(selected_faction == FACTION_TWE)
							ai_human.faction_group = FACTION_LIST_TWE
							if(faction_tags)
								faction_tags.faction_group = FACTION_LIST_TWE
						else
							ai_human.faction_group = list(selected_faction)
							if(faction_tags)
								faction_tags.faction_group = list(selected_faction)
				if(spawn_ai && !outfit)
					ai_human.AddComponent(/datum/component/human_ai) //ai human might not be AI. those who know
					ai_human.get_ai_brain().appraise_inventory(armor = TRUE)

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

#undef SPAWN_CLICK_INTERCEPT_ACTION
