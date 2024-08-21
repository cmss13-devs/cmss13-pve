#define FACTION_DRG "Deep Rock Galactic"

/area/drg
	name = "Deep Caves"
	icon = 'icons/turf/area_kutjevo.dmi'
	icon_state = "kutjevo"
	minimap_color = MINIMAP_AREA_ENGI

/obj
	var/lore = "Nothing important to know..."

/obj/item
	var/digging_buff = 0

/mob
	var/marked_creature = FALSE

/mob/proc/mark_mob()
	marked_creature = TRUE
	src.add_filter("mark_on", 1, list("type" = "outline", "color" = "#fc0303", "size" = 1))
	addtimer(CALLBACK(src, PROC_REF(remove_mark)), 20 SECONDS)

/mob/proc/remove_mark()
	src.remove_filter("mark_on")
	marked_creature = FALSE

// ROCKS AND MINERALS //

/obj/structure/surface/table/rock
	name = "hard surface"
	desc = "Dense rock, which can only be cleared by special tools."
	climbable = FALSE
	throwpass = FALSE
	unslashable = TRUE
	reinforced = TRUE
	opacity = TRUE
	projectile_coverage = 100
	flipped_projectile_coverage = PROJECTILE_COVERAGE_MAX
	upright_projectile_coverage = PROJECTILE_COVERAGE_MAX
	health = 500

	icon = 'void-marines/icons/rocks.dmi'
	icon_state = "rocktable"
	table_prefix = "rock"
	color = "#a78772"

	debris = null
	parts = null
	var/list/allowed_instruments = list(/obj/item/weapon/drg/pickaxe) //what items can be used to dig it out
	var/dig_time = 10 SECONDS //how long it will take - also can be decreased by instruments stats
	var/have_minerals = FALSE //do we have anything tasty?
	var/mineral_drop = null //loot to drop

/obj/structure/surface/table/rock/Initialize()
	..()
	verbs -= /obj/structure/surface/table/verb/do_flip

/obj/structure/surface/table/rock/initialize_pass_flags(datum/pass_flags_container/PF)
	return

/obj/structure/surface/table/rock/Crossed(atom/movable/O)
	return

/obj/structure/surface/table/rock/MouseDrop(over_object, src_location, over_location)
	return

/obj/structure/surface/table/rock/MouseDrop_T(obj/item/I, mob/user)
	return

/obj/structure/surface/table/rock/attackby(obj/item/W, mob/user, click_data)

	if(W.type in allowed_instruments)
		playsound(src.loc, 'sound/weapons/Genhit.ogg', 25, 1)
		if(do_after(user, dig_time - W.digging_buff, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			if(have_minerals)
				new mineral_drop(loc)
			user.visible_message(SPAN_WARNING("[src] crumbles to dust."),
			SPAN_NOTICE("You dug through [src]."))
			qdel(src)

/obj/structure/surface/table/rock/soft
	icon_state = "dirttable"
	table_prefix = "dirt"

	name = "soft soil"
	desc = "Much easier to dig."
	dig_time = 5 SECONDS
