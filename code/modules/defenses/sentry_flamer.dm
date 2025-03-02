/obj/structure/machinery/defenses/sentry/flamer
	name = "\improper UA 42-F Sentry Flamer"
	icon = 'icons/obj/structures/machinery/defenses/flamer.dmi'
	desc = "A deployable, semi-automated turret with AI targeting capabilities. Armed with a special flamer and a 100 liters fuel tank."
	fire_delay = 2 SECONDS
	ammo = new /obj/item/ammo_magazine/sentry_flamer
	sentry_type = "uac_flamer"
	handheld_type = /obj/item/defenses/handheld/sentry/flamer
	health = 200
	health_max = 200
	burst = 25
	sentry_range = 9

	firing_sound = "gun_flamethrower"

	choice_categories = list(
		// SENTRY_CATEGORY_ROF = list(ROF_SINGLE, ROF_BURST, ROF_FULL_AUTO),
		SENTRY_CATEGORY_IFF = list(FACTION_MARINE, SENTRY_FACTION_WEYLAND, SENTRY_FACTION_HUMAN),
	)

	selected_categories = list(
		SENTRY_CATEGORY_ROF = ROF_BURST,
		SENTRY_CATEGORY_IFF = FACTION_MARINE,
	)

/obj/structure/machinery/defenses/sentry/flamer/handle_rof(level)
	switch(level)
		if(ROF_SINGLE)
			accuracy_mult = 1
			fire_delay = 4
		if(ROF_BURST)
			burst = 25
			accuracy_mult = 0.6
			fire_delay = 5
		if(ROF_FULL_AUTO)
			accuracy_mult = 0.1
			fire_delay = 0.5

/obj/structure/machinery/defenses/sentry/flamer/destroyed_action()
	visible_message("[icon2html(src, viewers(src))] [SPAN_WARNING("The [name] starts spitting out sparks and smoke!")]")
	playsound(loc, 'sound/mecha/critdestrsyndi.ogg', 25, 1)
	for(var/i = 1 to 6)
		setDir(pick(NORTH, EAST, SOUTH, WEST))
		sleep(2)

	if(ammo.current_rounds != 0)
		var/datum/reagent/napalm/blue/R = new()
		new /obj/flamer_fire(loc, create_cause_data("sentry explosion", owner_mob), R, 2)
	cell_explosion(loc, 10, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("sentry explosion", owner_mob))
	if(!QDELETED(src))
		qdel(src)


/obj/structure/machinery/defenses/sentry/flamer/mini
	name = "UA 45-FM Mini Sentry"
	defense_type = "Mini"
	health = 150
	health_max = 150
	density = FALSE
	fire_delay = 1.25 SECONDS
	disassemble_time = 0.75 SECONDS
	ammo = new /obj/item/ammo_magazine/sentry_flamer/mini
	handheld_type = /obj/item/defenses/handheld/sentry/flamer/mini
	composite_icon = FALSE


/obj/structure/machinery/defenses/sentry/flamer/mini/destroyed_action()
	visible_message("[icon2html(src, viewers(src))] [SPAN_WARNING("The [name] starts spitting out sparks and smoke!")]")
	playsound(loc, 'sound/mecha/critdestrsyndi.ogg', 25, 1)

	cell_explosion(loc, 10, 10, null, create_cause_data("sentry explosion", owner_mob))
	if(!QDELETED(src))
		qdel(src)

/obj/structure/machinery/defenses/sentry/flamer/wy
	name = "WY 406-FE2 Smart Sentry"
	icon = 'icons/obj/structures/machinery/defenses/wy_defenses.dmi'
	desc = "A deployable, fully-automated turret with AI targeting capabilities used by the PMC."
	health = 300
	health_max = 300
	disassemble_time = 5 SECONDS
	hack_time = 25 SECONDS
	ammo = new /obj/item/ammo_magazine/sentry_flamer/wy
	sentry_type = "wy_flamer"
	sentry_range = 9
	omni_directional = TRUE
	handheld_type = /obj/item/defenses/handheld/sentry/flamer/wy
	selected_categories = list(
		SENTRY_CATEGORY_ROF = ROF_BURST,
		SENTRY_CATEGORY_IFF = SENTRY_FACTION_WEYLAND,
	)

/obj/structure/machinery/defenses/sentry/flamer/wy/destroyed_action()
	visible_message("[icon2html(src, viewers(src))] [SPAN_WARNING("The [name] starts spitting out sparks and smoke!")]")
	playsound(loc, 'sound/mecha/critdestrsyndi.ogg', 25, 1)
	for(var/i = 1 to 6)
		setDir(pick(NORTH, EAST, SOUTH, WEST))
		sleep(2)

	if(ammo.current_rounds != 0)
		var/datum/reagent/napalm/sticky/sticky_napalm = new()
		new /obj/flamer_fire(loc, create_cause_data("sentry explosion", owner_mob), sticky_napalm, 2)
	cell_explosion(loc, 10, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("sentry explosion", owner_mob))
	if(!QDELETED(src))
		qdel(src)


/obj/structure/machinery/defenses/sentry/flamer/upp
	name = "UPP SDS-R5 Sentry Flamer"
	icon = 'icons/obj/structures/machinery/defenses/upp_defenses.dmi'
	desc = "A deployable, fully-automated turret with AI targeting capabilities used by the UPP."
	health = 300
	health_max = 300
	disassemble_time = 5 SECONDS
	ammo = new /obj/item/ammo_magazine/sentry_flamer/upp
	sentry_type = "upp_flamer"
	handheld_type = /obj/item/defenses/handheld/sentry/flamer/upp
	selected_categories = list(
		SENTRY_CATEGORY_ROF = ROF_BURST,
		SENTRY_CATEGORY_IFF = FACTION_UPP,
	)

/obj/structure/machinery/defenses/sentry/flamer/upp/destroyed_action()
	visible_message("[icon2html(src, viewers(src))] [SPAN_WARNING("The [name] starts spitting out sparks and smoke!")]")
	playsound(loc, 'sound/mecha/critdestrsyndi.ogg', 25, 1)
	for(var/i = 1 to 6)
		setDir(pick(NORTH, EAST, SOUTH, WEST))
		sleep(2)

	if(ammo.current_rounds != 0)
		var/datum/reagent/napalm/gel/gel_napalm = new()
		new /obj/flamer_fire(loc, create_cause_data("sentry explosion", owner_mob), gel_napalm, 2)
	cell_explosion(loc, 10, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("sentry explosion", owner_mob))
	if(!QDELETED(src))
		qdel(src)
