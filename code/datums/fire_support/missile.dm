/datum/fire_support/missile
	name = "LGM strike"
	fire_support_firer = FIRESUPPORT_CAS
	fire_support_type = FIRESUPPORT_TYPE_MISSILE
	scatter_range = 1
	cost = 4
	icon_state = "missile"
	initiate_chat_message = "TARGET ACQUIRED MISSILE INBOUND."
	initiate_screen_message = list(
		"TGP on lase, one out.",
		"Hope that target's worth it, sending one.",
		"One big boom, on the way.",
		"Missile inbound, keep your heads down.",
		)
	initiate_sound = 'sound/effects/IncomingRocket.ogg'
	start_visual = null
	start_sound = null
	impact_start_visual = /obj/effect/temp_visual/falling_obj/keeper

/datum/fire_support/missile/do_impact(turf/target_turf)
	cell_explosion(target_turf, 450, 80, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, create_cause_data("LGM strike"))
	for(var/obj/vehicle/multitile/vic in target_turf)
		vic.take_damage_type(1e8, "LGM")
		vic.take_damage_type(1e8, "LGM")
		vic.healthcheck() // JUST DIE
		playsound(vic, 'sound/effects/meteorimpact.ogg', 50)
		vic.at_munition_interior_explosion_effect(1200, 400, cause_data = create_cause_data("LGM strike"))
		vic.interior_crash_effect()

/datum/fire_support/missile/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_MISSILE_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"

/datum/fire_support/missile/napalm
	name = "Napalm strike"
	fire_support_type = FIRESUPPORT_TYPE_NAPALM_MISSILE
	cost = 3
	icon_state = "napalm_missile"
	initiate_chat_message = "TARGET ACQUIRED NAPALM MISSILE INBOUND."
	impact_start_visual = /obj/effect/temp_visual/falling_obj/napalm

/datum/fire_support/missile/napalm/do_impact(turf/target_turf)
	cell_explosion(target_turf, 150, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("Napalm missile"))
	fire_spread(target_turf, create_cause_data("Napalm missile"), 6, 60, 30, "#EE6515")

/datum/fire_support/missile/napalm/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_NAPALM_MISSILE_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"

/datum/fire_support/missile/smoke
	name = "SMK missile"
	fire_support_type = FIRESUPPORT_TYPE_SMOKE_MISSILE
	cost = 2
	icon_state = "smoke_missile"
	initiate_chat_message = "TARGET ACQUIRED SMOKE MISSILE INBOUND."
	impact_start_visual = /obj/effect/temp_visual/falling_obj/banshee
	///smoke type created when the grenade is primed
	var/datum/effect_system/smoke_spread/smoketype = /datum/effect_system/smoke_spread/bad
	///radius this smoke grenade will encompass
	var/smokeradius = 12
	///The duration of the smoke
	var/smoke_duration = 40

/datum/fire_support/missile/smoke/do_impact(turf/target_turf)
	var/datum/effect_system/smoke_spread/smoke = new smoketype()
	playsound(target_turf, 'sound/effects/smoke.ogg', 25, TRUE)
	smoke.set_up(smokeradius, 0, target_turf, smoke_time = smoke_duration)
	smoke.start()

/datum/fire_support/missile/smoke/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_SMOKE_MISSILE_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"

/datum/fire_support/missile/smoke/nerve
	name = "CN-20 missile"
	fire_support_type = FIRESUPPORT_TYPE_NERVE_MISSILE_UPP
	cost = 3
	icon_state = "nerve_missile"
	initiate_screen_message = list("Nerve gas, inbound!")
	smoketype = /datum/effect_system/smoke_spread/cn20
	smoke_duration = 30

/datum/fire_support/missile/smoke/nerve/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_NERVE_MISSILE_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"

/datum/fire_support/missile/smoke/lsd
	name = "LSD missile"
	fire_support_type = FIRESUPPORT_TYPE_LSD_MISSILE_UPP
	cost = 2
	icon_state = "lsd_missile"
	initiate_screen_message = list("LSD gas, inbound!")
	smoketype = /datum/effect_system/smoke_spread/LSD
	smoke_duration = 30

/datum/fire_support/missile/smoke/lsd/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_LSD_MISSILE_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"
