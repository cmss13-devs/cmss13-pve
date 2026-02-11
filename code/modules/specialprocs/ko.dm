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

/proc/ko_single_mob(mob/living/carbon/human/human)
	for(var/savename in GLOB.simulacrum_playersaves	)
		var/datum/simulacrum_humansave/save = GLOB.simulacrum_playersaves[savename]
		save.tied_human.rejuvenate()
		save.tied_human.clear_fullscreens()
		save.tied_human.hud_used.show_hud(HUD_STYLE_NOHUD, save.tied_human)
		to_chat(human, SPAN_BOLDWARNING("A horrific light shatters your retinas"))
		var/atom/movable/screen/fullscreen/overlay_screen = human.overlay_fullscreen("simulacrum_ko", /atom/movable/screen/fullscreen/impaired)
		overlay_screen.icon_state = "passage9"
		sleep(3 SECONDS)
		overlay_screen.icon_state = "passage6"
		sleep(2 SECONDS)
		to_chat(human, SPAN_WARNING("The sphere of pure-white is still burnt into your eyes. The final dawn breaks a few hours early."))
		overlay_screen.icon_state = "passage5"
		sleep(3 SECONDS)
		to_chat(human, SPAN_BOLDWARNING("The shockwave rips up the ground, advancing too fast to even process."))
		overlay_screen.icon_state = "passage7"
		sleep(2 SECONDS)
		to_chat(human, SPAN_BOLDWARNING("All at once, it hits you. Burning, searing pain- then nothing at all."))
		overlay_screen.icon_state = "impaired_overlay8"
		human.Stun(100000000)
		human.loc = null
		human.SetEyeBlind(100000000)
		sleep(5 SECONDS)
		if(human.client) // devious shenanigans
			winset(human.client, "mainwindow.split", "splitter=1000")
			winset(human.client, "infowindow", "is-visible=false")
			winset(human.client, "outputwindow", "is-visible=false")

		INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(conclude_op), save.tied_human)

