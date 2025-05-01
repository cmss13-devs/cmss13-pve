
#define CWO_VARIANT "Chief Warrant Officer"
#define WO_VARIANT "Warrant Officer"

/datum/job/command/pilot/dropship_pilot
	title = JOB_DROPSHIP_PILOT
	total_positions = 1
	spawn_positions = 1
	allow_additional = TRUE
	scaled = TRUE
	supervisors = "the platoon commander"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/dp
	gear_preset_secondary = /datum/equipment_preset/uscm_ship/dp/lesser_rank
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job is to fly, protect, and maintain the ship's transport dropship.</a> While you are an officer, your authority is limited to the dropship, where you have authority over the enlisted personnel. If you are not piloting, there is an autopilot fallback for command, but don't leave the dropship without reason."
	job_options = list(WO_VARIANT = "WO", CWO_VARIANT = "CWO")

/datum/job/command/pilot/dropship_pilot/handle_job_options(option)
	if(option != WO_VARIANT)
		gear_preset = initial(gear_preset)
	else
		gear_preset = gear_preset_secondary

// Dropship Roles is both DP, GP and DCC combined to not force people to backtrack
AddTimelock(/datum/job/command/pilot/dropship_pilot, list(
	JOB_DROPSHIP_ROLES = 0 HOURS
))

/obj/effect/landmark/start/pilot/dropship_pilot
	name = JOB_DROPSHIP_PILOT
	icon_state = "po_spawn"
	job = /datum/job/command/pilot/dropship_pilot

#undef CWO_VARIANT
#undef WO_VARIANT
