
SUBSYSTEM_DEF(xeno_ai)
	name = "Xeno AI"
	priority = SS_PRIORITY_XENO_AI
	flags = SS_NO_INIT
	wait = 0.1 SECONDS
	/// A list of mobs scheduled to process
	var/list/current_run = list()
	/// A list of AI mobs
	var/list/ai_mobs = list()

	var/ai_kill = FALSE

/datum/controller/subsystem/xeno_ai/stat_entry(msg)
	msg = "P:[length(ai_mobs)]"
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
		src.current_run = ai_mobs.Copy()
	// Cache for sanic speed (lists are references anyways)
	var/list/current_run = src.current_run
	while(current_run.len)
		var/mob/living/carbon/xenomorph/M = current_run[current_run.len]
		current_run.len--
		if(!QDELETED(M) && !M.client && M.stat != DEAD)
			M.process_ai(wait * 0.1)
		else
			remove_ai(M)

		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/xeno_ai/proc/add_ai(mob/living/carbon/xenomorph/X)
	if(X.mob_flags & AI_CONTROLLED)
		return
	ai_mobs |= X
	X.mob_flags |= AI_CONTROLLED

/datum/controller/subsystem/xeno_ai/proc/remove_ai(mob/living/carbon/xenomorph/X)
	X.mob_flags &= ~AI_CONTROLLED
	ai_mobs -= X
