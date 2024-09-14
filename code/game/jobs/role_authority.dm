/*
How this works:
jobs.dm contains the job defines that work on that level only. Things like equipping a character, creating IDs, and so forth, are handled there.
Role Authority handles the creation and assignment of roles. Roles can be things like regular marines, PMC response teams, aliens, and so forth.
Role Authority creates two master lists on New(), one for every role defined in the game, by path, and one only for roles that should appear
at round start, by name. The title of a role is important and is a unique identifier. Two roles can share the same title, but it's really
the same role, just with different equipment, spawn conditions, or something along those lines. The title is there to tell the job ban system
which roles to ban, and it does so through the roles_by_name master list.

When a round starts, the roles are assigned based on the round, from another list. This is done to make sure that both the master list of roles
by name can be kept for things like job bans, while the round may add or remove roles as needed.If you need to equip a mob for a job, always
use roles_by_path as it is an accurate account of every specific role path (with specific equipment).
*/
GLOBAL_DATUM(RoleAuthority, /datum/authority/branch/role)

#define GET_RANDOM_JOB 0
#define BE_MARINE 1
#define RETURN_TO_LOBBY 2

#define NEVER_PRIORITY 0
#define PRIME_PRIORITY 1
#define HIGH_PRIORITY 2
#define MED_PRIORITY 3
#define LOW_PRIORITY 4

#define SHIPSIDE_ROLE_WEIGHT 0.25

GLOBAL_VAR_INIT(players_preassigned, 0)

/proc/guest_jobbans(job)
	return (job in GLOB.ROLES_COMMAND)

/datum/authority/branch/role
	var/name = "Role Authority"

	var/list/roles_by_path //Master list generated when role aithority is created, listing every role by path, including variable roles. Great for manually equipping with.
	var/list/roles_by_name //Master list generated when role authority is created, listing every default role by name, including those that may not be regularly selected.
	var/list/roles_for_mode //Derived list of roles only for the game mode, generated when the round starts.
	var/list/castes_by_path //Master list generated when role aithority is created, listing every caste by path.
	var/list/castes_by_name //Master list generated when role authority is created, listing every default caste by name.

	/// List of mapped roles that should be used in place of usual ones
	var/list/role_mappings
	var/list/default_roles

	var/list/unassigned_players
	var/list/squads
	var/list/squads_by_type

//Whenever the controller is created, we want to set up the basic role lists.
/datum/authority/branch/role/New()
	var/roles_all[] = typesof(/datum/job) - list( //We want to prune all the parent types that are only variable holders.
											/datum/job,
											/datum/job/command,
											/datum/job/civilian,
											/datum/job/logistics,
											/datum/job/marine,
											/datum/job/antag,
											/datum/job/special,
											/datum/job/special/provost,
											/datum/job/special/uaac,
											/datum/job/special/uaac/tis,
											/datum/job/special/uscm,
											)
	var/squads_all[] = typesof(/datum/squad) - /datum/squad
	var/castes_all[] = subtypesof(/datum/caste_datum)

	if(!length(roles_all))
		to_world(SPAN_DEBUG("Error setting up jobs, no job datums found."))
		log_debug("Error setting up jobs, no job datums found.")
		return //No real reason this should be length zero, so we'll just return instead.

	if(!length(squads_all))
		to_world(SPAN_DEBUG("Error setting up squads, no squad datums found."))
		log_debug("Error setting up squads, no squad datums found.")
		return

	if(!length(castes_all))
		to_world(SPAN_DEBUG("Error setting up castes, no caste datums found."))
		log_debug("Error setting up castes, no caste datums found.")
		return

	castes_by_path = list()
	castes_by_name = list()
	for(var/caste in castes_all) //Setting up our castes.
		var/datum/caste_datum/C = new caste()

		if(!C.caste_type) //In case you forget to subtract one of those variable holder jobs.
			to_world(SPAN_DEBUG("Error setting up castes, blank caste name: [C.type].</span>"))
			log_debug("Error setting up castes, blank caste name: [C.type].")
			continue

		castes_by_path[C.type] = C
		castes_by_name[C.caste_type] = C

	roles_by_path = list()
	roles_by_name = list()
	roles_for_mode = list()
	for(var/role in roles_all) //Setting up our roles.
		var/datum/job/J = new role()

		if(!J.title) //In case you forget to subtract one of those variable holder jobs.
			to_world(SPAN_DEBUG("Error setting up jobs, blank title job: [J.type]."))
			log_debug("Error setting up jobs, blank title job: [J.type].")
			continue

		roles_by_path[J.type] = J
		roles_by_name[J.title] = J

	squads = list()
	squads_by_type = list()
	for(var/squad in squads_all) //Setting up our squads.
		var/datum/squad/S = new squad()
		squads += S
		squads_by_type[S.type] = S

//#undef FACTION_TO_JOIN

/*
Consolidated into a better collection of procs. It was also calling too many loops, and I tried to fix that as well.
I hope it's easier to tell what the heck this proc is even doing, unlike previously.
 */


/datum/authority/branch/role/proc/setup_candidates_and_roles(list/overwritten_roles_for_mode)
	//===============================================================\\
	//PART I: Get roles relevant to the mode

	var/datum/game_mode/G = SSticker.mode
	roles_for_mode = list()
	for(var/role_name in G.get_roles_list())
		var/datum/job/J = roles_by_name[role_name]
		if(!J)
			continue
		roles_for_mode[role_name] = J

	// Also register game mode specific mappings to standard roles
	role_mappings = list()
	default_roles = list()
	if(G.role_mappings)
		for(var/role_path in G.role_mappings)
			var/mapped_title = G.role_mappings[role_path]
			var/datum/job/J = roles_by_path[role_path]
			if(!J || !roles_by_name[mapped_title])
				continue
			role_mappings[mapped_title] = J
			default_roles[J.title] = mapped_title

	/*===============================================================*/

	//===============================================================\\
	//PART II: Setting up our player variables and lists, to see if we have anyone to destribute.

	unassigned_players = list()
	for(var/mob/new_player/player as anything in GLOB.new_player_list)
		if(!player.ready || player.job) //get only players who are ready and unassigned
			continue

		var/datum/preferences/prefs = player.client?.prefs
		if(!prefs) //either no client to play, or no preferences
			continue

		if(prefs.alternate_option == RETURN_TO_LOBBY && !prefs.has_job_priorities()) //only try to assign players that could possibly be assigned
			continue

		unassigned_players += player

	if(!length(unassigned_players)) //If we don't have any players, the round can't start.
		unassigned_players = null
		return

	var/list/player_weights = list()
	var/debug_total_weight = 0
	for(var/mob/new_player/cycled_unassigned as anything in unassigned_players)
		var/base_weight = 1 //baseline weighting

		var/new_bonus = 0
		switch(cycled_unassigned.client.get_total_human_playtime()) //+1 for new players, +2 for really new players
			if(0 to 2 HOURS)
				new_bonus = 2
			if(2 HOURS to 5 HOURS)
				new_bonus = 1

		var/streak_bonus = max(get_client_stat(cycled_unassigned.client, PLAYER_STAT_UNASSIGNED_ROUND_STREAK) - 2, 0) //+1 per missed round after 2

		player_weights[cycled_unassigned] = base_weight + new_bonus + streak_bonus
		debug_total_weight += player_weights[cycled_unassigned]
	log_debug("ASSIGNMENT: player_weights generated with [length(player_weights)] players and [debug_total_weight] total weight.")

	unassigned_players = shuffle_weight(player_weights)
	var/list/debug_weight_order = list()
	for(var/mob/new_player/cycled_unassigned as anything in unassigned_players)
		debug_weight_order += player_weights[cycled_unassigned]
	log_debug("ASSIGNMENT: unassigned_players by entry weight: ([debug_weight_order.Join(", ")])")

	// How many positions do we open based on total pop
	for(var/i in roles_by_name)
		var/datum/job/J = roles_by_name[i]
		if(J.scaled)
			J.set_spawn_positions(length(unassigned_players))

	/*===============================================================*/

	//===============================================================\\
	//PART III: Here we're doing the main body of the loop and assigning everyone.

	var/list/temp_roles_for_mode = roles_for_mode
	if(length(overwritten_roles_for_mode))
		temp_roles_for_mode = overwritten_roles_for_mode

	// Assign the roles, this time for real, respecting limits we have established.
	assign_roles(temp_roles_for_mode.Copy(), unassigned_players)

	unassigned_players = null

	/*===============================================================*/

/// Assign roles to the players. Return roles that are still available.
/datum/authority/branch/role/proc/assign_roles(list/roles_to_assign, list/unassigned_players)
	if(!length(roles_to_assign) || !length(unassigned_players))
		return

	log_debug("ASSIGNMENT: Starting prime priority assignments.")
	for(var/mob/new_player/cycled_unassigned in unassigned_players)
		assign_role_to_player_by_priority(cycled_unassigned, roles_to_assign, unassigned_players, PRIME_PRIORITY)

	log_debug("ASSIGNMENT: Starting regular priority assignments.")
	for(var/mob/new_player/cycled_unassigned in unassigned_players)
		var/player_assigned_job = FALSE

		for(var/priority in HIGH_PRIORITY to LOW_PRIORITY)
			player_assigned_job = assign_role_to_player_by_priority(cycled_unassigned, roles_to_assign, unassigned_players, priority)
			if(player_assigned_job)
				break

		if(!length(roles_to_assign))
			log_debug("ASSIGNMENT: No more roles to assign, breaking.")
			break

		if(!player_assigned_job)
			switch(cycled_unassigned.client.prefs.alternate_option)
				if(GET_RANDOM_JOB)
					var/iterator = 0
					while((cycled_unassigned in unassigned_players) || iterator >= 5)
						iterator++
						var/random_job_name = pick(roles_to_assign)
						var/datum/job/random_job = roles_to_assign[random_job_name]

						if(assign_role(cycled_unassigned, random_job))
							log_debug("ASSIGNMENT: We have randomly assigned [random_job_name] to [cycled_unassigned]")
							cycled_unassigned.client.player_data.adjust_stat(PLAYER_STAT_UNASSIGNED_ROUND_STREAK, STAT_CATEGORY_MISC, 0, TRUE)
							unassigned_players -= cycled_unassigned

							if(random_job.spawn_positions != -1 && random_job.current_positions >= random_job.spawn_positions)
								roles_to_assign -= random_job_name
								log_debug("ASSIGNMENT: We have ran out of slots for [random_job_name] and it has been removed from roles to assign.")

					if(iterator > 5)
						log_debug("ASSIGNMENT: [cycled_unassigned] was unable to be randomly assigned a job. Something has gone wrong.")

				if(BE_MARINE)
					var/datum/job/marine_job = GET_MAPPED_ROLE(JOB_SQUAD_MARINE)
					if(assign_role(cycled_unassigned, marine_job))
						log_debug("ASSIGNMENT: We have assigned [marine_job.title] to [cycled_unassigned] via alternate option.")
						cycled_unassigned.client.player_data.adjust_stat(PLAYER_STAT_UNASSIGNED_ROUND_STREAK, STAT_CATEGORY_MISC, 0, TRUE)
						unassigned_players -= cycled_unassigned

						if(marine_job.spawn_positions != -1 && marine_job.current_positions >= marine_job.spawn_positions)
							roles_to_assign -= marine_job.title
							log_debug("ASSIGNMENT: We have ran out of slots for [marine_job.title] and it has been removed from roles to assign.")
					else
						log_debug("ASSIGNMENT: We were unable to assign [marine_job.title] to [cycled_unassigned] via alternate option.")

				if(RETURN_TO_LOBBY)
					log_debug("ASSIGNMENT: [cycled_unassigned] has opted for return to lobby alternate option.")
					cycled_unassigned.ready = 0

	log_debug("ASSIGNMENT: Assignment complete. Players unassigned: [length(unassigned_players)] Jobs unassigned: [length(roles_to_assign)]")
	for(var/mob/new_player/cycled_unassigned in unassigned_players)
		cycled_unassigned.client.player_data.adjust_stat(PLAYER_STAT_UNASSIGNED_ROUND_STREAK, STAT_CATEGORY_MISC, 1)

	return roles_to_assign

/datum/authority/branch/role/proc/assign_role_to_player_by_priority(mob/new_player/cycled_unassigned, list/roles_to_assign, list/unassigned_players, priority)
	var/wanted_jobs_by_name = shuffle(cycled_unassigned.client.prefs.get_jobs_by_priority(priority))
	var/player_assigned_job = FALSE

	for(var/job_name in wanted_jobs_by_name)
		if(job_name in roles_to_assign)
			var/datum/job/actual_job = roles_to_assign[job_name]

			if(assign_role(cycled_unassigned, actual_job))
				log_debug("ASSIGNMENT: We have assigned [job_name] to [cycled_unassigned] at priority [priority].")
				cycled_unassigned.client.player_data?.adjust_stat(PLAYER_STAT_UNASSIGNED_ROUND_STREAK, STAT_CATEGORY_MISC, 0, TRUE)
				unassigned_players -= cycled_unassigned

				if(actual_job.spawn_positions != -1 && actual_job.current_positions >= actual_job.spawn_positions)
					roles_to_assign -= job_name
					log_debug("ASSIGNMENT: We have ran out of slots for [job_name] and it has been removed from roles to assign.")

				player_assigned_job = TRUE
				break

	if(player_assigned_job)
		return player_assigned_job

	return player_assigned_job

/**
* Calculate role balance weight for one person joining as that role. This weight is used
* when calculating the number of xenos both roundstart and burrowed larva they get for
* people late joining. This weight also controls the size of local wildlife population,
* survivors and the number of roundstart Squad Rifleman slots.
*/
/datum/authority/branch/role/proc/calculate_role_weight(datum/job/J)
	if(!J)
		return 0
	if(GLOB.ROLES_MARINES.Find(J.title))
		return 1
	if(GLOB.ROLES_XENO.Find(J.title))
		return 1
	if(J.title == JOB_SURVIVOR)
		return 1
	return SHIPSIDE_ROLE_WEIGHT

/datum/authority/branch/role/proc/assign_role(mob/new_player/M, datum/job/J, latejoin = FALSE)
	if(ismob(M) && istype(J))
		if(check_role_entry(M, J, latejoin))
			M.job = J.title
			J.current_positions++
			return TRUE

/datum/authority/branch/role/proc/check_role_entry(mob/new_player/M, datum/job/J, latejoin = FALSE)
	if(jobban_isbanned(M, J.title))
		return FALSE
	if(J.role_ban_alternative && jobban_isbanned(M, J.role_ban_alternative))
		return FALSE
	if(!J.can_play_role(M.client))
		return FALSE
	if(!J.check_whitelist_status(M))
		return FALSE
	if(J.total_positions != -1 && J.get_total_positions(latejoin) <= J.current_positions)
		return FALSE
	if(latejoin && !J.late_joinable)
		return FALSE
	return TRUE

/datum/authority/branch/role/proc/free_role(datum/job/J, latejoin = 1) //Want to make sure it's a job, and nothing like a MODE or special role.
	if(istype(J) && J.total_positions != -1 && J.get_total_positions(latejoin) >= J.current_positions)
		J.current_positions--
		return 1

/datum/authority/branch/role/proc/free_role_admin(datum/job/J, latejoin = 1, user) //Specific proc that used for admin "Free Job Slots" verb (round tab)
	if(!istype(J) || J.total_positions == -1)
		return
	if(J.current_positions < 1) //this should be filtered earlier, but we still check just in case
		to_chat(user, "There are no [J] job slots occupied.")
		return

//here is the main reason this proc exists - to remove freed squad jobs from squad,
//so latejoining person ends in the squad which's job was freed and not random one
	var/datum/squad/sq = null
	if(GLOB.job_squad_roles.Find(J.title))
		var/list/squad_list = list()
		for(sq in GLOB.RoleAuthority.squads)
			if(sq.usable)
				squad_list += sq
		sq = null
		sq = input(user, "Select squad you want to free [J.title] slot from.", "Squad Selection")  as null|anything in squad_list
		if(!sq)
			return
		switch(J.title)
			if(JOB_SQUAD_ENGI)
				if(sq.num_engineers > 0)
					sq.num_engineers--
				else
					to_chat(user, "There are no [J.title] slots occupied in [sq.name] Squad.")
					return
			if(JOB_SQUAD_MEDIC)
				if(sq.num_medics > 0)
					sq.num_medics--
				else
					to_chat(user, "There are no [J.title] slots occupied in [sq.name] Squad.")
					return
			if(JOB_SQUAD_SPECIALIST)
				if(sq.num_specialists > 0)
					sq.num_specialists--
				else
					to_chat(user, "There are no [J.title] slots occupied in [sq.name] Squad.")
					return
			if(JOB_SQUAD_SMARTGUN)
				if(sq.num_smartgun > 0)
					sq.num_smartgun--
				else
					to_chat(user, "There are no [J.title] slots occupied in [sq.name] Squad.")
					return
			if(JOB_SQUAD_TEAM_LEADER)
				if(sq.num_tl > 0)
					sq.num_tl--
				else
					to_chat(user, "There are no [J.title] slots occupied in [sq.name] Squad.")
					return
			if(JOB_SQUAD_LEADER)
				if(sq.num_leaders > 0)
					sq.num_leaders--
				else
					to_chat(user, "There are no [J.title] slots occupied in [sq.name] Squad.")
					return
	J.current_positions--
	message_admins("[key_name(user)] freed the [J.title] job slot[sq ? " in [sq.name] Squad" : ""].")
	return 1

/datum/authority/branch/role/proc/modify_role(datum/job/J, amount)
	if(!istype(J))
		return 0
	if(amount < J.current_positions) //we should be able to slot everyone
		return 0
	J.total_positions = amount
	J.total_positions_so_far = amount
	return 1

//I'm not entirely sure why this proc exists. //TODO Figure this out.
/datum/authority/branch/role/proc/reset_roles()
	for(var/mob/new_player/M in GLOB.new_player_list)
		M.job = null


/datum/authority/branch/role/proc/equip_role(mob/living/new_mob, datum/job/new_job, late_join)
	if(!istype(new_mob) || !istype(new_job))
		return

	. = TRUE

	if(!ishuman(new_mob))
		return

	var/mob/living/carbon/human/new_human = new_mob

	if(new_job.job_options && new_human?.client?.prefs?.pref_special_job_options[new_job.title])
		new_job.handle_job_options(new_human.client.prefs.pref_special_job_options[new_job.title])

	var/job_whitelist = new_job.title
	var/whitelist_status = new_job.get_whitelist_status(new_human.client)

	if(whitelist_status)
		job_whitelist = "[new_job.title][whitelist_status]"

	new_human.job = new_job.title //TODO Why is this a mob variable at all?

	if(new_job.gear_preset_whitelist[job_whitelist])
		arm_equipment(new_human, new_job.gear_preset_whitelist[job_whitelist], FALSE, TRUE, late_join = late_join)
		var/generated_account = new_job.generate_money_account(new_human)
		new_job.announce_entry_message(new_human, generated_account, whitelist_status) //Tell them their spawn info.
		new_job.generate_entry_conditions(new_human, whitelist_status) //Do any other thing that relates to their spawn.
	else
		arm_equipment(new_human, new_job.gear_preset, FALSE, TRUE, late_join = late_join) //After we move them, we want to equip anything else they should have.
		var/generated_account = new_job.generate_money_account(new_human)
		new_job.announce_entry_message(new_human, generated_account) //Tell them their spawn info.
		new_job.generate_entry_conditions(new_human) //Do any other thing that relates to their spawn.

	if(new_job.flags_startup_parameters & ROLE_ADD_TO_SQUAD) //Are we a muhreen? Randomize our squad. This should go AFTER IDs. //TODO Robust this later.
		randomize_squad(new_human)

	if(Check_WO() && GLOB.job_squad_roles.Find(GET_DEFAULT_ROLE(new_human.job))) //activates self setting proc for marine headsets for WO
		var/datum/game_mode/whiskey_outpost/WO = SSticker.mode
		WO.self_set_headset(new_human)

	var/assigned_squad
	if(ishuman(new_human))
		var/mob/living/carbon/human/human = new_human
		if(human.assigned_squad)
			assigned_squad = human.assigned_squad.name

	if(isturf(late_join))
		new_human.forceMove(late_join)
	else if(late_join)
		var/turf/late_join_turf
		if(GLOB.latejoin_by_squad[assigned_squad])
			late_join_turf = get_turf(pick(GLOB.latejoin_by_squad[assigned_squad]))
		else if(GLOB.latejoin_by_job[new_job.title])
			late_join_turf = get_turf(pick(GLOB.latejoin_by_job[new_job.title]))
		else
			late_join_turf = get_turf(pick(GLOB.latejoin))
		new_human.forceMove(late_join_turf)
	else
		var/turf/join_turf
		if(assigned_squad && GLOB.spawns_by_squad_and_job[assigned_squad] && GLOB.spawns_by_squad_and_job[assigned_squad][new_job.type])
			join_turf = get_turf(pick(GLOB.spawns_by_squad_and_job[assigned_squad][new_job.type]))
		else if(GLOB.spawns_by_job[new_job.type])
			join_turf = get_turf(pick(GLOB.spawns_by_job[new_job.type]))
		else if(assigned_squad && GLOB.latejoin_by_squad[assigned_squad])
			join_turf = get_turf(pick(GLOB.latejoin_by_squad[assigned_squad]))
		else
			join_turf = get_turf(pick(GLOB.latejoin))
		new_human.forceMove(join_turf)

	for(var/cardinal in GLOB.cardinals)
		var/obj/structure/machinery/cryopod/pod = locate() in get_step(new_human, cardinal)
		if(pod)
			pod.go_in_cryopod(new_human, silent = TRUE)
			break

	new_human.sec_hud_set_ID()
	new_human.hud_set_squad()

	SEND_SIGNAL(new_human, COMSIG_POST_SPAWN_UPDATE)
	SSround_recording.recorder.track_player(new_human)

//Find which squad has the least population. If all 4 squads are equal it should just use a random one
/datum/authority/branch/role/proc/get_lowest_squad(mob/living/carbon/human/H)
	if(!length(squads)) //Something went wrong, our squads aren't set up.
		to_world("Warning, something messed up in get_lowest_squad(). No squads set up!")
		return null


	//we make a list of squad that is randomized so alpha isn't always lowest squad.
	var/list/squads_copy = squads.Copy()
	var/list/mixed_squads = list()

	for(var/i= 1 to length(squads_copy))
		var/datum/squad/S = pick_n_take(squads_copy)
		if (S.roundstart && S.usable && S.faction == H.faction && S.name != "Root")
			mixed_squads += S

	var/datum/squad/lowest = pick(mixed_squads)

	var/datum/pref_squad_name
	if(H && H.client && H.client.prefs.preferred_squad && H.client.prefs.preferred_squad != "None")
		pref_squad_name = H.client.prefs.preferred_squad

	for(var/datum/squad/L in mixed_squads)
		if(L.usable)
			if(pref_squad_name && L.name == pref_squad_name)
				lowest = L
				break


	if(!lowest)
		to_world("Warning! Bug in get_random_squad()!")
		return null

	var/lowest_count = lowest.count
	var/current_count = 0

	if(!pref_squad_name)
		//Loop through squads.
		for(var/datum/squad/S in mixed_squads)
			if(!S)
				to_world("Warning: Null squad in get_lowest_squad. Call a coder!")
				break //null squad somehow, let's just abort
			current_count = S.count //Grab our current squad's #
			if(current_count >= (lowest_count - 2)) //Current squad count is not much lower than the chosen one. Skip it.
				continue
			lowest_count = current_count //We found a winner! This squad is much lower than our default. Make it the new default.
			lowest = S //'Select' this squad.

	return lowest //Return whichever squad won the competition.

//This proc is a bit of a misnomer, since there's no actual randomization going on.
/datum/authority/branch/role/proc/randomize_squad(mob/living/carbon/human/H, skip_limit = FALSE)
	if(!H)
		return

	if(!length(squads))
		to_chat(H, "Something went wrong with your squad randomizer! Tell a coder!")
		return //Shit, where's our squad data

	if(H.assigned_squad) //Wait, we already have a squad. Get outta here!
		return

	//we make a list of squad that is randomized so alpha isn't always lowest squad.
	var/list/squads_copy = squads.Copy()
	var/list/mixed_squads = list()
	// The following code removes non useable squads from the lists of squads we assign marines too.
	for(var/i= 1 to length(squads_copy))
		var/datum/squad/S = pick_n_take(squads_copy)
		if (S.roundstart && S.usable && S.faction == H.faction && S.name != "Root")
			mixed_squads += S

	//Deal with IOs first
	if(H.job == JOB_INTEL)
		var/datum/squad/intel_squad = get_squad_by_name(SQUAD_MARINE_INTEL)
		if(!intel_squad || !istype(intel_squad)) //Something went horribly wrong!
			to_chat(H, "Something went wrong with randomize_squad()! Tell a coder!")
			return
		intel_squad.put_marine_in_squad(H) //Found one, finish up
		return

	//Deal with non-standards first.
	//Non-standards are distributed regardless of squad population.
	//If the number of available positions for the job are more than max_whatever, it will break.
	//Ie. 8 squad medic jobs should be available, and total medics in squads should be 8.
	if(H.job != JOB_SQUAD_MARINE && H.job != "Reinforcements")
		var/pref_squad_name
		if(H && H.client && H.client.prefs.preferred_squad && H.client.prefs.preferred_squad != "None")
			pref_squad_name = H.client.prefs.preferred_squad

		var/datum/squad/lowest

		switch(H.job)
			if(JOB_SQUAD_ENGI)
				for(var/datum/squad/S in mixed_squads)
					if(S.usable && S.roundstart)
						if(!skip_limit && S.num_engineers >= S.max_engineers) continue
						if(pref_squad_name && S.name == pref_squad_name)
							S.put_marine_in_squad(H) //fav squad has a spot for us, no more searching needed.
							return

						if(!lowest)
							lowest = S
						else if(S.num_engineers < lowest.num_engineers)
							lowest = S

			if(JOB_SQUAD_MEDIC)
				for(var/datum/squad/S in mixed_squads)
					if(S.usable && S.roundstart)
						if(!skip_limit && S.num_medics >= S.max_medics) continue
						if(pref_squad_name && S.name == pref_squad_name)
							S.put_marine_in_squad(H) //fav squad has a spot for us.
							return

						if(!lowest)
							lowest = S
						else if(S.num_medics < lowest.num_medics)
							lowest = S

			if(JOB_SQUAD_LEADER)
				for(var/datum/squad/S in mixed_squads)
					if(S.usable && S.roundstart)
						if(!skip_limit && S.num_leaders >= S.max_leaders) continue
						if(pref_squad_name && S.name == pref_squad_name)
							S.put_marine_in_squad(H) //fav squad has a spot for us.
							return

						if(!lowest)
							lowest = S
						else if(S.num_leaders < lowest.num_leaders)
							lowest = S

			if(JOB_SQUAD_SPECIALIST)
				for(var/datum/squad/S in mixed_squads)
					if(S.usable && S.roundstart)
						if(!skip_limit && S.num_specialists >= S.max_specialists) continue
						if(pref_squad_name && S.name == pref_squad_name)
							S.put_marine_in_squad(H) //fav squad has a spot for us.
							return

						if(!lowest)
							lowest = S
						else if(S.num_specialists < lowest.num_specialists)
							lowest = S

			if(JOB_SQUAD_TEAM_LEADER)
				for(var/datum/squad/S in mixed_squads)
					if(S.usable && S.roundstart)
						if(!skip_limit && S.num_tl >= S.max_tl) continue
						if(pref_squad_name && S.name == pref_squad_name)
							S.put_marine_in_squad(H) //fav squad has a spot for us.
							return

						if(!lowest)
							lowest = S
						else if(S.num_tl < lowest.num_tl)
							lowest = S

			if(JOB_SQUAD_SMARTGUN)
				for(var/datum/squad/S in mixed_squads)
					if(S.usable && S.roundstart)
						if(!skip_limit && S.num_smartgun >= S.max_smartgun) continue
						if(pref_squad_name && S.name == pref_squad_name)
							S.put_marine_in_squad(H) //fav squad has a spot for us.
							return

						if(!lowest)
							lowest = S
						else if(S.num_smartgun < lowest.num_smartgun)
							lowest = S

			if(JOB_SQUAD_RTO)
				for(var/datum/squad/S in mixed_squads)
					if(S.usable && S.roundstart)
						if(pref_squad_name && S.name == pref_squad_name)
							S.put_marine_in_squad(H) //fav squad has a spot for us.
							return

						if(!lowest)
							lowest = S
		if(!lowest)
			var/ranpick = rand(1,4)
			lowest = mixed_squads[ranpick]
		if(lowest) lowest.put_marine_in_squad(H)
		else to_chat(H, "Something went badly with randomize_squad()! Tell a coder!")

	else
		//Deal with marines. They get distributed to the lowest populated squad.
		var/datum/squad/given_squad = get_lowest_squad(H)
		if(!given_squad || !istype(given_squad)) //Something went horribly wrong!
			to_chat(H, "Something went wrong with randomize_squad()! Tell a coder!")
			return
		given_squad.put_marine_in_squad(H) //Found one, finish up

/datum/authority/branch/role/proc/get_caste_by_text(name)
	var/mob/living/carbon/xenomorph/M
	switch(name) //ADD NEW CASTES HERE!
		if(XENO_CASTE_LARVA)
			M = /mob/living/carbon/xenomorph/larva
		if(XENO_CASTE_PREDALIEN_LARVA)
			M = /mob/living/carbon/xenomorph/larva/predalien
		if(XENO_CASTE_FACEHUGGER)
			M = /mob/living/carbon/xenomorph/facehugger
		if(XENO_CASTE_LESSER_DRONE)
			M = /mob/living/carbon/xenomorph/lesser_drone
		if(XENO_CASTE_RUNNER)
			M = /mob/living/carbon/xenomorph/runner
		if(XENO_CASTE_DRONE)
			M = /mob/living/carbon/xenomorph/drone
		if(XENO_CASTE_CARRIER)
			M = /mob/living/carbon/xenomorph/carrier
		if(XENO_CASTE_HIVELORD)
			M = /mob/living/carbon/xenomorph/hivelord
		if(XENO_CASTE_BURROWER)
			M = /mob/living/carbon/xenomorph/burrower
		if(XENO_CASTE_PRAETORIAN)
			M = /mob/living/carbon/xenomorph/praetorian
		if(XENO_CASTE_RAVAGER)
			M = /mob/living/carbon/xenomorph/ravager
		if(XENO_CASTE_SENTINEL)
			M = /mob/living/carbon/xenomorph/sentinel
		if(XENO_CASTE_SPITTER)
			M = /mob/living/carbon/xenomorph/spitter
		if(XENO_CASTE_LURKER)
			M = /mob/living/carbon/xenomorph/lurker
		if(XENO_CASTE_WARRIOR)
			M = /mob/living/carbon/xenomorph/warrior
		if(XENO_CASTE_DEFENDER)
			M = /mob/living/carbon/xenomorph/defender
		if(XENO_CASTE_QUEEN)
			M = /mob/living/carbon/xenomorph/queen
		if(XENO_CASTE_CRUSHER)
			M = /mob/living/carbon/xenomorph/crusher
		if(XENO_CASTE_BOILER)
			M = /mob/living/carbon/xenomorph/boiler
		if(XENO_CASTE_PREDALIEN)
			M = /mob/living/carbon/xenomorph/predalien
		if(XENO_CASTE_HELLHOUND)
			M = /mob/living/carbon/xenomorph/hellhound
		if(XENO_CASTE_KING)
			M = /mob/living/carbon/xenomorph/king
	return M


/proc/get_desired_status(desired_status, status_limit)
	var/found_desired = FALSE
	var/found_limit = FALSE

	for(var/status in GLOB.whitelist_hierarchy)
		if(status == desired_status)
			found_desired = TRUE
			break
		if(status == status_limit)
			found_limit = TRUE
			break

	if(found_desired)
		return desired_status
	else if(found_limit)
		return status_limit

	return desired_status

/proc/transfer_marine_to_squad(mob/living/carbon/human/transfer_marine, datum/squad/new_squad, datum/squad/old_squad, obj/item/card/id/ID)
	if(old_squad)
		if(transfer_marine.assigned_fireteam)
			if(old_squad.fireteam_leaders["FT[transfer_marine.assigned_fireteam]"] == transfer_marine)
				old_squad.unassign_ft_leader(transfer_marine.assigned_fireteam, TRUE, FALSE)
			old_squad.unassign_fireteam(transfer_marine, TRUE) //reset fireteam assignment
		old_squad.remove_marine_from_squad(transfer_marine, ID)
		old_squad.update_free_mar()
	. = new_squad.put_marine_in_squad(transfer_marine, ID)
	if(.)
		new_squad.update_free_mar()

		var/marine_ref = WEAKREF(transfer_marine)
		for(var/datum/data/record/t in GLOB.data_core.general) //we update the crew manifest
			if(t.fields["ref"] == marine_ref)
				t.fields["squad"] = new_squad.name
				break

		transfer_marine.hud_set_squad()

// returns TRUE if transfer_marine's role is at max capacity in the new squad
/datum/authority/branch/role/proc/check_squad_capacity(mob/living/carbon/human/transfer_marine, datum/squad/new_squad)
	switch(transfer_marine.job)
		if(JOB_SQUAD_LEADER)
			if(new_squad.num_leaders >= new_squad.max_leaders)
				return TRUE
		if(JOB_SQUAD_SPECIALIST)
			if(new_squad.num_specialists >= new_squad.max_specialists)
				return TRUE
		if(JOB_SQUAD_ENGI)
			if(new_squad.num_engineers >= new_squad.max_engineers)
				return TRUE
		if(JOB_SQUAD_MEDIC)
			if(new_squad.num_medics >= new_squad.max_medics)
				return TRUE
		if(JOB_SQUAD_SMARTGUN)
			if(new_squad.num_smartgun >= new_squad.max_smartgun)
				return TRUE
		if(JOB_SQUAD_TEAM_LEADER)
			if(new_squad.num_tl >= new_squad.max_tl)
				return TRUE
	return FALSE
