/datum/game_mode/colonialmarines/ai
	name = "Distress Signal: Lowpop"
	config_tag = "Distress Signal: Lowpop"
	required_players = 0

	flags_round_type = MODE_INFESTATION|MODE_NEW_SPAWN

	var/list/squad_limit = list(
		SQUAD_MARINE_1
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
	RegisterSignal(SSdcs, COMSIG_GLOB_XENO_SPAWN, PROC_REF(handle_xeno_spawn))

	. = ..()

/datum/game_mode/colonialmarines/ai/announce_bioscans()
	return

/datum/game_mode/colonialmarines/ai/declare_completion()
	. = ..()

/datum/game_mode/colonialmarines/ai/end_round_message()
	return ..()

/datum/game_mode/colonialmarines/ai/proc/handle_xeno_spawn(datum/source, mob/living/carbon/xenomorph/X)
	SIGNAL_HANDLER
	X.make_ai()

/datum/game_mode/colonialmarines/ai/check_win()
	if(!game_started || round_finished || SSticker.current_state != GAME_STATE_PLAYING)
		return

/datum/game_mode/colonialmarines/ai/get_roles_list()
	return ROLES_AI
