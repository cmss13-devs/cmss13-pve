/turf/open/openspace
	name = "open space"
	desc = "Watch your step!"
	// We don't actually draw openspace, but it needs to have color
	// In its icon state so we can count it as a "non black" tile
	icon = 'icons/turf/floors/space.dmi'
	icon_state = "invisible"
	baseturfs = /turf/open/openspace
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = TRANSPARENT_FLOOR_PLANE

// Reminder, any behavior code written here needs to be duped to /turf/open/space/openspace
// I am so sorry
/turf/open/openspace/Initialize(mapload) // handle plane and layer here so that they don't cover other obs/turfs in Dream Maker
	. = ..()
	if(PERFORM_ALL_TESTS(focus_only/openspace_clear) && !GET_TURF_BELOW(src))
		stack_trace("[src] was inited as openspace with nothing below it at ([x], [y], [z])")
	RegisterSignal(src, COMSIG_ATOM_AFTER_SUCCESSFUL_INITIALIZED_ON, PROC_REF(on_atom_created))

	return INITIALIZE_HINT_LATELOAD

/turf/open/openspace/LateInitialize()
	. = ..()
	AddElement(/datum/element/turf_z_transparency)

/**
 * Prepares a moving movable to be precipitated if Move() is successful.
 * This is done in Enter() and not Entered() because there's no easy way to tell
 * if the latter was called by Move() or forceMove() while the former is only called by Move().
 */
/turf/open/openspace/Enter(atom/movable/movable, atom/oldloc)
	. = ..()
	if(.)
		//higher priority than CURRENTLY_Z_FALLING so the movable doesn't fall on Entered()
		movable.set_currently_z_moving(CURRENTLY_Z_FALLING_FROM_MOVE)

///Makes movables fall when forceMove()'d to this turf.
/turf/open/openspace/Entered(atom/movable/movable)
	. = ..()
	if(movable.set_currently_z_moving(CURRENTLY_Z_FALLING))
		zFall(movable, falling_from_move = TRUE)

/**
 * Drops movables spawned on this turf after they are successfully initialized.
 * so that spawned movables that should fall to gravity, will fall.
 */
/turf/open/openspace/proc/on_atom_created(datum/source, atom/created_atom)
	SIGNAL_HANDLER
	if(ismovable(created_atom))
		zfall_if_on_turf(created_atom)

/turf/open/openspace/proc/zfall_if_on_turf(atom/movable/movable)
	if(QDELETED(movable) || movable.loc != src)
		return
	zFall(movable)

/turf/open/openspace/zPassIn(direction)
	if(direction == DOWN)
		for(var/obj/contained_object in contents)
			if(contained_object.flags_obj & BLOCK_Z_IN_DOWN)
				return FALSE
		return TRUE
	if(direction == UP)
		for(var/obj/contained_object in contents)
			if(contained_object.flags_obj & BLOCK_Z_IN_UP)
				return FALSE
		return TRUE
	return FALSE

/turf/open/openspace/zPassOut(direction)
	if(direction == DOWN)
		for(var/obj/contained_object in contents)
			if(contained_object.flags_obj & BLOCK_Z_OUT_DOWN)
				return FALSE
		return TRUE
	if(direction == UP)
		for(var/obj/contained_object in contents)
			if(contained_object.flags_obj & BLOCK_Z_OUT_UP)
				return FALSE
		return TRUE
	return FALSE
