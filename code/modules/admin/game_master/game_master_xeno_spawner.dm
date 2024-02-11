GLOBAL_LIST_EMPTY(gm_xeno_spawners)

/datum/game_master_xeno_spawner
	/// The actual image holder that is added to game masters' clients
	var/image/gm_image

	/// The location the xenomorphs will spawn at.
	var/turf/spawn_loc

	/// The type of xeno to be spawned.
	var/mob/living/carbon/xenomorph/spawn_type

	/// The number of xenos to be spawned.
	var/spawn_count

	/// The delay until xenos are spawned (may be 0, in which case xenos spawn instantaneously).
	var/spawn_delay

	/// If TRUE, the spawner will not delete itself after firing.
	var/looping

	/// The hive the spawned xenos will belong to.
	var/spawn_hive

	/// Whether or not to spawn xenos with AI: if TRUE, the spawned xenos will have AI.
	var/spawn_ai

	/// If TRUE, the spawn will fail if any humans are within "fail_range" tiles.
	/// This will cause the spawner to either delete itself or reset its spawn timer, depending on whether it loops.
	var/fail_if_human_near

	var/fail_range = 9

/datum/game_master_xeno_spawner/New(turf/s_loc, mob/living/carbon/xenomorph/s_type, s_count, s_delay, loop, s_hive, s_ai, fail_human)
	GLOB.gm_xeno_spawners += src

	spawn_loc = s_loc
	spawn_type = s_type
	spawn_count = s_count
	spawn_delay = s_delay
	looping = loop
	spawn_hive = s_hive
	spawn_ai = s_ai
	fail_if_human_near = fail_human

	// we can return early if we aren't waiting for anything
	if(spawn_delay <= 0)
		spawn_xenos()
		return

	addtimer(CALLBACK(src, PROC_REF(spawn_xenos)), spawn_delay)

	// get the icon state for the xeno type we're trying to spawn
	var/derived_icon_state =  initial(spawn_type.mutation_type) + " " + initial(spawn_type.icon_state)
	gm_image = new(
		initial(spawn_type.icon),
		spawn_loc,
		derived_icon_state,
		layer = ABOVE_FLY_LAYER,
	)
	// centers the xeno
	gm_image.pixel_x = -(initial(spawn_type.icon_size) - 32)/2
	// slightly more visible than observers
	gm_image.alpha = 150
	// color matrix. this makes them look sorta overexposed. janky, but it's more important that it looks distinguishable than good
	gm_image.color = list(
		1.5, 0, 0,
		0, 1.5, 0,
		0, 0, 1.5,
		0.25, 0.25, 0.25
	)

	for(var/client/game_master in GLOB.game_masters)
		game_master.images |= gm_image

/datum/game_master_xeno_spawner/Destroy(force, silent, ...)
	. = ..()

	GLOB.gm_xeno_spawners -= src

	// cleans up the image
	if(gm_image)
		for(var/client/game_master in GLOB.game_masters)
			game_master.images -= gm_image
		QDEL_NULL(gm_image)

/datum/game_master_xeno_spawner/proc/spawn_xenos()
	var/failure = FALSE

	if(fail_if_human_near)
		for(var/mob/living/carbon/human as anything in GLOB.alive_human_list)
			if(human.client && human.z == spawn_loc.z && (get_dist(human, spawn_loc) <= fail_range))
				failure = TRUE
				break

	if(!failure)
		for(var/i = 1 to spawn_count)
			new spawn_type(spawn_loc, null, spawn_hive, !spawn_ai)

	if(spawn_delay && looping)
		addtimer(CALLBACK(src, PROC_REF(spawn_xenos)), spawn_delay)
	else
		qdel(src)
