// welcome to the sanity of probable insanity (being a majority of one in this endeavour)

GLOBAL_LIST_EMPTY(dropship_airlock_inners)

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
	var/obj/docking_port/stationary/marine_dropship/airlock/outer/linked_outer
	var/obj/effect/hangar_airlock/inner/inner_airlock_effect
	var/obj/effect/hangar_airlock/outer/outer_airlock_effect
	var/list/dropship_height_masks = null
	var/list/floodlights = null
	var/list/door_controls = null
	var/list/poddoors = null
	var/list/inner_airlock_turfs = null
	var/list/outer_airlock_turfs = null
	var/obj/docking_port/mobile/marine_dropship/docked_mobile = null
	var/obj/effect/projector/projector_proxy = null
	COOLDOWN_DECLARE(dropship_airlock_cooldown)
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
	var/obj/docking_port/stationary/marine_dropship/airlock/inner/linked_inner

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
	var/obj/effect/projector/projector = locate(/obj/effect/projector) in loc // its an odd way to piggyback off an existing system, but if you've messed up the projectors this will tell you (and you're hardly going to be making custom airlocks that often.)
	if(!projector)
		WARNING("There is no projector in the centre of [name]. THE AIRLOCK WILL NOT WORK")
		return
	linked_inner = locate(/obj/docking_port/stationary/marine_dropship/airlock/inner) in locate(x + projector.vector_x, y + projector.vector_y, z + projector.vector_z)
	if(!linked_inner)
		WARNING("[name] could not link to its inner counterpart (likely due to incorrectly offset projectors). THE AIRLOCK WILL NOT WORK.")
		return
	linked_inner.linked_outer = src
	linked_inner.projector_proxy = src
	linked_inner.outer_airlock_effect = new /obj/effect/hangar_airlock/outer(locate(DROPSHIP_AIRLOCK_FROM_DOCKPORT_TO_EFFECT))
	if(linked_inner.roundstart_template)
		unregister()
	else
		addtimer(CALLBACK(linked_inner, TYPE_PROC_REF(/obj/docking_port/stationary/marine_dropship/airlock/inner, update_outer_airlock), TRUE), 0.1 SECONDS)

/obj/docking_port/stationary/marine_dropship/airlock/outer/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	if(registered)
		unregister()
	linked_inner.disengaged_clamps = FALSE
	linked_inner.lowered_dropship = TRUE
	for(var/turf/open/shuttle/shuttle_turf in block(DROPSHIP_AIRLOCK_BLOCK))
		if(shuttle_turf.clone)
			shuttle_turf.clone.layer = 1.93
			shuttle_turf.clone.color = "#000000"

/obj/docking_port/stationary/marine_dropship/airlock/outer/on_departure(obj/docking_port/mobile/departing_shuttle)
	. = ..()
	if(!registered)
		register(TRUE)

/obj/docking_port/stationary/marine_dropship/airlock/outer/proc/get_outer_airlock_turfs() // why is this the only newly defined proc for the outer? well DROPSHIP_AIRLOCK_BLOCK is a string I'd prefer to keep as a constant (for readability reasons) and I doubt this is ever going to be expected to be callable from the controller obj (the inner airlock)
	linked_inner.outer_airlock_turfs = list()
	for(var/turf/turf as anything in block(DROPSHIP_AIRLOCK_BLOCK))
		if(!istype(turf, /turf/open/floor/hangar_airlock/outer) && !istype(turf, /turf/open/shuttle) && !istype(turf, /turf/closed/shuttle))
			continue
		linked_inner.outer_airlock_turfs += turf

/obj/docking_port/stationary/marine_dropship/airlock/inner/Initialize(mapload)
	. = ..()
	GLOB.dropship_airlock_inners += src
	dropship_height_masks = list()
	floodlights = list()
	door_controls = list()
	poddoors = list()
	inner_airlock_effect = new /obj/effect/hangar_airlock/inner(locate(DROPSHIP_AIRLOCK_FROM_DOCKPORT_TO_EFFECT))
	new /obj/effect/hangar_airlock/outline(locate(DROPSHIP_AIRLOCK_FROM_DOCKPORT_TO_EFFECT))
	if(!roundstart_template)
		unregister()

/obj/docking_port/stationary/marine_dropship/airlock/inner/on_arrival(obj/docking_port/mobile/arriving_shuttle)
	. = ..()
	if(registered)
		unregister()
	auto_open = FALSE // when the dropship that is originally loaded is auto_opened, any further landing dropships will have people onboard to decide to whether or not they want the doors open (which stops people charging out the opened doors when the airlock is open)
	var/list/dropship_turfs = arriving_shuttle.return_turfs()
	for(var/turf/dropship_turf as anything in dropship_turfs)
		if(istype(dropship_turf, /turf/open/shuttle) || istype(dropship_turf, /turf/closed/shuttle))
			var/obj/effect/hangar_airlock/height_mask/dropship/dropship_height_mask = new /obj/effect/hangar_airlock/height_mask/dropship(dropship_turf)
			dropship_height_masks += dropship_height_mask
			continue
		if(istype(dropship_turf, /turf/open/floor/hangar_airlock/inner))
			var/obj/structure/shuttle/part/dropship_part = locate(/obj/structure/shuttle/part) in dropship_turf.contents
			if(!dropship_part)
				continue
			var/obj/effect/hangar_airlock/height_mask/dropship/dropship_part_height_mask = new /obj/effect/hangar_airlock/height_mask/dropship(dropship_turf)
			dropship_part_height_mask.icon = dropship_part.icon
			dropship_part_height_mask.icon_state = dropship_part.icon_state
			dropship_part_height_mask.color = "#000000"
			dropship_height_masks += dropship_part_height_mask

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/get_inner_airlock_turfs()
	inner_airlock_turfs = list()
	for(var/turf/turf as anything in block(DROPSHIP_AIRLOCK_BLOCK))
		if(!istype(turf, /turf/open/floor/hangar_airlock/inner) && !istype(turf, /turf/open/shuttle) && !istype(turf, /turf/closed/shuttle))
			continue
		new /obj/effect/hangar_airlock/height_mask(turf)
		inner_airlock_turfs += turf

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/omnibus_airlock_transition(airlock_type, open, airlock_turfs, obj/effect/hangar_airlock/airlock, end_decisecond)
	var/transition = open ? "open" : "close"
	airlock.icon_state = "[transition]_0s"

	omnibus_sound_play('sound/machines/centrifuge.ogg', 60)

	COOLDOWN_START(src, dropship_airlock_cooldown, end_decisecond)
	addtimer(CALLBACK(src, PROC_REF(delayed_airlock_transition), airlock_type, open, airlock_turfs, airlock, end_decisecond, transition), 0.1 SECONDS)

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/omnibus_sound_play(sound_effect, volume)
	playsound(src, sound_effect, volume, sound_range = 15)
	playsound(linked_outer, sound_effect, volume, sound_range = 15)

/*#############################################################################
Timer Induced (or timer looping) Procs
#############################################################################*/

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/delayed_disengage_clamps()
	if(!docked_mobile.assigned_transit)
		SSshuttle.generate_transit_dock(docked_mobile)
	docked_mobile.set_mode(SHUTTLE_IDLE)
	docked_mobile.initiate_docking(docked_mobile.assigned_transit)
	addtimer(CALLBACK(docked_mobile, TYPE_PROC_REF(/obj/docking_port/mobile/marine_dropship, dropship_freefall)), 0.1 SECONDS)
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/height_decrease()
	processing = TRUE
	if(COOLDOWN_FINISHED(src, dropship_airlock_cooldown))
		docked_mobile.initiate_docking(linked_outer)
		for(var/obj/effect/hangar_airlock/height_mask/qdeling_height_mask as anything in dropship_height_masks)
			dropship_height_masks -= qdeling_height_mask
			qdel(qdeling_height_mask)
		COOLDOWN_RESET(src, dropship_airlock_cooldown)
		processing = FALSE
		return
	var/time_elapsed = DROPSHIP_AIRLOCK_HEIGHT_TRANSITION - COOLDOWN_TIMELEFT(src, dropship_airlock_cooldown)
	for(var/obj/effect/hangar_airlock/height_mask/dropship/transitioning_height_mask as anything in dropship_height_masks)
		transitioning_height_mask.alpha = time_elapsed * 2
	addtimer(CALLBACK(src, PROC_REF(height_decrease)), 0.3 SECONDS)

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/height_increase()
	processing = TRUE
	docked_mobile.initiate_docking(src)
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/stop_processing()
	processing = FALSE

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/delayed_airlock_transition(airlock_type, open, airlock_turfs, obj/effect/hangar_airlock/airlock, end_decisecond, transition)
	if(COOLDOWN_FINISHED(src, dropship_airlock_cooldown))
		airlock.icon_state = "[transition]"
		processing = FALSE
		return
	var/decisecond = (end_decisecond - COOLDOWN_TIMELEFT(src, dropship_airlock_cooldown))
	if(!(decisecond % 10))
		if(decisecond != end_decisecond)
			airlock.icon_state = "[transition]_[decisecond * 0.1]s"
	for(var/turf/open/floor/hangar_airlock/T in airlock_turfs)
		if(decisecond == T.frame_threshold)
			T.open = open
			for(var/atom/movable/AM in T.contents)
				if(!AM.anchored)
					T.Entered(AM)
			T.clean_cleanables()
			T.can_bloody = !open
	addtimer(CALLBACK(src, PROC_REF(delayed_airlock_transition), airlock_type, open, airlock_turfs, airlock, end_decisecond, transition), 0.1 SECONDS)

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
		linked_outer.get_outer_airlock_turfs()
	var/obj/structure/machinery/floodlight/landing/airlock/floodlight
	var/floodlight_increment = 1
	for(floodlight as anything in floodlights)
		addtimer(CALLBACK(floodlight, TYPE_PROC_REF(/obj/structure/machinery/floodlight/landing/airlock, toggle_rotating)), DROPSHIP_AIRLOCK_FLOODLIGHT_TRANSITION * floodlight_increment)
		floodlight_increment += 1
	docked_mobile = get_docked()
	if(docked_mobile)
		docked_mobile.door_control.control_doors("unlock", "all")
	addtimer(CALLBACK(src, PROC_REF(stop_processing)), DROPSHIP_AIRLOCK_FLOODLIGHT_TRANSITION * floodlight_increment)

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_inner_airlock(invert = FALSE)
	processing = TRUE
	if(invert)
		open_inner_airlock = open_inner_airlock ? FALSE : TRUE
	if(!inner_airlock_turfs)
		get_inner_airlock_turfs()
	if(!projector_proxy)
		projector_proxy = locate(/obj/effect/projector) in linked_outer.loc
	if(open_inner_airlock)
		SSfz_transitions.toggle_selective_update(open_inner_airlock, projector_proxy) // start updating the projectors
		omnibus_airlock_transition("inner", TRUE, inner_airlock_turfs, inner_airlock_effect, 50)
	else
		omnibus_airlock_transition("inner", FALSE, inner_airlock_turfs, inner_airlock_effect, 50)
		SSfz_transitions.toggle_selective_update(open_inner_airlock, projector_proxy) // stop updating the projectors

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_dropship_height(invert = FALSE)
	processing = TRUE
	if(invert)
		lowered_dropship = lowered_dropship ? FALSE : TRUE
	if(!inner_airlock_turfs)
		get_inner_airlock_turfs()
	if(!outer_airlock_turfs)
		linked_outer.get_outer_airlock_turfs()
	if(lowered_dropship)
		docked_mobile = get_docked()
		if(linked_outer.get_docked())
			processing = FALSE
			return
	else
		docked_mobile = linked_outer.get_docked()
		if(get_docked())
			processing = FALSE
			return
	if(!docked_mobile)
		WARNING("No dropship to raise height with!")
		processing = TRUE
		return
	omnibus_sound_play(lowered_dropship ? 'sound/machines/asrs_lowering.ogg' : 'sound/machines/asrs_raising.ogg', 60)
	if(lowered_dropship)
		COOLDOWN_START(src, dropship_airlock_cooldown, DROPSHIP_AIRLOCK_HEIGHT_TRANSITION)
		height_decrease()
	else
		addtimer(CALLBACK(src, PROC_REF(height_increase)), DROPSHIP_AIRLOCK_HEIGHT_TRANSITION)

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_outer_airlock(invert = FALSE)
	processing = TRUE
	if(invert)
		open_outer_airlock = open_outer_airlock ? FALSE : TRUE
	if(!outer_airlock_turfs)
		linked_outer.get_outer_airlock_turfs()
	if(open_outer_airlock)
		for(var/obj/structure/machinery/door/poddoor/almayer/airlock/poddoor as anything in poddoors)
			poddoor.close()
		omnibus_airlock_transition("outer", TRUE, outer_airlock_turfs, outer_airlock_effect, DROPSHIP_AIRLOCK_TRANSITION_PERIOD)
	else
		omnibus_airlock_transition("outer", FALSE, outer_airlock_turfs, outer_airlock_effect, DROPSHIP_AIRLOCK_TRANSITION_PERIOD)

/obj/docking_port/stationary/marine_dropship/airlock/inner/proc/update_clamps(invert = FALSE)
	processing = TRUE
	if(invert)
		disengaged_clamps = disengaged_clamps ? FALSE : TRUE
	docked_mobile = linked_outer.get_docked()
	if(!docked_mobile)
		WARNING("No dropship to unclamp in [linked_outer.name]!")
		processing = FALSE
		return
	if(disengaged_clamps)
		playsound(docked_mobile.return_center_turf(), 'sound/effects/dropship_flight_airlocked_start.ogg', 50, sound_range = docked_mobile.dheight)
		addtimer(CALLBACK(src, PROC_REF(delayed_disengage_clamps), docked_mobile), DROPSHIP_AIRLOCK_DECLAMP_PERIOD)

/*#############################################################################
Airlock Appearance Effects
#############################################################################*/

/obj/effect/hangar_airlock
	layer = ABOVE_TURF_LAYER
	plane = FLOOR_PLANE
	indestructible = TRUE
	unacidable = TRUE
	mouse_opacity = FALSE
	anchored = TRUE

// we typically don't want them moving
/obj/effect/hangar_airlock/onShuttleMove(turf/newT, turf/oldT, list/movement_force, move_dir, obj/docking_port/stationary/old_dock, obj/docking_port/mobile/moving_dock)
	if(!anchored)
		. = ..()
	return TRUE

/obj/effect/hangar_airlock/inner
	name = "hangar inner airlock"
	icon = 'icons/effects/airlock_inner.dmi'
	icon_state = "close"
	layer = 1.95

/obj/effect/hangar_airlock/outer
	name = "hangar outer airlock"
	icon = 'icons/effects/airlock_outer.dmi'
	icon_state = "close"
	layer = 1.95

/obj/effect/hangar_airlock/outline
	icon = 'icons/effects/airlock_outline.dmi'
	icon_state = "outline"

/obj/effect/hangar_airlock/half_tile
	icon = 'icons/effects/airlock_32x32.dmi'
	icon_state = "half_tile"

/obj/effect/hangar_airlock/height_mask
	icon = 'icons/effects/airlock_32x32.dmi'
	icon_state = "height_mask"
	layer = 1.94
	alpha = 135
	plane = -7

/obj/effect/hangar_airlock/height_mask/dropship
	layer = 5.01
	alpha = 0
	plane = -6

/*#############################################################################
Airlock Turfs Definitions
#############################################################################*/

/turf/open/floor/hangar_airlock
	hull_floor = TRUE
	breakable_tile = FALSE
	burnable_tile = FALSE
	tool_flags = null
	layer = 1.5
	// to tie the turf opening and the airlock animation together, the frame on which a tile can be considered 'open' or 'closed' has to be done manually.
	var/frame_threshold = null
	var/open = FALSE

/turf/open/floor/hangar_airlock/outer
	name = "Hangar Outer Airlock"
	icon = 'icons/turf/floors/dev/dev_airlock.dmi'
	icon_state = "0"

/turf/open/floor/hangar_airlock/outer/Initialize(mapload, ...)
	. = ..()
	icon = 'icons/turf/floors/space.dmi'
	icon_state = "[((x + y) ^ ~(x * y) + z) % 25]"

/turf/open/floor/hangar_airlock/inner
	name = "Hangar Inner Airlock"
	icon = 'icons/turf/floors/dev/dev_airlock.dmi'
	icon_state = "plate"

/turf/open/floor/hangar_airlock/inner/Initialize(mapload, ...)
	. = ..()
	icon = 'icons/turf/almayer.dmi'
	icon_state = "plate"

/*#############################################################################
Airlock Turf Interactability Procs
#############################################################################*/

/turf/open/floor/hangar_airlock/Entered(atom/movable/AM)
	if(open)
		if(!isobserver(AM) && !istype(AM, /obj/docking_port) && !istype(AM, /atom/movable/clone) && !istype(AM, /obj/effect/hangar_airlock))
			enter_depths(AM)

/turf/open/floor/hangar_airlock/proc/enter_depths(/atom/movable/AM)
	return

/turf/open/floor/hangar_airlock/inner/enter_depths(atom/movable/AM)
	if(AM.throwing == 0)
		AM.visible_message(SPAN_WARNING("[AM] falls into the depths!"), SPAN_WARNING("You fall into the depths!"))
		for(var/A in src.contents)
			if(istype(A, /atom/movable/clone))
				var/atom/movable/clone/C = A
				// why not just use .loc? well, because of /atom/movable/clone facsimile 'turfs', it is potentially the case that we'd locate an area (from the mstr turf of the facsimile) when we just want the exact turf.
				if(istype(get_turf(AM), /turf/open/floor/hangar_airlock))
					AM.forceMove(locate(C.mstr.x, C.mstr.y, C.mstr.z))
					break

				var/obj/structure/shuttle/part/dropship_part_to_locate
				dropship_part_to_locate = locate(/obj/structure/shuttle/part) in orange(8)
				if(dropship_part_to_locate) // presumably, shuttle parts are on the outside skin of a dropship.
					AM.forceMove(dropship_part_to_locate.loc)
					AM.visible_message(SPAN_WARNING("[AM] slides off the roof of the dropship!"), SPAN_WARNING("You slide off the roof of the dropship!"))
					break

				AM.visible_message(SPAN_WARNING("[AM] falls onto the engines of the dropship, burning into ash!"), SPAN_WARNING("You fall onto the engines of the dropship, burning into ash!"))
				qdel(AM)
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

/*#############################################################################
Turf Definitions From Instances
#############################################################################*/

/turf/open/floor/almayer/plate/hangar_1
	icon_state = "hangar_1"
	name = "Hangar Airlock One"

/turf/open/floor/almayer/plate/hangar_2
	icon_state = "hangar_2"
	name = "Hangar Airlock Two"

/turf/open/floor/hangar_airlock/inner/frame5
	frame_threshold = 5
	icon_state = "5" // for strongdmm

/turf/open/floor/hangar_airlock/inner/frame9
	frame_threshold = 9
	icon_state = "9"

/turf/open/floor/hangar_airlock/inner/frame11
	frame_threshold = 11
	icon_state = "11"

/turf/open/floor/hangar_airlock/inner/frame13
	frame_threshold = 13
	icon_state = "13"

/turf/open/floor/hangar_airlock/inner/frame17
	frame_threshold = 17
	icon_state = "17"

/turf/open/floor/hangar_airlock/inner/frame21
	frame_threshold = 21
	icon_state = "21"

/turf/open/floor/hangar_airlock/inner/frame25
	frame_threshold = 25
	icon_state = "25"

/turf/open/floor/hangar_airlock/inner/frame30
	frame_threshold = 30
	icon_state = "30"

/turf/open/floor/hangar_airlock/inner/frame33
	frame_threshold = 33
	icon_state = "33"

/turf/open/floor/hangar_airlock/inner/frame35
	frame_threshold = 35
	icon_state = "35"

/turf/open/floor/hangar_airlock/inner/frame40
	frame_threshold = 40
	icon_state = "40"

/turf/open/floor/hangar_airlock/inner/frame49
	frame_threshold = 49
	icon_state = "49"

/turf/open/floor/hangar_airlock/outer/frame4
	frame_threshold = 4
	icon_state = "_4"

/turf/open/floor/hangar_airlock/outer/frame11
	frame_threshold = 11
	icon_state = "_11"

/turf/open/floor/hangar_airlock/outer/frame19
	frame_threshold = 19
	icon_state = "_19"

/turf/open/floor/hangar_airlock/outer/frame27
	frame_threshold = 27
	icon_state = "_27"

/turf/open/floor/hangar_airlock/outer/frame35
	frame_threshold = 35
	icon_state = "_35"

/turf/open/floor/hangar_airlock/outer/frame43
	frame_threshold = 43
	icon_state = "_43"

/turf/open/floor/hangar_airlock/outer/frame49
	frame_threshold = 49
	icon_state = "_49"
