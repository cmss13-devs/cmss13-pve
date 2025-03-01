/turf/open/liquid //Basic liquid turf parent
	name = "liquid"
	icon = 'icons/turf/ground_map.dmi'
	can_bloody = FALSE
	allow_construction = FALSE
	///Multiplier on any slowdown applied to a mob moving through this turf
	var/slowdown_multiplier = 1
	///How high up on the mob water overlays sit
	var/mob_liquid_height = 11
	///How far down the mob visually drops down when in water
	var/mob_liquid_depth = -5


/turf/open/liquid/Initialize(mapload)
	AddElement(/datum/element/submerge) //added first so it loads all the contents correctly
	RegisterSignal(src, COMSIG_TURF_THROW_ENDED_HERE, PROC_REF(atom_entered))
	return ..()

/turf/open/liquid/Destroy(force)
	if(!(get_submerge_height() - mob_liquid_height) && !(get_submerge_depth() - mob_liquid_depth))
		RemoveElement(/datum/element/submerge)
	return ..()

/turf/open/liquid/AfterChange()
	. = ..()
	baseturfs = type

/turf/open/liquid/is_weedable()
	return NOT_WEEDABLE

/turf/open/liquid/can_dig_xeno_tunnel()
	return FALSE

/turf/open/liquid/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	return atom_entered(src, arrived)

/turf/open/liquid/get_submerge_height(turf_only = FALSE)
	. = ..()
	if(SEND_SIGNAL(src, COMSIG_TURF_CHECK_COVERED))
		return
	. += mob_liquid_height

/turf/open/liquid/get_submerge_depth()
	if(SEND_SIGNAL(src, COMSIG_TURF_CHECK_COVERED))
		return 0
	return mob_liquid_depth

///Effects applied to anything that lands in the liquid
/turf/open/liquid/proc/atom_entered(datum/source, atom/movable/arrived)
	SIGNAL_HANDLER
	if(!check_submerge(arrived))
		return FALSE
	entry_effects(arrived)
	return TRUE

///Returns TRUE if the AM is actually in the liquid instead of above it
/turf/open/liquid/proc/check_submerge(atom/movable/submergee)
	if(SEND_SIGNAL(src, COMSIG_TURF_CHECK_COVERED))
		return FALSE
	if(submergee.throwing)
		return FALSE
	if(HAS_TRAIT(submergee, TRAIT_NOSUBMERGE))
		return FALSE
	return TRUE

///Applies liquid effects to an AM
/turf/open/liquid/proc/entry_effects(atom/movable/target)
	if(!isliving(target))
		return
	var/mob/living_target = target
	living_target.next_move_slowdown += (living_target.get_liquid_slowdown() * slowdown_multiplier)

/turf/open/liquid/water
	name = "river"
	icon_state = "seashallow"
	minimap_color = MINIMAP_WATER
	supports_fishing = TRUE

/turf/open/liquid/water/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	if(!.)
		return

	if(!iscarbon(arrived))
		return

	var/mob/living/carbon/carbon_mob = arrived
	SEND_SIGNAL(carbon_mob, COMSIG_MOVABLE_ENTERED_RIVER, src)

	if(ishuman(carbon_mob))
		clean_up(carbon_mob)

	if(carbon_mob.on_fire)
		carbon_mob.ExtinguishMob()

/turf/open/liquid/water/proc/clean_up(mob/living/carbon/human/M)
	if(!M || !istype(M)) return

	if(M.back)
		if(M.back.clean_blood())
			M.update_inv_back(0)
	if(M.wear_suit)
		if(M.wear_suit.clean_blood())
			M.update_inv_wear_suit(0)
	if(M.w_uniform)
		if(M.w_uniform.clean_blood())
			M.update_inv_w_uniform(0)
	if(M.gloves)
		if(M.gloves.clean_blood())
			M.update_inv_gloves(0)
	if(M.shoes)
		if(M.shoes.clean_blood())
			M.update_inv_shoes(0)
	M.clean_blood()

/turf/open/liquid/water/sea
	name = "water"
	icon_state = "seadeep"

/turf/open/liquid/water/river
	name = "river"

/turf/open/liquid/water/river/no_overlay
	mob_liquid_height = 0
	mob_liquid_depth = 0

/turf/open/liquid/water/river/deep
	icon_state = "seashallow_deep"
	mob_liquid_height = 18
	mob_liquid_depth = -8

/turf/open/liquid/water/river/deep/Initialize(mapload)
	. = ..()
	icon_state = "seashallow"

/turf/open/liquid/water/pool
	name = "pool"

/turf/open/liquid/water/darkred_pool
	color = "#990000"
	name = "pool"

/turf/open/liquid/water/darkred
	color = "#990000"

/turf/open/liquid/water/red_pool
	color = "#995555"
	name = "pool"

/turf/open/liquid/water/red
	color = "#995555"

/turf/open/liquid/water/shallow_ocean_shallow_ocean
	name = "shallow ocean"
	supports_fishing = TRUE

/turf/open/liquid/water/ocean
	color = "#dae3e2"
	slowdown_multiplier = 2 // VERY. SLOW.
	supports_fishing = TRUE

/turf/open/liquid/water/ocean/Entered(atom/movable/AM)
	. = ..()
	if(prob(20)) // fuck you
		if(!ismob(AM))
			return
		var/mob/unlucky_mob = AM
		var/turf/target_turf = get_random_turf_in_range(AM.loc, 3, 0)
		var/datum/launch_metadata/LM = new()
		LM.target = target_turf
		LM.range = get_dist(AM.loc, target_turf)
		LM.speed = SPEED_FAST
		LM.thrower = unlucky_mob
		LM.spin = TRUE
		LM.pass_flags = NO_FLAGS
		to_chat(unlucky_mob, SPAN_WARNING("The ocean currents sweep you off your feet and throw you away!"))
		unlucky_mob.launch_towards(LM)
		return

	if(world.time % 5)
		if(ismob(AM))
			var/mob/rivermob = AM
			to_chat(rivermob, SPAN_WARNING("Moving through the incredibly deep ocean slows you down a lot!"))

/turf/open/liquid/water/ocean/deep_ocean
	name = "deep ocean"
	mob_liquid_height = 18
	mob_liquid_depth = -8

/turf/open/liquid/water/beach_water
	name = "shallow water"
	mob_liquid_height = 5
	mob_liquid_depth = -2

/turf/open/liquid/water/ocean/deep_water
	name = "deep water"
	mob_liquid_height = 18
	mob_liquid_depth = -8

/turf/open/liquid/water/river/desert
	name = "water"
	icon = 'icons/turf/floors/desert_water.dmi'
	icon_state = "shallow"
	var/toxic = FALSE

/turf/open/liquid/water/river/desert/deep
	icon_state = "deep"
	mob_liquid_height = 18
	mob_liquid_depth = -8

/turf/open/liquid/water/river/desert/deep/no_slowdown
	slowdown_multiplier = 0

/turf/open/liquid/water/river/desert/update_icon()
	..()
	switch(toxic)
		if(1)
			set_light(2)
			icon = 'icons/turf/floors/desert_water_toxic.dmi'
		if(0)
			set_light(0)
			icon = 'icons/turf/floors/desert_water.dmi'
		if(-1)
			set_light(1)
			icon = 'icons/turf/floors/desert_water_transition.dmi'

/turf/open/liquid/water/river/desert/shallow
	mob_liquid_height = 5
	mob_liquid_depth = -2

/turf/open/liquid/water/river/desert/shallow/pool
	name = "pool"

/turf/open/liquid/water/river/desert/shallow/toxic
	icon = 'icons/turf/floors/desert_water_toxic.dmi'

//shallow water transition to deep
/turf/open/liquid/water/river/desert/shallow/edge
	icon_state = "shallow_edge"

/turf/open/liquid/water/river/desert/shallow/edge/southwest
	dir = SOUTHWEST

/turf/open/liquid/water/river/desert/shallow/edge/north
	dir = NORTH

/turf/open/liquid/water/river/desert/shallow/edge/east
	dir = EAST

/turf/open/liquid/water/river/desert/shallow/edge/northwest
	dir = NORTHWEST

/turf/open/liquid/water/river/desert/shallow/edge/northeast
	dir = NORTHEAST

/turf/open/liquid/water/river/desert/shallow/edge/southeast
	dir = SOUTHEAST

/turf/open/liquid/water/river/desert/shallow/edge/west
	dir = WEST

/turf/open/liquid/water/river/desert/shallow/edge/covered/Initialize(mapload)
	. = ..()
	new /obj/structure/catwalk/grate(src)

/turf/open/liquid/water/river/desert/shallow/edge/covered/north
	dir = NORTH

/turf/open/liquid/water/river/desert/shallow/edge/covered/east
	dir = EAST

/turf/open/liquid/water/river/desert/shallow/edge/covered/northeast
	dir = NORTHEAST

/turf/open/liquid/water/river/desert/shallow/edge/covered/west
	dir = WEST

/turf/open/liquid/water/river/desert/shallow/corner
	icon_state = "shallow_c"

/turf/open/liquid/water/river/desert/shallow/corner/north
	dir = NORTH

/turf/open/liquid/water/river/desert/shallow/corner/east
	dir = EAST

/turf/open/liquid/water/river/desert/shallow/corner/west
	dir = WEST

/turf/open/liquid/water/river/desert/shallow/corner/covered/Initialize(mapload)
	. = ..()
	new /obj/structure/catwalk/grate(src)

/turf/open/liquid/water/river/desert/deep/toxic
	icon = 'icons/turf/floors/desert_water_toxic.dmi'

//Mapping helpers
/turf/open/liquid/water/river/desert/deep/covered/Initialize(mapload)
	. = ..()
	new /obj/structure/catwalk/grate(src)

// LAVA
/turf/open/liquid/lava
	name = "lava"
	icon = 'icons/turf/lava.dmi'
	icon_state = "full"
	light_system = STATIC_LIGHT //theres a lot of lava, dont change this
	light_range = 2
	light_power = 1.4
	light_color = LIGHT_COLOR_LAVA
	minimap_color = MINIMAP_LAVA
	slowdown_multiplier = 1.5

/turf/open/liquid/lava/Exited(atom/movable/leaver, direction)
	. = ..()
	if(isliving(leaver))
		var/mob/living/L = leaver
		if(!(istype((get_step(src, direction)), /turf/open/liquid/lava)) && !L.on_fire)
			L.update_fire()

/turf/open/liquid/lava/process()
	if(!burn_stuff())
		STOP_PROCESSING(SSobj, src)

/turf/open/liquid/lava/entry_effects(atom/movable/target)
	. = ..()
	if(burn_stuff(target))
		START_PROCESSING(SSobj, src)

///Handles burning turf contents or an entering AM. Returns true to keep processing
/turf/open/liquid/lava/proc/burn_stuff(AM)
	var/thing_to_check = AM ? list(AM) : src
	for(var/atom/thing as anything in thing_to_check)
		if(thing.lava_act())
			. = TRUE

/turf/open/liquid/lava/corner
	icon_state = "corner"

/turf/open/liquid/lava/side
	icon_state = "side"

/turf/open/liquid/lava/lpiece
	icon_state = "lpiece"

/turf/open/liquid/lava/single/
	icon_state = "single"

/turf/open/liquid/lava/single/intersection
	icon_state = "single_intersection"

/turf/open/liquid/lava/single_intersection/direction
	icon_state = "single_intersection_direction"

/turf/open/liquid/lava/single/middle
	icon_state = "single_middle"

/turf/open/liquid/lava/single/end
	icon_state = "single_end"

/turf/open/liquid/lava/single/corners
	icon_state = "single_corners"

//Mapping helpers
/turf/open/liquid/lava/catwalk
	icon_state = "lavacatwalk"

/turf/open/liquid/lava/catwalk/Initialize(mapload)
	. = ..()
	icon_state = "full"
	new /obj/structure/catwalk(src)
