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
	body.text_to_play = "You're awakened about an hour later- shaken up by a small army of techs in biohazard gear. The hours melt into days, a blur of screenings, testimonies- all in the refuge of some unknown blacksite."
	body.player = human.client
	body.color = "#9f53a9"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(5 SECONDS)
	text_box.after_play()
	body.after_play()
	sleep(3 SECONDS)
	var/atom/movable/screen/text/screen_text/body2 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/secondary()
	body2.text_to_play = "But, you made it. An unmarked shuttle burns through the blockade of Union ships, it's cargo too valuable to be guarded by anything but a section's worth of battle-hardened Marines. Your fate is now interwoven with the Company, but you've delivered them their prize. Whatever path you take, the blessings of the most powerful corporate entity in human history are behind you."
	body2.player = human.client
	body2.color = "#FAF9F6"
	LAZYADD(human.client.screen_texts, body2)
	body2.play_to_client()
	sleep(5 SECONDS)
	var/atom/movable/screen/text/screen_text/body3 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/fatelist()
	body3.text_to_play = "SPECIMEN DELIVERED SUCCESSFULLY. THE WEYLAND-YUTANI CORPORATION IS GRATEFUL FOR YOUR SERVICE."
	body3.player = human.client
	body3.color = "#FF8b3d"
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
