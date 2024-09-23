/obj/effect/hangar_airlock
	icon = 'icons/effects/hangar_airlocks.dmi'
	layer = ABOVE_TURF_LAYER
	plane = FLOOR_PLANE
	indestructible = TRUE
	unacidable = TRUE
	mouse_opacity = FALSE

/obj/effect/hangar_airlock/inner
	name = "hangar inner airlock"
	icon_state = "inner"
	layer = UNDER_TURF_LAYER

/obj/effect/hangar_airlock/inner/proc/open()
	icon_state = "inner_open"

/obj/effect/hangar_airlock/inner/proc/close()
	icon_state = "inner_close"

/obj/effect/hangar_airlock/outer
	name = "hangar outer airlock"
	icon_state = "outer"
	layer = 1.98 //under UNDER_TURF_LAYER

/obj/effect/hangar_airlock/outer/proc/open()
	icon_state = "outer_open"

/obj/effect/hangar_airlock/outer/proc/close()
	icon_state = "outer_close"

/obj/effect/hangar_airlock/outline
	icon_state = "outline_inner"

/obj/effect/hangar_airlock/half_tile
	icon = 'icons/effects/half_tiles.dmi'
	icon_state = "hangar_airlock_tile"
