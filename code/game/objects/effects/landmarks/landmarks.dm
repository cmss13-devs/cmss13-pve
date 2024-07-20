/obj/effect/landmark
	name = "landmark"
	icon = 'icons/landmarks.dmi'
	icon_state = "x2"
	anchored = TRUE
	unacidable = TRUE

	var/invisibility_value = INVISIBILITY_MAXIMUM

/obj/effect/landmark/New()
	tag = "landmark*[name]"
	invisibility = invisibility_value
	return ..()

/obj/effect/landmark/Initialize(mapload, ...)
	. = ..()
	GLOB.landmarks_list += src
	invisibility = invisibility_value

/obj/effect/landmark/Destroy()
	GLOB.landmarks_list -= src
	return ..()

/obj/effect/landmark/newplayer_start
	name = "New player start"

/obj/effect/landmark/newplayer_start/New() // this must be New()
	. = ..()
	GLOB.newplayer_start += src

/obj/effect/landmark/newplayer_start/Destroy()
	GLOB.newplayer_start -= src
	return ..()

/obj/effect/landmark/sim_target
	name = "simulator_target"

/obj/effect/landmark/sim_target/Initialize(mapload, ...)
	. = ..()
	GLOB.simulator_targets += src

/obj/effect/landmark/sim_target/Destroy()
	GLOB.simulator_targets -= src
	return ..()

/obj/effect/landmark/sim_camera
	name = "simulator_camera"
	color = "#FFFF00"

/obj/effect/landmark/sim_camera/Initialize(mapload, ...)
	. = ..()
	GLOB.simulator_cameras += src

/obj/effect/landmark/sim_camera/Destroy()
	GLOB.simulator_cameras -= src
	return ..()

/obj/effect/landmark/observer_start
	name = "Observer Landmark"
	icon = 'icons/mob/mob.dmi'
	icon_state = "ghost1"

/obj/effect/landmark/observer_start/Initialize()
	. = ..()
	GLOB.observer_starts += src

/obj/effect/landmark/observer_start/Destroy()
	GLOB.observer_starts -= src
	return ..()

/obj/effect/landmark/ert_spawns/Initialize(mapload, ...)
	. = ..()
	LAZYADD(GLOB.ert_spawns[type], src)

/obj/effect/landmark/ert_spawns/Destroy()
	LAZYREMOVE(GLOB.ert_spawns[type], src)
	return ..()

// Nightmare insert locations
/obj/effect/landmark/nightmare
	name = "Nightmare Insert"
	icon_state = "nightmare_insert"
	var/insert_tag // Identifier for global mapping
	var/replace = FALSE    // Replace another existing landmark mapping of same name
	var/autoremove = TRUE  // Delete mapped turf when landmark is deleted, such as by an insert in replace mode
/obj/effect/landmark/nightmare/Initialize(mapload, ...)
	. = ..()
	if(!insert_tag) return
	if(!replace && GLOB.nightmare_landmarks[insert_tag])
		return
	GLOB.nightmare_landmarks[insert_tag] = get_turf(src)
/obj/effect/landmark/nightmare/Destroy()
	if(insert_tag && autoremove \
	   && GLOB.nightmare_landmarks[insert_tag] == get_turf(src))
		GLOB.nightmare_landmarks.Remove(insert_tag)
	return ..()

/obj/effect/landmark/ert_spawns/distress
	name = "Distress"

/obj/effect/landmark/ert_spawns/distress/item
	name = "DistressItem"

/obj/effect/landmark/ert_spawns/distress_wo
	name = "distress_wo"

/obj/effect/landmark/ert_spawns/groundside_xeno
	name = "distress_groundside_xeno"

/obj/effect/landmark/monkey_spawn
	name = "monkey_spawn"
	icon_state = "monkey_spawn"

/obj/effect/landmark/monkey_spawn/Initialize(mapload, ...)
	. = ..()
	GLOB.monkey_spawns += src

/obj/effect/landmark/monkey_spawn/Destroy()
	GLOB.monkey_spawns -= src
	return ..()

/obj/effect/landmark/latewhiskey
	name = "Whiskey Outpost Late join"

/obj/effect/landmark/latewhiskey/Initialize(mapload, ...)
	. = ..()
	GLOB.latewhiskey += src

/obj/effect/landmark/latewhiskey/Destroy()
	GLOB.latewhiskey -= src
	return ..()

/obj/effect/landmark/thunderdome/one
	name = "Thunderdome Team 1"
	icon_state = "thunderdome_t1"

/obj/effect/landmark/thunderdome/one/Initialize(mapload, ...)
	. = ..()
	GLOB.thunderdome_one += src

/obj/effect/landmark/thunderdome/one/Destroy()
	GLOB.thunderdome_one -= src
	return ..()

/obj/effect/landmark/thunderdome/two
	name = "Thunderdome Team 2"
	icon_state = "thunderdome_t2"

/obj/effect/landmark/thunderdome/two/Initialize(mapload, ...)
	. = ..()
	GLOB.thunderdome_two += src

/obj/effect/landmark/thunderdome/two/Destroy()
	GLOB.thunderdome_two-= src
	return ..()

/obj/effect/landmark/thunderdome/admin
	name = "Thunderdome Admin"
	icon_state = "thunderdome_admin"

/obj/effect/landmark/thunderdome/admin/Initialize(mapload, ...)
	. = ..()
	GLOB.thunderdome_admin += src

/obj/effect/landmark/thunderdome/admin/Destroy()
	GLOB.thunderdome_admin -= src
	return ..()

/obj/effect/landmark/thunderdome/observer
	name = "Thunderdome Observer"
	icon_state = "thunderdome_observer"

/obj/effect/landmark/thunderdome/observer/Initialize(mapload, ...)
	. = ..()
	GLOB.thunderdome_observer += src

/obj/effect/landmark/thunderdome/observer/Destroy()
	GLOB.thunderdome_observer -= src
	return ..()

/obj/effect/landmark/queen_spawn
	name = "queen spawn"
	icon_state = "queen_spawn"

/obj/effect/landmark/queen_spawn/Initialize(mapload, ...)
	. = ..()
	GLOB.queen_spawns += src

/obj/effect/landmark/queen_spawn/Destroy()
	GLOB.queen_spawns -= src
	return ..()

/obj/effect/landmark/xeno_spawn
	name = "xeno spawn"
	icon_state = "xeno_spawn"

/obj/effect/landmark/xeno_spawn/Initialize(mapload, ...)
	. = ..()
	GLOB.xeno_spawns += src

/obj/effect/landmark/xeno_spawn/Destroy()
	GLOB.xeno_spawns -= src
	return ..()

/obj/effect/landmark/xeno_hive_spawn
	name = "xeno hive spawn"
	icon_state = "hive_spawn"

/obj/effect/landmark/xeno_hive_spawn/Initialize(mapload, ...)
	. = ..()
	GLOB.xeno_hive_spawns += src

/obj/effect/landmark/xeno_hive_spawn/Destroy()
	GLOB.xeno_hive_spawns -= src
	return ..()

/obj/effect/landmark/yautja_teleport
	name = "yautja_teleport"
	/// The index we registered as in mainship_yautja_desc or yautja_teleport_descs
	var/desc_index

/obj/effect/landmark/yautja_teleport/Initialize(mapload, ...)
	. = ..()
	var/turf/turf = get_turf(src)
	desc_index = turf.loc.name + turf.loc_to_string()
	if(is_mainship_level(z))
		GLOB.mainship_yautja_teleports += src
		GLOB.mainship_yautja_desc[desc_index] = src
	else
		GLOB.yautja_teleports += src
		GLOB.yautja_teleport_descs[desc_index] = src

/obj/effect/landmark/yautja_teleport/Destroy()
	GLOB.mainship_yautja_teleports -= src
	GLOB.yautja_teleports -= src
	GLOB.mainship_yautja_desc -= desc_index
	GLOB.yautja_teleport_descs -= desc_index
	return ..()



/obj/effect/landmark/start
	name = "start"
	icon_state = "x"
	anchored = TRUE
	var/job
	var/squad

/obj/effect/landmark/start/Initialize(mapload, ...)
	. = ..()
	if(job)
		if(squad)
			LAZYINITLIST(GLOB.spawns_by_squad_and_job[squad])
			LAZYADD(GLOB.spawns_by_squad_and_job[squad][job], src)
		else
			LAZYADD(GLOB.spawns_by_job[job], src)

	RegisterSignal(SSdcs, COMSIG_GLOB_PLATOON_NAME_CHANGE, PROC_REF(rename_platoon))

/obj/effect/landmark/start/Destroy()
	if(job)
		if(squad)
			LAZYREMOVE(GLOB.spawns_by_squad_and_job[squad][job], src)
		else
			LAZYREMOVE(GLOB.spawns_by_job[job], src)
	return ..()

/obj/effect/landmark/start/proc/rename_platoon(datum/source, new_name, old_name)
	SIGNAL_HANDLER
	if(squad != old_name)
		return

	LAZYREMOVE(GLOB.spawns_by_squad_and_job, squad)
	squad = new_name
	LAZYINITLIST(GLOB.spawns_by_squad_and_job)
	LAZYINITLIST(GLOB.spawns_by_squad_and_job[squad])
	LAZYADD(GLOB.spawns_by_squad_and_job[squad][job], src)

/obj/effect/landmark/start/AISloc
	name = "AI"

//****************************************** LATE JOIN ************************************************/

/obj/effect/landmark/late_join
	name = "late join"
	icon_state = "x2"
	var/squad
	/// What job should latejoin on this landmark
	var/job

/obj/effect/landmark/late_join/alpha
	name = "alpha late join"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/late_join/alpha/Initialize(mapload, ...)
	. = ..()

	RegisterSignal(SSdcs, COMSIG_GLOB_PLATOON_NAME_CHANGE, PROC_REF(rename_platoon))

/obj/effect/landmark/late_join/proc/rename_platoon(datum/source, new_name, old_name)
	SIGNAL_HANDLER

	squad = new_name

/obj/effect/landmark/late_join/bravo
	name = "bravo late join"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/late_join/charlie
	name = "charlie late join"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/late_join/delta
	name = "delta late join"
	squad = SQUAD_MARINE_4

/obj/effect/landmark/late_join/upp
	name = "upp late join"
	squad = SQUAD_UPP

/obj/effect/landmark/late_join/upp/Initialize(mapload, ...)
	. = ..()

	RegisterSignal(SSdcs, COMSIG_GLOB_PLATOON_NAME_CHANGE, PROC_REF(rename_platoon))

/obj/effect/landmark/late_join/working_joe
	name = "working joe late join"
	job = JOB_WORKING_JOE

/obj/effect/landmark/late_join/forecon
	name = "forecon late join"
	squad = SQUAD_LRRP


/obj/effect/landmark/late_join/Initialize(mapload, ...)
	. = ..()
	if(squad)
		LAZYADD(GLOB.latejoin_by_squad[squad], src)
	else if(job)
		LAZYADD(GLOB.latejoin_by_job[job], src)
	else
		GLOB.latejoin += src

/obj/effect/landmark/late_join/Destroy()
	if(squad)
		LAZYREMOVE(GLOB.latejoin_by_squad[squad], src)
	else if(job)
		LAZYREMOVE(GLOB.latejoin_by_job[job], src)
	else
		GLOB.latejoin -= src
	return ..()

//****************************************** STATIC COMMS ************************************************//
/obj/effect/landmark/static_comms
	name = "static comms"
	icon = 'icons/obj/structures/machinery/comm_tower3.dmi'
	icon_state = "comms_landmark"
	var/broken_on_spawn = FALSE

/obj/effect/landmark/static_comms/proc/spawn_tower()
	var/obj/structure/machinery/telecomms/relay/preset/tower/mapcomms/commstower = new /obj/structure/machinery/telecomms/relay/preset/tower/mapcomms(loc)
	if(broken_on_spawn)
		commstower.update_health(damage = health) //fuck it up
	qdel(src)

/obj/effect/landmark/static_comms/net_one
	icon_state = "comms_landmark_1"

/obj/effect/landmark/static_comms/net_one/Initialize(mapload, ...)
	. = ..()
	GLOB.comm_tower_landmarks_net_one += src

/obj/effect/landmark/static_comms/net_one/Destroy()
	GLOB.comm_tower_landmarks_net_one -= src
	return ..()

/obj/effect/landmark/static_comms/net_two
	icon_state = "comms_landmark_2"

/obj/effect/landmark/static_comms/net_two/Initialize(mapload, ...)
	. = ..()
	GLOB.comm_tower_landmarks_net_two += src

/obj/effect/landmark/static_comms/net_two/Destroy()
	GLOB.comm_tower_landmarks_net_two -= src
	return ..()


// zombie spawn
/obj/effect/landmark/zombie
	name = "zombie spawnpoint"
	desc = "The spot a zombie spawns in. Players in-game can't see this."
	icon_state = "corpse_spawner"
	invisibility_value = INVISIBILITY_OBSERVER
	var/spawns_left = 1
	var/infinite_spawns = FALSE

/obj/effect/landmark/zombie/Initialize(mapload, ...)
	. = ..()
	GLOB.zombie_landmarks += src

/obj/effect/landmark/zombie/Destroy()
	GLOB.zombie_landmarks -= src
	return ..()

/obj/effect/landmark/zombie/proc/spawn_zombie(mob/dead/observer/observer)
	if(!infinite_spawns)
		spawns_left--
	if(spawns_left <= 0)
		GLOB.zombie_landmarks -= src
	anim(loc, loc, 'icons/mob/mob.dmi', null, "zombie_rise", 12, SOUTH)
	observer.see_invisible = SEE_INVISIBLE_LIVING
	observer.client.eye = src // gives the player a second to orient themselves to the spawn zone
	addtimer(CALLBACK(src, PROC_REF(handle_zombie_spawn), observer), 1 SECONDS)

/obj/effect/landmark/zombie/proc/handle_zombie_spawn(mob/dead/observer/observer)
	var/mob/living/carbon/human/zombie = new /mob/living/carbon/human(loc)
	if(!zombie.hud_used)
		zombie.create_hud()
	arm_equipment(zombie, /datum/equipment_preset/other/zombie, randomise = TRUE, count_participant = TRUE, mob_client = observer.client, show_job_gear = TRUE)
	observer.client.eye = zombie
	observer.mind.transfer_to(zombie)
	if(spawns_left <= 0)
		qdel(src)

/obj/effect/landmark/zombie/three
	spawns_left = 3

/obj/effect/landmark/zombie/infinite
	infinite_spawns = TRUE

/// Marks the bottom left of the testing zone.
/// In landmarks.dm and not unit_test.dm so it is always active in the mapping tools.
/obj/effect/landmark/unit_test_bottom_left
	name = "unit test zone bottom left"

/// Marks the top right of the testing zone.
/// In landmarks.dm and not unit_test.dm so it is always active in the mapping tools.
/obj/effect/landmark/unit_test_top_right
	name = "unit test zone top right"
