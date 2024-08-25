
// GROUND MINERALS //

/obj/structure/drg/land_crystals
	name = "land ore"
	desc = "Crystal rocks, growing from the floor, walls, and even from cave roof."
	icon = 'void-marines/icons/gray_crystal.dmi'
	icon_state = "crystal_stage1"
	anchored = TRUE
	density = TRUE
	opacity = FALSE

	light_power = 4
	light_range = 1
	light_on = TRUE

	var/mineral_amount = 3
	var/current_minerals

	//pretty same to rocks code
	var/list/allowed_instruments = list(/obj/item/weapon/drg/pickaxe) //what items can be used to dig it out
	var/mineral_type = null //loot to drop

	var/mining_sound

/obj/structure/drg/land_crystals/Initialize()
	. = ..()
	current_minerals = rand(1, mineral_amount)
	update_icon()

/obj/structure/drg/land_crystals/update_icon()
	. = ..()
	var/stage
	if(current_minerals > mineral_amount * 0.66)
		stage = 3
	else if(current_minerals > mineral_amount * 0.33)
		stage = 2
	else
		stage = 1

	icon_state = "crystal_stage[stage]"

/obj/structure/drg/land_crystals/attackby(obj/item/W, mob/user, click_data)
	if(!(W.type in allowed_instruments))
		return TRUE

	playsound(loc, 'void-marines/sound/drg/standart_pickaxe_1.ogg', 25, 1)
	spawn(1 SECONDS)
		playsound(loc, 'void-marines/sound/drg/standart_pickaxe_2.ogg', 25, 1)

	user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
	SPAN_NOTICE("You start digging [src] out."))
	if(!do_after(user, 2 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
		return TRUE

	current_minerals--
	if(mineral_type)
		new mineral_type(loc)

	if(mining_sound)
		playsound(loc, mining_sound, 25, 1)

	if(!current_minerals)
		user.visible_message(SPAN_WARNING("[src] crumbles to dust."),
		SPAN_NOTICE("You dug through [src]."))
		qdel(src)
		return TRUE

	user.visible_message(SPAN_WARNING("[user] breaks off a chunk of [src]."),
	SPAN_NOTICE("You break a chunk of [src]."))
	update_icon()
	return TRUE

/*
	Red sugar deposits, funny addictive healing thingy
*/
/obj/structure/drg/land_crystals/sugar
	name = "red sugar crystal"
	desc = "Crystal chunk, posessing strong regenerative capabilities."
	light_color = "#e90505"
	color = "#e90505"

	mineral_type = /obj/item/reagent_container/food/snacks/drg_sugar
	mining_sound = 'void-marines/sound/drg/red_sugar_break.ogg'

/*
	Crystals themselves
*/
/obj/item/reagent_container/food/snacks/drg_sugar
	name = "red sugar"
	icon = 'void-marines/icons/gray_crystal.dmi'
	icon_state = "shard"
	item_state = "shard-glass"
	flags_atom = FPRINT
	w_class = SIZE_LARGE
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = TRUE
	filling_color = "#e90505"
	color = "#e90505"

/obj/item/reagent_container/food/snacks/drg_sugar/Initialize()
	. = ..()
	var/shardsize = pick("large", "medium", "small")
	icon_state = shardsize
	switch(shardsize)
		if("small")
			pixel_x = rand(-12, 12)
			pixel_y = rand(-12, 12)
		if("medium")
			pixel_x = rand(-8, 8)
			pixel_y = rand(-8, 8)
		if("large")
			pixel_x = rand(-5, 5)
			pixel_y = rand(-5, 5)

	reagents.add_reagent("rsugar", 2.5)
	bitesize = 1.25

/obj/item/reagent_container/food/snacks/drg_sugar/attack(mob/M, mob/user)
	. = ..()
	if(.)
		playsound(M.loc, 'sound/effects/glass_step.ogg', 15, 1)

/*
	Reagent
*/
/datum/reagent/medical/red_sugar
	name = "Red Sugar"
	id = "rsugar"
	description = "A powdered red sugar. Nothing else!"
	color = "#fd3567"
	chemclass = CHEM_CLASS_SPECIAL
	reagent_state = LIQUID
	properties = list(
		// pos
		PROPERTY_ANTICORROSIVE = 6,
		PROPERTY_OXYGENATING = 6,
		PROPERTY_NEOGENETIC = 6,
		PROPERTY_ANTITOXIC = 6,
		PROPERTY_CARDIOSTABILIZING = 10,
		PROPERTY_NERVESTIMULATING = 2,
		PROPERTY_BONEMENDING = 100, //minimum 5 seconds to knit bones
		PROPERTY_NUTRITIOUS = 2,
		PROPERTY_HEMOGENIC = 3,
		PROPERTY_AIDING = 1,
		// organs
		PROPERTY_ORGAN_HEALING = 10,
		// neu
		PROPERTY_EUPHORIC = 1, //5% chance to do the laugh
		// neg
		PROPERTY_ADDICTIVE = 1,
	)
	flags = REAGENT_TYPE_MEDICAL | REAGENT_SCANNABLE | REAGENT_CANNOT_OVERDOSE

/datum/reagent/medical/red_sugar/handle_processing(mob/living/M, list/mods, delta_time)
	. = ..()
	for(var/obj/limb/L in M)
		L.remove_all_bleeding(TRUE, TRUE)

// EGG-HUNT STUFF //

/obj/structure/surface/table/rock/organic
	icon_state = "meatnormaltable"
	table_prefix = "meatnormal"

	color = "#ffffff"
	name = "organic mass"
	desc = "This is...flesh?"
	dig_time = 5 SECONDS

/obj/structure/surface/table/rock/organic/veiny
	icon_state = "meatnormal2table"
	table_prefix = "meatnormal2"

/obj/effect/decal/organic_veins
	icon = 'void-marines/icons/glyphid_egg.dmi'
	icon_state = "veins"
	layer = TURF_LAYER
	name = "strange red vines"

/turf/open/floor/organic
	icon = 'void-marines/icons/glyphid_egg.dmi'
	icon_state = "default"
	name = "organic mass"
	desc = "This is...flesh?"
	plating_type = /turf/open/auto_turf/sand_white/layer0

/turf/open/floor/organic/veiny
	icon_state = "eyes"

/obj/item/drg/glyphid_egg
	icon = 'void-marines/icons/glyphid_egg.dmi'
	icon_state = "egg"
	name = "strange egg"
	desc = "An strange alien egg, used for pretty simple things - like cooking omlet"
	w_class = SIZE_LARGE
