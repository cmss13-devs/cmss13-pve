/datum/game_mode/colonialmarines/ai
	name = "Outpost Alpha"
	config_tag = "Distress Signal: Lowpop"
	required_players = 1 //Need at least one player, but really we need 2.

	flags_round_type = MODE_INFESTATION|MODE_NEW_SPAWN

/*	medic_set = list(
		/obj/item/bodybag/cryobag,
		/obj/item/device/defibrillator/powerful,
		/obj/item/storage/firstaid/adv,
		/obj/item/device/healthanalyzer,
		/obj/item/roller/medevac,
		/obj/item/roller,
	)*/

	var/list/squad_limit = list(
		SQUAD_MARINE_1
	)

	var/list/objectives = list()
	var/initial_objectives = 0

//	var/list/lootbox_amounts = list(
//		/obj/structure/closet/crate/loot/objects = 200,
//		/obj/structure/closet/crate/loot/weapons = 200,
//		/obj/structure/closet/crate/loot/ammo = 200
//	)

//	var/endgame_spawn_amount = 3
//	var/endgame_remaining_spawns = 8
//	var/game_shuttle_id = "alamo"

//	var/endgame_enabled = FALSE
//	var/boss_battle_enabled = FALSE

//	var/endgame_map_path = "map_files/Hive"
//	var/endgame_map_file = "Hive.dmm"

//	var/endgame_entrance_area = /area/hive_entrance
//	var/list/endgame_map_traits = list()

//	var/boss_to_spawn = /datum/boss_battle/queen

	var/game_started = FALSE

//	var/obj/docking_port/mobile/marine_dropship/game_shuttle
	var/music_range = 12

	var/group_distance = 12
//	var/boss_health_scale_per_player = 4

/*/datum/game_mode/colonialmarines/ai/load_maps(var/list/FailedZs)
	SSmapping.LoadGroup(FailedZs, "The Hive", endgame_map_path, endgame_map_file, endgame_map_traits, ZTRAITS_HIVE, TRUE)*/

/datum/game_mode/colonialmarines/ai/can_start()
	//if(readied_players <= 0)
	//	return FALSE
	return ..()


/datum/game_mode/colonialmarines/ai/pre_setup()
//	game_shuttle = SSshuttle.getShuttle(game_shuttle_id)

	RegisterSignal(SSdcs, COMSIG_GLOB_XENO_SPAWN, .proc/handle_xeno_spawn)
/*	for(var/i in RoleAuthority.squads.Copy())
		var/datum/squad/S = i
		if(!(S.name in squad_limit))
			RoleAuthority.squads -= i

	for(var/i in GLOB.objective_landmarks)
		var/turf/T = get_turf(i)
		var/obj/structure/resource_node/RN = new(T)

		RN.make_active()
		RegisterSignal(RN, list(
//			COMSIG_RESOURCE_NODE_SET_TREE,
			COMSIG_PARENT_QDELETING
		), .proc/finish_objective)
		objectives += RN

	initial_objectives = length(objectives)*/

/*	while(length(GLOB.loot_landmarks) && length(lootbox_amounts))
		var/obj/effect/landmark/loot_landmark/L = pick(GLOB.loot_landmarks)
		GLOB.loot_landmarks -= L
		var/type = pick(lootbox_amounts)
		new type(get_turf(L))

		var/amount_of_type_left = --lootbox_amounts[type]
		if(amount_of_type_left <= 0)
			lootbox_amounts -= type
	lootbox_amounts = null

	for(var/i in GLOB.apc_list)
		var/obj/structure/machinery/power/apc/A = i
		if(A.start_charge == initial(A.start_charge))
			A.cell?.charge = 0

	RegisterSignal(game_shuttle, COMSIG_SHUTTLE_CAN_MOVE_TOPIC, .proc/shuttle_launch_handler)
	RegisterSignal(game_shuttle, COMSIG_SHUTTLE_ON_DOCK, .proc/handle_dock)
	for(var/i in GLOB.shuttle_controls_list)
		var/obj/structure/machinery/computer/shuttle/S = i
		S.possible_destinations = "lz1;lz2"*/

	. = ..()

/datum/game_mode/colonialmarines/ai/announce_bioscans()
	return

/*/datum/game_mode/colonialmarines/ai/proc/finish_objective(var/obj/structure/resource_node/RN)
	SIGNAL_HANDLER

//	if(GLOB.marine_pointshop)
//		GLOB.marine_pointshop.points += RN.points_on_cap
//	objectives -= RN
//	UnregisterSignal(RN, list(
//		COMSIG_RESOURCE_NODE_SET_TREE,
//		COMSIG_PARENT_QDELETING
//	))

	for(var/i in GLOB.xeno_ai_spawns)
		var/obj/effect/landmark/xeno_ai/XA = i
		XA.remaining_spawns = initial(XA.remaining_spawns)

	var/finished_percentage = 1-(length(objectives)/initial_objectives)
	if(finished_percentage > CONFIG_GET(number/ai_director/t2_spawn_at_percentage))
		spawn_flags |= XENO_SPAWN_T2

	if(finished_percentage > CONFIG_GET(number/ai_director/t3_spawn_at_percentage))
		spawn_flags |= XENO_SPAWN_T3

	if(!length(objectives))
		INVOKE_ASYNC(src, .proc/marine_win)*/

/*/datum/game_mode/colonialmarines/ai/proc/enter_endgame()
	marine_announcement("Massive biosignatures detected. xenomorph hive located. Please board the dropship and launch as soon as possible. Autopilot co-ordinates set for xenomorph Hive", "[MAIN_SHIP_NAME] AI", 'sound/misc/distressbeacon_sunshine.ogg')
	for(var/i in GLOB.xeno_ai_spawns)
		var/obj/effect/landmark/xeno_ai/XA = i
		XA.remaining_spawns = endgame_remaining_spawns

	CONFIG_SET(number/ai_director/max_xeno_per_player, endgame_spawn_amount)

	for(var/i in GLOB.shuttle_controls_list)
		var/obj/structure/machinery/computer/shuttle/S = i
		S.possible_destinations = "hive"

	endgame_enabled = TRUE*/

/*/datum/game_mode/colonialmarines/ai/proc/shuttle_launch_handler(var/obj/docking_port/mobile/marine_dropship/DS, var/mob/user)
	SIGNAL_HANDLER
	if(is_mainship_level(DS.z) || endgame_enabled)
		for(var/i in GLOB.alive_client_human_list)
			var/mob/M = i

			if(!istype(get_area(M), /area/shuttle))
				to_chat(user, SPAN_WARNING("You must wait for everyone else to be on the dropship!"))
				return COMPONENT_SHUTTLE_PREVENT_MOVE*/

/*/datum/game_mode/colonialmarines/ai/proc/handle_dock(var/obj/docking_port/mobile/marine_dropship/DS, var/obj/docking_port/stationary/current_dock)
	SIGNAL_HANDLER
	if(!game_started)
		for(var/i in GLOB.human_mob_list)
			var/mob/M = i
			if(M.z == DS.z)
				continue

			if(!M.client)
				qdel(M)
				continue
			M.forceMove(get_turf(DS))
		game_started = TRUE*/

/*	if(endgame_enabled)
		for(var/i in GLOB.alive_client_human_list)
			var/mob/M = i
			if(M.z == DS.z)
				continue
			M.forceMove(get_turf(DS))*/

/datum/game_mode/colonialmarines/ai/declare_completion()
	. = ..()
/*	for(var/i in GLOB.clients)
		var/client/C = i
		C.set_queued_music(null)
		sound_to(C, sound(null, channel=SOUND_CHANNEL_MUSIC))
		C.current_music = null*/

/datum/game_mode/colonialmarines/ai/end_round_message()
	return ..()

/*/datum/game_mode/colonialmarines/ai/proc/start_boss_battle()
	boss_battle_enabled = TRUE
	for(var/i in GLOB.boss_entrance_landmarks)
		var/obj/effect/landmark/boss_entrance/BE = i
		if(BE.close_on_begin)
			BE.attached_object.density = FALSE
			INVOKE_ASYNC(BE.attached_object, /obj/structure/machinery/door.proc/close, TRUE)
		else
			INVOKE_ASYNC(BE.attached_object, /obj/structure/machinery/door.proc/open, TRUE)

	var/datum/boss_battle/BB = new boss_to_spawn()
	var/mob/X = BB.spawn_boss_in(length(GLOB.alive_client_human_list), get_turf(pick(GLOB.boss_spawn)))
	if(!X)
		marine_win()
		CRASH("No boss spawned in for type [boss_to_spawn]!")

	RegisterSignal(X, COMSIG_MOB_DEATH, .proc/marine_win)*/

///datum/game_mode/colonialmarines/ai/proc/marine_win()
	//for(var/i in GLOB.xeno_mob_list)
	//	var/mob/M = i
	//	M.gib("marine win")

	//round_finished = MODE_PVE_WIN

#define XENO_SPAWN_INDEX 1
#define AVERAGE_DISTANCE_INDEX 2

/datum/game_mode/colonialmarines/ai/process(delta_time)
	. = ..()
/*
/*	if(endgame_enabled && !boss_battle_enabled)
		var/ready_for_boss_battle = TRUE
		for(var/i in GLOB.alive_client_human_list)
			var/mob/living/carbon/human/H = i
			var/area/A = get_area(H)
			if(A.type != endgame_entrance_area)
				ready_for_boss_battle = FALSE
				break

		if(ready_for_boss_battle)
			start_boss_battle()*/

//	var/t2_amount = 0
//	var/t3_amount = 0
	var/total_amount = length(GLOB.living_xeno_list)
//	var/list/targetted_players = GLOB.clients.Copy()

/*	for(var/i in GLOB.living_xeno_list)
		var/mob/living/carbon/xenomorph/X = i
		switch(X.tier)
			if(2)
				t2_amount++
			if(3)
				t3_amount++

		if(X.health > 0)
			for(var/h in GLOB.clients)
				var/client/C = h
				if(get_dist(X, C.mob) <= music_range && X.z == C.mob.z)
					if(X.current_target || X.current_path)
						targetted_players[h] += X.tier
					else
						targetted_players[h] = max(targetted_players[h], 1)*/

/*	for(var/i in targetted_players)
		var/client/C = i

		if(SSticker.current_state == GAME_STATE_FINISHED)
			C.set_queued_music(null)
			continue

		if(boss_battle_enabled)
			SET_THREAT(C, length(GLOB.danger_music))
			continue

		if(!total_amount)
			C.set_queued_music(null) // Remove queued music
			continue

		var/new_threat = targetted_players[C]
		if(!new_threat)
			C.set_queued_music(null)
			continue

		SET_THREAT(C, new_threat)*/

	var/list/humans = GLOB.alive_client_human_list.Copy()
	var/list/groups = list()
	while(length(humans))
		var/x = humans[length(humans)]
		humans.len--
		var/list/group = list(x)
		for(var/y in humans)
			if(get_dist(x, y) <= group_distance)
				group += y
				humans -= y

		groups += list(group)


	var/list/xenos_to_spawn = list()

	//while(total_amount < length(GLOB.alive_client_human_list)*CONFIG_GET(number/ai_director/max_xeno_per_player)*length(groups))
//		var/current_amount = total_amount
	//	total_amount++
/*		if(current_amount)
			if(t3_amount >= 2)
				break
			if(t2_amount >= 5)
				break
			if((length(GLOB.alive_human_list) >= 15) && (spawn_flags & XENO_SPAWN_T3) && prob(60))
				xenos_to_spawn += pick(GLOB.t3_ais)
				t3_amount++
				continue

			if((length(GLOB.alive_human_list) >= 10) && (spawn_flags & XENO_SPAWN_T2) && prob(90))
				xenos_to_spawn += pick(GLOB.t2_ais)
				t2_amount++
				continue*/

	//	if(spawn_flags & XENO_SPAWN_T1)
	//		xenos_to_spawn += pick(GLOB.t1_ais,GLOB.t2_ais,GLOB.t3_ais)
	//		continue
	//	break

	var/list/possible_spawners = GLOB.xeno_ai_spawns.Copy()

	for(var/i in GLOB.alive_client_human_list)
		for(var/l in possible_spawners)
			if(get_dist(i, l) < MIN_RANGE_TO_SPAWN_XENO)
				possible_spawners -= l

	for(var/group in groups)
		var/list/spawners_nearby = list()
		var/amount_to_spawn = Ceiling(length(xenos_to_spawn)/length(groups))

		for(var/xa in GLOB.xeno_ai_spawns)
			var/obj/effect/landmark/xeno_ai/XA = xa
			if(XA.remaining_spawns <= 0 || length(XA.spawned_xenos) > XA.remaining_spawns)
				continue

			var/nearby_group = FALSE
			var/average_distance
			for(var/h in group)
				var/mob/M = h
				if(M.z != XA.z)
					continue

				var/distance = get_dist(h, XA)
				average_distance += distance

				if(distance > MAX_RANGE_TO_SPAWN_XENO)
					continue

				nearby_group = TRUE

			average_distance /= length(group)

			if(!nearby_group)
				continue

			var/list/data = list(
				XENO_SPAWN_INDEX = XA,
				AVERAGE_DISTANCE_INDEX = average_distance
			)

			if(!length(spawners_nearby))
				spawners_nearby.Add(list(data))
				continue

			for(var/curr_index in 1 to length(spawners_nearby))
				if(spawners_nearby[curr_index][AVERAGE_DISTANCE_INDEX] < average_distance)
					spawners_nearby.Insert(curr_index+1, list(data))
					break


		while(length(spawners_nearby))
			var/list/data = spawners_nearby[length(spawners_nearby)]
			spawners_nearby.len--
			var/obj/effect/landmark/xeno_ai/XA = data[XENO_SPAWN_INDEX]

			while(amount_to_spawn && length(xenos_to_spawn))
				if(length(XA.spawned_xenos) > XA.remaining_spawns)
					break

				var/type_to_spawn = pick(xenos_to_spawn)
				xenos_to_spawn -= type_to_spawn
				amount_to_spawn--
				var/datum/D = new type_to_spawn(pick(XA.spawnable_turfs))
				XA.RegisterSignal(D, COMSIG_MOB_DEATH, /obj/effect/landmark/xeno_ai.proc/reduce_remaining_spawns)
				XA.RegisterSignal(D, COMSIG_PARENT_QDELETING, /obj/effect/landmark/xeno_ai.proc/handle_xeno_delete)
				XA.spawned_xenos += D
*/
#undef XENO_SPAWN_INDEX
#undef AVERAGE_DISTANCE_INDEX

/datum/game_mode/colonialmarines/ai/proc/handle_xeno_spawn(datum/source, mob/living/carbon/xenomorph/X)
	SIGNAL_HANDLER
	X.make_ai()

/datum/game_mode/colonialmarines/ai/check_win()
	if(!game_started || round_finished || SSticker.current_state != GAME_STATE_PLAYING)
		return

	//if(!length(GLOB.alive_client_human_list))
	//	round_finished = MODE_PVE_LOSE

GLOBAL_LIST_EMPTY_TYPED(objective_landmarks, /obj/effect/landmark/objective_landmark)

/obj/effect/landmark/objective_landmark
	name = "Objective Landmark"
	icon_state = "landmark_node"

/obj/effect/landmark/objective_landmark/Initialize(mapload, ...)
	. = ..()
	GLOB.objective_landmarks += src

/obj/effect/landmark/objective_landmark/Destroy()
	GLOB.objective_landmarks -= src
	return ..()

/*GLOBAL_LIST_EMPTY_TYPED(boss_entrance_landmarks, /obj/effect/landmark/boss_entrance)

/obj/effect/landmark/boss_entrance
	var/close_on_begin = FALSE
	var/obj/structure/machinery/door/attached_object

/obj/effect/landmark/boss_entrance/Initialize(mapload)
	. = ..()
	if(!attached_object)
		return INITIALIZE_HINT_QDEL

	GLOB.boss_entrance_landmarks += src
	attached_object = new attached_object(loc)

/obj/effect/landmark/boss_entrance/Destroy()
	QDEL_NULL(attached_object)
	GLOB.boss_entrance_landmarks -= src
	return ..()

/obj/effect/landmark/boss_entrance/secure_closed
	close_on_begin = FALSE
	attached_object = /obj/structure/machinery/door/poddoor/two_tile/four_tile/secure

/obj/effect/landmark/boss_entrance/secure_open
	close_on_begin = TRUE
	attached_object = /obj/structure/machinery/door/poddoor/two_tile/four_tile/secure/opened



GLOBAL_DATUM(boss_spawn, /obj/effect/landmark/boss_spawn)

/obj/effect/landmark/boss_spawn
	name = "Boss Spawn"

/obj/effect/landmark/boss_spawn/Initialize(mapload, ...)
	. = ..()
	if(GLOB.boss_spawn)
		qdel(GLOB.boss_spawn)
	GLOB.boss_spawn = src

/obj/effect/landmark/boss_spawn/Destroy()
	GLOB.boss_spawn = null
	return ..()


/area/hive_entrance
	name = "\improper xenomorph Hive Entrance"
	requires_power = FALSE
	lighting_use_dynamic = FALSE
	luminosity = TRUE
	icon_state = "caves_lambda"
	ceiling = CEILING_MAX
	ceiling_muffle = FALSE
	ambience_exterior = AMBIENCE_YAUTJA
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC

/area/hive
	name = "\improper xenomorph Hive"
	requires_power = FALSE
	lighting_use_dynamic = FALSE
	luminosity = TRUE
	icon_state = "caves_north"
	ceiling = CEILING_MAX
	ceiling_muffle = FALSE
	ambience_exterior = AMBIENCE_YAUTJA
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC*/
