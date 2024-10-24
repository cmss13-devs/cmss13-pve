
#define SSGT_VARIANT "Staff Sergeant"
#define GYSGT_VARIANT "Gunnery Sergeant"

/datum/job/marine/leader
	title = JOB_SQUAD_LEADER
	total_positions = 4
	spawn_positions = 4
	supervisors = "the acting commanding officer"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/leader
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You are responsible for the men and women of your entire platoon.</a> Make sure they are on task, working together, and communicating. You are also in charge of communicating with command and letting them know about the situation first hand. Keep out of harm's way.<br><b>You remember that you've stored your personal gear and uniform are located in the dorm or locker rooms.</b>"

	job_options = list(GYSGT_VARIANT = "GySgt", SSGT_VARIANT = "SSgt")

/datum/job/marine/leader/whiskey
	title = JOB_WO_SQUAD_LEADER
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/sl

OverrideTimelock(/datum/job/marine/leader, list(
	JOB_SQUAD_ROLES = 1 HOURS
))

/obj/effect/landmark/start/marine/leader
	name = JOB_SQUAD_LEADER
	icon_state = "leader_spawn"
	job = /datum/job/marine/leader

/obj/effect/landmark/start/marine/leader/alpha
	icon_state = "leader_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/leader/bravo
	icon_state = "leader_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/leader/charlie
	icon_state = "leader_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/leader/delta
	icon_state = "leader_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/leader/ai
	total_positions = 1
	spawn_positions = 1
	prime_priority = TRUE

/datum/job/marine/leader/ai/upp
	title = JOB_SQUAD_LEADER_UPP
	gear_preset = /datum/equipment_preset/uscm/leader/upp
	job_options = list("Master Serzhant" = "MSzh", "Starshina" = "Strsh")

/datum/job/marine/leader/ai/forecon
	title = JOB_SQUAD_LEADER_FORECON
	gear_preset = /datum/equipment_preset/uscm/leader/forecon
	job_options = list("Gunnery Sergeant" = "GySgt", "Master Sergeant" = "MSgt")

/obj/effect/landmark/start/marine/leader/upp
	name = JOB_SQUAD_LEADER_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/leader/ai/upp

/obj/effect/landmark/start/marine/leader/forecon
	name = JOB_SQUAD_LEADER_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/leader/ai/forecon

#undef SSGT_VARIANT
#undef GYSGT_VARIANT
