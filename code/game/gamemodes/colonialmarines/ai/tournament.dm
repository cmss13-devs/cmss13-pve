/datum/game_mode/tournament
	name = "Tournament"
	config_tag = "Tournament"
	required_players = 0
	votable = FALSE

	flags_round_type = MODE_NEW_SPAWN|MODE_NO_XENO_EVOLVE

	role_mappings = list(
		/datum/job/marine/leader/ai/tournament = JOB_SQUAD_LEADER,
		/datum/job/marine/medic/ai/tournament = JOB_SQUAD_MEDIC,
		/datum/job/marine/tl/ai/tournament = JOB_SQUAD_TEAM_LEADER,
		/datum/job/marine/smartgunner/ai/tournament = JOB_SQUAD_SMARTGUN,
		/datum/job/marine/standard/ai/tournament = JOB_SQUAD_MARINE,
	)

	static_comms_amount = 0
	requires_comms = FALSE
	toggleable_flags = MODE_NO_JOIN_AS_XENO|MODE_HARDCORE_PERMA

/datum/game_mode/tournament/get_roles_list()
	return ROLES_AI