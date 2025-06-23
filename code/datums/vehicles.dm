/datum/map_template/interior
	name = "Base Interior Template"
	var/prefix = "maps/interiors/"
	var/interior_id = "SHOULD NEVER EXIST"


/datum/map_template/interior/New()
	if(interior_id == "SHOULD NEVER EXIST")
		stack_trace("invalid interior datum")
	mappath = "[prefix][interior_id].dmm"
	return ..()

/datum/map_template/interior/apc
	name = "APC"
	interior_id = "apc"

/datum/map_template/interior/apc_command
	name = "Command APC"
	interior_id = "apc_command"

/datum/map_template/interior/apc_med
	name = "Med APC"
	interior_id = "apc_med"

/datum/map_template/interior/apc_no_fpw
	name = "APC - No FPW"
	interior_id = "apc_no_fpw"

/datum/map_template/interior/apc_movie
	name = "Movie APC"
	interior_id = "apc_movie"

/datum/map_template/interior/apc_aa
	name = "Anti-Air APC"
	interior_id = "apc_aa"

/datum/map_template/interior/apc_moviemed
	name = "Medical Treatment APC"
	interior_id = "apc_moviemed"

/datum/map_template/interior/arc
	name = "ARC"
	interior_id = "arc"

/datum/map_template/interior/tank
	name = "Tank"
	interior_id = "tank"

/datum/map_template/interior/aev
	name = "AEV"
	interior_id = "aev"

/datum/map_template/interior/van
	name = "Van"
	interior_id = "van"

/datum/map_template/interior/box_van
	name = "Box Van"
	interior_id = "box_van"

/datum/map_template/interior/pizza_van
	name = "Pizza-Galaxy Van"
	interior_id = "pizza_van"

/datum/map_template/interior/ambulance
	name = "Ambulance"
	interior_id = "ambulance"

/datum/map_template/interior/cop_car
	name = "Cop Car"
	interior_id = "cop_car"

/datum/map_template/interior/arc
	name = "ARC"
	interior_id = "arc"
