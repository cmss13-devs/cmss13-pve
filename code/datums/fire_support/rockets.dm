/datum/fire_support/rockets
	name = "HE Rockets"
	fire_support_firer = FIRESUPPORT_CAS
	fire_support_type = FIRESUPPORT_TYPE_ROCKETS
	cost = 3
	scatter_range = 7
	impact_quantity = 16
	icon_state = "rockets"
	start_visual = /obj/effect/temp_visual/dropship_flyby
	initiate_chat_message = "TARGET ACQUIRED HE ROCKET RUN INBOUND."
	initiate_screen_message = list(
		"Rockets hot, incoming!",
		"Heres a little firework show for you all!",
		"Salvo sent, watch the spread!",
		"Flying in hot, rockets inbound!",
		)

/datum/fire_support/rockets/do_impact(turf/target_turf)
	cell_explosion(target_turf, 180, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("HE rockets"))

/datum/fire_support/rockets/upp
	fire_support_firer = FIRESUPPORT_CAS_UPP
	faction = FACTION_UPP
	fire_support_type = FIRESUPPORT_TYPE_ROCKETS_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"
	start_visual = /obj/effect/temp_visual/dropship_flyby/krokodil

/datum/fire_support/incendiary_rockets
	name = "INC rockets"
	fire_support_firer = FIRESUPPORT_CAS
	fire_support_type = FIRESUPPORT_TYPE_INCEND_ROCKETS
	cost = 3
	icon_state = "incend_rockets"
	scatter_range = 7
	impact_quantity = 10
	initiate_chat_message = "TARGET ACQUIRED INC ROCKET RUN INBOUND."
	initiate_screen_message = list(
		"Rockets hot, incoming!",
		"Heres a little firework show for you all!",
		"Salvo sent, watch the spread!",
		"Flying in hot, rockets inbound!",
		)
	start_visual = /obj/effect/temp_visual/dropship_flyby

/datum/fire_support/incendiary_rockets/do_impact(turf/target_turf)
	cell_explosion(target_turf, 100, 50, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("Incendiary rockets"))
	fire_spread(target_turf, create_cause_data("Incendiary rockets"), 3, 25, 20, "#EE6515")

/datum/fire_support/incendiary_rockets/upp
	fire_support_firer = FIRESUPPORT_CAS_UPP
	faction = FACTION_UPP
	fire_support_type = FIRESUPPORT_TYPE_INCEND_ROCKETS_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"
	start_visual = /obj/effect/temp_visual/dropship_flyby/krokodil
