/proc/simulacrum_text_1(mob/living/carbon/human/human)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "Somewhere..."
	text_box.player = human.client
	text_box.color = "#8a2398"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(1.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "You exist in a black, impermeable void. Exist, for there is no other word to describe it. You cannot feel any sort of body or other physical attachments, and you cannot see anything but black. Despite all this, you are undeniably conscious. From this sleepless dream of nothingness, will you wake up, you wonder?"
	body.player = human.client
	body.color = "#9f53a9"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(5 SECONDS)
	var/atom/movable/screen/text/screen_text/body2 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/secondary()
	body2.text_to_play = "After three seconds of eternity pass, you awaken. Perhaps it is over." // "There’s an emperor, and he asks the shepherd’s boy how many seconds in eternity. And the shepherd’s boy says, 'There’s a mountain of pure diamond. It takes an hour to climb it and an hour to go around it, and every hundred years a little bird comes and sharpens its beak on the diamond mountain. And when the entire mountain is chiseled away, the first second of eternity will have passed.'"
	body2.player = human.client
	body2.color = "#9f53a9"
	LAZYADD(human.client.screen_texts, body2)
	body2.play_to_client()
	sleep(5 SECONDS)
	text_box.after_play()
	body.after_play()
	body2.after_play()
	teleport_to_simulation(human, TRUE, TRUE)

/proc/simulacrum_text_2(mob/living/carbon/human/human, should_roar)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "Back here again."
	text_box.player = human.client
	text_box.color = "#8a2398"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(1.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "You died, you know that for certain. You vividly remember your grisly fate, and you suspect you will for a long time. Now, though, you're in an abyss unending once more. And there is nothing to do but wait."
	body.player = human.client
	body.color = "#9f53a9"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(4 SECONDS)
	var/atom/movable/screen/text/screen_text/body2 = new /atom/movable/screen/text/screen_text/simulacrum_message/body/secondary()
	body2.text_to_play = "An unknown amount of time passes."
	body2.player = human.client
	body2.color = "#9f53a9"
	LAZYADD(human.client.screen_texts, body2)
	body2.play_to_client()
	sleep(3 SECONDS)
	text_box.after_play()
	body.after_play()
	body2.after_play()
	teleport_to_simulation(human, should_roar, FALSE)

/proc/simulacrum_text_3(mob/living/carbon/human/human, should_roar)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "Pain unending."
	text_box.player = human.client
	text_box.color = "#8a2398"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(1.5 SECONDS)
	var/atom/movable/screen/text/screen_text/body = new /atom/movable/screen/text/screen_text/simulacrum_message/body()
	body.text_to_play = "Another very-real death, and another portion of time spent in the void, alone with naught but your thoughts."
	body.player = human.client
	body.color = "#9f53a9"
	LAZYADD(human.client.screen_texts, body)
	body.play_to_client()
	sleep(4 SECONDS)
	text_box.after_play()
	body.after_play()
	teleport_to_simulation(human, should_roar, FALSE)

/proc/simulacrum_text_4(mob/living/carbon/human/human, should_roar)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "6 Simulations Later..."
	text_box.player = human.client
	text_box.color = "#8a2398"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(2.5 SECONDS)
	text_box.after_play()
	teleport_to_simulation(human, should_roar, FALSE)

/proc/simulacrum_text_5(mob/living/carbon/human/human, should_roar)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "19 Simulations Later..."
	text_box.player = human.client
	text_box.color = "#8a2398"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(2.5 SECONDS)
	text_box.after_play()
	teleport_to_simulation(human, should_roar, FALSE)

/proc/simulacrum_text_6(mob/living/carbon/human/human, should_roar)
	var/atom/movable/screen/text/screen_text/text_box = new /atom/movable/screen/text/screen_text/simulacrum_message()
	text_box.text_to_play = "192 Simulations Later..."
	text_box.player = human.client
	text_box.color = "#8a2398"
	LAZYADD(human.client.screen_texts, text_box)
	text_box.play_to_client()
	sleep(2.5 SECONDS)
	text_box.after_play()
	teleport_to_simulation(human, should_roar, FALSE)

// Write the ending one later
