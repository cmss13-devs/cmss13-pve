
#define CPL_VARIANT "Corporal"
#define LCPL_VARIANT "Lance Corporal"

/datum/job/marine/engineer
	title = JOB_SQUAD_ENGI
	total_positions = 12
	spawn_positions = 12
	allow_additional = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/engineer
	gear_preset_secondary = /datum/equipment_preset/uscm/engineer/lesser_rank
	entry_message_body = "You have the <a href='"+WIKI_PLACEHOLDER+"'>equipment and skill</a> to build fortifications, reroute power lines, and bunker down. Your squaddies will look to you when it comes to construction in the field of battle."

	job_options = list(LCPL_VARIANT = "LCPL", CPL_VARIANT = "CPL")

/datum/job/marine/engineer/set_spawn_positions(count)
	for(var/datum/squad/sq in GLOB.RoleAuthority.squads)
		if(sq)
			sq.max_engineers = engi_slot_formula(count)

/datum/job/marine/engineer/get_total_positions(latejoin=0)
	var/slots = engi_slot_formula(get_total_marines())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	if(latejoin)
		for(var/datum/squad/sq in GLOB.RoleAuthority.squads)
			if(sq)
				sq.max_engineers = slots

	return (slots*4)

/datum/job/marine/engineer/handle_job_options(option)
	if(option != LCPL_VARIANT)
		gear_preset = initial(gear_preset)
	else
		gear_preset = gear_preset_secondary

/datum/job/marine/engineer/whiskey
	title = JOB_WO_SQUAD_ENGINEER
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/engineer

/obj/effect/landmark/start/marine/engineer
	name = JOB_SQUAD_ENGI
	icon_state = "engi_spawn"
	job = /datum/job/marine/engineer

/obj/effect/landmark/start/marine/engineer/alpha
	icon_state = "engi_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/engineer/bravo
	icon_state = "engi_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/engineer/charlie
	icon_state = "engi_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/engineer/delta
	icon_state = "engi_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/engineer/ai
	total_positions = 1
	spawn_positions = 1

/datum/job/marine/engineer/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/engineer/ai/get_total_positions(latejoin=0)
	return latejoin ? total_positions : spawn_positions

#undef CPL_VARIANT
#undef LCPL_VARIANT
