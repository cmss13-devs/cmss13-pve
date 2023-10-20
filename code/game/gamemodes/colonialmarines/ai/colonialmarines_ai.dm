/datum/game_mode/colonialmarines/ai
	name = "Distress Signal: Lowpop"
	config_tag = "Distress Signal: Lowpop"
	required_players = 0
	votable = TRUE

	flags_round_type = MODE_INFESTATION|MODE_NEW_SPAWN

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

/datum/game_mode/colonialmarines/ai/can_start()
	return ..()

/datum/game_mode/colonialmarines/ai/pre_setup()

	//Hacky pre-setup shit since RoleAuthority sucks
	RoleAuthority.squads = list()
	RoleAuthority.squads_by_type = list()
	for(var/cycled_squad_type in squad_limit)
		var/datum/squad/cycled_squad = new cycled_squad_type()
		RoleAuthority.squads += cycled_squad
		RoleAuthority.squads_by_type[cycled_squad.type] = cycled_squad

	RegisterSignal(SSdcs, COMSIG_GLOB_XENO_SPAWN, PROC_REF(handle_xeno_spawn))

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
	return ROLES_AI
