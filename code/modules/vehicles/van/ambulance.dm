

//Trucks
//Read the documentation in multitile.dm before trying to decipher this stuff

/obj/vehicle/multitile/box_van/ambulance
	name = "\improper ambulance"
	desc = "An ambulance. It's used to transport critically injured patients."
	icon = 'icons/obj/vehicles/ambulance.dmi'

	interior_map = /datum/map_template/interior/ambulance

	honk_sound = 'sound/vehicles/siren_honk.ogg'

/*
** PRESETS SPAWNERS
*/

/obj/effect/vehicle_spawner/box_van/ambulance
	name = "Ambulance Spawner"
	icon = 'icons/obj/vehicles/ambulance.dmi'
	icon_state = "van_base"

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/box_van/ambulance/spawn_vehicle()

//PRESET: wheels installed, destroyed
/obj/effect/vehicle_spawner/box_van/ambulance/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/box_van/ambulance/AMBULANCE = new (loc)

	load_misc(AMBULANCE)
	load_hardpoints(AMBULANCE)
	handle_direction(AMBULANCE)
	load_damage(AMBULANCE)
	AMBULANCE.update_icon()

/obj/effect/vehicle_spawner/box_van/ambulance/decrepit/load_hardpoints(obj/vehicle/multitile/box_van/ambulance/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels)

//PRESET: wheels installed
/obj/effect/vehicle_spawner/box_van/ambulance/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/box_van/ambulance/AMBULANCE = new (loc)

	load_misc(AMBULANCE)
	load_hardpoints(AMBULANCE)
	handle_direction(AMBULANCE)
	AMBULANCE.update_icon()

/obj/effect/vehicle_spawner/box_van/ambulance/fixed/load_hardpoints(obj/vehicle/multitile/box_van/ambulance/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels)
