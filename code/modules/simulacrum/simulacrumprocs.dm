/proc/slow_everyone()
	for(var/mob/living/carbon/human/human as anything in GLOB.alive_human_list)
		to_chat(human, SPAN_WARNING("You feel your boots stick to the darkness below you, it's a bit harder to move."))
		human.apply_effect(1000000, SLOW)

/client/proc/slow_everyone_verb()
	set name = "Slow Everyone"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	slow_everyone()

/proc/superslow_everyone()
	for(var/mob/living/carbon/human/human as anything in GLOB.alive_human_list)
		to_chat(human, SPAN_WARNING("Your boots are really sinking into the darkness now. It's incredibly hard to move."))
		human.apply_effect(1000000, SUPERSLOW)

/client/proc/superslow_everyone_verb()
	set name = "Superslow Everyone"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	superslow_everyone()

/proc/ko_everyone()
	for(var/mob/living/carbon/human/human as anything in GLOB.alive_human_list)
		INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(ko_single_mob), human)

/client/proc/ko_everyone_verb()
	set name = "KO Everyone"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	if(tgui_input_list(src, "Are you sure you want to KO everyone", "KO?", list("yes", "no")) != "yes")
		return

	ko_everyone()

/proc/ko_single_mob(mob/living/carbon/human/human)
	to_chat(human, SPAN_WARNING("A low whirring fills your mind."))
	var/atom/movable/screen/fullscreen/overlay_screen = human.overlay_fullscreen("simulacrum_ko", /atom/movable/screen/fullscreen/impaired)
	overlay_screen.icon_state = "impairedoverlay1"
	sleep(5 SECONDS)
	to_chat(human, SPAN_WARNING("The whirring grows louder, it's a bit harder to think..."))
	overlay_screen.icon_state = "impairedoverlay3"
	sleep(12 SECONDS)
	to_chat(human, SPAN_WARNING("The drone in your mind grows ever louder. It hurts."))
	overlay_screen.icon_state = "impairedoverlay5"
	sleep(10 SECONDS)
	to_chat(human, SPAN_BOLDWARNING("MAKE IT STOP!"))
	overlay_screen.icon_state = "impairedoverlay6"
	sleep(10 SECONDS)
	to_chat(human, SPAN_BOLDWARNING("You collapse, drifting to unconsciousness as this cacaphony of sound assaults your senses."))
	overlay_screen.icon_state = "impairedoverlay7"
	human.Stun(100000000)
	human.SetEarDeafness(1000000000)
	human.SetEyeBlind(100000000)
	save_human(human)
	human.ghost_locked = TRUE
	human.hudswitch_blocked = TRUE
	human.hud_used.show_hud(HUD_STYLE_NOHUD, human)
	sleep(5 SECONDS)
	if(human.client) // devious shenanigans
		winset(human.client, "mainwindow.split", "splitter=1000")
		winset(human.client, "infowindow", "is-visible=false")
		winset(human.client, "outputwindow", "is-visible=false")
	simulacrum_text_1(human)

/proc/teleport_to_simulation(mob/living/carbon/human/human, roar = TRUE, initial_run = FALSE)
	human.forceMove(locate(GLOB.simulation_controller.next_simulation[1], GLOB.simulation_controller.next_simulation[2], GLOB.simulation_controller.next_simulation[3]))
	if(!initial_run)
		load_human(human)
	sleep(4 SECONDS) // give time for weeds and me
	if(human.client)
		winset(human.client, "infowindow", "is-visible=true")
		winset(human.client, "outputwindow", "is-visible=true")
		winset(human.client, "mainwindow.split", "splitter=400")
		human.client.fit_viewport()
		human.client.nuke_chat()
	human.hudswitch_blocked = FALSE
	human.hud_used.show_hud(HUD_STYLE_STANDARD, human)
	human.SetStun(0)
	human.SetEarDeafness(0)
	human.SetEyeBlind(0)
	human.rejuvenate()
	human.clear_fullscreen("simulacrum_ko", TRUE)
	to_chat(human, SPAN_NOTICE("You appear from the nothingness."))

/mob/living/carbon/human
	var/ghost_locked = FALSE

/mob/living/carbon/human/do_ghost()
	if(ghost_locked)
		to_chat(src, SPAN_BOLDWARNING("You cannot leave your corpse at this time."))
		return
	return ..()

GLOBAL_DATUM_INIT(simulation_controller, /datum/simulation_controller, new)

/datum/simulation_controller
	var/list/non_completed_simulations = list(
		"desert_dam" = list(list(61, 194, 3), list(98, 194, 3), list(135, 194, 3)),
		"varadero" = list(list(24, 162, 3), list(58, 162, 3), list(92, 162, 3)),
	)
	var/list/next_simulation = list(24, 194, 3)
	var/list/non_completed_cutscenes = list("2", "3", "4", "5", "6")
	var/next_cutscene = ""
	var/current_cutscene_completed = FALSE
	var/everyone_already_koed

/client/proc/pick_simulation_verb()
	set name = "Pick Next Simulation"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	var/result1 = tgui_input_list(mob, "Pick next category", "Category", GLOB.simulation_controller.non_completed_simulations)
	if(!result1)
		return

	GLOB.simulation_controller.next_simulation = GLOB.simulation_controller.non_completed_simulations[result1][1] // Go in order of simulations
	to_chat(src, SPAN_NOTICE("Category of [result1] selected."))

/client/proc/decay_old_simulation_cutscene_verb()
	set name = "Decay Old Simulation & Cutscene"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	if(GLOB.simulation_controller.next_cutscene)
		GLOB.simulation_controller.non_completed_cutscenes -= GLOB.simulation_controller.next_cutscene
		GLOB.simulation_controller.next_cutscene = ""
		to_chat(src, SPAN_NOTICE("Cutscene decayed."))

	if(GLOB.simulation_controller.next_simulation)
		for(var/mapname in GLOB.simulation_controller.non_completed_simulations)
			//for(var/list/coordset as anything in GLOB.simulation_controller.non_completed_simulations[mapname])
			for(var/i in 1 to length(GLOB.simulation_controller.non_completed_simulations[mapname]))
				if((GLOB.simulation_controller.non_completed_simulations[mapname][i][1] == GLOB.simulation_controller.next_simulation[1]) && (GLOB.simulation_controller.non_completed_simulations[mapname][i][2] == GLOB.simulation_controller.next_simulation[2]) && (GLOB.simulation_controller.non_completed_simulations[mapname][i][3] == GLOB.simulation_controller.next_simulation[3]))
					GLOB.simulation_controller.non_completed_simulations[mapname][i] = null

		var/list/new_simlist = list(
			"desert_dam" = list(),
			"varadero" = list(),
		)
		for(var/entry in GLOB.simulation_controller.non_completed_simulations)
			for(var/list/coordset as anything in GLOB.simulation_controller.non_completed_simulations[entry])
				if(isnull(coordset))
					continue
				new_simlist[entry] += list(coordset)
			if(!length(new_simlist[entry]))
				new_simlist -= entry

		GLOB.simulation_controller.non_completed_simulations = new_simlist
		GLOB.simulation_controller.next_simulation = null
		to_chat(src, SPAN_NOTICE("Simulation decayed."))

/client/proc/toggle_cutscene_verb()
	set name = "Toggle Cutscene"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	if(!length(GLOB.simulation_controller.non_completed_cutscenes))
		to_chat(src, SPAN_BOLDNOTICE("No more cutscenes to play."))
		return

	if(GLOB.simulation_controller.next_cutscene)
		GLOB.simulation_controller.next_cutscene = ""
		to_chat(src, SPAN_BOLDNOTICE("Next loop will no longer trigger a cutscene."))
		return

	GLOB.simulation_controller.next_cutscene = GLOB.simulation_controller.non_completed_cutscenes[1]
	to_chat(src, SPAN_BOLDNOTICE("Next loop will now trigger cutscene [GLOB.simulation_controller.next_cutscene]. After this one, there are [length(GLOB.simulation_controller.non_completed_cutscenes) - 1] cutscenes remaining."))

/client/proc/go_to_next_simulation_verb()
	set name = "Advance Simulation"
	set category = "Admin.Simulation"

	if(!check_rights(R_EVENT))
		return

	if(!GLOB.simulation_controller.next_simulation)
		to_chat(src, SPAN_NOTICE("Next simulation has not been selected."))
		return

	to_chat(src, SPAN_NOTICE("Advancing simulation. Cutscene [GLOB.simulation_controller.next_cutscene ? "will" : "will not"] play."))

	for(var/savename in GLOB.simulacrum_playersaves)
		var/datum/simulacrum_humansave/save = GLOB.simulacrum_playersaves[savename]
		if(!save.tied_human)
			message_admins("FUCKFUCKFUCK. A save with ckey [save.tied_ckey] no longer has a tied human!!!! FUCK")
			continue

		save.tied_human.rejuvenate()
		var/atom/movable/screen/fullscreen/overlay_screen = save.tied_human.overlay_fullscreen("simulacrum_ko", /atom/movable/screen/fullscreen/impaired)
		overlay_screen.icon_state = "impairedoverlay7"
		save.tied_human.Stun(100000000)
		save.tied_human.SetEarDeafness(1000000000)
		save.tied_human.SetEyeBlind(100000000)
		save.tied_human.hudswitch_blocked = TRUE
		save.tied_human.hud_used.show_hud(HUD_STYLE_NOHUD, save.tied_human)
		if(GLOB.simulation_controller.next_cutscene)
			if(save.tied_human) // devious shenanigans
				winset(save.tied_human, "mainwindow.split", "splitter=1000")
				winset(save.tied_human, "infowindow", "is-visible=false")
				winset(save.tied_human, "outputwindow", "is-visible=false")
			switch(GLOB.simulation_controller.next_cutscene)
				if("2")
					INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(simulacrum_text_2), save.tied_human, TRUE)
				if("3")
					INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(simulacrum_text_3), save.tied_human, TRUE)
				if("4")
					INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(simulacrum_text_4), save.tied_human, TRUE)
				if("5")
					INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(simulacrum_text_5), save.tied_human, TRUE)
				if("6")
					INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(simulacrum_text_6), save.tied_human, TRUE)
