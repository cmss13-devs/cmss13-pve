/obj/docking_port/mobile/crashable/breacher
	name = "Breacher Shuttle"
	id = ESCAPE_SHUTTLE
	area_type = /area/shuttle/breach
	width = 5
	height = 13
	preferred_direction = SOUTH
	rechargeTime = SHUTTLE_RECHARGE
	ignitionTime = 8 SECONDS
	ignition_sound = 'sound/effects/escape_pod_warmup.ogg'
	/// The % chance of the escape pod crashing into the groundmap before lifeboats leaving
	var/early_crash_land_chance = 75
	/// The % chance of the escape pod crashing into the groundmap
	var/crash_land_chance = 0
	/// How many people can be in the escape pod before it crashes
	var/max_capacity = 3

	var/datum/door_controller/single/door_handler = new()
	var/launched = FALSE
	var/evac_set = FALSE

/obj/docking_port/mobile/crashable/breacher/Initialize(mapload)
	. = ..(mapload)
	for(var/place in shuttle_areas)
		for(var/obj/structure/machinery/door/airlock/evacuation/air in place)
			door_handler.doors += list(air)
			air.breakable = FALSE
			air.indestructible = TRUE
			air.unacidable = TRUE
			air.linked_shuttle = src

/obj/docking_port/mobile/crashable/breacher/proc/cancel_evac()
	door_handler.control_doors("force-unlock")
	evac_set = FALSE

	var/obj/structure/machinery/computer/shuttle/escape_pod_panel/panel = getControlConsole()
	if(panel.pod_state != STATE_READY && panel.pod_state != STATE_DELAYED)
		return
	panel.pod_state = STATE_IDLE
	for(var/area/interior_area in shuttle_areas)
		for(var/obj/structure/machinery/cryopod/evacuation/cryotube in interior_area)
			cryotube.dock_state = STATE_IDLE

/obj/docking_port/mobile/crashable/breacher/proc/prepare_evac()
	door_handler.control_doors("force-unlock")
	evac_set = TRUE
	for(var/area/interior_area in shuttle_areas)
		for(var/obj/structure/machinery/cryopod/evacuation/cryotube in interior_area)
			cryotube.dock_state = STATE_READY
	for(var/obj/structure/machinery/door/air in door_handler.doors)
		air.breakable = TRUE
		air.indestructible = FALSE
		air.unslashable = FALSE
		air.unacidable = FALSE

/obj/docking_port/mobile/crashable/breacher/evac_launch()
	. = ..()

	if(mode == SHUTTLE_CRASHED)
		return

	if(launched)
		return

	var/obj/structure/machinery/computer/shuttle/escape_pod_panel/panel = getControlConsole()
	if(panel.pod_state == STATE_DELAYED)
		return

	door_handler.control_doors("force-lock-launch")
	var/occupant_count = 0
	var/list/cryos = list()
	for(var/area/interior_area in shuttle_areas)
		for(var/mob/living/occupant in interior_area)
			occupant_count++
		for(var/obj/structure/machinery/cryopod/evacuation/cryotube in interior_area)
			cryos += list(cryotube)
	if (occupant_count > max_capacity)
		playsound(src,'sound/effects/escape_pod_warmup.ogg', 50, 1)
		sleep(31)
		var/turf/sploded = return_center_turf()
		cell_explosion(sploded, 100, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("escape pod malfunction")) //Clears out walls
		sleep(25)
		mode = SHUTTLE_CRASHED
		for(var/obj/structure/machinery/cryopod/evacuation/cryotube in cryos)
			cryotube.go_out()
		door_handler.control_doors("force-unlock")
		return

	set_mode(SHUTTLE_IGNITING)
	on_ignition()
	setTimer(ignitionTime)
	launched = TRUE

	if(!crash_land) // so doors won't break in space
		for(var/obj/structure/machinery/door/air in door_handler.doors)
			for(var/obj/effect/xenomorph/acid/acid in air.loc)
				if(acid.acid_t == air)
					qdel(acid)
			air.breakable = FALSE
			air.indestructible = TRUE
			air.unacidable = TRUE

/obj/docking_port/mobile/crashable/breacher/crash_check()
	. = ..()

	if(prob((SShijack.hijack_status >= HIJACK_OBJECTIVES_COMPLETE ? crash_land_chance : early_crash_land_chance)))
		return TRUE

/obj/docking_port/mobile/crashable/breacher/open_doors()
	. = ..()

	door_handler.control_doors("force-unlock")

/obj/docking_port/mobile/crashable/breacher/afterShuttleMove(turf/oldT, list/movement_force, shuttle_dir, shuttle_preferred_direction, move_dir, rotation)
	. = ..()
	playsound(src,'sound/effects/escape_pod_launch.ogg', 50, 1)

/obj/docking_port/mobile/crashable/breacher/b
	id = ESCAPE_SHUTTLE_BREACH
	width = 5
	height = 13

/obj/docking_port/stationary/breacher
	name = "Breacher Dock"

/obj/docking_port/stationary/breacher/b
	id = ESCAPE_SHUTTLE_BREACH_PREFIX
	roundstart_template = /datum/map_template/shuttle/breacher_shuttle
	width = 5
	height = 13

/datum/map_template/shuttle/breacher_shuttle
	name = "Breacher Shuttle"
	shuttle_id = ESCAPE_SHUTTLE_BREACH
