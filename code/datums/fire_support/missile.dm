/datum/fire_support/missile
	name = "Laser guided missile strike"
	fire_support_type = FIRESUPPORT_TYPE_MISSILE
	scatter_range = 1
	cost = 2
	icon_state = "cruise"
	initiate_chat_message = "TARGET ACQUIRED MISSILE INBOUND."
	initiate_screen_message = list(
		"TGP on lase, one out.",
		"Keeper! Keep your heads down!",
		"Hope that target's worth it, sending one.",
		"One big boom, on the way."
		)
	initiate_sound = 'sound/effects/IncomingRocket.ogg'
	start_visual = null
	start_sound = null

/datum/fire_support/missile/select_target(turf/target_turf)
	explosion(target_turf, 4, 5, 6)
