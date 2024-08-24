
GLOBAL_VAR_INIT(main_platoon_name, SQUAD_MARINE_1)
GLOBAL_VAR_INIT(main_platoon_initial_name, GLOB.main_platoon_name)

/// Ability to rename the platoon
/client/proc/game_master_rename_platoon()
	set name = "Rename Platoon Override"
	set category = "Game Master.Extras"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	rename_platoon()

/client/proc/commander_rename_platoon()
	set name = "Rename Platoon"
	set category = "OOC.Commander"

	if(GLOB.main_platoon_name != GLOB.main_platoon_initial_name)
		to_chat(src, SPAN_NOTICE("The platoon has already been renamed this round."))
		return

	rename_platoon()

/// Actually renames the platoon
/client/proc/rename_platoon()
	var/new_name = tgui_input_text(mob, "New platoon name?", "Platoon Name", GLOB.main_platoon_name)
	if(!new_name || !istext(new_name))
		return

	if(length(new_name) > 16)
		to_chat(src, SPAN_NOTICE("The platoon name should be 16 characters or less."))
		return

	var/old_name = GLOB.main_platoon_name

	var/channel = radiochannels[old_name]
	radiochannels -= old_name

	radiochannels[new_name] = channel

	var/list/keys_to_readd = list()

	for(var/key in department_radio_keys)
		if(department_radio_keys[key] == old_name)
			keys_to_readd += key
			department_radio_keys -= key

	for(var/key in keys_to_readd)
		department_radio_keys[key] = new_name

	ROLES_SQUAD_ALL -= old_name
	ROLES_SQUAD_ALL += new_name

	var/list/copy_frozen_platoon_items = GLOB.frozen_items[old_name]
	GLOB.frozen_items -= old_name
	GLOB.frozen_items[new_name] = copy_frozen_platoon_items

	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_PLATOON_NAME_CHANGE, new_name, old_name)

	log_admin("[key_name(src)] has renamed the platoon from [GLOB.main_platoon_name] to [new_name].")

	GLOB.main_platoon_name = new_name
