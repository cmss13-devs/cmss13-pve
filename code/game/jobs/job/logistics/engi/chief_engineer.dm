/datum/job/logistics/engineering
	title = JOB_CHIEF_ENGINEER
	selection_class = "job_ce"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/chief_engineer
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job</a> is to maintain your department and keep your technicians in check. You are responsible for engineering, power, ordnance, and the orbital cannon. Should the commanding and executive officer be unavailable, you are next in the chain of command."

/obj/effect/landmark/start/engineering
	name = JOB_CHIEF_ENGINEER
	icon_state = "ce_spawn"
	job = /datum/job/logistics/engineering
