/obj/effect/projector
	density = FALSE
	unacidable = TRUE
	anchored = TRUE
	invisibility = 101
	layer = TURF_LAYER
	var/vector_x = 0
	var/vector_y = 0
	var/vector_z = 0
	var/mask_layer = null // all actual layers are divided by 10 and then subtracted from the mask layer.
	var/movables_projection_plane = -6 //necessary to change when making a movable go under a turf (whose plane is -7)
	var/modify_turf = TRUE
	var/projected_mouse_opacity = 1
	var/projected_opacity
	icon = 'icons/landmarks.dmi'
	icon_state = "projector"//for map editor

/obj/effect/projector/onShuttleMove(turf/newT, turf/oldT, list/movement_force, move_dir, obj/docking_port/stationary/old_dock, obj/docking_port/mobile/moving_dock)
	return TRUE
	// we don't want projectors moving

// defined so we can deselect their firing for performance and also so we can spawn them in after/before dropships interact with projectors
/obj/effect/projector/bay_one
	name = "Bay One"
	vector_x = 52
	vector_y = -60
	mask_layer = 1.9
	movables_projection_plane = -7
	modify_turf = FALSE
	projected_mouse_opacity = 0
	projected_opacity = 0

/obj/effect/projector/bay_two
	name = "Bay Two"
	vector_x = 52
	vector_y = -60
	mask_layer = 1.9
	movables_projection_plane = -7
	modify_turf = FALSE
	projected_mouse_opacity = 0
	projected_opacity = 0
