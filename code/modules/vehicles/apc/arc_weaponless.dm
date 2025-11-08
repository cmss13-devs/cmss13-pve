
/obj/vehicle/multitile/apc/arc/weaponless
	name = "M540-S Armored Recon Carrier"
	desc = "An M540-S Armored Recon Carrier, also known as an ARC. This is a much lighter and more nimble version to the M557A3 APC, often preferred by recon forces for that very reason. This variant has had it's weapons removed to lighten it's weight and improve it's stealth capabilities. Entrance on the right."

	icon_state = "arc_weaponless"

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
		/obj/item/hardpoint/support/flare_launcher,
		/obj/item/hardpoint/locomotion/apc_wheels/arc,
	)

/obj/vehicle/multitile/apc/arc/weaponless/add_seated_verbs(mob/living/M, seat)
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

/obj/vehicle/multitile/apc/arc/weaponless/remove_seated_verbs(mob/living/M, seat)
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

/obj/vehicle/multitile/apc/arc/weaponless/initialize_cameras(change_tag = FALSE)
	if(!camera)
		camera = new /obj/structure/machinery/camera/vehicle(src)
	if(change_tag)
		camera.c_tag = "#[rand(1,100)] M540-S \"[nickname]\" ARC"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior"
	else
		camera.c_tag = "#[rand(1,100)] M540-S ARC"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior"

/obj/vehicle/multitile/apc/arc/weaponless/set_muzzle_offsets(obj/item/hardpoint/HP)
	//sets muzzle flash offsets for APC weapons
	switch(HP.slot)
		if(HDPT_SUPPORT) //flare
			HP.muzzle_flash_pos = list(
				"1" = list(-4, -46),
				"2" = list(5, 11),
				"4" = list(-31, 6),
				"8" = list(31, -4)
			)
	return ..()

/*
** PRESETS SPAWNERS
*/
/obj/effect/vehicle_spawner/arc/weaponless
	name = "Weaponless ARC Spawner"
	icon = 'icons/obj/vehicles/arc.dmi'
	icon_state = "arc_weaponless"
	pixel_x = -48
	pixel_y = -48

/obj/effect/vehicle_spawner/arc/weaponless/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/arc/weaponless/spawn_vehicle()
	var/obj/vehicle/multitile/apc/arc/weaponless/APC = new (loc)

	load_misc(APC)
	load_hardpoints(APC)
	handle_direction(APC)
	APC.update_icon()

//PRESET: only wheels installed
/obj/effect/vehicle_spawner/arc/weaponless/plain/load_hardpoints(obj/vehicle/multitile/apc/arc/weaponless/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels/arc)

//PRESET: default hardpoints, destroyed
/obj/effect/vehicle_spawner/arc/weaponless/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/apc/arc/weaponless/APC = new (loc)

	load_misc(APC)
	load_hardpoints(APC)
	handle_direction(APC)
	load_damage(APC)
	APC.update_icon()

/obj/effect/vehicle_spawner/arc/weaponless/decrepit/load_hardpoints(obj/vehicle/multitile/apc/arc/weaponless/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels/arc)

//PRESET: default hardpoints
/obj/effect/vehicle_spawner/arc/weaponless/fixed/load_hardpoints(obj/vehicle/multitile/apc/arc/weaponless/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels/arc)
