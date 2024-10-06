/obj/docking_port/stationary/marine_dropship/airlock/outer
	var/obj/docking_port/stationary/marine_dropship/airlock/inner/link_to_inner

/obj/docking_port/stationary/marine_dropship/airlock/outer/Initialize(mapload)
	. = ..()
	var/obj/effect/projector/P = locate(/obj/effect/projector) in loc
	var/link_to_inner_loc = locate(x + P.vector_x, y + P.vector_y, z + P.vector_z)
	link_to_inner = locate(/obj/docking_port/stationary/marine_dropship/airlock/inner) in link_to_inner_loc
	link_to_inner.link_to_outer = src

/obj/docking_port/stationary/marine_dropship/airlock/outer/golden_arrow_one
	name = "Golden Arrow Hangar Airlock 1 Outer"
	id = GOLDEN_ARROW_A1_L

/obj/docking_port/stationary/marine_dropship/airlock/outer/golden_arrow_two
	name = "Golden Arrow Hangar Airlock 2 Outer"
	id = GOLDEN_ARROW_A2_L

/obj/docking_port/stationary/marine_dropship/airlock/inner
	var/processing = FALSE
	var/playing_airlock_alarm = FALSE
	var/open_inner_airlock = FALSE
	var/lowered_dropship = FALSE
	var/open_outer_airlock = FALSE
	var/obj/docking_port/stationary/marine_dropship/airlock/outer/link_to_outer
	var/floodlight_color = "#dae2ff"
	var/obj/effect/hangar_airlock/inner/inner_airlock
	var/obj/effect/hangar_airlock/outer/outer_airlock
	var/obj/effect/hangar_airlock/height_mask/height_mask_effect
	var/list/floodlights = list()
	var/list/inner_airlock_turfs = null
	var/list/outer_airlock_turfs = null

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/get_inner_airlock_turfs()
	// we want to ensure all the turfs are /turf/open/floor/hangar_airlock
	inner_airlock_turfs = list()
	for(var/turf/T in return_turfs())
		if(istype(T, /turf/open/floor/hangar_airlock/inner))
			inner_airlock_turfs += T
			// as clones are generated after other map objects are spawned, the most intelligent way to locate actual objects (the airlock effects themselves) is by doing this.
			if(T.contents.len >= 1)
				if(istype(T.contents[1],/atom/movable/clone))
					continue
				// this is (hopefully) only passed through once per docking port so we can afford to be somewhat uneconomical,
				for(var/A in T.contents)
					if(istype(A, /obj/effect/hangar_airlock/inner))
						inner_airlock = A
					if(istype(A, /obj/effect/hangar_airlock/height_mask))
						height_mask_effect = A

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/get_outer_airlock_turfs()
	// we want to ensure all the turfs are /turf/open/floor/hangar_airlock
	outer_airlock_turfs = list()
	var/turfs_in_bounds = link_to_outer.return_turfs()
	for(var/turf/T in turfs_in_bounds)
		if(istype(T, /turf/open/floor/hangar_airlock))
			outer_airlock_turfs += T
			// as clones are generated after other map objects are spawned, the most intelligent way to locate actual objects (the airlock effects themselves) is by doing this.
			if(T.contents.len >= 1)
				if(istype(T.contents[1],/atom/movable/clone))
					continue
				// this is (hopefully) only passed through once per docking port so we can afford to be somewhat uneconomical,
				for(var/A in T.contents)
					if(istype(A, /obj/effect/hangar_airlock/outer))
						outer_airlock = A

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/omnibus_airlock_transition(airlock_type, open, airlock_turfs, obj/effect/hangar_airlock/airlock, end_decisecond)
	var/deciseconds
	var/transition = open ? "open" : "close"
	airlock.icon_state = "[airlock_type]_[transition]_0s"
	sleep(1 DECISECONDS)
	for(deciseconds=1, deciseconds<end_decisecond, deciseconds++)
		if(!(deciseconds % 10))
			airlock.icon_state = "[airlock_type]_[transition]_[deciseconds/10]s"
		for(var/turf/open/floor/hangar_airlock/T in airlock_turfs)
			if(deciseconds == T.frame_threshold)
				T.open = open
		sleep(1 DECISECONDS)
	airlock.icon_state = "[airlock_type]_[transition]_static"

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_airlock_alarm()
	processing = TRUE
	if(playing_airlock_alarm)
		var/obj/structure/machinery/floodlight/landing/activating_floodlight
		for(activating_floodlight in floodlights)
			sleep(1.5 SECONDS)
			QDEL_NULL(activating_floodlight.static_light)
			activating_floodlight.light_system = MOVABLE_LIGHT
			floodlight_color = activating_floodlight.light_color
			activating_floodlight.set_light(10, 2, LIGHT_COLOR_BLUE, /atom/movable/lighting_mask/rotating_toggleable)
		var/atom/movable/lighting_mask/rotating_toggleable/activating_rotating_light
		for(activating_floodlight in floodlights)
			sleep(0.5 SECONDS)
			activating_rotating_light = activating_floodlight.light.our_mask
			activating_rotating_light.toggle(TRUE)

	else
		var/obj/structure/machinery/floodlight/landing/deactivating_floodlight
		var/atom/movable/lighting_mask/rotating_toggleable/deactivating_rotating_light
		for(deactivating_floodlight in floodlights)
			sleep(1.5 SECONDS)
			deactivating_rotating_light = deactivating_floodlight.light.our_mask
			deactivating_rotating_light.toggle(FALSE)
		for(deactivating_floodlight in floodlights)
			sleep(0.5 SECONDS)
			QDEL_NULL(deactivating_floodlight.light)
			deactivating_floodlight.light_system = STATIC_LIGHT
			deactivating_floodlight.light_color = floodlight_color
			deactivating_floodlight.static_update_light()
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_inner_airlock()
	processing = TRUE
	if(!inner_airlock_turfs)
		get_inner_airlock_turfs()
	if(open_inner_airlock)
		omnibus_airlock_transition("inner", 1, inner_airlock_turfs, inner_airlock, 50)
	else
		omnibus_airlock_transition("inner", 0, inner_airlock_turfs, inner_airlock, 50)
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_dropship_height()
	processing = TRUE
	if(!inner_airlock_turfs)
		get_inner_airlock_turfs()
	if(!outer_airlock_turfs)
		get_outer_airlock_turfs()
	if(lowered_dropship) //lower the dropship
		processing = TRUE
	else // raise the dropship
		processing = TRUE
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_outer_airlock()
	processing = TRUE
	if(!outer_airlock_turfs)
		get_outer_airlock_turfs()
	if(open_outer_airlock)
		omnibus_airlock_transition("outer", 1, outer_airlock_turfs, outer_airlock, 30)
	else
		omnibus_airlock_transition("outer", 0, outer_airlock_turfs, outer_airlock, 30)
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/golden_arrow_one
	name = "Golden Arrow Hanagar Airlock 1 Inner"
	id = GOLDEN_ARROW_A1_U
	roundstart_template = /datum/map_template/shuttle/midway

/obj/docking_port/stationary/marine_dropship/airlock/inner/golden_arrow_two
	name = "Golden Arrow Hangar Airlock 2 Inner"
	id = GOLDEN_ARROW_A2_U

/obj/effect/hangar_airlock
	icon = 'icons/effects/hangar_airlocks.dmi'
	layer = ABOVE_TURF_LAYER
	plane = FLOOR_PLANE
	indestructible = TRUE
	unacidable = TRUE
	mouse_opacity = FALSE
	anchored = TRUE

/obj/effect/hangar_airlock/inner
	name = "hangar inner airlock"
	icon_state = "inner_close_static"
	layer = 1.95

/obj/effect/hangar_airlock/inner/proc/open()
	sleep(1 SECONDS)
	icon_state = "inner_open_1s"
	sleep(1 SECONDS)
	icon_state = "inner_open_2s"
	sleep(1 SECONDS)
	icon_state = "inner_open_3s"
	sleep(1 SECONDS)
	icon_state = "inner_open_4s"
	sleep(1 SECONDS)
	icon_state = "inner_open_static"

/obj/effect/hangar_airlock/inner/proc/close()
	icon_state = "inner_close_0s"
	sleep(1 SECONDS)
	icon_state = "inner_close_1s"
	sleep(1 SECONDS)
	icon_state = "inner_close_2s"
	sleep(1 SECONDS)
	icon_state = "inner_close_3s"
	sleep(1 SECONDS)
	icon_state = "inner_close_4s"
	sleep(1 SECONDS)
	icon_state = "inner"

/obj/effect/hangar_airlock/outer
	name = "hangar outer airlock"
	icon_state = "outer_close_static"
	layer = 1.95

/obj/effect/hangar_airlock/outer/proc/open()
	icon_state = "outer_open_0s"
	sleep(1 SECONDS)
	icon_state = "outer_open_1s"
	sleep(1 SECONDS)
	icon_state = "outer_open_2s"
	sleep(1 SECONDS)
	icon_state = "outer_open_static"

/obj/effect/hangar_airlock/outer/proc/close()
	icon_state = "outer_close_0s"
	sleep(1 SECONDS)
	icon_state = "outer_close_1s"
	sleep(1 SECONDS)
	icon_state = "outer_close_2s"
	sleep(1 SECONDS)
	icon_state = "outer"

/obj/effect/hangar_airlock/outline
	icon_state = "outline_inner"

/obj/effect/hangar_airlock/half_tile
	icon = 'icons/effects/half_tiles.dmi'
	icon_state = "hangar_airlock_tile"

/obj/effect/hangar_airlock/height_mask
	icon_state = "height_mask"
	layer = 1.92
	alpha = 80

/turf/open/floor/hangar_airlock
	layer = 1.5
	// to tie the turf opening and the airlock animation together, the frame on which a tile can be considered 'open' or 'closed' has to be done manually.
	var/frame_threshold = null
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
