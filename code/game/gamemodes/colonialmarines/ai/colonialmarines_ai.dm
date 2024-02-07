/datum/game_mode/colonialmarines/ai
	name = "Distress Signal: Lowpop"
	config_tag = "Distress Signal: Lowpop"
	required_players = 0
	votable = TRUE

	flags_round_type = MODE_INFESTATION|MODE_NEW_SPAWN|MODE_NO_XENO_EVOLVE

	var/list/squad_limit = list(
		/datum/squad/marine/alpha
	)

	var/list/objectives = list()
	var/initial_objectives = 0

	var/game_started = FALSE

	role_mappings = list(
		/datum/job/command/bridge/ai = JOB_SO,
		/datum/job/marine/leader/ai = JOB_SQUAD_LEADER,
		/datum/job/marine/medic/ai = JOB_SQUAD_MEDIC,
		/datum/job/marine/tl/ai = JOB_SQUAD_TEAM_LEADER,
		/datum/job/marine/smartgunner/ai = JOB_SQUAD_SMARTGUN,
		/datum/job/marine/standard/ai = JOB_SQUAD_MARINE,
	)

	static_comms_amount = 0
	requires_comms = FALSE
	toggleable_flags = MODE_NO_JOIN_AS_XENO|MODE_HARDCORE_PERMA

/datum/game_mode/colonialmarines/ai/can_start()
	return ..()

/datum/game_mode/colonialmarines/ai/pre_setup()
	RegisterSignal(SSdcs, COMSIG_GLOB_XENO_SPAWN, PROC_REF(handle_xeno_spawn))
	if(GLOB.platoon_overriden)
		squad_limit.Cut()
		squad_limit += GLOB.overriden_platoon
		for(var/i in squad_limit)
			role_mappings = GLOB.platoon_to_jobs[i]
		RoleAuthority.reset_roles()
		for(var/datum/squad/sq in RoleAuthority.squads)
			if(sq.type in squad_limit)
				GLOB.main_platoon_name = sq.name
				GLOB.main_platoon_initial_name = sq.name


	for(var/datum/squad/squad in RoleAuthority.squads)
		if(squad.type in squad_limit)
			continue
		RoleAuthority.squads -= squad
		RoleAuthority.squads_by_type -= squad.type


	. = ..()

/datum/game_mode/colonialmarines/ai/announce_bioscans()
	return

/datum/game_mode/colonialmarines/ai/end_round_message()
	return ..()

/datum/game_mode/colonialmarines/ai/proc/handle_xeno_spawn(datum/source, mob/living/carbon/xenomorph/spawning_xeno, ai_hard_off = FALSE)
	SIGNAL_HANDLER
	if(ai_hard_off)
		return

	spawning_xeno.make_ai()

/datum/game_mode/colonialmarines/ai/check_win()
	if(!game_started || round_finished || SSticker.current_state != GAME_STATE_PLAYING)
		return

/datum/game_mode/colonialmarines/ai/get_roles_list()
	if(GLOB.platoon_overriden)
		var/squad
		for(var/i in GLOB.overriden_platoon)
			squad = i
		return GLOB.platoon_to_role_list[squad]
	else
		return ROLES_AI

GLOBAL_VAR_INIT(platoon_overriden, FALSE)
GLOBAL_LIST_INIT(overriden_platoon, list())

/client/proc/game_master_choose_platoon()
	set name = "Choose Platoon"
	set category = "Game Master.Extras"

	if(!admin_holder || !check_rights(R_MOD, FALSE))
		return

	if(GLOB.master_mode != "Distress Signal: Lowpop")
		return

	GLOB.platoon_overriden = TRUE

	override_platoon()

/proc/override_platoon()
	to_chat(usr, "Current platoon: [english_list(GLOB.overriden_platoon)]")
	if(SSticker.current_state != GAME_STATE_PREGAME)
		to_chat(usr, "This can only be used during lobby!")
		return
	var/list/possible_platoons = list(/datum/squad/marine/upp, /datum/squad/marine/alpha)
	var/platoon_input = input(usr, "Select your Platoon.", "Squad Selection")  as null|anything in possible_platoons
	GLOB.overriden_platoon.Cut()
	GLOB.overriden_platoon += platoon_input
	GLOB.gamemode_roles["Distress Signal: Lowpop"] = GLOB.platoon_to_role_list[platoon_input]
	to_chat(usr, "Selected platoon: [english_list(GLOB.overriden_platoon)]")
	to_chat(world, SPAN_NOTICE("Gamemaster has changed platoon type! Check out occupation preferences!"))

GLOBAL_LIST_INIT(platoon_to_jobs, list(/datum/squad/marine/alpha = list(/datum/job/command/bridge/ai = JOB_SO,\
		/datum/job/marine/leader/ai = JOB_SQUAD_LEADER,\
		/datum/job/marine/medic/ai = JOB_SQUAD_MEDIC,\
		/datum/job/marine/tl/ai = JOB_SQUAD_TEAM_LEADER,
		/datum/job/marine/smartgunner/ai = JOB_SQUAD_SMARTGUN,\
		/datum/job/marine/standard/ai = JOB_SQUAD_MARINE), /datum/squad/marine/upp = list(/datum/job/command/bridge/ai/upp = JOB_SO,\
		/datum/job/marine/leader/ai/upp = JOB_SQUAD_LEADER,\
		/datum/job/marine/medic/ai/upp = JOB_SQUAD_MEDIC,\
		/datum/job/marine/tl/ai/upp = JOB_SQUAD_TEAM_LEADER,
		/datum/job/marine/smartgunner/ai/upp = JOB_SQUAD_SMARTGUN,\
		/datum/job/marine/standard/ai/upp = JOB_SQUAD_MARINE)))

GLOBAL_LIST_INIT(platoon_to_role_list, list(/datum/squad/marine/alpha = ROLES_AI,\
												/datum/squad/marine/upp = ROLES_AI_UPP))
