#define JOB_SQUAD_MARINE_OPFOR "UPP Rifleman"
GLOBAL_LIST_INIT(ROLES_TURBODEATHWAR, list(JOB_SQUAD_MARINE_OPFOR, JOB_SQUAD_MARINE))


/datum/game_mode/colonialmarines/war
	name = "Turbo Death War"
	config_tag = "Turbo Death War"
	required_players = 0
	votable = TRUE

	flags_round_type = MODE_INFESTATION|MODE_NEW_SPAWN|MODE_NO_XENO_EVOLVE

	var/list/squad_limit = list(
		/datum/squad/marine/alpha,
		/datum/squad/marine/upp
	)

	var/list/objectives = list()
	var/initial_objectives = 0

	var/game_started = FALSE
/*
	role_mappings = list(
		/datum/job/command/bridge/ai = JOB_SO,
		/datum/job/marine/leader/ai = JOB_SQUAD_LEADER,
		/datum/job/marine/medic/ai = JOB_SQUAD_MEDIC,
		/datum/job/marine/tl/ai = JOB_SQUAD_TEAM_LEADER,
		/datum/job/marine/smartgunner/ai = JOB_SQUAD_SMARTGUN,
		/datum/job/marine/standard/ai = JOB_SQUAD_MARINE,
	)
*/

	role_mappings = list(
		/datum/job/marine/standard/war_opfor = JOB_SQUAD_MARINE_OPFOR,
		/datum/job/marine/standard/war = JOB_SQUAD_MARINE,
	)

	static_comms_amount = 0
	requires_comms = FALSE
	toggleable_flags = MODE_NO_JOIN_AS_XENO|MODE_HARDCORE_PERMA|MODE_DISABLE_FS_PORTRAIT

/datum/game_mode/colonialmarines/war/can_start()
	return ..()

/datum/game_mode/colonialmarines/war/pre_setup()
	RegisterSignal(SSdcs, COMSIG_GLOB_XENO_SPAWN, PROC_REF(handle_xeno_spawn))
	GLOB.RoleAuthority.reset_roles()

	for(var/datum/squad/squad in GLOB.RoleAuthority.squads)
		if(squad.type in squad_limit)
			continue
		GLOB.RoleAuthority.squads -= squad
		GLOB.RoleAuthority.squads_by_type -= squad.type


	. = ..()

/datum/game_mode/colonialmarines/war/post_setup()
	set_lz_resin_allowed(TRUE)
	return ..()

/datum/game_mode/colonialmarines/war/announce_bioscans()
	return

/datum/game_mode/colonialmarines/war/end_round_message()
	return ..()

/datum/game_mode/colonialmarines/war/proc/handle_xeno_spawn(datum/source, mob/living/carbon/xenomorph/spawning_xeno, ai_hard_off = FALSE)
	SIGNAL_HANDLER
	if(ai_hard_off)
		return

	spawning_xeno.make_ai()

/datum/game_mode/colonialmarines/war/check_win()
	if(!game_started || round_finished || SSticker.current_state != GAME_STATE_PLAYING)
		return

/datum/game_mode/colonialmarines/war/get_roles_list()
	return GLOB.ROLES_TURBODEATHWAR

/datum/game_mode/colonialmarines/war/check_queen_status()
	return
