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
	to_chat(human, SPAN_BOLDWARNING("A horrific light shatters your retinas"))
	human.clear_fullscreens()
	var/atom/movable/screen/fullscreen/overlay_screen = human.overlay_fullscreen("simulacrum_ko", /atom/movable/screen/fullscreen/impaired)
	overlay_screen.icon_state = "passage9"
	sleep(5 SECONDS)
	to_chat(human, SPAN_WARNING("Another nuclear device detonates, far too close."))
	overlay_screen.icon_state = "passage6"
	sleep(4 SECONDS)
	to_chat(human, SPAN_WARNING("The sphere of pure-white is still burnt into your eyes. A final dawn."))
	overlay_screen.icon_state = "passage4"
	sleep(4 SECONDS)
	to_chat(human, SPAN_BOLDWARNING("The shockwave rips up the ground, advancing too fast to even process."))
	overlay_screen.icon_state = "passage7"
	sleep(4 SECONDS)
	to_chat(human, SPAN_BOLDWARNING("All at once, it hits you. Burning, searing pain- then nothing at all."))
	overlay_screen.icon_state = "impaired_overlay8"
	human.Stun(100000000)
	human.loc = null
	human.SetEyeBlind(100000000)

	human.hud_used.show_hud(HUD_STYLE_NOHUD, human)
	message_admins("working so far!")
	sleep(5 SECONDS)
	if(human.client) // devious shenanigans
		winset(human.client, "mainwindow.split", "splitter=1000")
		winset(human.client, "infowindow", "is-visible=false")
		winset(human.client, "outputwindow", "is-visible=false")
	text_ending(human)

/proc/text_ending(mob/living/carbon/human/human, should_roar)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "EVACUATION OF COLONY 'CRUCIBLE' COMPLETE. SURFACE SCOURED DUE TO OVERWHELMING HOSTILE XENOFAUNA"
	text_box.player = human.client
	text_box.color = "#982323"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(2.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "PLATOON ELEMENT 'RED DAWN' ELIMINATED BY NUCLEAR BLAST. ANALYSIS INDICATES DEFENSIVE EFFORTS TO HAVE SAVED NUMBERS RANGING IN THE TENS OF THOUSANDS."
	body.player = human.client
	body.color = "#982323"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(5 SECONDS)
	var/atom/movable/screen/text/screen_text/body2 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/secondary()
	body2.text_to_play = "THE UNION HONOURS YOUR SACRIFICE."
	body2.player = human.client
	body2.color = "#c2ce54"
	LAZYADD(human.client.screen_texts, body2)
	body2.play_to_client()
	sleep(7 SECONDS)
	text_box.after_play()
	body.after_play()
	body2.after_play()
	message_admins("END THE ROUND NOW")
	sleep(15 SECONDS)
	if(human.client)
		winset(human.client, "infowindow", "is-visible=true")
		winset(human.client, "outputwindow", "is-visible=true")
		winset(human.client, "mainwindow.split", "splitter=400")
		human.client.fit_viewport()
		human.client.nuke_chat()
