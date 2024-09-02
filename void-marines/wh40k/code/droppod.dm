/datum/map_template/shuttle/astartes_drop
	name = "Droppod"
	shuttle_id = DROPPOD_ASTARTES

/obj/docking_port/mobile/marine_dropship/astartes_drop
	name = "Droppod"
	id = DROPPOD_ASTARTES
	width = 7
	height = 7

	dwidth = 3
	dheight = 3

/obj/docking_port/stationary/marine_dropship/astartes_drop
	name = "Hangar Bay"
	id = TEMPEST_LZ
	auto_open = TRUE
	roundstart_template = /datum/map_template/shuttle/astartes_drop

/obj/structure/machinery/computer/shuttle/dropship/flight/remote_control/astartes_drop
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "shuttle"
	shuttleId = DROPPOD_ASTARTES
	is_remote = TRUE
	needs_power = TRUE
