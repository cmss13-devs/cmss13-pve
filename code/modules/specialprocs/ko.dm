// This is in no means my own code, thank you to Zonespace who wrote it all up for me to take later!

/proc/ko_everyone()
	for(var/mob/living/carbon/human/human as anything in GLOB.alive_human_list)
		INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(ko_single_mob), human)

/client/proc/ko_everyone_verb()
	set name = "Launch Nuke"
	set category = "Game Master.Extras"
	if(!check_rights(R_ADMIN))
		return

	if(tgui_input_list(src, "Are you sure you want to kill everyone", "Nuke?", list("yes", "no")) != "yes")
		return

	ko_everyone()

/proc/ko_single_mob(mob/living/carbon/human)
	to_chat(human, SPAN_WARNING("A low whirring fills your mind."))
	human.clear_fullscreens()
	var/atom/movable/screen/fullscreen/overlay_screen = human.overlay_fullscreen("simulacrum_ko", /atom/movable/screen/fullscreen/impaired)
	overlay_screen.icon_state = "passage1"
	sleep(5 SECONDS)
	to_chat(human, SPAN_WARNING("The whirring grows louder, it's a bit harder to think..."))
	overlay_screen.icon_state = "passage3"
	sleep(12 SECONDS)
	to_chat(human, SPAN_WARNING("The drone in your mind grows ever louder. It hurts."))
	overlay_screen.icon_state = "passage5"
	sleep(10 SECONDS)
	to_chat(human, SPAN_BOLDWARNING("MAKE IT STOP!"))
	overlay_screen.icon_state = "passage7"
	sleep(10 SECONDS)
	to_chat(human, SPAN_BOLDWARNING("You collapse, drifting to unconsciousness as this cacaphony of sound assaults your senses."))
	overlay_screen.icon_state = "passage9"
	human.Stun(100000000)
	human.loc = null
	human.SetEyeBlind(100000000)
