
/obj/vehicle/multitile/apc/arc
	name = "M540 Armored Recon Carrier"
	desc = "An M540 Armored Recon Carrier, also known as an ARC. This is a much lighter and more nimble alternative to the M557A3 APC, often preferred by recon forces for that very reason. Entrance on the right."

	icon = 'icons/obj/vehicles/arc.dmi'
	icon_state = "arc_base"
	pixel_x = -48
	pixel_y = -48

	bound_width = 96
	bound_height = 96

	interior_map = /datum/map_template/interior/arc


	passengers_slots = 9

	entrances = list(
		"right" = list(-2, 0),
	)

	seats = list(
		VEHICLE_DRIVER = null,
		VEHICLE_GUNNER = null,
	)

	active_hp = list(
		VEHICLE_DRIVER = null,
		VEHICLE_GUNNER = null,
	)

	hardpoints_allowed = list(
		/obj/item/hardpoint/primary/arc_frontalcannon,
		/obj/item/hardpoint/support/flare_launcher,
		/obj/item/hardpoint/locomotion/apc_wheels/arc,
	)

	dmg_multipliers = list(
		"all" = 1,
		"acid" = 1.8,
		"slash" = 0.7,
		"bullet" = 0.8,
		"explosive" = 0.9,
		"blunt" = 0.7,
		"abstract" = 1,
	)

	move_max_momentum = 3
	move_momentum_build_factor = 1.8
	move_turn_momentum_loss_factor = 0.5

	wall_ram_damage = 75 //Supposedly super light? Still gonna do _some_ damage to walls though
	vehicle_ram_multiplier = 2

/obj/vehicle/multitile/apc/arc/add_seated_verbs(mob/living/M, seat)
	if(!M.client)
		return
	add_verb(M.client, list(
		/obj/vehicle/multitile/proc/get_status_info,
		/obj/vehicle/multitile/proc/open_controls_guide,
		/obj/vehicle/multitile/proc/name_vehicle,
	))
	if(seat == VEHICLE_DRIVER)
		add_verb(M.client, list(
			/obj/vehicle/multitile/proc/toggle_door_lock,
			/obj/vehicle/multitile/proc/switch_hardpoint,
			/obj/vehicle/multitile/proc/cycle_hardpoint,
			/obj/vehicle/multitile/proc/activate_horn,
		))
	else if(seat == VEHICLE_GUNNER)
		add_verb(M.client, list(
			/obj/vehicle/multitile/proc/switch_hardpoint,
			/obj/vehicle/multitile/proc/cycle_hardpoint,
		))

/obj/vehicle/multitile/apc/arc/remove_seated_verbs(mob/living/M, seat)
	if(!M.client)
		return
	remove_verb(M.client, list(
		/obj/vehicle/multitile/proc/get_status_info,
		/obj/vehicle/multitile/proc/open_controls_guide,
		/obj/vehicle/multitile/proc/name_vehicle,
	))
	SStgui.close_user_uis(M, src)
	if(seat == VEHICLE_DRIVER)
		remove_verb(M.client, list(
			/obj/vehicle/multitile/proc/toggle_door_lock,
			/obj/vehicle/multitile/proc/switch_hardpoint,
			/obj/vehicle/multitile/proc/cycle_hardpoint,
			/obj/vehicle/multitile/proc/activate_horn,
		))
	else if(seat == VEHICLE_GUNNER)
		remove_verb(M.client, list(
			/obj/vehicle/multitile/proc/switch_hardpoint,
			/obj/vehicle/multitile/proc/cycle_hardpoint,
		))

/obj/vehicle/multitile/apc/arc/initialize_cameras(change_tag = FALSE)
	if(!camera)
		camera = new /obj/structure/machinery/camera/vehicle(src)
	if(change_tag)
		camera.c_tag = "#[rand(1,100)] M540 \"[nickname]\" ARC"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior"
	else
		camera.c_tag = "#[rand(1,100)] M540 ARC"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior"

/obj/vehicle/multitile/apc/arc/set_muzzle_offsets(obj/item/hardpoint/HP)
	//sets muzzle flash offsets for APC weapons
	switch(HP.slot)
		if(HDPT_SUPPORT) //flare
			HP.muzzle_flash_pos = list(
				"1" = list(-4, -33),
				"2" = list(5, -2),
				"4" = list(-18, 6),
				"8" = list(18, -4)
			)
	return ..()

/*
** PRESETS SPAWNERS
*/
/obj/effect/vehicle_spawner/arc
	name = "ARC Spawner"
	icon = 'icons/obj/vehicles/arc.dmi'
	icon_state = "arc_base"
	pixel_x = -48
	pixel_y = -48

/obj/effect/vehicle_spawner/arc/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/arc/spawn_vehicle()
	var/obj/vehicle/multitile/apc/arc/APC = new (loc)

	load_misc(APC)
	load_hardpoints(APC)
	handle_direction(APC)
	APC.update_icon()

//PRESET: only wheels installed
/obj/effect/vehicle_spawner/arc/plain/load_hardpoints(obj/vehicle/multitile/apc/arc/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels/arc)

//PRESET: default hardpoints, destroyed
/obj/effect/vehicle_spawner/arc/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/apc/arc/APC = new (loc)

	load_misc(APC)
	load_hardpoints(APC)
	handle_direction(APC)
	load_damage(APC)
	APC.update_icon()

/obj/effect/vehicle_spawner/arc/decrepit/load_hardpoints(obj/vehicle/multitile/apc/arc/V)
	V.add_hardpoint(new /obj/item/hardpoint/primary/arc_frontalcannon)
	V.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels/arc)

//PRESET: default hardpoints
/obj/effect/vehicle_spawner/arc/fixed/load_hardpoints(obj/vehicle/multitile/apc/arc/V)
	V.add_hardpoint(new /obj/item/hardpoint/primary/arc_frontalcannon)
	V.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels/arc)
