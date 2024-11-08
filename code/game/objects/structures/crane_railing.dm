/obj/structure/roof/cargocrane_tracks
	name = "cargo crane track"
	desc = "A track for a cargo crane to move along."
	icon = 'icons/obj/structures/props/cargocrane_tracks.dmi'
	mouse_opacity = FALSE

/obj/structure/roof/cargocrane_tracks/update_icon()
	..()

	overlays.Cut()
	var/image/source_image = image(src.icon, icon_state = "[icon_state]-s")
	source_image.pixel_y = -32
	source_image.plane = FLOOR_PLANE
	source_image.layer = ABOVE_TURF_LAYER
	overlays += source_image

/obj/structure/roof/cargocrane_tracks/horizontal
	icon_state = "horizontal"

/obj/structure/roof/cargocrane_tracks/vertical
	icon_state = "vertical"


/obj/structure/roof/cargocrane_tracks/corner
	icon_state = "corner"

/obj/structure/roof/cargocrane_tracks/tjoint
	icon_state = "t-joint"

/obj/structure/roof/cargocrane_tracks/tjoint2
	icon_state = "t-joint2"

/obj/structure/roof/cargocrane_tracks/tjoint3
	icon_state = "t-joint3"
