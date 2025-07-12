/obj/vehicle/multitile/tank/upptank
	name = "Cheetah 2A Light Tank"
	desc = "The Cheetah 2A is an assault tank designed to be rapidly deployed from light dropcraft in daring raids and first strike operations. The Cheetah 2A is relatively new in comparison to most UPP vehicles seen on the Frontier, but has already earned a fair reputation as a reliable workhorse, that is able to bring some cutting edge technology to the fight. While the project was based in Germany, the Cheetah 2A has a truly progressive development history, seeing influences from nearly all UPP member states."

	icon = 'icons/obj/vehicles/upptank.dmi'
	icon_state = "tank_base"
	pixel_x = -48
	pixel_y = -48

	bound_width = 96
	bound_height = 96

	bound_x = -32
	bound_y = -32

	interior_map = /datum/map_template/interior/upptank

	passengers_slots = 4
	//this is done in case VCs die inside the tank, so that someone else can come in and take them out.
	revivable_dead_slots = 2
	xenos_slots = 4

	entrances = list(
		"back" = list(0, 2)
	)

	movement_sound = 'sound/vehicles/tank_driving.ogg'
	honk_sound = 'sound/vehicles/honk_3_ambulence.ogg'

	required_skill = SKILL_VEHICLE_LARGE

	vehicle_flags = VEHICLE_CLASS_MEDIUM

	move_max_momentum = 2
	move_momentum_build_factor = 1.5
	move_turn_momentum_loss_factor = 0.6

	light_range = 4

	// Rest (all the guns) is handled by the tank turret hardpoint
	hardpoints_allowed = list(
		/obj/item/hardpoint/holder/tank_turret/uppturret,
		/obj/item/hardpoint/support/weapons_sensor,
		/obj/item/hardpoint/support/overdrive_enhancer,
		/obj/item/hardpoint/support/artillery_module,
		/obj/item/hardpoint/armor/reactive,
		/obj/item/hardpoint/locomotion/treads,
		/obj/item/hardpoint/locomotion/treads/robust,
	)

	seats = list(
		VEHICLE_DRIVER = null,
		VEHICLE_GUNNER = null,
	)

	active_hp = list(
		VEHICLE_DRIVER = null,
		VEHICLE_GUNNER = null,
	)

	dmg_multipliers = list(
		"all" = 1,
		"acid" = 0.5,
		"slash" = 1.6,
		"bullet" = 0.4,
		"explosive" = 0.8,
		"blunt" = 0.8,
		"abstract" = 1
	)

	explosive_resistance = 500

/obj/vehicle/multitile/tank/upptank/initialize_cameras(change_tag = FALSE)
	if(!camera)
		camera = new /obj/structure/machinery/camera/vehicle(src)
	if(change_tag)
		camera.c_tag = "#[rand(1,100)] Cheetah 2A \"[nickname]\" Tank" //this fluff allows it to be at the start of cams list
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior" //this fluff allows it to be at the start of cams list
	else
		camera.c_tag = "#[rand(1,100)] Cheetah 2A Tank"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior" //this fluff allows it to be at the start of cams list

/obj/vehicle/multitile/tank/upptank/load_hardpoints()
	add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)

/*
** PRESETS SPAWNERS
*/
/obj/effect/vehicle_spawner/upptank
	name = "Tank Spawner"
	icon = 'icons/obj/vehicles/upptank.dmi'
	icon_state = "tank_base"
	pixel_x = -48
	pixel_y = -48

/obj/effect/vehicle_spawner/upptank/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

//PRESET: turret, no hardpoints (not the one without turret for convenience, you still expect to have turret when you spawn "no hardpoints tank")
/obj/effect/vehicle_spawner/upptank/spawn_vehicle()
	var/obj/vehicle/multitile/tank/upptank/TANK = new (loc)

	load_misc(TANK)
	load_hardpoints(TANK)
	handle_direction(TANK)
	TANK.update_icon()

	return TANK

/obj/effect/vehicle_spawner/upptank/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)

//PRESET: turret, treads installed
/obj/effect/vehicle_spawner/upptank/plain/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/upptank/hull/load_hardpoints(obj/vehicle/multitile/tank/V)
	return

//Just the hull and it's broken TOO, you get the full experience
/obj/effect/vehicle_spawner/upptank/hull/broken/spawn_vehicle()
	var/obj/vehicle/multitile/tank/tonk = ..()
	load_damage(tonk)
	tonk.update_icon()

//PRESET: default hardpoints, destroyed
/obj/effect/vehicle_spawner/upptank/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/tank/upptank/TANK = new (loc)

	load_misc(TANK)
	handle_direction(TANK)
	load_hardpoints(TANK)
	load_damage(TANK)
	TANK.update_icon()

/obj/effect/vehicle_spawner/upptank/decrepit/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/weapons_sensor)
	V.add_hardpoint(new /obj/item/hardpoint/armor/reactive)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)
	for(var/obj/item/hardpoint/holder/tank_turret/uppturret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/cannon/p17702)
		TT.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher/upptank)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/t60p3m)
		break

//PRESET: default hardpoints, No Armor
/obj/effect/vehicle_spawner/upptank/fixed/non_armor/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/weapons_sensor)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)
	for(var/obj/item/hardpoint/holder/tank_turret/uppturret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/cannon/p17702)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/t60p3m)
		TT.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher/upptank)
		break


//PRESET: default hardpoints, MG secondaries
/obj/effect/vehicle_spawner/upptank/fixed/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/weapons_sensor)
	V.add_hardpoint(new /obj/item/hardpoint/armor/reactive)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)
	for(var/obj/item/hardpoint/holder/tank_turret/uppturret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/cannon/p17702)
		TT.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher/upptank)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/t60p3m)
		break

//PRESET: TOW hardpoints, TOW launcher secondaries
/obj/effect/vehicle_spawner/upptank/fixed/tow/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/weapons_sensor)
	V.add_hardpoint(new /obj/item/hardpoint/armor/reactive)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)
	for(var/obj/item/hardpoint/holder/tank_turret/uppturret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/cannon/p17702)
		TT.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher/upptank)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/hj35launcher/upptank)
		break

//PRESET: Anti-Armored hardpoints, MG secondaries, Railgun
/obj/effect/vehicle_spawner/upptank/fixed/railgun/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/weapons_sensor)
	V.add_hardpoint(new /obj/item/hardpoint/armor/reactive)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)
	for(var/obj/item/hardpoint/holder/tank_turret/uppturret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/cannon/railgun)
		TT.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher/upptank)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/t60p3m)
		break


//PRESET: Anti-Armored Sniper hardpoints, MG secondaries, Railgun
/obj/effect/vehicle_spawner/upptank/fixed/sniper_railgun/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/artillery_module)
	V.add_hardpoint(new /obj/item/hardpoint/armor/reactive)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/holder/tank_turret/uppturret)
	for(var/obj/item/hardpoint/holder/tank_turret/uppturret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/cannon/railgun)
		TT.add_hardpoint(new /obj/item/hardpoint/support/flare_launcher/upptank)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/t60p3m)
		break
