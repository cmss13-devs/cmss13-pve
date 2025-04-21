
#define SGT_VARIANT "Sergeant"
#define SSGT_VARIANT "Staff Sergeant"

/datum/job/command/crew_chief
	title = JOB_DROPSHIP_CREW_CHIEF
	total_positions = 2
	spawn_positions = 2
	allow_additional = TRUE
	scaled = TRUE
	supervisors = "the pilot officer"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/dcc
	gear_preset_secondary = /datum/equipment_preset/uscm_ship/dcc/lesser_rank
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job is to assist</a> the pilot officer maintain the ship's dropship. You have authority only on the dropship, but you are expected to maintain order, as not to disrupt the pilot."

	job_options = list(SGT_VARIANT = "SGT", SSGT_VARIANT = "SSGT")

/obj/effect/landmark/start/crew_chief
	name = JOB_DROPSHIP_CREW_CHIEF
	icon_state = "dcc_spawn"
	job = /datum/job/command/crew_chief

/datum/job/command/crew_chief/handle_job_options(option)
	if(option != SGT_VARIANT)
		gear_preset = initial(gear_preset)
	else
		gear_preset = gear_preset_secondary

/datum/job/command/crew_chief/ai
	total_positions = 1
	spawn_positions = 1

/datum/job/command/crew_chief/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/command/crew_chief/ai/get_total_positions(latejoin=0)
	return latejoin ? total_positions : spawn_positions

