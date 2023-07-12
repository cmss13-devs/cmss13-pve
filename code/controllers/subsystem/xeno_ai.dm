/datum/config_entry/number/eval_weight_marine
	config_entry_value = 8

/datum/config_entry/number/eval_weight_xeno_t1
	config_entry_value = -1

/datum/config_entry/number/eval_weight_xeno_t2
	config_entry_value = -2

/datum/config_entry/number/eval_weight_xeno_t3
	config_entry_value = -3

/datum/config_entry/number/eval_weight_xeno_queen
	config_entry_value = -5

/datum/config_entry/number/eval_weight_offset
	config_entry_value = 0

/*
/datum/config_entry/number/eval_distance_per_marine_from_hive
	config_entry_value = 0.1

/datum/config_entry/number/eval_distance_per_xeno_from_hive
	config_entry_value = -0.1
*/

SUBSYSTEM_DEF(xeno_ai)
	name = "Xeno AI"
	priority = SS_PRIORITY_XENO_AI
	flags = SS_NO_INIT
	wait = 0.1 SECONDS
	/// A list of mobs scheduled to process
	var/list/current_run = list()
	/// A list of AI mobs
	var/list/ai_mobs = list()

	var/game_evaluation = 0

	var/ai_kill = FALSE

/datum/controller/subsystem/xeno_ai/stat_entry(msg)
	msg = "P:[length(ai_mobs)]|Eval:[game_evaluation]"
	return ..()

/datum/admins/proc/toggle_ai()
	set name = "Toggle xeno AI"
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	SSxeno_ai.ai_kill = !SSxeno_ai.ai_kill
	message_admins("[key_name_admin(usr)] [SSxeno_ai.ai_kill? "killed" : "revived"] all xeno AI.")

/datum/controller/subsystem/xeno_ai/fire(resumed = FALSE)
	if(ai_kill)
		return

	if(!resumed)
		//calculate_eval()
		src.current_run = ai_mobs.Copy()
	// Cache for sanic speed (lists are references anyways)
	var/list/current_run = src.current_run
	while(current_run.len)
		var/mob/living/carbon/xenomorph/M = current_run[current_run.len]
		current_run.len--
		if(!QDELETED(M) && !M.client && M.stat != DEAD)
			M.process_ai(wait * 0.1, game_evaluation)
//		else
//			remove_ai(M)

		if(MC_TICK_CHECK)
			return


/datum/controller/subsystem/xeno_ai/proc/calculate_eval()
	game_evaluation = CONFIG_GET(number/eval_weight_offset)

	for(var/i in GLOB.alive_human_list)
		var/mob/living/carbon/human/H = i
		if(H.client && is_ground_level(H.z) && !H.is_mob_incapacitated())
			game_evaluation += CONFIG_GET(number/eval_weight_marine)

	for(var/i in GLOB.xeno_mob_list)
		var/mob/living/carbon/xenomorph/X = i
		if(X.stat)
			return

		switch(X.tier)
			if(1)
				game_evaluation += CONFIG_GET(number/eval_weight_xeno_t1)
			if(2)
				game_evaluation += CONFIG_GET(number/eval_weight_xeno_t1)
			if(3)
				game_evaluation += CONFIG_GET(number/eval_weight_xeno_t1)

		if(isqueen(X))
			game_evaluation += CONFIG_GET(number/eval_weight_xeno_queen)

	for(var/i in GLOB.evaluation_landmarks)
		var/obj/effect/landmark/eval/E = i
		E.calculate_eval()

/datum/controller/subsystem/xeno_ai/proc/add_ai(mob/living/carbon/xenomorph/X)
	if(X.mob_flags & AI_CONTROLLED)
		return
	ai_mobs |= X
	X.mob_flags |= AI_CONTROLLED

/datum/controller/subsystem/xeno_ai/proc/remove_ai(mob/living/carbon/xenomorph/X)
	X.mob_flags &= ~AI_CONTROLLED
	ai_mobs -= X


// I'm not a good enough mapper to properly lay these out on the maps, so they'll stay like this
GLOBAL_LIST_EMPTY(evaluation_landmarks)

/area
	var/list/eval_landmarks

/obj/effect/landmark/eval
	name = "Evaluation Landmark"

/obj/effect/landmark/eval/Initialize(mapload, ...)
	. = ..()
	GLOB.evaluation_landmarks += src
	var/area/A = get_area(src)
	A.eval_landmarks += src

/obj/effect/landmark/eval/Destroy()
	var/area/A = get_area(src)
	A.eval_landmarks -= src
	GLOB.evaluation_landmarks -= src
	return ..()

/// Calculates the evaluation
/obj/effect/landmark/eval/proc/calculate_eval()
	return 0

/obj/effect/landmark/eval/proc/calculate_eval_for_mob(mob/M)

/// A landmark that calculates evaluation depending on the marines in an area
/obj/effect/landmark/eval/marine
	name = "Marine Eval Landmark"
	var/eval_per_marine = 0

/obj/effect/landmark/eval/marine/calculate_eval_for_mob(mob/M)
	if(ishuman(M) && M.client && !M.is_mob_incapacitated())
		return eval_per_marine

/obj/effect/landmark/eval/marine/calculate_eval()
	var/area/A = get_area(src)
	var/eval_amount = 0
	for(var/mob/living/carbon/human/H in A)
		if(H.client && !H.is_mob_incapacitated())
			eval_amount += eval_per_marine

	return eval_amount

/obj/effect/landmark/eval/marine/bad
	eval_per_marine = 0.5

/obj/effect/landmark/eval/marine/good
	eval_per_marine = -0.5

/obj/effect/landmark/eval/marine/very_good
	eval_per_marine = -1

/obj/effect/landmark/eval/xeno
	name = "Xeno Eval Landmark"
	var/eval_per_xeno

/obj/effect/landmark/eval/xeno/calculate_eval_for_mob(mob/M)
	if(isxeno(M) && !M.stat)
		return eval_per_xeno

/obj/effect/landmark/eval/xeno/calculate_eval()
	var/area/A = get_area(src)
	var/eval_amount = 0
	for(var/mob/living/carbon/xenomorph/X in A)
		if(!X.stat)
			eval_amount += eval_per_xeno

	return eval_amount

/obj/effect/landmark/eval/xeno/bad
	eval_per_xeno = -0.5

/obj/effect/landmark/eval/xeno/good
	eval_per_xeno = 0.5

/obj/effect/landmark/eval/xeno/very_good
	eval_per_xeno = 1
