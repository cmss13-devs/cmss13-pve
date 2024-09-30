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
	layer = 1.97 //under under UNDER_TURF_LAYER

/obj/effect/hangar_airlock/outer/proc/open()
	icon_state = "outer_open"

/obj/effect/hangar_airlock/outer/proc/close()
	icon_state = "outer_close"

/obj/effect/hangar_airlock/outline
	icon_state = "outline_inner"

/obj/effect/hangar_airlock/half_tile
	icon = 'icons/effects/half_tiles.dmi'
	icon_state = "hangar_airlock_tile"

/obj/effect/hangar_airlock/height_mask
	icon_state = "height_mask"
	layer = 1.98 // under UNDER_TURF_LAYER
	alpha = 80

/obj/effect/hangar_airlock/dropship_height_mask
	icon_state = "dropship_height_mask"
	layer = 5

/obj/effect/hangar_airlock/dropship_height_mask/proc/darken()
	alpha = 80

/turf/open/floor/hangar_airlock
	layer = 1.5
	var/open = FALSE


/turf/open/floor/hangar_airlock/outer
	name = "Hangar Outer Airlock"
	icon = 'icons/turf/floors/space.dmi'
	icon_state = "0"

/turf/open/floor/hangar_airlock/outer/Initialize(mapload, ...)
	. = ..()
	icon_state = "[((x + y) ^ ~(x * y) + z) % 25]"

/turf/open/floor/hangar_airlock/inner
	name = "Hangar Inner Airlock"
	icon = 'icons/turf/almayer.dmi'
	icon_state = "plate"

/turf/open/floor/hangar_airlock/Entered(atom/movable/AM)
	if(open)
		if(!isobserver(AM) && !istype(AM, /obj/docking_port) && !istype(AM, /atom/movable/clone))
			addtimer(CALLBACK(src, PROC_REF(enter_depths), AM), 0.2 SECONDS)

/turf/open/floor/hangar_airlock/proc/enter_depths(/atom/movable/AM)
	return

/turf/open/floor/hangar_airlock/inner/enter_depths(atom/movable/AM)
	if(AM.throwing == 0 && istype(get_turf(AM), /turf/open/floor/hangar_airlock))
		AM.visible_message(SPAN_WARNING("[AM] falls into the depths!"), SPAN_WARNING("You fall into the depths!"))
		for(var/i in src.contents)
			if(istype(i, /atom/movable/clone))
				var/atom/movable/clone/C = i
				// why not just use .loc? well, because of /atom/movable/clone facsimile 'turfs', it is potentially the case that we'd locate an area (from the mstr turf of the facsimile) when we just want the exact turf.
				AM.forceMove(locate(C.mstr.x, C.mstr.y, C.mstr.z))
				break
		if(!isliving(AM))
			return
		var/mob/living/fallen_living = AM
		shake_camera(fallen_living, 20, 1)
		fallen_living.apply_effect(3, WEAKEN)
		fallen_living.apply_damage(75, BRUTE, pick("r_leg", "l_leg", "r_arm", "l_arm", "chest", "head"))

/turf/open/floor/hangar_airlock/outer/enter_depths(atom/movable/AM)
	if(AM.throwing == 0 && istype(get_turf(AM), /turf/open/floor/hangar_airlock))
		AM.visible_message(SPAN_WARNING("There is an onrush of air. [AM] falls into space!"), SPAN_WARNING("There is an onrush of air. You fall into space!"))
		qdel(AM)
