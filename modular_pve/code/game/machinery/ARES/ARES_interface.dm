/obj/structure/machinery/computer/ares_console/large
	name = "AI interface computer"
	desc = "A large, bulky computer intended to allow the user to interface with the ship's AI."
	icon = 'modular_pve/icons/obj/structures/props/almayer_props64.dmi'
	icon_state = "ai_interface"
	layer = BELOW_MOB_LAYER
	pixel_x = -16
	pixel_y = -8

/obj/structure/machinery/computer/ares_console/large/Initialize()
	. = ..()
	overlays.Cut()
	var/image/source_image = image(icon, "ai_interface_top", layer = ABOVE_MOB_LAYER)
	overlays += source_image
