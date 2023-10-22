/datum/xeno_ai_movement/linger/lurking

	// Gradually increases the chance of AI to try and bait marines
	// Annoyance accumulate when we lurk (stand invisible) and aware of our target
	var/annoyance = 0

	// Total baits this xeno made
	var/total_baits = 0

	// Are we currentlu hiding?
	var/ai_lurking = FALSE

#define ANNOYANCE_INCREASE_COOLDOWN 1 SECONDS

/datum/xeno_ai_movement/linger/lurking/New(mob/living/carbon/xenomorph/parent)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(check_annoyance)), ANNOYANCE_INCREASE_COOLDOWN, TIMER_UNIQUE|TIMER_LOOP|TIMER_DELETE_ME)

#undef ANNOYANCE_INCREASE_COOLDOWN

/datum/xeno_ai_movement/linger/lurking/ai_move_idle(delta_time)
	var/mob/living/carbon/xenomorph/idle_xeno = parent
	if(idle_xeno.throwing)
		return

	if(next_home_search < world.time && (!home_turf || get_dist(home_turf, idle_xeno) > max_distance_from_home))
		var/turf/T = get_turf(idle_xeno.loc)
		next_home_search = world.time + home_search_delay
		var/shortest_distance = INFINITY
		for(var/i in RANGE_TURFS(home_locate_range, T))
			var/turf/potential_home = i
			if(!potential_home.density && get_dist(idle_xeno, potential_home) < shortest_distance)
				home_turf = potential_home
				shortest_distance = get_dist(idle_xeno, potential_home)

	if(!home_turf)
		return

	if(idle_xeno.move_to_next_turf(home_turf, home_locate_range))
		if(get_dist(home_turf, idle_xeno) <= 0 && !ai_lurking)
			start_lurking(idle_xeno)
	else
		home_turf = null

/datum/xeno_ai_movement/linger/lurking/ai_move_target(delta_time)
	var/mob/living/carbon/xenomorph/moving_xeno = parent
	if(moving_xeno.throwing)
		return

	if(moving_xeno.current_target.is_mob_incapacitated())
		return ..()

	if(ai_lurking)
		return ai_move_idle(delta_time)

	annoyance = 0
	check_for_travelling_turf_change(moving_xeno)

	if(!moving_xeno.move_to_next_turf(travelling_turf))
		travelling_turf = get_turf(moving_xeno.current_target)
		return TRUE

/datum/xeno_ai_movement/linger/lurking/proc/check_annoyance()
	var/mob/living/carbon/xenomorph/annoyed_xeno = parent
	if(annoyed_xeno.current_target in view(world.view,src))
		return

	annoyance++

	if(prob(annoyance))
		try_bait()

#define LURKER_BAIT_TYPES list("Taunt","Emote","Interact")
#define LURKER_BAIT_EMOTES pick("growl","roar","scream","needhelp")
#define LURKER_BAIT_TAUNTS pick("Come here, little host","I won't bite","I see you")
#define LURKER_BAITS_BEFORE_AMBUSH 3

/datum/xeno_ai_movement/linger/lurking/proc/try_bait(no_interact)
	var/mob/living/carbon/xenomorph/baiting_xeno = parent
	if(baiting_xeno.throwing)
		return

	if(total_baits >= LURKER_BAITS_BEFORE_AMBUSH)
		stop_lurking(baiting_xeno)
		return

	var/bait_types = LURKER_BAIT_TYPES
	if(no_interact)
		bait_types -= "Interact"

	var/bait = pick(bait_types)
	switch(bait)
		if("Emote")
			baiting_xeno.emote(LURKER_BAIT_EMOTES)
		if("Taunt")
			baiting_xeno.say(LURKER_BAIT_TAUNTS)
		if("Interact")
			if(!interact_random(baiting_xeno))
				try_bait(no_interact = TRUE)
				return

	total_baits++
	annoyance = 0

#undef LURKER_BAIT_TYPES
#undef LURKER_BAIT_EMOTES
#undef LURKER_BAIT_TAUNTS
#undef LURKER_BAITS_BEFORE_AMBUSH

/datum/xeno_ai_movement/linger/lurking/proc/interact_random(mob/living/carbon/xenomorph/X)
	for(var/obj/O in orange(1, X))
		if(istype(O, /obj/structure/window_frame))
			continue
		if(!O.xeno_ai_act(X))
			continue
		return TRUE
	return FALSE

/datum/xeno_ai_movement/linger/lurking/proc/start_lurking(mob/living/carbon/xenomorph/X)
	animate(X, alpha = 15, time = 0.5 SECONDS, easing = QUAD_EASING)
	ai_lurking = TRUE

/datum/xeno_ai_movement/linger/lurking/proc/stop_lurking(mob/living/carbon/xenomorph/X)
	animate(X, alpha = initial(X.alpha), time = 0.2 SECONDS, easing = QUAD_EASING)
	ai_lurking = FALSE
