/*#############################################################################
Docking Port Definitions
#############################################################################*/

/obj/docking_port/stationary/marine_dropship/airlock/inner
	var/processing = FALSE
	var/playing_airlock_alarm = FALSE
	var/open_inner_airlock = FALSE
	var/lowered_dropship = FALSE
	var/open_outer_airlock = FALSE
	var/disengaged_clamps = FALSE
	var/obj/docking_port/stationary/marine_dropship/airlock/outer/link_to_outer
	var/floodlight_color = "#dae2ff"
	var/obj/effect/hangar_airlock/inner/inner_airlock
	var/obj/effect/hangar_airlock/outer/outer_airlock
	var/list/dropship_height_masks = list()
	var/list/floodlights = list()
	var/list/inner_airlock_turfs = null
	var/list/outer_airlock_turfs = null
	auto_open = TRUE

/obj/docking_port/stationary/marine_dropship/airlock/inner/golden_arrow_one
	name = "Golden Arrow Hangar Airlock 1 Inner"
	id = GOLDEN_ARROW_A1_I
	roundstart_template = /datum/map_template/shuttle/midway

/obj/docking_port/stationary/marine_dropship/airlock/inner/golden_arrow_two
	name = "Golden Arrow Hangar Airlock 2 Inner"
	id = GOLDEN_ARROW_A2_I

/obj/docking_port/stationary/marine_dropship/airlock/outer
	name = "Hangar Airlock Outer"
	id = GENERIC_A_O
	var/obj/docking_port/stationary/marine_dropship/airlock/inner/link_to_inner

/obj/docking_port/stationary/marine_dropship/airlock/outer/golden_arrow_one
	name = "Golden Arrow Hangar Airlock 1 Outer"
	id = GOLDEN_ARROW_A1_O

/obj/docking_port/stationary/marine_dropship/airlock/outer/golden_arrow_two
	name = "Golden Arrow Hangar Airlock 2 Outer"
	id = GOLDEN_ARROW_A2_O

/*#############################################################################
Backend Procs
#############################################################################*/

/obj/docking_port/stationary/marine_dropship/airlock/outer/Initialize(mapload)
	. = ..()
	var/obj/effect/projector/P = locate(/obj/effect/projector) in loc // its an odd way to piggyback off an existing system, but if you've messed up the projectors this will tell you (and you're hardly going to be making custom airlocks that often.)
	if(!roundstart_template)
		unregister()
	if(P)
		var/link_to_inner_loc = locate(x + P.vector_x, y + P.vector_y, z + P.vector_z)
		link_to_inner = locate(/obj/docking_port/stationary/marine_dropship/airlock/inner) in link_to_inner_loc
		link_to_inner.link_to_outer = src
	else
		WARNING("Outer Airlock Docking Port: [name] could not link to its inner counterpart, this is because the projector on its tile is not properly linked. THE AIRLOCK WILL NOT WORK.")

/obj/docking_port/stationary/marine_dropship/airlock/outer/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	if(registered)
		unregister()
	link_to_inner.lowered_dropship = TRUE
	arriving_shuttle.set_mode(SHUTTLE_AIRLOCKED)

/obj/docking_port/stationary/marine_dropship/airlock/outer/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	if(!registered)
		register()

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/get_inner_airlock_turfs()
	// we want to ensure all the turfs are /turf/open/floor/hangar_airlock
	inner_airlock_turfs = list()
	for(var/turf/T in return_turfs())
		if(istype(T, /turf/open/floor/hangar_airlock/inner))
			new /obj/effect/hangar_airlock/height_mask(T)
			inner_airlock_turfs += T
			// as clones are generated after other map objects are spawned, the most intelligent way to locate actual objects (the airlock effects themselves) is by doing this.
			if(T.contents.len >= 1)
				if(!istype(T.contents[1],/atom/movable/clone))
					// this is (hopefully) only passed through once per docking port so we can afford to be somewhat uneconomical,
					for(var/A in T.contents)
						if(istype(A, /obj/effect/hangar_airlock/inner))
							inner_airlock = A

/obj/docking_port/stationary/marine_dropship/airlock/inner/Initialize()
	. = ..()
	if(!roundstart_template)
		unregister()

/obj/docking_port/stationary/marine_dropship/airlock/inner/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	if(registered)
		unregister()
	arriving_shuttle.set_mode(SHUTTLE_AIRLOCKED)
	auto_open = FALSE // when the dropship that is originally loaded is auto_opened, any further landing dropships will have people onboard to decide to whether or not they want the doors open (which stops people charging out the opened doors when the airlocks are open)
	var/list/dropship_turfs = arriving_shuttle.return_turfs()
	for(var/turf/dropship_turf in dropship_turfs)
		if(istype(dropship_turf, /turf/open/shuttle) || istype(dropship_turf, /turf/closed/shuttle))
			var/obj/effect/hangar_airlock/height_mask/dropship/dropship_height_mask = new /obj/effect/hangar_airlock/height_mask/dropship(dropship_turf)
			dropship_height_masks += dropship_height_mask
			continue
		if(istype(dropship_turf, /turf/open/floor/hangar_airlock/inner) && dropship_turf.contents.len) // although checking contents[1] is a bit sloppy, this avoids a lot of recurrances of the for loop (as clones are not objects and are added to the contents list after real objects.)
			if(istype(dropship_turf.contents[1], /obj))
				for(var/dropship_obj in dropship_turf.contents)
					if(istype(dropship_obj, /obj/structure/shuttle/part))
						var/obj/structure/dropship_part = dropship_obj
						var/obj/effect/hangar_airlock/height_mask/dropship/dropship_part_height_mask = new /obj/effect/hangar_airlock/height_mask/dropship(dropship_turf)
						dropship_part_height_mask.icon = dropship_part.icon
						dropship_part_height_mask.icon_state = dropship_part.icon_state
						dropship_part_height_mask.color = "#000000"
						dropship_height_masks += dropship_part_height_mask

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/get_outer_airlock_turfs()
	// we want to ensure all the turfs are /turf/open/floor/hangar_airlock
	outer_airlock_turfs = list()
	var/turfs_in_bounds = link_to_outer.return_turfs()
	for(var/turf/T in turfs_in_bounds)
		if(istype(T, /turf/open/floor/hangar_airlock/outer))
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
	var/deciseconds = 0
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

/*#############################################################################
Player Interactablility Procs
#############################################################################*/

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_airlock_alarm(invert = FALSE)
	processing = TRUE
	if(invert)
		playing_airlock_alarm = playing_airlock_alarm ? FALSE : TRUE
	if(!inner_airlock_turfs)
		get_inner_airlock_turfs()
	if(!outer_airlock_turfs)
		get_outer_airlock_turfs()
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

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_inner_airlock(invert = FALSE)
	processing = TRUE
	if(invert)
		open_inner_airlock = open_inner_airlock ? FALSE : TRUE
	if(!inner_airlock_turfs)
		get_inner_airlock_turfs()
	if(open_inner_airlock)
		omnibus_airlock_transition("inner", TRUE, inner_airlock_turfs, inner_airlock, 50)
	else
		omnibus_airlock_transition("inner", FALSE, inner_airlock_turfs, inner_airlock, 50)
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_dropship_height(invert = FALSE)
	processing = TRUE
	if(invert)
		lowered_dropship = lowered_dropship ? FALSE : TRUE
	if(!inner_airlock_turfs)
		get_inner_airlock_turfs()
	if(!outer_airlock_turfs)
		get_outer_airlock_turfs()
	for(var/bideciseconds, bideciseconds <= 25, bideciseconds++)
		if(lowered_dropship)
			for(var/obj/effect/hangar_airlock/height_mask/dropship/transitioning_height_mask in dropship_height_masks)
				transitioning_height_mask.alpha += 4
			sleep(2 DECISECONDS)
	var/obj/docking_port/mobile/docked_mobile
	if(lowered_dropship)
		docked_mobile = get_docked()
		docked_mobile.initiate_docking(link_to_outer)
	else
		docked_mobile = link_to_outer.get_docked()
		docked_mobile.initiate_docking(src)
	for(var/obj/effect/hangar_airlock/height_mask/qdeling_height_mask in dropship_height_masks)
		dropship_height_masks -= qdeling_height_mask
		qdel(qdeling_height_mask)
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_outer_airlock(invert = FALSE)
	processing = TRUE
	if(invert)
		open_outer_airlock = open_outer_airlock ? FALSE : TRUE
	if(!outer_airlock_turfs)
		get_outer_airlock_turfs()
	if(open_outer_airlock)
		omnibus_airlock_transition("outer", TRUE, outer_airlock_turfs, outer_airlock, 30)
	else
		omnibus_airlock_transition("outer", FALSE, outer_airlock_turfs, outer_airlock, 30)
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_clamps(invert = FALSE)
	processing = TRUE
	if(invert)
		disengaged_clamps = disengaged_clamps ? FALSE : TRUE
	if(disengaged_clamps)
		var/obj/docking_port/mobile/docked_mobile =	link_to_outer.get_docked()
		if(!docked_mobile.assigned_transit)
			SSshuttle.generate_transit_dock(docked_mobile)
		docked_mobile.set_mode(SHUTTLE_IDLE)
		docked_mobile.initiate_docking(docked_mobile.assigned_transit)
	processing = FALSE

/*#############################################################################
Airlock Appearance Effects
#############################################################################*/

/obj/effect/hangar_airlock
	icon = 'icons/effects/hangar_airlock_416x736.dmi'
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

/obj/effect/hangar_airlock/outer
	name = "hangar outer airlock"
	icon_state = "outer_close_static"
	layer = 1.95

/obj/effect/hangar_airlock/outline
	icon_state = "outline_inner"

/obj/effect/hangar_airlock/half_tile
	icon = 'icons/effects/hangar_airlock_32x32.dmi'
	icon_state = "half_tile"

/obj/effect/hangar_airlock/height_mask
	icon = 'icons/effects/hangar_airlock_32x32.dmi'
	icon_state = "height_mask"
	layer = 1.94
	alpha = 100
	plane = -7

/obj/effect/hangar_airlock/height_mask/dropship
	layer = 5
	alpha = 0
	plane = -6


/*#############################################################################
Airlock Turfs Definitions
#############################################################################*/

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

/*#############################################################################
Instanced to Defined Definitions (I hate ScrapeAway edition)
#############################################################################*/

/turf/open/floor/almayer/plate/hangar_1
	icon_state = "hangar_1"
	name = "Hangar Airlock One"

/turf/open/floor/almayer/plate/hangar_2
	icon_state = "hangar_2"
	name = "Hangar Airlock Two"

/turf/open/floor/hangar_airlock/inner/frame5
	frame_threshold = 5

/turf/open/floor/hangar_airlock/inner/frame12
	frame_threshold = 12

/turf/open/floor/hangar_airlock/inner/frame13
	frame_threshold = 13

/turf/open/floor/hangar_airlock/inner/frame18
	frame_threshold = 18

/turf/open/floor/hangar_airlock/inner/frame21
	frame_threshold = 21

/turf/open/floor/hangar_airlock/inner/frame22
	frame_threshold = 22

/turf/open/floor/hangar_airlock/inner/frame28
	frame_threshold = 28

/turf/open/floor/hangar_airlock/inner/frame33
	frame_threshold = 33

/turf/open/floor/hangar_airlock/inner/frame38
	frame_threshold = 38

/turf/open/floor/hangar_airlock/inner/frame45
	frame_threshold = 45

/turf/open/floor/hangar_airlock/inner/frame49
	frame_threshold = 49

/turf/open/floor/hangar_airlock/outer/frame4
	frame_threshold = 4

/turf/open/floor/hangar_airlock/outer/frame9
	frame_threshold = 9

/turf/open/floor/hangar_airlock/outer/frame14
	frame_threshold = 14

/turf/open/floor/hangar_airlock/outer/frame20
	frame_threshold = 20

/turf/open/floor/hangar_airlock/outer/frame25
	frame_threshold = 25

/turf/open/floor/hangar_airlock/outer/frame29
	frame_threshold = 29

/turf/open/space/basic/outer_airlock
	layer = 1.98

/*#############################################################################
Airlock Turf Interactability Procs
#############################################################################*/

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
