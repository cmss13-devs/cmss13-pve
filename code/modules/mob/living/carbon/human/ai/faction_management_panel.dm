/datum/human_faction_management_menu

/datum/human_faction_management_menu/New()

/datum/human_faction_management_menu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HumanFactionManager")
		ui.open()

/datum/human_faction_management_menu/ui_state(mob/user)
	return GLOB.admin_state

/datum/human_faction_management_menu/ui_data(mob/user)
	var/list/data = list()

	data["datumless_factions"] = FACTION_LIST_HUMANOID + FACTION_LIST_XENOMORPH

	data["factions"] = list()
	for(var/faction_name in SShuman_ai.human_ai_factions)
		var/datum/human_ai_faction/ai_faction = SShuman_ai.human_ai_factions[faction_name]
		data["factions"] += list(list(
			"name" = ai_faction.faction,
			"shoot_to_kill" = ai_faction.get_shoot_to_kill(),
			"friendly_factions" = english_list(ai_faction.get_friendly_factions()),
			"neutral_factions" = english_list(ai_faction.get_neutral_factions()),
			"ref" = REF(ai_faction),
		))
		data["datumless_factions"] -= ai_faction.faction

	return data

/datum/human_faction_management_menu/ui_static_data(mob/user)
	var/list/data = list()

	data["all_factions"] = FACTION_LIST_HUMANOID + FACTION_LIST_XENOMORPH

	return data

/datum/human_faction_management_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("create_faction")
			if(!params["faction"])
				return

			var/gotten_faction = params["faction"]
			if(gotten_faction in SShuman_ai.human_ai_factions)
				return

			var/datum/human_ai_faction/new_faction = new()
			new_faction.faction = gotten_faction
			SShuman_ai.human_ai_factions[new_faction.faction] = new_faction
			return TRUE

		if("set_shoot_to_kill")
			if(!params["new_value"] || !params["faction_name"])
				return

			var/gotten_faction = params["faction_name"]
			if(!(gotten_faction in SShuman_ai.human_ai_factions))
				return

			var/datum/human_ai_faction/faction_obj = SShuman_ai.human_ai_factions[gotten_faction]
			faction_obj.set_shoot_to_kill(text2num(params["new_value"]))
			return TRUE

		if("remove_neutral_faction")
			if(!params["faction"])
				return

			var/gotten_faction = params["faction"]
			if(!(gotten_faction in SShuman_ai.human_ai_factions))
				return

			var/datum/human_ai_faction/faction_obj = SShuman_ai.human_ai_factions[gotten_faction]
			var/gotten_input = tgui_input_list(ui.user, "Remove which faction being neutral to [gotten_faction]?", "Remove Neutral Faction", faction_obj.get_neutral_factions())
			if(!gotten_input)
				return

			faction_obj.remove_neutral_faction(gotten_input)
			return TRUE

		if("remove_friendly_faction")
			if(!params["faction"])
				return

			var/gotten_faction = params["faction"]
			if(!(gotten_faction in SShuman_ai.human_ai_factions))
				return

			var/datum/human_ai_faction/faction_obj = SShuman_ai.human_ai_factions[gotten_faction]
			var/gotten_input = tgui_input_list(ui.user, "Remove which faction being friendly to [gotten_faction]?", "Remove Friendly Faction", faction_obj.get_friendly_factions())
			if(!gotten_input)
				return

			faction_obj.remove_friendly_faction(gotten_input)
			return TRUE

		if("add_neutral_faction")
			if(!params["faction"])
				return

			var/gotten_faction = params["faction"]
			if(!(gotten_faction in SShuman_ai.human_ai_factions))
				return

			var/datum/human_ai_faction/faction_obj = SShuman_ai.human_ai_factions[gotten_faction]
			var/gotten_input = tgui_input_list(ui.user, "Set which faction being neutral to [gotten_faction]?", "Add Neutral Faction", (FACTION_LIST_HUMANOID + FACTION_LIST_XENOMORPH) - faction_obj.get_neutral_factions() - faction_obj.faction)
			if(!gotten_input)
				return

			faction_obj.add_neutral_faction(gotten_input)

		if("add_friendly_faction")
			if(!params["faction"])
				return

			var/gotten_faction = params["faction"]
			if(!(gotten_faction in SShuman_ai.human_ai_factions))
				return

			var/datum/human_ai_faction/faction_obj = SShuman_ai.human_ai_factions[gotten_faction]
			var/gotten_input = tgui_input_list(ui.user, "Set which faction being friendly to [gotten_faction]?", "Add Friendly Faction", (FACTION_LIST_HUMANOID + FACTION_LIST_XENOMORPH) - faction_obj.get_friendly_factions() - faction_obj.faction)
			if(!gotten_input)
				return

			faction_obj.add_friendly_faction(gotten_input)

/client/proc/open_human_faction_management_panel()
	set name = "Human Faction Management Panel"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	if(human_faction_menu)
		human_faction_menu.tgui_interact(mob)
		return

	human_faction_menu = new /datum/human_faction_management_menu(src)
	human_faction_menu.tgui_interact(mob)
