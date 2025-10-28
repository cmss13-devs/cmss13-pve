/obj/vehicle/multitile/tank/aev
	name = "M34E1 Buckner Armored Engineering Vehicle"
	desc = "A giant piece of armor with a plow, you know what to do. Entrance in the back."
	desc_lore = "M34E1 is an extremely rare vehicle in the arsenal of USCMC. Developed after Operation Odolla Onslaught conducted by the forces of the USS Stalwart against a massive local insurrection. Being pinned down with improvised mortars and surrounded by IEDs, marines of 1/2 \"Iron Heads\" outfitted a Longstreet tank with improvised armor and mine plow, sending it unmanned into a minefield and allowing for a quick assault against enemy positions. MEUCOM took notice of this event, and after record-breaking 3 months of development and 10 million dollars of cost introduced M34E1 in limited numbers."

	icon_state = "aev_base"

	hardpoints_allowed = list(
		/obj/item/hardpoint/support/overdrive_enhancer,
		/obj/item/hardpoint/support/smoke_launcher/aev,
		/obj/item/hardpoint/secondary/m56cupola/aev,
		/obj/item/hardpoint/armor/ballistic,
		/obj/item/hardpoint/armor/caustic,
		/obj/item/hardpoint/armor/concussive,
		/obj/item/hardpoint/armor/paladin,
		/obj/item/hardpoint/armor/snowplow,
		/obj/item/hardpoint/locomotion/treads,
		/obj/item/hardpoint/locomotion/treads/robust,
	)

	required_skill = SKILL_VEHICLE_LARGE
	interior_map = /datum/map_template/interior/aev

	active_hp = list(VEHICLE_DRIVER = null)

	explosive_resistance = 750

	passengers_slots = 15

	move_max_momentum = 2.2 //No turret and autoloader systems, saves on overall weight so moves quicker
	move_momentum_build_factor = 1.5
	move_turn_momentum_loss_factor = 0.6
	wall_ram_damage = 600

/obj/vehicle/multitile/tank/aev/initialize_cameras(change_tag = FALSE)
	if(!camera)
		camera = new /obj/structure/machinery/camera/vehicle(src)
	if(change_tag)
		camera.c_tag = "#[rand(1,100)] M34E1 \"[nickname]\" AEV"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior" //this fluff allows it to be at the start of cams list
	else
		camera.c_tag = "#[rand(1,100)] M34E1 AEV"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior" //this fluff allows it to be at the start of cams list

/obj/vehicle/multitile/tank/aev/add_seated_verbs(mob/living/user, seat)
	if(!user.client)
		return
	add_verb(user.client, list(
		/obj/vehicle/multitile/proc/switch_hardpoint,
		/obj/vehicle/multitile/proc/get_status_info,
		/obj/vehicle/multitile/proc/open_controls_guide,
		/obj/vehicle/multitile/proc/name_vehicle,
	))
	user.client.change_view(view_boost, seat)
	user.client.pixel_x = 0
	user.client.pixel_y = 0
	if(seat == VEHICLE_DRIVER)
		add_verb(user.client, list(
			/obj/vehicle/multitile/proc/toggle_door_lock,
			/obj/vehicle/multitile/proc/activate_horn,
			/obj/vehicle/multitile/proc/cycle_hardpoint,
		))

/obj/vehicle/multitile/tank/aev/remove_seated_verbs(mob/living/user, seat)
	if(!user.client)
		return
	remove_verb(user.client, list(
		/obj/vehicle/multitile/proc/get_status_info,
		/obj/vehicle/multitile/proc/open_controls_guide,
		/obj/vehicle/multitile/proc/name_vehicle,
		/obj/vehicle/multitile/proc/switch_hardpoint,
	))
	user.client.change_view(GLOB.world_view_size, seat)
	user.client.pixel_x = 0
	user.client.pixel_y = 0
	SStgui.close_user_uis(user, src)
	if(seat == VEHICLE_DRIVER)
		remove_verb(user.client, list(
			/obj/vehicle/multitile/proc/toggle_door_lock,
			/obj/vehicle/multitile/proc/activate_horn,
			/obj/vehicle/multitile/proc/cycle_hardpoint,
		))

/obj/vehicle/multitile/tank/aev/load_hardpoints()
	return

/obj/vehicle/multitile/tank/aev/desert
	desc = "A giant piece of armor with a plow, you know what to do. Entrance in the back. Painted in an arid-environment camo scheme."
	icon_state = "aev_base_d"

/obj/vehicle/multitile/tank/aev/jungle
	desc = "A giant piece of armor with a plow, you know what to do. Entrance in the back. Painted in a lush-environment camo scheme."
	icon_state = "aev_base_j"

/obj/vehicle/multitile/tank/aev/night
	desc = "A giant piece of armor with a plow, you know what to do. Entrance in the back. Painted in a night-environment camo scheme."
	icon_state = "aev_base_n"

/obj/effect/vehicle_spawner/aev
	name = "AEV Spawner"
	icon = 'icons/obj/vehicles/tank.dmi'
	icon_state = "aev_base"
	pixel_x = -48
	pixel_y = -48

/obj/effect/vehicle_spawner/aev/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

/obj/effect/vehicle_spawner/aev/spawn_vehicle()
	var/obj/vehicle/multitile/tank/aev/AEV = new(loc)

	load_misc(AEV)
	load_hardpoints(AEV)
	handle_direction(AEV)
	AEV.update_icon()

	return AEV

/obj/effect/vehicle_spawner/aev/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/armor/snowplow)
	V.add_hardpoint(new /obj/item/hardpoint/support/overdrive_enhancer)
	V.add_hardpoint(new /obj/item/hardpoint/secondary/m56cupola/aev)
	V.add_hardpoint(new /obj/item/hardpoint/support/smoke_launcher/aev)

/obj/effect/vehicle_spawner/aev/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/tank/aev/AEV = new(loc)

	load_misc(AEV)
	handle_direction(AEV)
	load_hardpoints(AEV)
	load_damage(AEV)
	AEV.update_icon()

//DESERT CAMO PRESET
/obj/effect/vehicle_spawner/aev/desert/spawn_vehicle()
	var/obj/vehicle/multitile/tank/aev/desert/AEV = new(loc)

	load_misc(AEV)
	load_hardpoints(AEV)
	handle_direction(AEV)
	AEV.update_icon()

	return AEV

/obj/effect/vehicle_spawner/aev/desert/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/armor/snowplow)
	V.add_hardpoint(new /obj/item/hardpoint/support/overdrive_enhancer)
	V.add_hardpoint(new /obj/item/hardpoint/secondary/m56cupola/aev)
	V.add_hardpoint(new /obj/item/hardpoint/support/smoke_launcher/aev)

//JUNGLE CAMO PRESET
/obj/effect/vehicle_spawner/aev/jungle/spawn_vehicle()
	var/obj/vehicle/multitile/tank/aev/jungle/AEV = new(loc)

	load_misc(AEV)
	load_hardpoints(AEV)
	handle_direction(AEV)
	AEV.update_icon()

	return AEV

/obj/effect/vehicle_spawner/aev/jungle/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/armor/snowplow)
	V.add_hardpoint(new /obj/item/hardpoint/support/overdrive_enhancer)
	V.add_hardpoint(new /obj/item/hardpoint/secondary/m56cupola/aev)
	V.add_hardpoint(new /obj/item/hardpoint/support/smoke_launcher/aev)

//NIGHT/URBAN CAMO PRESET
/obj/effect/vehicle_spawner/aev/night/spawn_vehicle()
	var/obj/vehicle/multitile/tank/aev/night/AEV = new(loc)

	load_misc(AEV)
	load_hardpoints(AEV)
	handle_direction(AEV)
	AEV.update_icon()

	return AEV

/obj/effect/vehicle_spawner/aev/night/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/armor/snowplow)
	V.add_hardpoint(new /obj/item/hardpoint/support/overdrive_enhancer)
	V.add_hardpoint(new /obj/item/hardpoint/secondary/m56cupola/aev)
	V.add_hardpoint(new /obj/item/hardpoint/support/smoke_launcher/aev)
