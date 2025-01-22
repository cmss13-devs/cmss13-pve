GLOBAL_LIST_INIT(human_ai_conversations, initialize_human_ai_conversations())

/// Populates the AI conversation data structure
/proc/initialize_human_ai_conversations()
	var/list/return_list = list()
	for(var/datum/human_ai_conversation/subtype_convo as anything in subtypesof(/datum/human_ai_conversation))
		if(subtype_convo::amount_ai_involved == -1)
			continue

		var/datum/human_ai_conversation/new_convo = new subtype_convo
		if(new_convo.amount_ai_involved > length(return_list))
			return_list.len = new_convo.amount_ai_involved
			for(var/i in length(return_list) + 1 to new_convo.amount_ai_involved)
				return_list[i] = list()
		return_list[new_convo.amount_ai_involved] += list(new_convo)
	return return_list

/datum/human_ai_conversation
	/// How many AI are involved in this conversation. If -1, this conversation is abstract.
	var/amount_ai_involved = -1
	/// P#: The AI of that number (randomly assigned when conversation is created) will say the message after the P#.
	/// You can use || to divide one message into multiple that the AI will randomly choose between.
	/// D #: Will delay the conversation for however many deciseconds listed.
	var/list/conversation_data = list(
		"P1 Message 1",
		"D 25",
		"P2 Message 2",
		"D 25",
		"P1 Random||Chance||Messages"
	)

/// Processes a conversation with other nearby AI.
/datum/human_ai_conversation/proc/initiate_conversation(list/brains_involved)
	if(!length(brains_involved))
		return

	for(var/datum/human_ai_brain/brain as anything in brains_involved)
		brain.in_conversation = TRUE

	for(var/string in conversation_data)
		switch(string[1])
			if("P")
				var/ai_index = text2num(string[2]) // doesn't currently support indexes >9, but can be fixed if that ever comes up, somehow
				var/datum/human_ai_brain/brain = brains_involved[ai_index]
				if(should_interrupt_conversation(brain))
					for(var/datum/human_ai_brain/other_brain as anything in brains_involved)
						other_brain.in_conversation = FALSE
					return

				for(var/datum/human_ai_brain/other_brain as anything in brains_involved)
					if(brain == other_brain)
						continue
					other_brain.tied_human.setDir(get_cardinal_dir(other_brain.tied_human, brain.tied_human))

				brain.tied_human.say(pick(splittext(copytext(string, 4), "||")))

			if("D")
				sleep(text2num(copytext(string, 3)))

	for(var/datum/human_ai_brain/other_brain as anything in brains_involved)
		other_brain.in_conversation = FALSE
		COOLDOWN_START(other_brain, conversation_success_cooldown, other_brain.conversation_success_cooldown_time)

/// Simple check to see if a conversation should stop at a given line
/datum/human_ai_conversation/proc/should_interrupt_conversation(datum/human_ai_brain/brain)
	return (brain.in_combat || !brain.in_conversation || (brain.tied_human.health < HEALTH_THRESHOLD_CRIT))

/// Check to be overridden to see if an AI should be able to start a conversation
/datum/human_ai_conversation/proc/conversation_allowed(datum/human_ai_brain/brain)
	return TRUE

/datum/human_ai_conversation/hello
	amount_ai_involved = 2
	conversation_data = list(
		"P1 Hello.",
		"D 16",
		"P2 Hello.",
		"D 25",
		"P1 How are you doing?",
		"D 25",
		"P2 I'm doing well, how are you?||Could be better, you?||Fine, I guess. How about you?",
		"D 15",
		"P1 I'm doin' pretty alright.",
	)

/datum/human_ai_conversation/smoke
	amount_ai_involved = 2
	conversation_data = list(
		"P1 Hey, got a smoke?",
		"D 20",
		"P2 Nah, sorry man.",
		"D 22",
		"P1 Damn.",
	)

/datum/human_ai_conversation/faction
	/// What faction(s) can say this line.
	var/list/acceptable_factions

/datum/human_ai_conversation/faction/conversation_allowed(datum/human_ai_brain/brain)
	if(brain.tied_human.faction in acceptable_factions)
		return ..()
	return FALSE


/datum/human_ai_brain
	/// If TRUE, this AI is currently in a conversation with others
	var/in_conversation = FALSE
	/// The chance that the AI will try to initiate a conversation. Trying to initiate a conversation is on a 1 second cooldown, so this is really every 5 ticks
	/// Disabled until more conversations are added
	var/conversation_start_prob = 0 //0.75 // at 1 chance / sec, this'll mean we hit the equivalent of a 50% chance of a conversation at ~90 chances, which would take ~90 seconds
	COOLDOWN_DECLARE(conversation_start_cooldown)
	/// Cooldown upon a successful conversation, started on everyone involved at the end of the conversation
	COOLDOWN_DECLARE(conversation_success_cooldown)
	/// Length of the conversation success cooldown
	var/conversation_success_cooldown_time = 45 SECONDS
