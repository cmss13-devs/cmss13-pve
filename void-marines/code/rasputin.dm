//PARTS

/turf/closed/shuttle/rasputin
	name = "\improper Rasputin"
	icon = 'void-marines/icons/rasputin.dmi'
	icon_state = "dwall26"

/obj/structure/shuttle/part/rasputin
	name = "\improper Rasputin"
	icon = 'void-marines/icons/rasputin.dmi'
	icon_state = "dwall26"

/obj/structure/shuttle/part/rasputin/transparent
	opacity = FALSE

/obj/structure/shuttle/part/rasputin/transparent/window
	icon_state = "dwall31"

/obj/structure/shuttle/part/rasputin/corner
	icon_state = "dwall29"

/obj/structure/shuttle/part/rasputin/corner_single
	icon_state = "dwall33"

/obj/structure/shuttle/part/rasputin/tail
	icon_state = "dwall32"

/obj/structure/shuttle/part/rasputin/engine
	icon_state = "dwall34"

/obj/structure/shuttle/part/rasputin/transparent/inner_right_weapons
	icon_state = "attach4"

/obj/structure/shuttle/part/rasputin/transparent/outer_right_weapons
	icon_state = "attach3"

/obj/structure/shuttle/part/rasputin/transparent/inner_left_weapons
	icon_state = "attach2"

/obj/structure/shuttle/part/rasputin/transparent/outer_left_weapons
	icon_state = "attach1"

//DOORS

/obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear/ds3
	name = "\improper Rasputin cargo door"
	icon = 'icons/obj/structures/doors/dropship3_cargo.dmi'

/obj/structure/machinery/door/airlock/dropship_hatch/three
	icon = 'icons/obj/structures/doors/dropship3_side.dmi'
	id = "sh_dropship3"

/obj/structure/machinery/door/airlock/hatch/cockpit/three
	icon = 'icons/obj/structures/doors/dropship3_pilot.dmi'

//AREAS

/area/shuttle/rasputin
	name = "\improper Dropship Rasputin"
	icon_state = "shuttlered"
	base_muffle = MUFFLE_HIGH
	soundscape_interval = 30
	is_landing_zone = TRUE
	ceiling = CEILING_REINFORCED_METAL

/area/shuttle/rasputin/Enter(atom/movable/O, atom/oldloc)
	if(istype(O, /obj/structure/barricade))
		return FALSE
	return TRUE

//PORT

/datum/map_template/shuttle/rasputin
	name = "Rasputin"
	shuttle_id = DROPSHIP_RASPUTIN

/obj/docking_port/mobile/marine_dropship/rasputin
	name = "Rasputin"
	id = DROPSHIP_RASPUTIN
	width = 11
	height = 18

	dwidth = 5
	dheight = 8

/obj/docking_port/stationary/marine_dropship/golden_arrow_hangar_ru
	name = "Hangar Bay"
	id = GOLDEN_ARROW_LZ
	auto_open = TRUE
	roundstart_template = /datum/map_template/shuttle/rasputin

/obj/structure/machinery/computer/shuttle/dropship/flight/remote_control/rasputin
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "shuttle"
	shuttleId = DROPSHIP_RASPUTIN
	is_remote = TRUE
	needs_power = TRUE

//ATTACH POINT

/obj/effect/attach_point/computer/rasputin
	ship_tag = DROPSHIP_RASPUTIN

/obj/effect/attach_point/electronics/rasputin
	ship_tag = DROPSHIP_RASPUTIN

/obj/effect/attach_point/fuel/rasputin
	ship_tag = DROPSHIP_RASPUTIN

/obj/effect/attach_point/weapon/rasputin
	ship_tag = DROPSHIP_RASPUTIN

/obj/effect/attach_point/crew_weapon/rasputin
	ship_tag = DROPSHIP_RASPUTIN

/obj/effect/attach_point/weapon/rasputin/left_fore
	name = "port fore weapon attach point"
	attach_id = 1
	dir = NORTH
	firing_arc_min = -6
	firing_arc_max =  0
	transverse  =  0
	long    =  0

/obj/effect/attach_point/weapon/rasputin/right_fore
	name = "starboard fore weapon attach point"
	attach_id = 2
	dir = NORTH
	firing_arc_min =  0
	firing_arc_max =  6
	transverse  =  0
	long    =  0

//MACHINERY

/obj/structure/machinery/camera/autoname/golden_arrow/rasputin
	network = list(CAMERA_NET_GOLDEN_ARROW, CAMERA_NET_RASPUTIN)

/obj/structure/machinery/computer/cameras/dropship/rasputin
	name = "\improper 'Rasputin' camera controls"
	network = list(CAMERA_NET_RASPUTIN, CAMERA_NET_LASER_TARGETS)

/obj/structure/machinery/computer/cameras/dropship/rasputin/update_icon()
	return

/obj/structure/machinery/computer/dropship_weapons/rasputin
	name = "\improper 'Rasputin' weapons controls"
	shuttle_tag = DROPSHIP_RASPUTIN

/obj/structure/machinery/computer/dropship_weapons/rasputin/update_icon()
	return

/obj/structure/machinery/computer/shuttle/dropship/flight/update_icon()
	return