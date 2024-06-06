/obj/vehicle/multitile/tank/aev
	name = "M34E1 Armored Engineering Vehicle"
	desc = "A giant piece of armor with a plow, you know what to do. Entrance in the back."
	desc_lore = "M34E1 is an extremely rare vehicle in the arsenal of USCMC that was developed after Operation Odolla Onslaught conducted by USS Stalwart forces against massive CLF insurrection. Being pinned down with improvised mortars and surrounded by IEDs, marines of 1/2 \"Iron Heads\" outfitted a Longstreet tank with improvised armor and mine plow, sending it unmanned into a minefield and allowing for a quick assault against enemy positions. MEUCOM took notice of this event, and after record-breaking 3 months of development and 10 million dollars of cost introduced M34E1 in limited numbers."

	icon_state = "aev_base"

	hardpoints_allowed = list(
		/obj/item/hardpoint/support/overdrive_enhancer,
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

	wall_ram_damage = 500

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

/obj/vehicle/multitile/tank/aev/load_hardpoints()
	return

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

/obj/effect/vehicle_spawner/aev/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/tank/aev/AEV = new(loc)

	load_misc(AEV)
	handle_direction(AEV)
	load_hardpoints(AEV)
	load_damage(AEV)
	AEV.update_icon()
