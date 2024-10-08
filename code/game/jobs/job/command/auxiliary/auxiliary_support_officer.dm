/datum/job/command/auxiliary_officer
	title = JOB_AUXILIARY_OFFICER
	total_positions = 1
	spawn_positions = 1
	allow_additional = TRUE
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/auxiliary_officer
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job is to oversee</a> the hangar crew, the intel officers, the engineering department, and requisition department. You have many responsibilities and a few plates to keep spinning but your subordinates are mostly self-reliant. Assist where you can and make sure command personnel are confident the auxiliary departments are operating at peak efficiency."

/obj/effect/landmark/start/auxiliary_officer
	name = JOB_AUXILIARY_OFFICER
	job = /datum/job/command/auxiliary_officer

/datum/timelock/auxiliary
	name = "Auxiliary Roles"

/datum/timelock/auxiliary/New(name, time_required, list/roles)
	. = ..()
	src.roles = JOB_AUXILIARY_ROLES_LIST
