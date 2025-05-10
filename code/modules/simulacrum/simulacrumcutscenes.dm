/mob/living/carbon/human
	var/in_cutscene = FALSE
/proc/simulacrum_text_ending_bad(mob/living/carbon/human/human)
	human.in_cutscene = TRUE
	sleep(5 SECONDS)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "REPORT LOGGED TO HIGH COMMAND: USS ROVER MIA, CONSIDERED LOST WITH ALL HANDS. LAST MESSAGE RECIEVED FROM 16-CYGNI SYSTEM CONTAINS UNKNOWN ELECTROMAGNETIC INTERFERENCE."
	text_box.player = human.client
	text_box.color = "#9b4b0a"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(15 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "WARNING. WARNING. 'UMBRELLA' SOLAR SYSTEM EARLY WARNING ARRAYS REPORT UNIDENTIFIED OBJECT EMERGING FROM SHUNT IN OORT CLOUD PROXIMITY."
	body.player = human.client
	body.color = "#990e0e"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(3 SECONDS)
	text_box.after_play()
	body.after_play()
	sleep(5 SECONDS)
	message_admins("END THE ROUND NOW")
	if(human.client)
		winset(human.client, "infowindow", "is-visible=true")
		winset(human.client, "outputwindow", "is-visible=true")
		winset(human.client, "mainwindow.split", "splitter=400")
		human.client.fit_viewport()
		human.client.nuke_chat()
