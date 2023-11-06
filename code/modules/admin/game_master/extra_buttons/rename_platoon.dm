
GLOBAL_VAR_INIT(main_platoon_name, SQUAD_MARINE_1)

/// Ability to rename the platoon
/client/proc/rename_platoon()
	set name = "Rename Platoon"
	set category = "Game Master.Extras"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	var/new_name = tgui_input_text(mob, "New platoon name?", "Platoon Name", GLOB.main_platoon_name)
	if(!new_name || !istext(new_name))
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

	GLOB.main_platoon_name = new_name
