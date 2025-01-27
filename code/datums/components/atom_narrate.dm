#define NARRATION_METHOD_SAY "Say"
#define NARRATION_METHOD_ME "Me"
#define NARRATION_METHOD_DIRECT "Direct"

/datum/component/atom_narrate
	var/message
	var/narration_type
	var/narrator

/datum/component/atom_narrate/Initialize(message, narration_type, delayed, narrator)
	. = ..()

	src.message = message
	src.narration_type = narration_type
	src.narrator = narrator

	if(!delayed)
		send_narration()
		return

	var/turf/parent_turf = get_turf(parent)

	if(!parent_turf)
		return COMPONENT_INCOMPATIBLE

	var/list/message_turfs = block(locate(max(parent_turf.x - 4, 1), max(parent_turf.y - 4, 1), parent_turf.z), locate(parent_turf.x + 4, parent_turf.y + 4, parent_turf.z))

	for(var/turf/cycled_turf as anything in message_turfs)
		RegisterSignal(cycled_turf, COMSIG_TURF_ENTERED, PROC_REF(send_message_on_movement))

/datum/component/atom_narrate/proc/send_message_on_movement(turf/source, atom/movable/entered)
	SIGNAL_HANDLER

	if(!istype(entered, /mob/living/carbon/human))
		return

	send_narration()
	qdel(src)

/datum/component/atom_narrate/proc/send_narration()
	var/atom/atom_parent = parent

	if(!atom_parent)
		qdel(src)
		return

	var/list/heard = get_mobs_in_view(GLOB.world_view_size, atom_parent)

	switch(narration_type)
		if(NARRATION_METHOD_SAY)
			atom_parent.langchat_speech(message, heard, GLOB.all_languages, skip_language_check = TRUE)
			atom_parent.visible_message("<b>[atom_parent]</b> says, \"[message]\"")
		if(NARRATION_METHOD_ME)
			atom_parent.langchat_speech(message, heard, GLOB.all_languages, skip_language_check = TRUE, animation_style = 2, additional_styles = list("langchat_small", "emote"))
			atom_parent.visible_message("<b>[atom_parent]</b> [message]")
		if(NARRATION_METHOD_DIRECT)
			atom_parent.visible_message("[message]")

	log_admin("[narrator] sent an Atom Narrate with message \"[message]\" from [atom_parent].")
	message_admins("[narrator] sent an Atom Narrate with message \"[message]\" from [atom_parent].")
