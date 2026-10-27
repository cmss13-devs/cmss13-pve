
/obj/structure/machinery/cryopod/big
	icon = 'modular_pve/icons/obj/structures/machinery/hypersleep.dmi'
	icon_state = "hypersleep_base"
	dir = EAST
	var/image/occupant_image
	var/occupant_angle = 270
	var/occupant_dir = 4
	var/occupant_x = 6
	var/occupant_y = 0

/obj/structure/machinery/cryopod/big/Initialize()
	. = ..()
	var/cover_image = image(icon, icon_state = "cover_fog", layer = 3.22)
	overlays += cover_image

/obj/structure/machinery/cryopod/big/update_icon()
	return

/obj/structure/machinery/cryopod/big/go_in_cryopod(mob/living/mob, silent = FALSE)
	..()
	overlays.Cut()
	occupant_image = image(mob.appearance, loc, layer = 3.21)
	occupant_image.pixel_x = occupant_x
	occupant_image.pixel_y = occupant_y
	occupant_image.dir = occupant_dir
	if(mob.body_position == STANDING_UP)
		occupant_image.transform = occupant.transform.Turn(occupant_angle)
	overlays += occupant_image
	var/cover_image = image(icon, icon_state = "cover", layer = 3.22)
	overlays += cover_image

/obj/structure/machinery/cryopod/big/go_out()
	..()
	overlays -= occupant_image
	occupant_image = null

/obj/structure/machinery/cryopod/big/despawn_occupant()
	..()
	overlays.Cut()
	occupant_image = null
	var/cover_image = image(icon, icon_state = "cover_fog", layer = 3.22)
	overlays += cover_image

/obj/structure/machinery/cryopod/big/flipped
	dir = WEST
	occupant_angle = 90
	occupant_dir = 8
	occupant_x = 10
