/obj/vehicle/multitile/apc/movie/aa
	name = "M579 Aerial-Defence System Carrier"
	desc = "A modification to the venerable M577 Armored Personnel Carrier, equipped with weapons systems tailored to target airborne threats. Comes with limited passenger capacity, entrance on the right."

	interior_map = /datum/map_template/interior/apc_aa

	hardpoints_allowed = list(
		/obj/item/hardpoint/primary/aa_quadcannon,
		/obj/item/hardpoint/secondary/towlauncher/aa,
		/obj/item/hardpoint/support/flare_launcher,
		/obj/item/hardpoint/locomotion/apc_wheels,
	)

	passengers_slots = 10

/obj/vehicle/multitile/apc/movie/aa/initialize_cameras(change_tag = FALSE)
	if(!camera)
		camera = new /obj/structure/machinery/camera/vehicle(src)
	if(change_tag)
		camera.c_tag = "#[rand(1,100)] M579 \"[nickname]\" ADS-C"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior"
	else
		camera.c_tag = "#[rand(1,100)] M579 ADS-C"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior"

/obj/vehicle/multitile/apc/movie/aa/set_muzzle_offsets(obj/item/hardpoint/HP)
	//sets muzzle flash offsets for APC weapons as appropriate for the movie APC, may need adjustment for AA weapons
	switch(HP.slot)
		if(HDPT_PRIMARY) //quadcannons
			HP.muzzle_flash_pos = list(
				"1" = list(10, -33),
				"2" = list(28, 28),
				"4" = list(-10, 26),
				"8" = list(37, 9)
			)
		if(HDPT_SECONDARY) //frontmissiles
			HP.muzzle_flash_pos = list(
				"1" = list(34, 76),
				"2" = list(-1, -76),
				"4" = list(94, -7),
				"8" = list(-62, 12)
			)
		if(HDPT_SUPPORT) //flare
			HP.muzzle_flash_pos = list(
				"1" = list(22, -13),
				"2" = list(11, 22),
				"4" = list(2, 10),
				"8" = list(30, 24)
			)

/*
** PRESETS SPAWNERS
*/
/obj/effect/vehicle_spawner/apc_aa
	name = "Anti-Air APC Spawner"
	icon = 'icons/obj/vehicles/movieapc.dmi'
	icon_state = "apc_base_movie"
	pixel_x = -64
	pixel_y = -64

/obj/effect/vehicle_spawner/apc_aa/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/apc_aa/spawn_vehicle()
	var/obj/vehicle/multitile/apc/movie/aa/APC = new (loc)

	load_misc(APC)
	load_hardpoints(APC)
	handle_direction(APC)
	APC.update_icon()

//PRESET: only wheels installed
/obj/effect/vehicle_spawner/apc_aa/plain/load_hardpoints(obj/vehicle/multitile/apc/movie/aa/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels)

//PRESET: default hardpoints, destroyed
/obj/effect/vehicle_spawner/apc_aa/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/apc/movie/aa/APC = new (loc)

	load_misc(APC)
	load_hardpoints(APC)
	handle_direction(APC)
	load_damage(APC)
	APC.update_icon()

/obj/effect/vehicle_spawner/apc_aa/decrepit/load_hardpoints(obj/vehicle/multitile/apc/movie/aa/V)
	V.add_hardpoint(new /obj/item/hardpoint/primary/aa_quadcannon)
	V.add_hardpoint(new /obj/item/hardpoint/secondary/towlauncher/aa)
	V.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels)

//PRESET: default hardpoints
/obj/effect/vehicle_spawner/apc_aa/fixed/load_hardpoints(obj/vehicle/multitile/apc/movie/aa/V)
	V.add_hardpoint(new /obj/item/hardpoint/primary/aa_quadcannon)
	V.add_hardpoint(new /obj/item/hardpoint/secondary/towlauncher/aa)
	V.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/apc_wheels)
