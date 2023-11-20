/// Turf type that appears to be a world border, completely impassable and non-interactable to all physical (alive) entities.
/turf/cordon
	name = "cordon"
	icon = 'icons/turf/walls.dmi'
	icon_state = "cordon"
	invisibility = INVISIBILITY_ABSTRACT
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	opacity = TRUE
	density = TRUE
	baseturfs = /turf/cordon

/turf/cordon/ScrapeAway(amount, flags)
	return src

/turf/cordon/bullet_act(obj/projectile/Proj)
	SHOULD_CALL_PARENT(FALSE)
	return TRUE

/turf/cordon/Adjacent(atom/neighbor, atom/target, atom/movable/mover)
	return FALSE

/turf/cordon/Bumped(atom/movable/bumped_atom)
	. = ..()

	dump_in_space(bumped_atom)

/// Area used in conjuction with the cordon turf to create a fully functioning world border.
/area/misc/cordon
	name = "CORDON"
	icon_state = "cordon"
	static_lighting = FALSE
	base_lighting_alpha = 255
	requires_power = FALSE

/area/misc/cordon/Entered(atom/movable/arrived, atom/OldLoc)
	. = ..()

	dump_in_space(arrived)
