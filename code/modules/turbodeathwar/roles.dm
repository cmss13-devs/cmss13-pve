var/global/list/the_balance = list("USCM" = 0, "UPP" = 0)

/proc/check_the_balance()
	to_chat(world, "USCM: [global.the_balance["USCM"]], UPP: [global.the_balance["UPP"]]")

/datum/job/marine/standard/war
	total_positions = 5
	spawn_positions = 5
	handle_spawn_and_equip = TRUE
	gear_preset = /datum/equipment_preset/uscm/private_equipped/war


/datum/job/marine/standard/war/generate_entry_conditions(mob/living/M, whitelist_status)
	if (istype(M) && M.client)
		M.client.soundOutput.update_ambience()

	global.the_balance["USCM"]++

/datum/job/marine/standard/war/spawn_and_equip(mob/new_player/player)
	global.the_balance["USCM"]++

/datum/job/marine/standard/war/equip_job(mob/living/M)
	global.the_balance["USCM"]++
	..()

/datum/job/marine/standard/war/get_total_positions(latejoin=0)
	if(global.the_balance["USCM"] > global.the_balance["UPP"])
		return 0
	else
		return 5

/obj/effect/landmark/start/marine/war
	name = JOB_SQUAD_MARINE
	icon_state = "marine_spawn"
	job = /datum/job/marine/standard/war

/datum/job/marine/standard/war_opfor
	title = JOB_SQUAD_MARINE_OPFOR
	total_positions = 5
	spawn_positions = 5
	handle_spawn_and_equip = TRUE
	gear_preset = /datum/equipment_preset/uscm/pfc/upp

/datum/job/marine/standard/war_opfor/generate_entry_conditions(mob/living/M, whitelist_status)
	if (istype(M) && M.client)
		M.client.soundOutput.update_ambience()

	global.the_balance["UPP"]++

/obj/effect/landmark/start/marine/war_opfor
	name = JOB_SQUAD_MARINE_OPFOR
	icon_state = "marine_spawn"
	job = /datum/job/marine/standard/war_opfor

/datum/job/marine/standard/war_opfor/set_spawn_positions(count)

/datum/job/marine/standard/war_opfor/get_total_positions(latejoin=0)
	if(global.the_balance["UPP"] > global.the_balance["USCM"])
		return 0
	else
		return 5

/datum/job/command/bridge/war
/datum/job/marine/leader/war
/datum/job/marine/medic/war
/datum/job/marine/tl/war
/datum/job/marine/smartgunner/war
/datum/job/marine/standard/war
