/mob/living/carbon/human
	var/in_cutscene = FALSE
/proc/conclude_op(mob/living/carbon/human/human)
	human.in_cutscene = TRUE
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
