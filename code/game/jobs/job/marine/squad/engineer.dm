/datum/job/marine/engineer
	title = JOB_SQUAD_ENGI
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	entry_message_body = "You have the <a href='"+WIKI_PLACEHOLDER+"'>equipment and skill</a> to build fortifications, reroute power lines, and bunker down. Your squaddies will look to you when it comes to construction in the field of battle."

/datum/job/marine/engineer/set_spawn_positions(count)
	spawn_positions = engi_slot_formula(count)

/datum/job/marine/engineer/set_spawn_positions(count)
	spawn_positions = engi_slot_formula(count)

/datum/job/marine/engineer/get_total_positions(latejoin = 0)
	var/positions = spawn_positions
	if(latejoin)
		positions = engi_slot_formula(get_total_marines())
		if(positions <= total_positions_so_far)
			positions = total_positions_so_far
		else
			total_positions_so_far = positions
	else
		total_positions_so_far = positions
	return positions

/datum/job/marine/engineer/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/engineer/ai/get_total_positions(latejoin = 0)
	return latejoin ? total_positions : spawn_positions

/datum/job/marine/engineer/whiskey
	title = JOB_WO_SQUAD_ENGINEER
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/engineer

/datum/job/marine/engineer/ai/marsoc
	title = JOB_SQUAD_SAPPER_MARSOC
	total_positions = 1
	spawn_positions = 1
	gear_preset = /datum/equipment_preset/uscm/engineer/marsoc

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

/obj/effect/landmark/start/marine/engineer/marsoc
	name = JOB_SQUAD_SAPPER_MARSOC
	squad = SQUAD_MRR
	job = /datum/equipment_preset/uscm/engineer/marsoc
