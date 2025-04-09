/datum/fire_support/mortar
	name = "Mortar barrage"
	fire_support_type = FIRESUPPORT_TYPE_HE_MORTAR
	scatter_range = 8
	impact_quantity = 5
	cooldown_duration = 20 SECONDS
	icon_state = "he_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = list(
		"Artillery brings dignity to what would otherwise be an ugly brawl.",
	)
	initiate_title = "Rhino-1"
	initiate_sound = 'sound/weapons/gun_mortar_travel.ogg'
	portrait_type = "marine_green"
	start_visual = null
	impact_start_visual = /obj/effect/temp_visual/mortar_falling
	start_sound = 'sound/weapons/fire_support/mortar_long_whistle.ogg'

/datum/fire_support/mortar/do_impact(turf/target_turf)
	explosion(target_turf, 0, 2, 3, 5, 2)

/datum/fire_support/mortar/som
	fire_support_type = FIRESUPPORT_TYPE_HE_MORTAR_SOM
	initiate_title = "Guardian-1"
	portrait_type = "marine_green"

/datum/fire_support/mortar/incendiary
	name = "Incendiary mortar barrage"
	fire_support_type = FIRESUPPORT_TYPE_INCENDIARY_MORTAR
	icon_state = "incendiary_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = list("Coordinates confirmed, incendiary inbound!")
	impact_start_visual = /obj/effect/temp_visual/mortar_falling/incend
	var/radius = 5
	var/flame_level = BURN_TIME_TIER_5 + 5 //Type B standard, 50 base + 5 from chemfire code.
	var/burn_level = BURN_LEVEL_TIER_2
	var/flameshape = FLAMESHAPE_DEFAULT
	var/fire_type = FIRE_VARIANT_TYPE_B //Armor Shredding Greenfire

/datum/fire_support/mortar/incendiary/do_impact(turf/target_turf)
	explosion(target_turf, 0, 2, 4, 7, explosion_cause_data = "mortar incendiary")
	flame_radius("mortar incendiary", radius, target_turf, flame_level, burn_level, flameshape, null, fire_type)

/datum/fire_support/mortar/incendiary/som
	fire_support_type = FIRESUPPORT_TYPE_INCENDIARY_MORTAR_SOM
	initiate_title = "Guardian-1"
	portrait_type = "marine_green"

/datum/fire_support/mortar/smoke
	name = "Smoke mortar barrage"
	fire_support_type = FIRESUPPORT_TYPE_SMOKE_MORTAR
	impact_quantity = 3
	icon_state = "smoke_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = "Coordinates confirmed, smoke inbound!"
	impact_start_visual = /obj/effect/temp_visual/mortar_falling/smoke
	///smoke type created when the grenade is primed
	var/datum/effect_system/smoke_spread/smoketype = /datum/effect_system/smoke_spread/bad
	///radius this smoke grenade will encompass
	var/smokeradius = 6
	///The duration of the smoke
	var/smoke_duration = 11

/datum/fire_support/mortar/smoke/do_impact(turf/target_turf)
	var/datum/effect_system/smoke_spread/smoke = new smoketype()
	playsound(target_turf, 'sound/effects/smoke.ogg', 25, TRUE)
	smoke.set_up(smokeradius, 0, target_turf, smoke_time = smoke_duration)
	smoke.start()

/datum/fire_support/mortar/smoke/som
	fire_support_type = FIRESUPPORT_TYPE_SMOKE_MORTAR_SOM
	initiate_title = "Guardian-1"
	portrait_type = "marine_green"

/datum/fire_support/mortar/smoke/cn
	name = "CN-20 mortar barrage"
	fire_support_type = FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR
	icon_state = "nerve_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = list("Coordinates confirmed, nerve gas inbound!")
	smoketype = /datum/effect_system/smoke_spread/cn20
	smokeradius = 5
