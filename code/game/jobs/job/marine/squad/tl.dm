#define SSGT_VARIANT "Staff Sergeant"
#define SGT_VARIANT "Sergeant"
#define CPL_VARIANT "Corporal"
#define JSGT_VARIANT "Junior Sergeant"

/datum/job/marine/tl
	title = JOB_SQUAD_TEAM_LEADER
	total_positions = 8
	spawn_positions = 8
	allow_additional = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/tl
	gear_preset_secondary = /datum/equipment_preset/uscm/tl/corporal
	entry_message_body = "You are the <a href='"+WIKI_PLACEHOLDER+"'>Squad Leader.</a> Your task is leading the designated squad and utilize available ordnance. If the section sergeant dies, you are expected to lead in their place.<br><b>You remember that you've stored your personal gear and uniform are located in the dorm or locker rooms.</b>"

	job_options = list(CPL_VARIANT = "CPL", SGT_VARIANT = "SGT")

/datum/job/marine/tl/generate_entry_conditions(mob/living/carbon/human/spawning_human)
	. = ..()
	spawning_human.important_radio_channels += JTAC_FREQ

/datum/job/marine/tl/handle_job_options(option)
	if(option != CPL_VARIANT)
		gear_preset = initial(gear_preset)
	else
		gear_preset = gear_preset_secondary

/obj/effect/landmark/start/marine/tl
	name = JOB_SQUAD_TEAM_LEADER
	icon_state = "tl_spawn"
	job = /datum/job/marine/tl

/obj/effect/landmark/start/marine/tl/alpha
	icon_state = "tl_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/tl/bravo
	icon_state = "tl_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/tl/charlie
	icon_state = "tl_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/tl/delta
	icon_state = "tl_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/tl/ai
	total_positions = 2
	spawn_positions = 2

/datum/job/marine/tl/ai/upp
	title = JOB_SQUAD_TEAM_LEADER_UPP
	gear_preset = /datum/equipment_preset/uscm/tl/upp
	gear_preset_secondary = /datum/equipment_preset/uscm/tl/upp/junior_sergeant
	job_options = list(JSGT_VARIANT = "JrSGT", SGT_VARIANT = "SGT")

/datum/job/marine/tl/ai/upp/handle_job_options(option)
	gear_preset = initial(gear_preset)
	if(option == JSGT_VARIANT)
		gear_preset = gear_preset_secondary

/datum/job/marine/tl/ai/forecon
	total_positions = 1
	spawn_positions = 1
	title = JOB_SQUAD_TEAM_LEADER_FORECON
	gear_preset = /datum/equipment_preset/uscm/tl/forecon
	gear_preset_secondary = /datum/equipment_preset/uscm/tl/forecon/sergeant
	job_options = list(SGT_VARIANT = "SGT", SSGT_VARIANT = "SSGT")

/datum/job/marine/tl/ai/forecon/handle_job_options(option)
	gear_preset = initial(gear_preset)
	if(option == SGT_VARIANT)
		gear_preset = gear_preset_secondary

/datum/job/marine/tl/ai/guard
	title = JOB_SQUAD_TEAM_LEADER_GUARD
	gear_preset = /datum/equipment_preset/uscm/tl/guard
	job_options = null

/obj/effect/landmark/start/marine/tl/upp
	name = JOB_SQUAD_TEAM_LEADER_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/tl/ai/upp


/datum/job/marine/tl/ai/pmc
	title = JOB_PMCPLAT_FTL
	gear_preset = /datum/equipment_preset/uscm/pmc/tl
	job_options = null

/obj/effect/landmark/start/marine/tl/pmc
	name = JOB_PMCPLAT_FTL
	squad = SQUAD_PMCPLT
	job = /datum/job/marine/tl/ai/pmc

/datum/job/marine/tl/ai/pmc/small
	title = JOB_PMCPLAT_SMALL_FTL
	gear_preset = /datum/equipment_preset/uscm/pmc/tl
	job_options = null
	total_positions = 1
	spawn_positions = 1

/obj/effect/landmark/start/marine/tl/pmc/small
	name = JOB_PMCPLAT_SMALL_FTL
	squad = SQUAD_PMCPLT_SMALL
	job = /datum/job/marine/tl/ai/pmc/small

/obj/effect/landmark/start/marine/tl/forecon
	name = JOB_SQUAD_TEAM_LEADER_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/tl/ai/forecon

/obj/effect/landmark/start/marine/tl/guard
	name = JOB_SQUAD_TEAM_LEADER_GUARD
	squad = "Colonial Guard"
	job = /datum/job/marine/tl/ai/guard

#undef SSGT_VARIANT
#undef SGT_VARIANT
#undef CPL_VARIANT
#undef JSGT_VARIANT
