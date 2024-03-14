///Our props and other things that can be changed and are map-specific will initialize into this list.
GLOBAL_LIST_EMPTY(map_specific_trigger_atoms)

/client/proc/toggle_map_manipulation_menu()
	set name = "Map Manipulation Panel"
	set category = "Game Master.Extras"
	if(!check_rights(R_ADMIN))
		return

	if(src)
		var/datum/map_manipulation_menu/map_menu = new //Instance it, it doesn't need need to be persistent.
		map_menu.tgui_interact(mob)

/datum/map_manipulation_menu
	var/selected_z_level = 2 //Ground by default.
	var/percentage_to_break = 25 //By default we want to break at least 25% of all objects affected.
	var/confirmed_break = FALSE //So they're not constantly getting spammed with the alert.
	var/selected_map = GROUND_MAP //What we feed to the system if we have some custom options.

/datum/map_manipulation_menu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MapManipulation", "Map Manipulation")
		ui.open()
	user.client?.click_intercept = src

/datum/map_manipulation_menu/ui_data(mob/user)
	. = ..()

	var/data[0]

	data["selected_z_level"] = selected_z_level
	data["percentage_to_break"] = percentage_to_break
	data["selected_map"] = selected_map

	if(SSticker.current_state > GAME_STATE_STARTUP && length(GLOB.map_specific_trigger_atoms)) //Don't want to load the tab until pre-game is set up.
		data["map_specific_options"] = TRUE //Declare this true to enable the tab; the map name may or may not exist, and there are two possible map types.
		var/datum/map_config/map_to_manipulate = SSmapping.configs[selected_map]
		data["map_name"] = map_to_manipulate ? map_to_manipulate.map_name : null // Did it actually load in? If so, we send the name to the menu. Otherwise we show an error message.

	return data

/datum/map_manipulation_menu/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE

/datum/map_manipulation_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()

	if(params["map_destruction"])
		if(SSticker.current_state == GAME_STATE_STARTUP)
			to_chat(ui.user, SPAN_WARNING("The game is still setting up; please wait until initial setup is complete."))
			return FALSE
		if(!confirmed_break)
			if(tgui_alert(ui.user, "Are you sure you want to break stuff? This cannot be undone.", "Confirmation", list("Yes", "No")) != "Yes") return FALSE
			confirmed_break = TRUE //Triggered only once per menu.
		message_admins("[key_name_admin(ui.user)] is breaking something: Z-Level [selected_z_level] | [action]" + ( params["batch_damage"] ? null : " | [percentage_to_break]%") )

	var/actions[0] //Staggered list of actions to take. Initialized into an empty list.
	var/possible_maps[] = SSmapping.levels_by_trait(selected_map == GROUND_MAP ? ZTRAIT_GROUND : ZTRAIT_MARINE_MAIN_SHIP) //If we're actually changing something on the map.

	switch(action)
		//OPTIONS
		if("selected_z_level")
			var/new_z_level = text2num(params["z_value"])
			if(!isnum(new_z_level)) return FALSE
			selected_z_level = clamp(new_z_level, 0, 10)	//Shouldn't need to be higher than that.

		if("percentage_to_break")
			var/new_percentage = text2num(params["percentage"])
			if(!isnum(new_percentage)) return FALSE
			percentage_to_break = clamp(new_percentage, 0, 100)

		if("selected_map")
			selected_map = params["chosen_map"] //GROUND_MAP or SHIP_MAP.

		//PRESETS
		if("preset_light_damage") //Parameters for presets are set through params with the tgui menu.
			actions = list(\
				"break_all_machines", 10, \
				"break_gear_vendors", 20, \
				"break_normal_vendors", 15, \
				"break_computers", 20, \
				"break_apcs", 5, \
				"break_cameras", 10, \
				"break_gun_racks", 15, \
				"break_grilles", 15, \
				"break_windows", 10, \
				"break_large_crates", 20, \
				"break_racks", 10, \
				"break_reagent_tanks", 15,\
				"damage_walls", 5, \
				"damage_floors", 5, \
				"destroy_guns", 20, \
				"destroy_devices", 20, \
				"destroy_item_storage", 15, \
				"destroy_clothing", 20, \
				"destroy_food", 20)

		if("preset_moderate_damage")
			actions = list(\
				"break_all_machines", 35,\
				"break_gear_vendors", 45,\
				"break_normal_vendors", 30,\
				"break_computers", 50,\
				"break_apcs", 35,\
				"break_lights", 40,\
				"break_cameras", 30,\
				"break_comm_towers", 50,\
				"break_airlocks", 35,\
				"break_gun_racks", 35, \
				"break_mirrors", 30,\
				"break_grilles", 45,\
				"break_fences", 30,\
				"damage_barricades", 45,\
				"break_windows", 30,\
				"break_window_frames", 15,\
				"break_chairs_and_beds", 35,\
				"break_tables", 30,\
				"break_lockers", 20,\
				"break_large_crates", 50,\
				"break_racks", 30,\
				"break_reagent_tanks", 35,\
				"break_powerloaders", 40,\
				"damage_walls", 20,\
				"damage_floors", 20,\
				"destroy_all_items", 30,\
				"destroy_guns", 50,\
				"destroy_ammo", 60,\
				"destroy_weapons", 35,\
				"destroy_devices", 40,\
				"destroy_item_storage", 30,\
				"destroy_clothing", 30,\
				"destroy_reagent_containers", 40,\
				"destroy_food", 60)

		if("preset_heavy_damage")
			actions = list(\
				"break_all_machines", 60,\
				"break_gear_vendors", 80,\
				"break_normal_vendors", 70,\
				"break_computers", 80,\
				"break_apcs", 55,\
				"break_lights", 70,\
				"break_cameras", 60,\
				"break_comm_towers", 100,\
				"break_airlocks", 65,\
				"break_gun_racks", 80, \
				"break_mirrors", 95,\
				"break_grilles", 75,\
				"break_fences", 75,\
				"damage_barricades", 85,\
				"break_windows", 55,\
				"break_window_frames", 30,\
				"break_chairs_and_beds", 65,\
				"break_tables", 60,\
				"break_lockers", 40,\
				"break_large_crates", 70,\
				"break_racks", 55,\
				"break_reagent_tanks", 70,\
				"break_powerloaders", 90,\
				"damage_walls", 45,\
				"damage_floors", 50,\
				"destroy_all_items", 55,\
				"destroy_guns", 80,\
				"destroy_ammo", 90,\
				"destroy_weapons", 60,\
				"destroy_devices", 80,\
				"destroy_item_storage", 90,\
				"destroy_clothing", 90,\
				"destroy_reagent_containers", 80,\
				"destroy_food", 90)

		//SPECIFIC MAP MANIPULATION
		//If the map has unique things it can do, it stills need individual cases here.

	//	if("toggle_marker_visibility")
		//	var/obj/effect/map_marker


		//BLACKSTONE BRIDGE aka Whiskey Outpost Re-Imagined.
		if("blackstone_toggle_blocker")
			var/obj/structure/blocker/rock_debris/I
			var/signal_id = params["blocker_id"]
			for(I in GLOB.map_specific_trigger_atoms)
				if(I.z in possible_maps)
					I.toggle_blocker(signal_id)

		if("blackstone_toggle_hatch")
			var/obj/structure/ladder/hatch/I
			var/signal_id = params["hatch_to_unlock"]
			for(I in GLOB.map_specific_trigger_atoms)
				if(I.z in possible_maps)
					I.toggle_lock(signal_id)

		if("blackstone_flicker_light")
			var/path_to_use = text2path("/area/whiskey_outpost/blackstone/underground[params["area_to_flicker"]]")
			var/area/whiskey_outpost/blackstone/underground/maintenance/A = locate(path_to_use)
			if(A) //Could be that we can't find it.
				var/obj/structure/machinery/light/I
				for(I in A)
					if(prob(70)) I.flicker(rand(5,10))

		if("blackstone_toggle_gate")
			var/obj/structure/machinery/door/poddoor/tunnel/I
			var/signal_id = params["gate_to_open"]
			for(I in GLOB.map_specific_trigger_atoms)
				if(I.z in possible_maps)
					I.toggle_pod_door(signal_id)

		if("blackstone_spawn_ambush")
			var/obj/effect/landmark/tunnel_ambush/I
			var/turf/T
			var/obj/structure/tunnel/U
			var/turf/closed/wall/W
			for(I in GLOB.map_specific_trigger_atoms)
				if(I.z in possible_maps)
					if(prob(20)) //We don't want to spam too many of these.
						T = get_turf(I)
						T = T.ChangeTurf(/turf/open/gm/dirt2) //Looks better with a tunnel attached.
						for(W in orange(1, T)) //We want to tile this properly with everything around it.
							W.update_connections(FALSE)
							W.update_icon()
						U = new(T)
						U.id = length(GLOB.map_specific_trigger_atoms)
						qdel(I)

		else actions = list(action, percentage_to_break) //Everything else falls into here.

	//BREAKING STUFF

	var/specified_percentage_to_break //Temporary so that we can override it for a preset batch.

	while(length(actions))
		specified_percentage_to_break = actions[2] //Always position 2.

		switch(actions[1]) //The action is in position 1.
			//MACHINES
			if("break_all_machines")
				var/obj/structure/machinery/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.ex_act(EXPLOSION_THRESHOLD_MEDIUM)
					//	I.INVOKE_ASYNC(I, PROC_REF(ex_act), EXPLOSION_THRESHOLD_MEDIUM)

			if("break_gear_vendors")
				var/obj/structure/machinery/cm_vending/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						if(prob(25)) I.tip_over()
						I.malfunction()
					//	INVOKE_ASYNC(I, TYPE_PROC_REF(/obj/structure/machinery/cm_vending, malfunction))
					//  INVOKE_ASYNC(I, SOURCE_PROC_REF(I, malfunction))

			if("break_normal_vendors")
				var/obj/structure/machinery/vending/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						if(prob(25)) I.tip_over() //This calls malfunction()
						else I.malfunction()
					//	I.INVOKE_ASYNC(I, PROC_REF(malfunction))

			if("break_computers")
				var/obj/structure/machinery/computer/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.set_broken()
					//	I.INVOKE_ASYNC(I, PROC_REF(set_broken))

			if("break_apcs")
				var/obj/structure/machinery/power/apc/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						//Copypasted from alien attacks. Exposes the wires and cuts each one.
						for(var/wire = 1; wire <= length(I.get_wire_descriptions()); wire++)
							if(!I.isWireCut(wire))
								I.cut(wire, null, FALSE) //User is nulled. FALSE means there is no message.
						I.wiresexposed = TRUE
						if(prob(50)) I.set_broken() //This destroys it.
						else I.update_icon()

			if("break_lights")
				var/obj/structure/machinery/light/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.broken(TRUE) //TRUE so that it doesn't play sparks and the sound.

			if("break_cameras")
				var/obj/structure/machinery/camera/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.wires = 0 //wires all cut
						I.light_disabled = 0
						I.toggle_cam_status(null, TRUE) //TRUE means there is no message. So the user is also passed as null.

			if("break_comm_towers")
				var/obj/structure/machinery/telecomms/relay/preset/tower/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.update_health(I.health / rand(1,4)) //Gives it a random amount of damage based on max health.

			if("break_airlocks")
				var/obj/structure/machinery/door/airlock/I
				for(I in machines)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.break_or_seal()

			//STRUCTURES
			if("break_all_structures")
				var/obj/structure/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.ex_act(EXPLOSION_THRESHOLD_MEDIUM)
					//	I.INVOKE_ASYNC(I, PROC_REF(ex_act), EXPLOSION_THRESHOLD_MEDIUM)

			if("break_gun_racks")
				var/obj/structure/gun_rack/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						//Could use floor(), but I am not sure if we have access to it yet.
						I.empty_out(round(I.max_stored * pick(200;1, 60;0.8, 30;0.6)))

			if("break_mirrors")
				var/obj/structure/mirror/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.shatter()

			if("break_grilles")
				var/obj/structure/grille/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.health = 0
						I.healthcheck()

			if("break_fences")
				var/obj/structure/fence/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.health = 0
						I.healthcheck()

			if("damage_barricades")
				var/obj/structure/barricade/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.update_health( (I.health / rand(1,4)) , TRUE) //TRUE so that it hides the message.

			if("break_windows")
				var/obj/structure/window/I
				for(I in world)
					if(I.z == selected_z_level && !I.not_damageable && prob(specified_percentage_to_break))
						I.shatter_window(TRUE) //TRUE to create debris.

			if("break_window_frames")
				var/obj/structure/window_frame/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.deconstruct(TRUE) //As though it was disassembled, so it creates metal.

			if("break_chairs_and_beds")
				var/obj/structure/bed/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.deconstruct(FALSE)

			if("break_tables")
				var/obj/structure/surface/table/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						if(prob(35) && I.flip(pick(1,2,4,8), FALSE, TRUE)) //We'll try to flip it normally. Hide the message so it doesn't spam us.
						else I.deconstruct(FALSE) //If that doesn't work, we deconstruct it instead.

			if("break_lockers")
				var/obj/structure/closet/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.deconstruct(FALSE)

			if("break_large_crates")
				var/obj/structure/largecrate/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.unpack()

			if("break_racks")
				var/obj/structure/surface/rack/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.deconstruct(prob(30) ? TRUE : FALSE) //Smaller chance to have them deconstructed into parts.

			if("break_reagent_tanks")
				var/obj/structure/reagent_dispensers/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.health -= I.health / rand(1,3)
						I.healthcheck()

			if("break_powerloaders") //Not really structures, but they leave structures upon destruction.
				var/obj/vehicle/powerloader/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						I.health -= I.health / rand(1,3)
						if(I.health <= 0) I.explode()

			//TURFS
			if("damage_walls")
				var/turf/closed/wall/I
				var/batch_damage = params["batch_damage"]
				var/enable_bullet_holes = params["bullet_holes"]
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						switch(batch_damage) //For batch processing.
							if(2)
								if(prob(20)) I.current_bulletholes = TRUE
							if(3)
								if(prob(40)) I.current_bulletholes = TRUE
							else //For not-batch processing, like if it's null.
								if(enable_bullet_holes) I.current_bulletholes = TRUE
						I.take_damage(I.damage_cap / rand(1,6), null)

			if("damage_floors")
				var/turf/open/floor/I
				var/obj/structure/pipes/P
				var/obj/structure/disposalpipe/junction/D
				var/break_pipes = params["break_pipes"]
				var/batch_damage = params["batch_damage"]
				var/add_dirt = params["add_dirt"]
				var/enable_pipe_break //Do we want to break pipes while we're breaking floors?
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))

						switch(batch_damage)
							if(2)
								if(prob(35)) new /obj/effect/decal/cleanable/dirt(I)
							if(3)
								if(prob(65)) new /obj/effect/decal/cleanable/dirt(I)
							else
								if(add_dirt)
									new /obj/effect/decal/cleanable/dirt(I)
									continue //Only adds dirt, doesn't destroy or damage.

						if(prob(65)) I.break_tile()//More damaged, fewer are turned into plating.
						else I.break_tile_to_plating()

						enable_pipe_break = FALSE
						switch(batch_damage)
							if(2)
								if(prob(20)) enable_pipe_break = TRUE
							if(3)
								if(prob(50)) enable_pipe_break = TRUE
							else
								if(break_pipes) enable_pipe_break = TRUE

						if(enable_pipe_break)
							for(P in I)
								if(prob(55)) new /obj/item/pipe(I, null, null, P)
								qdel(P)
							for(D in I)
								D.deconstruct(prob(40) ? TRUE : FALSE)

			//ITEMS //These are just qdeleted. They don't have any damage states.
			if("destroy_all_items")
				var/obj/item/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						qdel(I)

			if("destroy_guns")
				var/obj/item/weapon/gun/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						qdel(I)

			if("destroy_ammo")
				var/obj/item/ammo_magazine/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						qdel(I)

			if("destroy_weapons")
				var/obj/item/weapon/I
				for(I in world)
					if(I.z == selected_z_level && !istype(I, /obj/item/weapon/gun) && prob(specified_percentage_to_break)) //Don't want guns here. A little messy, but it should be fine.
						qdel(I)

			if("destroy_devices")
				var/obj/item/device/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						qdel(I)

			if("destroy_item_storage")
				var/obj/item/storage/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						qdel(I)

			if("destroy_clothing")
				var/obj/item/clothing/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						qdel(I)

			if("destroy_reagent_containers")
				var/obj/item/reagent_container/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						qdel(I)

			if("destroy_food")
				var/obj/item/reagent_container/food/I
				for(I in world)
					if(I.z == selected_z_level && prob(specified_percentage_to_break))
						qdel(I)

		actions.Cut(1,2) //Removes the first two entries.
	/*
			/obj/structure/machinery/door/window
			take_damage(damage)
	*/