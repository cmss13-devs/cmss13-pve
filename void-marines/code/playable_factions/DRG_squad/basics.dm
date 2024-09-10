#define FACTION_DRG "Deep Rock Galactic"

GLOBAL_LIST_EMPTY(marked_creatures)

/area/drg
	name = "Deep Caves"
	icon = 'icons/turf/area_kutjevo.dmi'
	icon_state = "kutjevo"
	minimap_color = MINIMAP_AREA_ENGI

/obj
	var/lore = "Nothing important to know..."

/obj/item
	var/digspeed_mod = 0

/mob
	var/marked_creature = FALSE
	var/additional_mark_time = 0

/mob/proc/mark_mob()
	marked_creature = TRUE
	src.add_filter("mark_on", 1, list("type" = "outline", "color" = "#fc0303", "size" = 1))
	GLOB.marked_creatures += src
	addtimer(CALLBACK(src, PROC_REF(remove_mark)), 20 SECONDS + additional_mark_time)

/mob/proc/remove_mark()
	if(additional_mark_time > 0)
		additional_mark_time = 0
	src.remove_filter("mark_on")
	GLOB.marked_creatures -= src
	marked_creature = FALSE

// ROCKS AND MINERALS //
#define HEALTH_ROCK 200
#define HEALTH_SOFT_ROCK 100

/turf/closed/wall/drg_rock
	name = "hard surface"
	desc = "Dense rock, which can only be cleared by special tools."
	icon = 'void-marines/icons/rocks.dmi'
	icon_state = "rocktable"
	special_icon = TRUE
	var/icon_prefix = "rock"

	color = "#a78772"
	damage_cap = HEALTH_ROCK
	repair_materials = list()

	var/dig_time = 10 SECONDS // how long it will take - also can be decreased by instruments stats
	var/mineral_drop = null // loot to drop

	var/floor_types = list(/turf/open/auto_turf/sand_white/layer0, /turf/open/auto_turf/sand_white/layer1)

/turf/closed/wall/drg_rock/Destroy(force)
	. = ..()
	var/list/turfs_around = orange(src, 1)
	for(var/turf/closed/wall/W in turfs_around)
		if(!can_join_with(W))
			continue
		addtimer(CALLBACK(W, PROC_REF(update_icon)), rand(1,3))

/turf/closed/wall/drg_rock/attackby(obj/item/W, mob/user, click_data)
	if(isxeno(user) && istype(W, /obj/item/grab))
		var/obj/item/grab/attacker_grab = W
		var/mob/living/carbon/xenomorph/user_as_xenomorph = user
		user_as_xenomorph.do_nesting_host(attacker_grab.grabbed_thing, src)

	if(!W.digspeed_mod)
		return

	playsound(src, 'void-marines/sound/drg/standart_pickaxe_2.ogg', 25, 1)

	var/timer = dig_time * W.digspeed_mod
	spawn(timer / 2)
		playsound(src, 'void-marines/sound/drg/standart_pickaxe_2.ogg', 25, 1)

	if(!do_after(user, timer, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
		return

	if(mineral_drop)
		new mineral_drop(loc)

	playsound(src, 'void-marines/sound/drg/standart_pickaxe_2.ogg', 25, 1)
	playsound(src, 'sound/soundscape/rocksfalling2.ogg', 100, 1)

	user.visible_message(SPAN_WARNING("[src] crumbles to dust."),
	SPAN_NOTICE("You dug through [src]."))

	ChangeTurf(pick(floor_types))

/turf/closed/wall/drg_rock/attack_alien(mob/living/carbon/xenomorph/user)
	if(acided_hole && user.mob_size >= MOB_SIZE_BIG)
		acided_hole.expand_hole(user) //This proc applies the attack delay itself.
		return XENO_NO_DELAY_ACTION

	if(!hull && user.claw_type >= claws_minimum)
		if(acided_hole)
			acided_hole.attack_alien(user)
			return XENO_NO_DELAY_ACTION
		user.animation_attack_on(src)
		playsound(src, 'sound/weapons/Genhit.ogg', 25, 1)
		if(damage >= (damage_cap - (damage_cap / XENO_HITS_TO_DESTROY_WALL)))
			ChangeTurf(pick(floor_types))
		else
			take_damage(damage_cap / XENO_HITS_TO_DESTROY_WALL)
		return XENO_ATTACK_ACTION

/turf/closed/wall/drg_rock/make_girder()
	return

/turf/closed/wall/drg_rock/update_icon()
	. = ..()

	var/dir_sum = 0
	for(var/direction in CARDINAL_ALL_DIRS)
		var/turf/closed/wall/W = get_step(src, direction)
		if(!istype(W))
			continue
		if(direction < 5)
			dir_sum += direction
		else
			if(direction == 5) //This permits the use of all table directions. (Set up so clockwise around the central table is a higher value, from north)
				dir_sum += 16
			if(direction == 6)
				dir_sum += 32
			if(direction == 8) //Aherp and Aderp.  Jezes I am stupid.  -- SkyMarshal
				dir_sum += 8
			if(direction == 10)
				dir_sum += 64
			if(direction == 9)
				dir_sum += 128

	var/table_type = 0 //stand_alone table
	if((dir_sum%16) in cardinal)
		table_type = 1 //endtable
		dir_sum %= 16
	if((dir_sum%16) in list(3, 12))
		table_type = 2 //1 tile thick, streight table
		if(dir_sum%16 == 3) //3 doesn't exist as a dir
			dir_sum = 2
		if(dir_sum%16 == 12) //12 doesn't exist as a dir.
			dir_sum = 4
	if((dir_sum%16) in list(5, 6, 9, 10))
		if(istype(get_step(src, dir_sum%16), /turf/closed/wall))
			table_type = 3 //full table (not the 1 tile thick one, but one of the 'tabledir' tables)
		else
			table_type = 2 //1 tile thick, corner table (treated the same as streight tables in code later on)
		dir_sum %= 16
	if((dir_sum%16) in list(13, 14, 7, 11)) //Three-way intersection
		table_type = 5 //full table as three-way intersections are not sprited, would require 64 sprites to handle all combinations.  TOO BAD -- SkyMarshal
		switch(dir_sum%16) //Begin computation of the special type tables.  --SkyMarshal
			if(7)
				if(dir_sum == 23)
					table_type = 6
					dir_sum = 8
				else if(dir_sum == 39)
					dir_sum = 4
					table_type = 6
				else if(dir_sum == 55 || dir_sum == 119 || dir_sum == 247 || dir_sum == 183)
					dir_sum = 4
					table_type = 3
				else
					dir_sum = 4
			if(11)
				if(dir_sum == 75)
					dir_sum = 5
					table_type = 6
				else if(dir_sum == 139)
					dir_sum = 9
					table_type = 6
				else if(dir_sum == 203 || dir_sum == 219 || dir_sum == 251 || dir_sum == 235)
					dir_sum = 8
					table_type = 3
				else
					dir_sum = 8
			if(13)
				if(dir_sum == 29)
					dir_sum = 10
					table_type = 6
				else if(dir_sum == 141)
					dir_sum = 6
					table_type = 6
				else if(dir_sum == 189 || dir_sum == 221 || dir_sum == 253 || dir_sum == 157)
					dir_sum = 1
					table_type = 3
				else
					dir_sum = 1
			if(14)
				if(dir_sum == 46)
					dir_sum = 1
					table_type = 6
				else if(dir_sum == 78)
					dir_sum = 2
					table_type = 6
				else if(dir_sum == 110 || dir_sum == 254 || dir_sum == 238 || dir_sum == 126)
					dir_sum = 2
					table_type = 3
				else
					dir_sum = 2 //These translate the dir_sum to the correct dirs from the 'tabledir' icon_state.
	if(dir_sum%16 == 15)
		table_type = 4 //4-way intersection, the 'middle' table sprites will be used.

	switch(table_type)
		if(0)
			icon_state = "[icon_prefix]table"
		if(1)
			icon_state = "[icon_prefix]1tileendtable"
		if(2)
			icon_state = "[icon_prefix]1tilethick"
		if(3)
			icon_state = "[icon_prefix]tabledir"
		if(4)
			icon_state = "[icon_prefix]middle"
		if(5)
			icon_state = "[icon_prefix]tabledir2"
		if(6)
			icon_state = "[icon_prefix]tabledir3"

	if(dir_sum in CARDINAL_ALL_DIRS)
		dir = dir_sum
	else
		dir = SOUTH

/turf/closed/wall/drg_rock/soft
	name = "soft soil"
	desc = "Much easier to dig."
	icon_state = "dirttable"
	icon_prefix = "dirt"

	damage_cap = HEALTH_SOFT_ROCK
	dig_time = 5 SECONDS
