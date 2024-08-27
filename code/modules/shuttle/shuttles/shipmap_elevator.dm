/obj/docking_port/mobile/trijent_elevator/shipmap_elevator
	name = "Vehicle Elevator One"
	height = 5
	width = 7
	preferred_direction = NORTH
	port_direction = SOUTH

	id = MOBILE_SHUTTLE_SHIPMAP_ELEVATOR_ONE

	callTime = 5 SECONDS
	ignitionTime = 1 SECONDS

	ignition_sound = null
	landing_sound = 'sound/machines/asrs_raising.ogg'
	ambience_idle = null
	ambience_flight = null
	var/list/railings = list()
	var/list/gears = list()
	area_type = /area/shuttle/vehicle_elevator

/obj/docking_port/mobile/trijent_elevator/shipmap_elevator/get_transit_path_type()
	return /turf/closed/wall/almayer/outer

/obj/docking_port/mobile/trijent_elevator/shipmap_elevator/register()
	. = ..()
	for(var/obj/structure/machinery/gear/G in machines)
		if(G.id == id)
			gears += G
	for(var/obj/structure/machinery/door/poddoor/railing/R in machines)
		if(R.id == id)
			railings += R

/obj/docking_port/mobile/trijent_elevator/shipmap_elevator/on_ignition()
	for(var/i in gears)
		var/obj/structure/machinery/gear/G = i
		G.start_moving()

/obj/docking_port/mobile/trijent_elevator/shipmap_elevator/set_idle()
	..()
	for(var/i in gears)
		var/obj/structure/machinery/gear/G = i
		G.stop_moving()
	for(var/i in railings)
		var/obj/structure/machinery/door/poddoor/railing/R = i
		if(R.density)
			INVOKE_ASYNC(R, TYPE_PROC_REF(/obj/structure/machinery/door, open))
		else
			INVOKE_ASYNC(R, TYPE_PROC_REF(/obj/structure/machinery/door, close))

/obj/docking_port/mobile/trijent_elevator/shipmap_elevator/two
	name = "Vehicle Elevator Two"
	id = MOBILE_SHUTTLE_SHIPMAP_ELEVATOR_TWO

/obj/docking_port/mobile/trijent_elevator/shipmap_elevator/cargo
	name = "Cargo Elevator"
	height = 6
	width = 8
	id = MOBILE_SHUTTLE_SHIPMAP_ELEVATOR_CARGO
	area_type = /area/shuttle/elevator1

/obj/docking_port/stationary/shipmap_elevator/visible_message()
	return

/obj/docking_port/stationary/shipmap_elevator
	dir = NORTH
	height = 5
	width = 7

/obj/docking_port/stationary/trijent_elevator/shipmap_elevator/one
	name = "Vehicle Elevator One"

/obj/docking_port/stationary/trijent_elevator/shipmap_elevator/two
	name = "Vehicle Elevator Two"

/obj/docking_port/stationary/trijent_elevator/shipmap_elevator/cargo
	name = "Cargo Elevator"
	height = 6
	width = 8
