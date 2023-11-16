/datum/job/civilian/reserve
	title = JOB_RESERVE
	total_positions = -1
	spawn_positions = -1
	supervisors = "God and whatever he will say"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/liaison
	entry_message_body = "As a <a href='"+WIKI_PLACEHOLDER+"'>Reserve Unit</a>, your job is listening what's God saying."

/obj/effect/landmark/start/reserve
	name = JOB_RESERVE
	icon_state = "tl_spawn"
	job = /datum/job/civilian/reserve