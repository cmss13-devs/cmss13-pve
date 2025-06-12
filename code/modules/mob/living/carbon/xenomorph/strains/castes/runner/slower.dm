/datum/xeno_strain/slower
	name = RUNNER_SLOWER
	description = "Your a shitty runner that cant even pounce lolll!"
	flavor_description = "This one will be the last thing they hear. A martyr."
	icon_state_prefix = "Slower"

	actions_to_remove = list(
		/datum/action/xeno_action/activable/pounce/runner,
		/datum/action/xeno_action/activable/runner_skillshot,
		/datum/action/xeno_action/onclick/toggle_long_range/runner,
	)

	behavior_delegate_type = /datum/behavior_delegate/runner_base
