GLOBAL_LIST_EMPTY(human_ai_squad_presets)

/datum/human_squad_spawner_menu
	var/static/list/lazy_ui_data = list()

/datum/human_squad_spawner_menu/New()
	if(!length(GLOB.human_ai_squad_presets))
		for(var/datum/human_ai_squad_preset/squad_type as anything in subtypesof(/datum/human_ai_squad_preset))
			if(!squad_type::name)
				continue

			if(!lazy_ui_data[squad_type::faction])
				lazy_ui_data[squad_type::faction] = list()

			var/datum/human_ai_squad_preset/squad_obj = new squad_type()
			GLOB.human_ai_squad_presets["[squad_type]"] = squad_obj

			var/list/contains = list()
			for(var/datum/equipment_preset/equip_path as anything in squad_obj.ai_to_spawn)
				contains += "[squad_obj.ai_to_spawn[equip_path]]x [equip_path::name]"

			lazy_ui_data[squad_type::faction] += list(list(
				"name" = squad_obj.name,
				"description" = squad_obj.desc,
				"path" = squad_type,
				"contents" = contains,
			))


/datum/human_squad_spawner_menu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "HumanSquadSpawner")
		ui.open()

/datum/human_squad_spawner_menu/ui_state(mob/user)
	return GLOB.admin_state

/datum/human_squad_spawner_menu/ui_data(mob/user)
	var/list/data = list()

	return data

/datum/human_squad_spawner_menu/ui_static_data(mob/user)
	var/list/data = list()

	data["squads"] = lazy_ui_data

	return data

/datum/human_squad_spawner_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("create_squad")
			if(!params["path"])
				return

			var/gotten_path = params["path"]
			if(!gotten_path)
				return

			var/datum/human_ai_squad_preset/preset_squad = GLOB.human_ai_squad_presets[gotten_path]
			preset_squad.spawn_ai(get_turf(ui.user))
			return TRUE

/client/proc/open_human_squad_spawner_panel()
	set name = "Human Squad Spawner Panel"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	if(human_squad_menu)
		human_squad_menu.tgui_interact(mob)
		return

	human_squad_menu = new /datum/human_squad_spawner_menu(src)
	human_squad_menu.tgui_interact(mob)

/datum/human_ai_squad_preset
	var/name = ""
	var/desc = ""
	var/faction = FACTION_NEUTRAL
	/// First entry is marked as squad leader
	var/list/ai_to_spawn = list()

/datum/human_ai_squad_preset/proc/spawn_ai(turf/spawn_loc)
	var/list/viable_turfs = list()
	for(var/turf/open/floor/floor in range(1, spawn_loc))
		viable_turfs += floor

	var/datum/human_ai_squad/new_squad = SShuman_ai.create_new_squad()

	var/squad_leader_selected = FALSE
	for(var/datum/equipment_preset/ai_equipment as anything in ai_to_spawn)
		for(var/i in 1 to ai_to_spawn[ai_equipment])
			var/mob/living/carbon/human/ai_human = new(pick(viable_turfs))
			var/datum/component/human_ai/ai_comp = ai_human.AddComponent(/datum/component/human_ai)
			arm_equipment(ai_human, ai_equipment, TRUE)
			new_squad.add_to_squad(ai_comp.ai_brain)
			if(!squad_leader_selected)
				new_squad.set_squad_leader(ai_comp.ai_brain)
				squad_leader_selected = TRUE

/datum/human_ai_squad_preset/clf
	faction = FACTION_CLF

/datum/human_ai_squad_preset/clf/patrol
	name = "Patrol Squad"
	desc = "A small squad of CLF for patrolling."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier/ai = 3,
		/datum/equipment_preset/clf/soldier/ai/shotgunner = 1,
	)

/datum/human_ai_squad_preset/clf/breach
	name = "Breacher Squad"
	desc = "A small squad of CLF for close-quarters combat."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/engineer/ai = 1,
		/datum/equipment_preset/clf/soldier/ai/shotgunner = 2,
	)

/datum/human_ai_squad_preset/clf/at
	name = "Anti-Tank Team"
	desc = "A team consisting of a SADAR specialist and a rifleman, good for jumping a vehicle or unaware marines."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/specialist/ai = 1,
		/datum/equipment_preset/clf/soldier/ai = 1,
	)

/datum/human_ai_squad_preset/clf/ambush
	name = "Ambush Squad"
	desc = "A small squad of CLF for ambushing unaware targets in close-quarters."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/specialist/ai/flamer = 1,
		/datum/equipment_preset/clf/soldier/ai/shotgunner = 2,
	)

/datum/human_ai_squad_preset/clf/fortified
	name = "Fortified Squad"
	desc = "A decently-sized squad of CLF for holding a fortified position."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier/ai = 3,
		/datum/equipment_preset/clf/medic = 1,
		/datum/equipment_preset/clf/engineer/ai = 1,
	)

/datum/human_ai_squad_preset/clf/kill_team
	name = "Kill Team"
	desc = "A small kill-team of CLF for going into enemy territory."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/soldier/ai = 2,
		/datum/equipment_preset/clf/soldier/ai/shotgunner = 2,
		/datum/equipment_preset/clf/medic = 1,
	)

/datum/human_ai_squad_preset/clf/leader_escort
	name = "Leader Escort"
	desc = "A small squad of CLF for escorting a CLF leader."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/leader = 1,
		/datum/equipment_preset/clf/soldier/ai = 2,
	)


/datum/human_ai_squad_preset/clf/honor_guard
	name = "Honor Guard"
	desc = "A team of CLF headed by a smartgun-wielding cell commander. Use carefully."
	ai_to_spawn = list(
		/datum/equipment_preset/clf/commander = 1,
		/datum/equipment_preset/clf/soldier/ai = 3,
		/datum/equipment_preset/clf/medic = 1,
	)
