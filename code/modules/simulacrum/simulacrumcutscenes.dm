/mob/living/carbon/human
	var/in_cutscene = FALSE
/proc/simulacrum_text_ending_bad(mob/living/carbon/human/human)
	human.in_cutscene = TRUE
	sleep(5 SECONDS)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "REPORT LOGGED: USS ROVER MISSING IN ACTION, CONSIDERED LOST WITH ALL HANDS."
	text_box.player = human.client
	text_box.color = "#960d0d"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(15 SECONDS)
	text_box.after_play()
	sleep(5 SECONDS)
	message_admins("END THE ROUND NOW")
	if(human.client)
		winset(human.client, "infowindow", "is-visible=true")
		winset(human.client, "outputwindow", "is-visible=true")
		winset(human.client, "mainwindow.split", "splitter=400")
		human.client.fit_viewport()
		human.client.nuke_chat()
