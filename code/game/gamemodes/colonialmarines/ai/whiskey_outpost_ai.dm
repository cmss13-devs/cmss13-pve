
/*
/datum/game_mode/colonialmarines/ai/whiskey_outpost
	name = "Whiskey Outpost: Lowpop"
	config_tag = "Whiskey Outpost: Lowpop"

	squad_limit = list(
		/datum/squad/marine/charlie,
		/datum/squad/marine/delta
	)

	role_mappings = list(
		/datum/job/command/commander/ai/whiskey = JOB_WO_AI_CO,
		/datum/job/commanad/lieutenant/ai/whiskey = JOB_WO_AI_MO,
		/datum/job/civilian/synthetic/ai/whiskey = JOB_WO_AI_SYNTH,
		/datum/job/marine/leader/ai/whiskey = JOB_WO_AI_SQUAD_LEADER,
		/datum/job/marine/tl/ai/whiskey = JOB_WO_AI_SQUAD_TEAM_LEADER
		/datum/job/marine/specialist/ai/whiskey = JOB_WO_AI_SQUAD_SPECIALIST,
		/datum/job/marine/smartgunner/ai/whiskey = JOB_WO_AI_SQUAD_SMARTGUNNER,
		/datum/job/marine/medic/whiskey/ai/whiskey = JOB_WO_AI_SQUAD_MEDIC,
		/datum/job/marine/standard/ai/whiskey = JOB_WO_AI_SQUAD_MARINE,
		/datum/job/civilian/civilian = JOB_WO_AI_CIVILIAN
	)

/datum/game_mode/colonialmarines/ai/get_roles_list()
	return ROLES_AI_WO

/datum/job/marine/specialist/ai/whiskey
	total_positions = 2
	spawn_positions = 2
	allow_additional = FALSE
	scaled = FALSE
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/spec
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You are the very rare and valuable weapon expert</a>, trained to use special equipment. You can serve a variety of roles, so choose carefully."


//======================================
//----------------SYNTHETIC-------------
//======================================

/datum/job/civilian/synthetic/whiskey
	title = JOB_AI_WO_SYNTH
	gear_preset = /datum/equipment_preset/synth/uscm/wo/ai

/datum/job/civilian/synthetic/whiskey/generate_entry_message()
	. = {"You are a synthetic unit deployed at Whiskey Outpost. You were created to assist the Dust Raiders in engineering and maintenance duties.
You may perform other duties and functions as assigned by the officers in charge of the operation. You must obey the chain of command and
assist the Dust Raiders as best as possible, You are not required to follow orders that are clearly dangerous to yourself or others, nonsensical,
or made under duress. In case of conflicting orders, those higher on the chain of command take priority."}
*/

/obj/effect/landmark/tunnel_ambush
	name = "xeno ambush"
	icon_state = "xeno_ambush"

/obj/effect/landmark/tunnel_ambush/Initialize()
	. = ..()
	GLOB.map_specific_trigger_atoms += src

/obj/effect/landmark/tunnel_ambush/Destroy()
	GLOB.map_specific_trigger_atoms -= src
	. = ..()