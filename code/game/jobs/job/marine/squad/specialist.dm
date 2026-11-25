/datum/job/marine/specialist
	title = JOB_SQUAD_SPECIALIST
	total_positions = 4
	spawn_positions = 4
	scaled = TRUE
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/specialist/equipped
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You are the very rare and valuable weapon expert</a>, trained to use special equipment. You can serve a variety of roles, so choose carefully."

/datum/job/marine/specialist/unequipped
	gear_preset = /datum/equipment_preset/uscm/specialist

/datum/job/marine/specialist/set_spawn_positions(count)
	spawn_positions = spec_slot_formula(count)

/datum/job/marine/specialist/get_total_positions(latejoin)
	var/normal_positions = ..()
	var/positions = isnull(scaled) ? normal_positions : spec_slot_formula(get_total_marines())

	if(positions <= total_positions_so_far)
		positions = total_positions_so_far
	else
		total_positions_so_far = positions

	return positions

/datum/job/marine/specialist/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/specialist/ai/get_total_positions(latejoin = 0)
	return latejoin ? total_positions : spawn_positions

/datum/job/marine/specialist/whiskey
	title = JOB_WO_SQUAD_SPECIALIST
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/spec

/obj/effect/landmark/start/marine/spec
	name = JOB_SQUAD_SPECIALIST
	icon_state = "spec_spawn"
	job = /datum/job/marine/specialist/unequipped

/obj/effect/landmark/start/marine/spec/alpha
	icon_state = "spec_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/spec/bravo
	icon_state = "spec_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/spec/charlie
	icon_state = "spec_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/spec/delta
	icon_state = "spec_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/specialist/ai/marsoc
	title = JOB_SQUAD_SPECIAL_WEAPONS_OPERATOR_MARSOC
	total_positions = 1
	spawn_positions = 1
	gear_preset = /datum/equipment_preset/uscm/spec/marsoc
	job_options = list(null)

/obj/effect/landmark/start/marine/spec/marsoc
	name = JOB_SQUAD_SPECIAL_WEAPONS_OPERATOR_MARSOC
	squad = SQUAD_MRR
	job = /datum/equipment_preset/uscm/spec/marsoc

/datum/job/marine/specialist/ai
	total_positions = 0
	spawn_positions = 0

/datum/job/marine/specialist/ai/set_spawn_positions(count)
	spawn_positions = initial(spawn_positions)

/datum/job/marine/specialist/ai/get_total_positions(latejoin)
	return latejoin ? total_positions : spawn_positions

/datum/job/marine/specialist/ai/uscm
	title = JOB_SQUAD_SPECIALIST
	total_positions = 0
	spawn_positions = 0
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/specialist/uscm
	entry_message_body = "You have received specialized training to field test unique, experimental loadouts. You can serve a variety of roles, so decide accordingly."

/obj/effect/landmark/start/marine/specialist/uscm
	name = JOB_SQUAD_SPECIALIST
	job = /datum/equipment_preset/uscm/specialist/uscm

/datum/job/marine/specialist/ai/rmc
	total_positions = 1
	spawn_positions = 1
	title = JOB_TWE_RMC_MARKSMAN
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/rmc/snp
	job_options = null
	supervisors = "the team leader and troop commander"
	entry_message_body = "You are a specially trained scout-sniper in the Royal Marines Commando. Your task is to provide highly accurate fire support for the Rifle Section as part of the Fire Support Team.<br><b>You remember that you've stored your personal gear and uniform in the locker rooms, and that your specialist equipment can be located in the armoury.</b>"

/obj/effect/landmark/start/marine/specialist/rmc
	name = JOB_TWE_RMC_MARKSMAN
	squad = SQUAD_RMC
	job = /datum/job/marine/specialist/ai/rmc
