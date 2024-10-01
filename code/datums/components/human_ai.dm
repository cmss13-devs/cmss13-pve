/datum/component/human_ai
	dupe_mode = COMPONENT_DUPE_UNIQUE
	/// Ref to the AI brain
	var/datum/human_ai_brain/ai_brain
	/// Ref to the owning human
	var/mob/living/carbon/human/ai_human

/datum/component/human_ai/Initialize()
	. = ..()
	ai_human = parent
	if(!istype(ai_human))
		return COMPONENT_INCOMPATIBLE

	ai_brain = new(ai_human)
	GLOB.ai_humans += ai_human
	ai_human.mob_flags |= AI_CONTROLLED

/datum/component/human_ai/Destroy(force, silent)
	handle_qdel()
	return ..()

/datum/component/human_ai/RegisterWithParent()
	..()
	RegisterSignal(ai_human, COMSIG_PARENT_QDELETING, PROC_REF(handle_qdel))
	RegisterSignal(ai_human, COMSIG_HUMAN_SET_SPECIES, PROC_REF(on_species_set))

/datum/component/human_ai/UnregisterFromParent()
	..()
	if(ai_human)
		UnregisterSignal(ai_human, COMSIG_PARENT_QDELETING)
		UnregisterSignal(ai_human, COMSIG_HUMAN_SET_SPECIES)

/datum/component/human_ai/proc/handle_qdel()
	SIGNAL_HANDLER

	GLOB.ai_humans -= ai_human
	ai_brain.tied_human = null
	QDEL_NULL(ai_brain)
	ai_human = null

/datum/component/human_ai/proc/on_species_set(datum/source, new_species)
	SIGNAL_HANDLER

	ai_human.mob_flags |= AI_CONTROLLED
