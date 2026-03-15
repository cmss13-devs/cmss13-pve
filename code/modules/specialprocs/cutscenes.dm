/mob/living/carbon/human
	var/in_cutscene = FALSE
/proc/simulacrum_text_ending_bad(mob/living/carbon/human/human)
	human.in_cutscene = TRUE
	sleep(5 SECONDS)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "EVACUATION OF COLONY 'CRUCIBLE' COMPLETE. SURFACE SCOURED DUE TO OVERWHELMING PRESENCE OF HOSTILE XENOFAUNA."
	text_box.player = human.client
	text_box.color = "#982323"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(2.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "PLATOON ELEMENT 'RED DAWN' ELIMINATED BY NUCLEAR BLAST IN CLOSE PROXIMITY OF 'PUDONG BUNKER COMPLEX'. POST-ENGAGEMENT ANALYSIS INDICATES DEFENSIVE EFFORT OF KEY LOCATION TO HAVE SAVED NUMBERS RANGING IN THE TENS OF THOUSANDS."
	body.player = human.client
	body.color = "#982323"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(8 SECONDS)
	var/atom/movable/screen/text/screen_text/body2 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/secondary()
	body2.text_to_play = "THE UNION HONOURS YOUR SACRIFICE."
	body2.player = human.client
	body2.color = "#af9231"
	LAZYADD(human.client.screen_texts, body2)
	body2.play_to_client()
	sleep(7 SECONDS)
	text_box.after_play()
	body.after_play()
	body2.after_play()
	sleep(5 SECONDS)
	message_admins("END THE ROUND NOW")
	if(human.client)
		winset(human.client, "infowindow", "is-visible=true")
		winset(human.client, "outputwindow", "is-visible=true")
		winset(human.client, "mainwindow.split", "splitter=400")
		human.client.fit_viewport()
		human.client.nuke_chat()

/proc/cutsceneone(mob/living/carbon/human/human)
	human.in_cutscene = TRUE
	sleep(2.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "SEVENTY ONE HOURS LATER (4.4375 DAYS LOCAL TIME)"
	body.player = human.client
	body.color = "#e4e3d8"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(2.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body2 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/secondary()
	body2.text_to_play = "The days are spent sending convoys through the road. Each day seems to bring more and more traffic- civilians brought from the South as more regions go dark, and Territorials moving forth to take their place."
	body2.player = human.client
	body2.color = "#e4e3d8"
	LAZYADD(human.client.screen_texts, body2)
	body2.play_to_client()
	sleep(2.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body3 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/fatelist()
	body3.text_to_play = "As the night comes today, though, the roads are empty."
	body3.player = human.client
	body3.color = "#e4e3d8"
	LAZYADD(human.client.screen_texts, body3)
	body3.play_to_client()
	sleep(8 SECONDS)
	body.after_play()
	body2.after_play()
	body3.after_play()
	sleep(3 SECONDS)
	message_admins("Cutscene one played. Back to it")
	if(human.client)
		winset(human.client, "infowindow", "is-visible=true")
		winset(human.client, "outputwindow", "is-visible=true")
		winset(human.client, "mainwindow.split", "splitter=400")
		human.client.fit_viewport()
		human.client.nuke_chat()
	human.hudswitch_blocked = FALSE
	human.hud_used.show_hud(HUD_STYLE_STANDARD, human)
	human.SetStun(0)
	human.SetEyeBlind(0)
	human.rejuvenate()
	human.clear_fullscreen("simulacrum_ko", TRUE)

/proc/cutscenetwo(mob/living/carbon/human/human)
	human.in_cutscene = TRUE
	human.rejuvenate()
	sleep(3 SECONDS)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "The ride back is longer than usual"
	text_box.player = human.client
	text_box.color = "#ac561d"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(2.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "You spend the rest of the eight hour night jumping between the hundreds of distress signals across the planet. Out of twenty three response deployments, you rescue five colonists; every settlement you find is either infested or abandoned."
	body.player = human.client
	body.color = "#ac561d"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(6 SECONDS)
	var/atom/movable/screen/text/screen_text/body2 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/secondary()
	body2.text_to_play = "The rust orange hue of Crucible's dawn finally starts to break. You return to base, exhausted and scarred, distress frequencies silent and evacuation almost complete. The roaring of those creatures hisses louder than the ambient din of the sands."
	body2.player = human.client
	body2.color = "#ac561d"
	LAZYADD(human.client.screen_texts, body2)
	body2.play_to_client()
	sleep(10 SECONDS)
	text_box.after_play()
	body.after_play()
	body2.after_play()
	sleep(5 SECONDS)
	message_admins("Cutscene two played. Back to it")
	if(human.client)
		winset(human.client, "infowindow", "is-visible=true")
		winset(human.client, "outputwindow", "is-visible=true")
		winset(human.client, "mainwindow.split", "splitter=400")
		human.client.fit_viewport()
		human.client.nuke_chat()
	human.hudswitch_blocked = FALSE
	human.hud_used.show_hud(HUD_STYLE_STANDARD, human)
	human.SetStun(0)
	human.SetEyeBlind(0)
	human.clear_fullscreen("simulacrum_ko", TRUE)
