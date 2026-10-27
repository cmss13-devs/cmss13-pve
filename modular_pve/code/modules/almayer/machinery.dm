/obj/structure/machinery/prop/almayer/computer/PC/large
	icon_state = "largecomp"

/obj/structure/machinery/prop/almayer/computer/PC/large/dark
	icon_state = "largecomp_dark"

/obj/structure/machinery/prop/almayer/CICmap/table/horizontal/segment
	icon = 'modular_pve/icons/obj/structures/props/maptable.dmi'
	icon_state = "h_maptable1"
	bound_width = 32
	bound_height = 32
	light_pixel_x = 0
	light_pixel_y = 0

/obj/structure/machinery/prop/almayer/CICmap/table/horizontal/segment/one
	icon_state = "h_maptable1"

/obj/structure/machinery/prop/almayer/CICmap/table/horizontal/segment/two
	icon_state = "h_maptable2"

/obj/structure/machinery/prop/almayer/CICmap/table/horizontal/segment/three
	icon_state = "h_maptable3"

/obj/structure/machinery/prop/almayer/CICmap/table/horizontal/segment/four
	icon_state = "h_maptable4"

/obj/structure/machinery/prop/almayer/CICmap/table/horizontal/segment/five
	icon_state = "h_maptable5"

/obj/structure/machinery/prop/almayer/CICmap/table/horizontal/segment/six
	icon_state = "h_maptable6"

/obj/structure/prop/almayer/whiteboard
	name = "\improper whiteboard"
	desc = "A blank white surface where thoughts turn to plans. It's blank, all of the markers having dried out from the constant inappropriate drawings."
	icon = 'modular_pve/icons/obj/structures/props/almayer_props64.dmi'
	icon_state = "whiteboard"
	bound_width = 64

/obj/structure/prop/almayer/whiteboard/clear
	name = "\improper glass whiteboard"
	desc = "Despite what the name implies, this whiteboard is not actually white and instead is a clear pane of glass. Why anyone would want you to see through a whiteboard remains one of the top mysteries as of 2182."
	icon_state = "whiteboard_clear"

/obj/structure/prop/almayer/ai_wallmonitor
	name = "AI interface wall monitor"
	desc = "A monitor embedded into the wall, providing detailed readouts of various different systems."
	icon = 'modular_pve/icons/obj/structures/machinery/computer.dmi'
	icon_state = "ai_wallmonitor"
	density = FALSE
	pixel_y = 32
	layer = ABOVE_OBJ_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/almayer/ai_wallmonitor/east
	icon_state = "ai_wallmonitor_e"
	pixel_x = 32
	pixel_y = 0

/obj/structure/prop/almayer/ai_wallmonitor/west
	icon_state = "ai_wallmonitor_w"
	pixel_x = -32
	pixel_y = 0

/obj/structure/prop/almayer/sadar_decoration
	name = "\improper Spent M83A2 SADAR"
	desc = "A spent M83A2 tube. It's been kept as a trophy after a lucky tank kill nearly a thousand meters out. Someone has engraved a single tally-mark on the side to begin recording a kill-count."
	icon = 'modular_pve/icons/obj/structures/props/almayer_props.dmi'
	icon_state = "sadar_decoration"
	density = FALSE

/obj/structure/prop/almayer/ship_memorial/golden_arrow
	name = "memorial"
	desc = "A memorial plaque dedicated to those of the Golden Arrow who have fallen in combat. It's an unfortunately long list of names."
	icon = 'modular_pve/icons/obj/structures/props/almayer_props64.dmi'
	icon_state = "garrow_memorial"
