

//Trucks
//Read the documentation in multitile.dm before trying to decipher this stuff

/obj/vehicle/multitile/box_van/cop_car
	name = "\improper Mono-Spectra"
	desc = "A police car. Used to transport law enforcement and criminals alike."
	icon = 'icons/obj/vehicles/cop_car.dmi'

	interior_map = /datum/map_template/interior/cop_car

	honk_sound = 'sound/vehicles/siren_honk.ogg'

/*
** PRESETS SPAWNERS
*/

/obj/effect/vehicle_spawner/box_van/cop_car
	name = "Cop Car Spawner"
	icon = 'icons/obj/vehicles/cop_car.dmi'
	icon_state = "van_base"

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/box_van/cop_car/spawn_vehicle()

//PRESET: wheels installed, destroyed
/obj/effect/vehicle_spawner/box_van/cop_car/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/box_van/cop_car/COP_CAR = new (loc)

	load_misc(COP_CAR)
	load_hardpoints(COP_CAR)
	handle_direction(COP_CAR)
	load_damage(COP_CAR)
	COP_CAR.update_icon()

/obj/effect/vehicle_spawner/box_van/cop_car/decrepit/load_hardpoints(obj/vehicle/multitile/box_van/cop_car/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels)

//PRESET: wheels installed
/obj/effect/vehicle_spawner/box_van/cop_car/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/box_van/cop_car/COP_CAR = new (loc)

	load_misc(COP_CAR)
	load_hardpoints(COP_CAR)
	handle_direction(COP_CAR)
	COP_CAR.update_icon()

/obj/effect/vehicle_spawner/box_van/cop_car/fixed/load_hardpoints(obj/vehicle/multitile/box_van/cop_car/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels)
