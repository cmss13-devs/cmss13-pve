

//Colonial Liberation Front
/datum/emergency_call/clf
	name = "Insurgent Combat Squad"
	mob_max = 10
	arrival_message = "'Attention, you are trespassing on our sovereign territory. Expect no forgiveness.'"
	objectives = "Assault the USCM, and sabotage as much as you can. Ensure any survivors escape in your custody."
	probability = 20
	hostility = TRUE
	home_base = /datum/lazy_template/ert/clf_station
	var/max_synths = 1
	var/synths = 0

/datum/emergency_call/clf/print_backstory(mob/living/carbon/human/H)
	if(ishuman_strict(H))
		var/message = "[pick(5;"on a UA prison station", 10;"in the LV-624 jungles under a biodome", 25;"on the farms of LV-771 in an isolated hab block", 25;"in the slums of LV-221 with a large family", 20;"the red wastes of LV-361 behind airtight walls", 15;"the icy tundra of LV-571")] to a [pick(50;"poor", 15;"well-off", 35;"average")] family."
		var/message_grew = "[pick(10; "the Colonial Marshals killed someone close to you on a raid", 10;"the United States Colonial Marine Corps killed someone close to you", 20;"you harbor a strong hatred of the UA government", 10;"you are a wanted criminal in the United Americas", 5;"you despise the United Americas' boot and want the Union of Progressive Peoples in control", 10;"you believe that the UA will only impose worse and worse conditions to support Earth", 5; "you are a violent person and want to kill someone for the sake of killing", 5; "you hate outside interference", 10;"your rebel militia was absorbed into a larger insurgency")]"
		to_chat(H, SPAN_BOLD("As a native of the area, you joined this organization because [message_grew]."))
		to_chat(H, SPAN_BOLD("You grew up [message] and are considered a terrorist by the UA."))
	else
		to_chat(H, SPAN_BOLD("You were reactivated in an anonymous workshop."))
		to_chat(H, SPAN_BOLD("Originally, you were programmed with medical and engineering knowledge to assist with building and maintaining colonies."))
		to_chat(H, SPAN_BOLD("Your new directives are for complete loyalty to your guerrilla cell, as well as new combat protocols."))

	var/message_area = "[pick(10; "Neroid sector", 50; "star system", 15; "colony", 10; "Cygnus sector", 10; "Hydrus sector", 5; "worker cooperative")]"
	var/message_reason = "[pick(25; "After a major disaster, the UA cleanup was slow and apparently unempathetic.", 25; "Rumors about the better if more strict life under the Union of Progressive Peoples reached a fever pitch when a guerrila group blew up the local Marshals' office. No turning back now.", 10; "The Three World Empire has offered your colony a hand, with prosperity under meritocracy. Anything must be better than the brutal corporate conditions here." 15; "Political organizations long dormant have had enough of the conditions. With the help of the UPP, they've gotten the training if not the equipment to overthrow their masters." 25; "You've heard stories about Cristobal, San Kinto, and more. Everyone else has too. The outcry became violence and thus rose rebellion. Too far to come back now.")]"
	to_chat(H, SPAN_BOLD("The [message_area] was relatively peaceful."))
	to_chat(H, SPAN_BOLD("Though life was difficult, many colonists in the [message_area] were content to take their pay and work for a better future."))
	to_chat(H, SPAN_BOLD("[message_reason]"))
	to_chat(H, SPAN_BOLD("The year is now [GLOB.game_year]."))
	to_chat(H, SPAN_BOLD("With the arrival of the [MAIN_SHIP_NAME] comes the promise of a boot from above to stamp out any progress made."))

/datum/emergency_call/clf/create_member(datum/mind/M, turf/override_spawn_loc)
	var/turf/spawn_loc = override_spawn_loc ? override_spawn_loc : get_spawn_point()

	if(!istype(spawn_loc))
		return //Didn't find a useable spawn point.

	var/mob/living/carbon/human/H = new(spawn_loc)
	M.transfer_to(H, TRUE)

	if(!leader && HAS_FLAG(H.client.prefs.toggles_ert, PLAY_LEADER) && check_timelock(H.client, JOB_SQUAD_LEADER, time_required_for_job))
		leader = H
		to_chat(H, SPAN_ROLE_HEADER("You are a Cell Leader of a local insurgency!"))
		arm_equipment(H, /datum/equipment_preset/clf/leader, TRUE, TRUE)
	else if(synths < max_synths && HAS_FLAG(H.client.prefs.toggles_ert, PLAY_SYNTH) && H.client.check_whitelist_status(WHITELIST_SYNTHETIC))
		synths++
		to_chat(H, SPAN_ROLE_HEADER("You are a Multi-Purpose Synthetic supporting a local insurgent cell!"))
		arm_equipment(H, /datum/equipment_preset/clf/synth, TRUE, TRUE)
	else if(medics < max_medics && HAS_FLAG(H.client.prefs.toggles_ert, PLAY_MEDIC) && check_timelock(H.client, JOB_SQUAD_MEDIC, time_required_for_job))
		medics++
		to_chat(H, SPAN_ROLE_HEADER("You are a Medic of a local insurgent cell!"))
		arm_equipment(H, /datum/equipment_preset/clf/medic, TRUE, TRUE)
	else if(engineers < max_engineers && HAS_FLAG(H.client.prefs.toggles_ert, PLAY_ENGINEER) && check_timelock(H.client, JOB_SQUAD_ENGI, time_required_for_job))
		engineers++
		to_chat(H, SPAN_ROLE_HEADER("You are an Engineer of a local insurgent cell!"))
		arm_equipment(H, /datum/equipment_preset/clf/engineer, TRUE, TRUE)
	else if(heavies < max_heavies && HAS_FLAG(H.client.prefs.toggles_ert, PLAY_HEAVY) && check_timelock(H.client, JOB_SQUAD_SPECIALIST, time_required_for_job))
		heavies++
		to_chat(H, SPAN_ROLE_HEADER("You are a Specialist of a local insurgent cell!"))
		arm_equipment(H, /datum/equipment_preset/clf/specialist, TRUE, TRUE)
	else
		to_chat(H, SPAN_ROLE_HEADER("You are a Fighter of a local insurgent cell!"))
		arm_equipment(H, /datum/equipment_preset/clf/soldier, TRUE, TRUE)
	print_backstory(H)

	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(to_chat), H, SPAN_BOLD("Objectives: [objectives]")), 1 SECONDS)


/datum/emergency_call/clf/platoon
	name = "Insurgent Combat Platoon"
	mob_min = 8
	mob_max = 35
	probability = 0
	max_engineers = 2
	max_medics = 2
	max_heavies = 2
	max_synths = 1
