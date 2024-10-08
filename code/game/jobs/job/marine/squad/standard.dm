#define STANDARD_MARINE_TO_TOTAL_SPAWN_RATIO 0.4

#define PVT_VARIANT "Private"
#define PFC_VARIANT "Private First Class"
#define LCPL_VARIANT "Lance Corporal"

/datum/job/marine/standard
	title = JOB_SQUAD_MARINE
	total_positions = -1
	spawn_positions = -1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/pfc
	job_options = list(PVT_VARIANT = "Pvt", PFC_VARIANT = "PFC", LCPL_VARIANT = "LCpl")

/datum/job/marine/standard/on_config_load()
	entry_message_body = "You are a rank-and-file <a href='[CONFIG_GET(string/wikiarticleurl)]/[URL_WIKI_MARINE_QUICKSTART]'>Soldier of your standing army</a>, and that is your strength. What you lack alone, you gain standing shoulder to shoulder with the men and women of the platoon. Ooh-rah!<br><b>You remember that you've stored your personal gear and uniform are located in the dorm or locker rooms.</b>"
	return ..()

/datum/job/marine/standard/set_spawn_positions(count)
	spawn_positions = max((floor(count * STANDARD_MARINE_TO_TOTAL_SPAWN_RATIO)), 8)

/datum/job/marine/standard/whiskey
	title = JOB_WO_SQUAD_MARINE
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/pfc

/obj/effect/landmark/start/marine
	name = JOB_SQUAD_MARINE
	icon_state = "marine_spawn"
	job = /datum/job/marine/standard

/obj/effect/landmark/start/marine/alpha
	icon_state = "marine_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/bravo
	icon_state = "marine_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/charlie
	icon_state = "marine_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/delta
	icon_state = "marine_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/standard/ai
	total_positions = 4
	spawn_positions = 4

/datum/job/marine/standard/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/standard/ai/upp
	title = JOB_SQUAD_MARINE_UPP
	gear_preset = /datum/equipment_preset/uscm/pfc/upp
	job_options = list("Ryadovoy" = "Ryad", "Efreitor" = "Efr")

/datum/job/marine/standard/ai/forecon
	title = JOB_SQUAD_MARINE_FORECON
	total_positions = 2
	spawn_positions = 2
	gear_preset = /datum/equipment_preset/uscm/pfc/forecon
	job_options = list("Lance Corporal" = "LCpl", "Corporal" = "Cpl")

/datum/job/marine/standard/ai/rto
	total_positions = 1
	spawn_positions = 1
	title = JOB_SQUAD_RTO
	gear_preset = /datum/equipment_preset/uscm/rto
	job_options = list("Lance Corporal" = "LCpl", "Corporal" = "Cpl")

/obj/effect/landmark/start/marine/upp
	name = JOB_SQUAD_MARINE_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/standard/ai/upp

/obj/effect/landmark/start/marine/forecon
	name = JOB_SQUAD_MARINE_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/standard/ai/forecon

/obj/effect/landmark/start/marine/rto
	name = JOB_SQUAD_RTO
	squad = SQUAD_LRRP
	job = /datum/job/marine/standard/ai/rto

#undef PVT_VARIANT
#undef PFC_VARIANT
