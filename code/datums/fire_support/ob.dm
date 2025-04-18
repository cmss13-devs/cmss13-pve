/datum/fire_support/ob
	name = "HE OB"
	fire_support_firer = FIRESUPPORT_ORBITAL
	fire_support_type = FIRESUPPORT_TYPE_OB
	scatter_range = 1
	cost = 5
	icon_state = "cruise"
	initiate_title = "CIC"
	initiate_chat_message = "TARGET ACQUIRED OB INBOUND."
	initiate_screen_message = list(
		"Orbital support request received, HE inbound.",
		)
	initiate_sound = 'sound/weapons/gun_orbital_travel.ogg'
	start_visual = /obj/effect/temp_visual/falling_obj/ob
	start_sound = 'sound/weapons/fire_support/ob_whistle.ogg'
	cooldown_duration = 120 SECONDS
	delay_to_impact = 12 SECONDS
	icon_state = "he_ob"
	portrait_type = "overwatch_3_green"

/datum/fire_support/ob/select_target(turf/target_turf)
	cell_explosion(target_turf, 1200, 400, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, "HE OB")
	cell_explosion(target_turf, 600, 30, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, "HE OB")

/datum/fire_support/ob/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ORBITAL_UPP
	fire_support_type = FIRESUPPORT_TYPE_OB_UPP
	portrait_type = "overwatch_red"
