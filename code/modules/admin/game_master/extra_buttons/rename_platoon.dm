
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

	do_rename_platoon(new_name, mob)

/proc/do_rename_platoon(name, mob/renamer)
	var/old_name = GLOB.main_platoon_name

	var/channel = GLOB.radiochannels[old_name]
	GLOB.radiochannels -= old_name

	GLOB.radiochannels[name] = channel

	var/list/keys_to_readd = list()

	for(var/key in GLOB.department_radio_keys)
		if(GLOB.department_radio_keys[key] == old_name)
			keys_to_readd += key
			GLOB.department_radio_keys -= key

	for(var/key in keys_to_readd)
		GLOB.department_radio_keys[key] = name

	GLOB.ROLES_SQUAD_ALL -= old_name
	GLOB.ROLES_SQUAD_ALL += name

	var/list/copy_frozen_platoon_items = GLOB.frozen_items[old_name]
	GLOB.frozen_items -= old_name
	GLOB.frozen_items[name] = copy_frozen_platoon_items

	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_PLATOON_NAME_CHANGE, name, old_name)

	log_admin("[key_name(renamer)] has renamed the platoon from [GLOB.main_platoon_name] to [name].")

	GLOB.main_platoon_name = name


/proc/change_dropship_camo(camo, mob/renamer)
	var/turf_icon
	var/cargo_icon
	var/cockpit_icon

	switch(camo)
		if(DROPSHIP_CAMO_TAN)
			turf_icon = 'icons/turf/dropship.dmi'
			cargo_icon = 'icons/obj/structures/doors/dropship1_cargo.dmi'
			cockpit_icon = 'icons/obj/structures/doors/dropship1_pilot.dmi'
		if(DROPSHIP_CAMO_NAVY)
			turf_icon = 'icons/turf/dropship2.dmi'
			cargo_icon = 'icons/obj/structures/doors/dropship2_cargo.dmi'
			cockpit_icon = 'icons/obj/structures/doors/dropship2_pilot.dmi'
		if(DROPSHIP_CAMO_URBAN)
			turf_icon = 'icons/turf/dropship3.dmi'
			cargo_icon = 'icons/obj/structures/doors/dropship2_cargo.dmi'
			cockpit_icon = 'icons/obj/structures/doors/dropship2_pilot.dmi'
		if(DROPSHIP_CAMO_JUNGLE)
			turf_icon = 'icons/turf/dropship4.dmi'
			cargo_icon = 'icons/obj/structures/doors/dropship4_cargo.dmi'
			cockpit_icon = 'icons/obj/structures/doors/dropship4_pilot.dmi'

	for(var/turf/closed/shuttle/midway/midway_turfs in world)
		if(istype(midway_turfs.loc, /area/shuttle/midway))
			midway_turfs.icon = turf_icon
	for(var/obj/structure/shuttle/part/midway/midway_parts in world)
		var/turf/turf_to_check = get_turf(midway_parts)
		if(istype(turf_to_check.loc, /area/shuttle/midway))
			midway_parts.icon = turf_icon
	for(var/obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear/cargo in world)
		var/turf/turf_to_check = get_turf(cargo)
		if(istype(turf_to_check.loc, /area/shuttle/midway))
			cargo.icon = cargo_icon
	for(var/obj/structure/machinery/door/airlock/hatch/cockpit/cockpit in world)
		var/turf/turf_to_check = get_turf(cockpit)
		if(istype(turf_to_check.loc, /area/shuttle/midway))
			cockpit.icon = cockpit_icon
