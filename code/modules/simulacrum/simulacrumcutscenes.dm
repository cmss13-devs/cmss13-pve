/mob/living/carbon/human
	var/in_cutscene = FALSE
/proc/simulacrum_text_ending_bad(mob/living/carbon/human/human)
	human.in_cutscene = TRUE
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "You're out. You made it."
	text_box.player = human.client
	text_box.color = "#8a2398"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(3 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "The UD-4 Cheyenne slides into the welcoming embrace of it's airlock. Your mind drifts as you're jostled awake, the disembark feels like a dream..."
	body.player = human.client
	body.color = "#9f53a9"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(5 SECONDS)
	text_box.after_play()
	body.after_play()
	sleep(3 SECONDS)
	var/atom/movable/screen/text/screen_text/body2 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/secondary()
	body2.text_to_play = "But, you made it. You drink down the curated warmth of the USS Schwarzenegger's atmosphere like booze. As the initial bliss fades, you move to mourn those who couldn't join you."
	body2.player = human.client
	body2.color = "#535ca9"
	LAZYADD(human.client.screen_texts, body2)
	body2.play_to_client()
	sleep(5 SECONDS)
	var/atom/movable/screen/text/screen_text/body3 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/fatelist()
	body3.text_to_play = "PEACEKEEPING OPERATION 512-BRAVO 'FORLORN HOPE' CONCLUDED. SENDING UPDATE AND MEDAL COMMENDATIONS TO USCMC HIGH COMMAND."
	body3.player = human.client
	body3.color = "#535ca9"
	LAZYADD(human.client.screen_texts, body3)
	body3.play_to_client()
	sleep(15 SECONDS)
	LAZYADD(human.client.screen_texts, body3)
	body3.play_to_client()
	sleep(15 SECONDS)
	text_box.after_play()
	body.after_play()
	body2.after_play()
	body3.after_play()
	sleep(5 SECONDS)
	message_admins("END THE ROUND NOW")
	if(human.client)
		winset(human.client, "infowindow", "is-visible=true")
		winset(human.client, "outputwindow", "is-visible=true")
		winset(human.client, "mainwindow.split", "splitter=400")
		human.client.fit_viewport()
		human.client.nuke_chat()
