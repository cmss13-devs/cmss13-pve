/datum/fire_support/supply_drop
	name = "Ammo drop"
	fire_support_firer = FIRESUPPORT_CAS
	fire_support_type = FIRESUPPORT_TYPE_SUPPLY_DROP
	cost = 2
	scatter_range = 1
	icon_state = "ammo"
	initiate_chat_message = "TARGET ACQUIRED AMMO CRATE LAUNCHING."
	initiate_screen_message = list(
		"Make sure to tip!",
		"Your ammo's here, enjoy.",
		"Watch your head, crate dropping.",
		"Dropping it.. now.",
	)
	delay_to_impact = 2 SECONDS
	start_visual = null
	initiate_visual = /obj/effect/temp_visual/dropship_hover
	initiate_sound = 'sound/weapons/fire_support/dropship_hover.ogg'
	start_sound = 'sound/items/fulton.ogg'
	///Thing the dropship delivers
	var/obj/delivered = /obj/structure/largecrate/supply/ammo/supply_drop

/datum/fire_support/supply_drop/select_target(turf/target_turf)
	var/obj/delivered_thing
	delivered_thing = new delivered(target_turf)
	delivered_thing.pixel_z = 100
	delivered_thing.overlays += image('icons/obj/structures/droppod_32x64.dmi', delivered_thing, "chute_cables_static")
	var/image/I = image('icons/obj/structures/droppod_64x64.dmi', delivered_thing, "chute_static")
	I.pixel_x -= 16
	I.pixel_y += 16
	delivered_thing.overlays += I
	delivered_thing.density = FALSE
	animate(delivered_thing, pixel_z = 0, time = 0.75 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(delivered_land), target_turf, delivered_thing), 0.75 SECONDS)

/datum/fire_support/supply_drop/proc/delivered_land(turf/target_turf, obj/delivered_thing)
	delivered_thing.density = TRUE
	delivered_thing.overlays.Cut()
	for(var/mob/living/M in target_turf)
		M.apply_damage(50, BRUTE)
		M.set_effect(5, STUN)
		M.set_effect(5, WEAKEN)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(H.pain.feels_pain)
				M.emote("pain")

/datum/fire_support/supply_drop/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_SUPPLY_DROP_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"
	initiate_visual = /obj/effect/temp_visual/dropship_hover/krokodil
	delivered = /obj/structure/largecrate/supply/ammo/supply_drop_upp

/datum/fire_support/sentry_drop
	name = "Sentry drop"
	fire_support_firer = FIRESUPPORT_CAS
	fire_support_type = FIRESUPPORT_TYPE_SENTRY_POD
	cost = 2
	scatter_range = 1
	icon_state = "sentry"
	initiate_chat_message = "TARGET ACQUIRED SENTRY POD LAUNCHING."
	initiate_screen_message = list(
		"Sending you a little friend.",
		"Watch your head, sentry dropping.",
		"Take good care of him, would you?.",
		"Sentry, on the way."
	)
	delay_to_impact = 2 SECONDS
	start_visual = null
	initiate_visual = /obj/effect/temp_visual/dropship_hover
	initiate_sound = 'sound/weapons/fire_support/dropship_hover.ogg'
	start_sound = null
	///Type of sentry to launch
	var/sentry_type = /obj/structure/machinery/defenses/sentry/launchable

/datum/fire_support/sentry_drop/select_target(turf/target_turf)
	/// Special structures it needs to break with drop pod
	var/list/breakeable_structures = list(/obj/structure/barricade, /obj/structure/surface/table)
	var/obj/structure/droppod/equipment/sentry/droppod = new(target_turf, sentry_type)
	droppod.special_structures_to_damage = breakeable_structures
	droppod.special_structure_damage = 500
	droppod.drop_time = 5 SECONDS
	droppod.launch(target_turf)

/datum/fire_support/sentry_drop/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_SENTRY_POD_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"
	initiate_visual = /obj/effect/temp_visual/dropship_hover/krokodil
	sentry_type = /obj/structure/machinery/defenses/sentry/launchable/upp
