
#define GYSGT_VARIANT "Gunnery Sergeant"
#define SSGT_VARIANT "Staff Sergeant"

/datum/job/marine/leader
	title = JOB_SQUAD_LEADER
	total_positions = 4
	spawn_positions = 4
	supervisors = "the acting commanding officer"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/leader
	gear_preset_secondary = /datum/equipment_preset/uscm/leader/lesser_rank
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You are responsible for the men and women of your entire section.</a> Make sure they are on task, working together, and communicating. You are also in charge of communicating with command and letting them know about the situation first hand. Keep out of harm's way.<br><b>You remember that you've stored your personal gear and uniform are located in the dorm or locker rooms.</b>"

	job_options = list(SSGT_VARIANT = "SSGT", GYSGT_VARIANT = "GYSGT")

/datum/job/marine/leader/handle_job_options(option)
	if(option != SSGT_VARIANT)
		gear_preset = initial(gear_preset)
	else
		gear_preset = gear_preset_secondary

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
	gear_preset_secondary = /datum/equipment_preset/uscm/leader/upp/lesser_rank

/datum/job/marine/leader/ai/forecon
	title = JOB_SQUAD_LEADER_FORECON
	gear_preset = /datum/equipment_preset/uscm/leader/forecon
	gear_preset_secondary = /datum/equipment_preset/uscm/leader/forecon/lesser_rank

/obj/effect/landmark/start/marine/leader/upp
	name = JOB_SQUAD_LEADER_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/leader/ai/upp


/datum/job/marine/leader/ai/pmc
	title = JOB_PMCPLAT_LEADER
	gear_preset = /datum/equipment_preset/uscm/pmc/sl
	gear_preset_secondary = /datum/equipment_preset/uscm/pmc/sl

/obj/effect/landmark/start/marine/leader/pmc
	name = JOB_PMCPLAT_LEADER
	squad = SQUAD_PMCPLT
	job = /datum/job/marine/leader/ai/pmc

/obj/effect/landmark/start/marine/leader/forecon
	name = JOB_SQUAD_LEADER_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/leader/ai/forecon

//-- RMC Platoon --//
// Second-in-command under LT, handles the mortar calls //
/datum/job/marine/leader/ai/rmc
	title = JOB_TWE_RMC_TROOPLEADER
	gear_preset = /datum/equipment_preset/uscm/rmc/cs
	job_options = null
	supervisors = "the troop commander"
	entry_message_body = "You are the second in command of the whole Troop, ensuring the orders of the Troop Commander are followed through. Make sure they are on task, working together, and adequately supplied. You are also in charge of communicating with the Mortar Gunner and coordinating indirect fire support. Keep out of harm's way. You report to the Troop Commander under normal circumstances, but may be required to take command should they die.<br><b>You remember that you've stored your personal gear and uniform in the locker rooms, and that your equipment can be located in the Sergeants Mess.</b>"

/obj/effect/landmark/start/marine/leader/rmc
	name = JOB_TWE_RMC_TROOPLEADER
	squad = SQUAD_RMC
	job = /datum/job/marine/leader/ai/rmc

#undef GYSGT_VARIANT
#undef SSGT_VARIANT
