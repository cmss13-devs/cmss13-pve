/obj/vehicle/multitile/van/armored
	name = "\improper Armored UACG Van"
	desc = "A colony van, uparmored and with a mounted M56 Cupola on the top. Commonly found use by the UACG. Entrances by the sides."

	icon = 'icons/obj/vehicles/van.dmi'
	icon_state = "van_armored_base"

	health = 800

	interior_map = /datum/map_template/interior/van/armored

	passengers_slots = 1 //4  total
	xenos_slots = 2

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0),
	)

	vehicle_flags = VEHICLE_CLASS_LIGHT

	light_range = 5

	// Rest (all the guns) is handled by the tank turret hardpoint
	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/van_wheels,
		/obj/item/hardpoint/secondary/m56cupola,
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
		"acid" = 1.8,
		"slash" = 1.1,
		"bullet" = 0.6,
		"explosive" = 0.8,
		"blunt" = 0.8,
		"abstract" = 1,
	)

/obj/vehicle/multitile/van/armored/add_seated_verbs(mob/living/M, seat)
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
			/obj/vehicle/multitile/proc/toggle_shift_click,
			/obj/vehicle/multitile/proc/activate_horn,
		))
	else if(seat == VEHICLE_GUNNER)
		add_verb(M.client, list(
			/obj/vehicle/multitile/proc/switch_hardpoint,
			/obj/vehicle/multitile/proc/cycle_hardpoint,
			/obj/vehicle/multitile/proc/toggle_shift_click,
		))

/obj/vehicle/multitile/van/armored/remove_seated_verbs(mob/living/M, seat)
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
			/obj/vehicle/multitile/proc/toggle_shift_click,
			/obj/vehicle/multitile/proc/activate_horn,
		))
	else if(seat == VEHICLE_GUNNER)
		remove_verb(M.client, list(
			/obj/vehicle/multitile/proc/switch_hardpoint,
			/obj/vehicle/multitile/proc/cycle_hardpoint,
			/obj/vehicle/multitile/proc/toggle_shift_click,
		))

/obj/vehicle/multitile/van/armored/Initialize()
	. = ..()
	under_image = image(icon, src, icon_state, layer = BELOW_MOB_LAYER)
	under_image.alpha = 127

	normal_image = image(icon, src, icon_state, layer = layer)

	icon_state = null

	RegisterSignal(SSdcs, COMSIG_GLOB_MOB_LOGGED_IN, PROC_REF(add_default_image))

	for(var/I in GLOB.player_list)
		add_default_image(SSdcs, I)
/*
** PRESETS SPAWNERS
*/
/obj/effect/vehicle_spawner/van/armored
	name = "Armored Van Spawner"
	icon = 'icons/obj/vehicles/van.dmi'
	icon_state = "van_armored_base"
	pixel_x = -48
	pixel_y = -48

/obj/effect/vehicle_spawner/van/armored/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/van/armored/spawn_vehicle()
	var/obj/vehicle/multitile/van/armored/ARM_VAN = new (loc)

	load_misc(ARM_VAN)
	load_hardpoints(ARM_VAN)
	handle_direction(ARM_VAN)
	ARM_VAN.update_icon()

//PRESET: only wheels installed
/obj/effect/vehicle_spawner/van/armored/load_hardpoints(obj/vehicle/multitile/van/armored/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels)

//PRESET: default hardpoints, destroyed
/obj/effect/vehicle_spawner/van/armored/spawn_vehicle()
	var/obj/vehicle/multitile/van/armored/ARM_VAN = new (loc)

	load_misc(ARM_VAN)
	load_hardpoints(ARM_VAN)
	handle_direction(ARM_VAN)
	load_damage(ARM_VAN)
	ARM_VAN.update_icon()

/obj/effect/vehicle_spawner/van/armored/load_hardpoints(obj/vehicle/multitile/apc/arc/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels)
	V.add_hardpoint(new /obj/item/hardpoint/secondary/m56cupola)

//PRESET: MG
/obj/effect/vehicle_spawner/van/armored/mg/load_hardpoints(obj/vehicle/multitile/apc/arc/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels)
	V.add_hardpoint(new /obj/item/hardpoint/secondary/m56cupola)
