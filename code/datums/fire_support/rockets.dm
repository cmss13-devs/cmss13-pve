/datum/fire_support/rockets
	name = "Rocket barrage"
	fire_support_type = FIRESUPPORT_TYPE_ROCKETS
	scatter_range = 9
	impact_quantity = 15
	icon_state = "rockets"
	initiate_chat_message = "TARGET ACQUIRED ROCKET RUN INBOUND."
	initiate_screen_message = list(
		"Rockets hot, incoming!",
		"Heres a little firework show for you all!",
		"Salvo sent, watch the spread!"
		)

/datum/fire_support/rockets/do_impact(turf/target_turf)
	explosion(target_turf, 0, 2, 4, 6, 2)

/datum/fire_support/incendiary_rockets
	name = "Incendiary rocket barrage"
	fire_support_type = FIRESUPPORT_TYPE_INCEND_ROCKETS
	scatter_range = 9
	impact_quantity = 9
	icon_state = "incendiary_rockets"
	initiate_chat_message = "TARGET ACQUIRED ROCKET RUN INBOUND."
	initiate_screen_message = "Rockets hot, incoming!"
	initiate_title = "Avenger-4"
	start_visual = /obj/effect/temp_visual/dropship_flyby

/datum/fire_support/incendiary_rockets/do_impact(turf/target_turf)
	explosion(target_turf, weak_impact_range = 4, flame_range = 4, throw_range = 2)
