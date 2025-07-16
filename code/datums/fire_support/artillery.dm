/datum/fire_support/mortar
	name = "HE mortar"
	fire_support_firer = FIRESUPPORT_ARTY
	fire_support_type = FIRESUPPORT_TYPE_HE_MORTAR
	cost = 2
	scatter_range = 6
	impact_quantity = 5
	cooldown_duration = 20 SECONDS
	impact_delay = 0.5 SECONDS
	visual_impact_delay = 0.3 SECONDS
	icon_state = "he_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = list(
		"Artillery brings dignity to what would otherwise be an ugly brawl.",
		"The world consists of 2 types of people, artillery men and targets.",
		"Firing for effect, over.",
		"Shells, on the way!",
	)
	initiate_title = "Rhino-1"
	initiate_sound = 'sound/weapons/gun_mortar_travel.ogg'
	portrait_type = "marine_green"
	start_visual = null
	impact_start_visual = /obj/effect/temp_visual/falling_obj
	start_sound = null
	impact_sound = 'sound/weapons/fire_support/mortar_long_whistle.ogg'

/datum/fire_support/mortar/do_impact(turf/target_turf)
	cell_explosion(target_turf, 225, 60, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("HE mortar"))

/datum/fire_support/mortar/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ARTY_UPP
	fire_support_type = FIRESUPPORT_TYPE_HE_MORTAR_UPP
	initiate_title = "Katyusha-1"
	portrait_type = "beret_2_red"

/datum/fire_support/mortar/incendiary
	name = "INC mortar"
	fire_support_type = FIRESUPPORT_TYPE_INCENDIARY_MORTAR
	icon_state = "incendiary_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = list("Coordinates confirmed, incendiary inbound!")
	impact_start_visual = /obj/effect/temp_visual/falling_obj/incend
	var/radius = 5
	var/flame_level = BURN_TIME_TIER_5 + 5 //Type B standard, 50 base + 5 from chemfire code.
	var/burn_level = BURN_LEVEL_TIER_2
	var/flameshape = FLAMESHAPE_DEFAULT
	var/fire_type = FIRE_VARIANT_TYPE_B //Armor Shredding Greenfire

/datum/fire_support/mortar/incendiary/do_impact(turf/target_turf)
	cell_explosion(target_turf, 150, 30, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("Incendiary mortar"))
	flame_radius("Incendiary mortar", radius, target_turf, flame_level, burn_level, flameshape, null, fire_type)

/datum/fire_support/mortar/incendiary/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ARTY_UPP
	fire_support_type = FIRESUPPORT_TYPE_INCENDIARY_MORTAR_UPP
	initiate_title = "Katyusha-1"
	portrait_type = "beret_2_red"

/datum/fire_support/mortar/flare
	name = "FLR mortar"
	fire_support_type = FIRESUPPORT_TYPE_FLARE_MORTAR
	cost = 1
	impact_quantity = 4
	icon_state = "flare_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. FLARE SUPPORT INCOMING."
	initiate_screen_message = "Coordinates confirmed, illumination inbound!"
	impact_start_visual = /obj/effect/temp_visual/falling_obj/flare

/datum/fire_support/mortar/flare/do_impact(turf/target_turf)
	new /obj/item/device/flashlight/flare/on/illumination(target_turf)
	playsound(target_turf, 'sound/weapons/gun_flare.ogg', 50, 1, 4)

/datum/fire_support/mortar/flare/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ARTY_UPP
	fire_support_type = FIRESUPPORT_TYPE_FLARE_MORTAR_UPP
	initiate_title = "Katyusha-1"
	portrait_type = "beret_2_red"

/datum/fire_support/mortar/smoke
	name = "SMK mortar"
	fire_support_type = FIRESUPPORT_TYPE_SMOKE_MORTAR
	cost = 1
	impact_quantity = 4
	icon_state = "smoke_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = "Coordinates confirmed, smoke inbound!"
	impact_start_visual = /obj/effect/temp_visual/falling_obj/smoke
	///smoke type created when the grenade is primed
	var/datum/effect_system/smoke_spread/smoketype = /datum/effect_system/smoke_spread/bad
	///radius this smoke grenade will encompass
	var/smokeradius = 5
	///The duration of the smoke
	var/smoke_duration = 40

/datum/fire_support/mortar/smoke/do_impact(turf/target_turf)
	var/datum/effect_system/smoke_spread/smoke = new smoketype()
	playsound(target_turf, 'sound/effects/smoke.ogg', 25, TRUE)
	smoke.set_up(smokeradius, 0, target_turf, smoke_time = smoke_duration)
	smoke.start()

/datum/fire_support/mortar/smoke/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ARTY_UPP
	fire_support_type = FIRESUPPORT_TYPE_SMOKE_MORTAR_UPP
	initiate_title = "Katyusha-1"
	portrait_type = "beret_2_red"

/datum/fire_support/mortar/smoke/cn
	name = "CN-20 mortar"
	fire_support_type = FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR
	cost = 2
	icon_state = "nerve_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = list("Coordinates confirmed, nerve gas inbound!")
	smoketype = /datum/effect_system/smoke_spread/cn20
	smoke_duration = 30

/datum/fire_support/mortar/smoke/cn/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ARTY_UPP
	fire_support_type = FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR_UPP
	initiate_title = "Katyusha-1"
	portrait_type = "beret_2_red"

/datum/fire_support/mortar/smoke/lsd
	name = "LSD mortar"
	fire_support_type = FIRESUPPORT_TYPE_LSD_SMOKE_MORTAR
	cost = 1
	icon_state = "lsd_mortar"
	initiate_chat_message = "COORDINATES CONFIRMED. MORTAR BARRAGE INCOMING."
	initiate_screen_message = list("Coordinates confirmed, LSD gas inbound!")
	smoketype = /datum/effect_system/smoke_spread/LSD
	smoke_duration = 30

/datum/fire_support/mortar/smoke/lsd/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ARTY_UPP
	fire_support_type = FIRESUPPORT_TYPE_LSD_SMOKE_MORTAR_UPP
	initiate_title = "Katyusha-1"
	portrait_type = "beret_2_red"

/datum/fire_support/mortar/mlrs
	name = "HE MLRS"
	fire_support_type = FIRESUPPORT_TYPE_HE_MLRS
	cost = 3
	scatter_range = 11
	impact_quantity = 35
	cooldown_duration = 20 SECONDS
	impact_delay = 0.2 SECONDS
	visual_impact_delay = 1
	icon_state = "mlrs"
	initiate_chat_message = "COORDINATES CONFIRMED. MLRS BARRAGE INCOMING."
	initiate_screen_message = list(
		"At my signal, unleash hell!",
		"Firing for effect, over.",
		"Full salvo, on the way!",
		"Their gonna dance to our tune!",
	)
	initiate_title = "Rhino-1"
	initiate_sound = 'sound/weapons/gun_mortar_travel.ogg'
	impact_start_visual = /obj/effect/temp_visual/falling_obj/mlrs
	impact_sound = 'sound/weapons/fire_support/rocket_whistle.ogg'

/datum/fire_support/mortar/mlrs/do_impact(turf/target_turf)
	cell_explosion(target_turf, 125, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("HE MLRS"))

/datum/fire_support/mortar/mlrs/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ARTY_UPP
	fire_support_type = FIRESUPPORT_TYPE_HE_MLRS_UPP
	initiate_title = "Katyusha-1"
	portrait_type = "beret_2_red"

/datum/fire_support/mortar/smoke/mlrs_cn
	name = "CN-20 MLRS"
	icon_state = "nerve_mlrs"
	fire_support_type = FIRESUPPORT_TYPE_NERVE_MLRS
	cost = 2
	scatter_range = 11
	impact_quantity = 35
	cooldown_duration = 20 SECONDS
	impact_delay = 0.2 SECONDS
	visual_impact_delay = 1
	icon_state = "mlrs"
	initiate_chat_message = "COORDINATES CONFIRMED. MLRS CN-20 BARRAGE INCOMING."
	initiate_title = "Rhino-1"
	initiate_screen_message = list(
		"At my signal, unleash hell!",
		"Firing for effect, over.",
		"Full salvo, on the way!",
		"Their gonna dance to our tune!",
	)
	initiate_sound = 'sound/weapons/gun_mortar_travel.ogg'
	impact_start_visual = /obj/effect/temp_visual/falling_obj/mlrs_smoke
	impact_sound = 'sound/weapons/fire_support/rocket_whistle.ogg'
	smoketype = /datum/effect_system/smoke_spread/cn20
	smoke_duration = 30
	smokeradius = 3

/datum/fire_support/mortar/smoke/mlrs_cn/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_ARTY_UPP
	fire_support_type = FIRESUPPORT_TYPE_NERVE_MLRS_UPP
	initiate_title = "Katyusha-1"
	portrait_type = "beret_2_red"
