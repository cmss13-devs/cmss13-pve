/datum/xeno_ai_movement/linger/lurking

	// Are we currentlu hiding?
	var/ai_lurking = FALSE

	// Gradually increases the chance of AI to try and bait marines
	// Annoyance accumulate when we lurk (stand invisible) and aware of our target
	var/annoyance = 0

	// Total baits this xeno made
	var/total_baits = 0

	// List of turfs we see and register while lurking
	var/list/registered_turfs = list()

	// Distance at which we want to stay from our spotted target
//	var/stalking_distance = 12 /// uncomment for stalking

	// Let's lower this a little bit cause we do some heavy checks while finding our "home"
	home_locate_range = 10

	max_distance_from_home = 8

#define AI_CHECK_ANNOYANCE_COOLDOWN 2.5 SECONDS

/datum/xeno_ai_movement/linger/lurking/New(mob/living/carbon/xenomorph/parent)
	. = ..()
	var/datum/action/xeno_action/activable/pounce/lurker/LPA = get_xeno_action_by_type(parent, /datum/action/xeno_action/activable/pounce/lurker)
	if (LPA && istype(LPA))
		LPA.knockdown = TRUE // pounce knocks down
		LPA.freeze_self = TRUE

	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(stop_lurking))
	addtimer(CALLBACK(src, PROC_REF(check_annoyance)), AI_CHECK_ANNOYANCE_COOLDOWN, TIMER_UNIQUE|TIMER_LOOP|TIMER_DELETE_ME)

#undef AI_CHECK_ANNOYANCE_COOLDOWN

/datum/xeno_ai_movement/linger/lurking/ai_move_idle(delta_time)
	var/mob/living/carbon/xenomorph/idle_xeno = parent
	if(idle_xeno.throwing)
		return

	if(next_home_search < world.time && (!home_turf || get_dist(home_turf, idle_xeno) > max_distance_from_home))
		var/turf/T = get_turf(idle_xeno.loc)
		next_home_search = world.time + home_search_delay
		var/shortest_distance = INFINITY
		for(var/i in shuffle(RANGE_TURFS(home_locate_range, T)))
			var/turf/potential_home = i
			var/lets_continue

			var/mob/living/carbon/xenomorph/blocking_xeno = locate() in potential_home
			if(blocking_xeno && blocking_xeno.stat == CONSCIOUS && blocking_xeno != idle_xeno)
				continue

			var/atom/target = idle_xeno.current_target
			if(target && potential_home != T && (potential_home in view(world.view, target)))
				continue // We prefer standing still when someone can see us

			if(!potential_home.density && get_dist(idle_xeno, potential_home) < shortest_distance)
				shortest_distance = get_dist(idle_xeno, potential_home)

				/// First we try to locate some structures to stand and hide on
				for(var/obj/structure/S in potential_home)
					if(S && !istype(S, /obj/structure/pipes)) // Don't care if it's dense cause we can break it and hide on remains
						home_turf = potential_home
						lets_continue = TRUE
						break

				if(lets_continue)
					continue

				/// If we cannot find any structures, we look for walls around our potential home
				for(var/turf/t_around in orange(1, potential_home))
					if(t_around && t_around.density) // Let's find a wall to stick to it
						home_turf = potential_home
						shortest_distance += 5 // Penalty for no structures, we can do better
						lets_continue = TRUE
						break

				if(lets_continue)
					continue

				/// If we have no structures or walls to stick to (strange), just hide on closest turf
				home_turf = potential_home
				shortest_distance += 10 // Penalty for empty turfs (we don't wanna hide on them)

	if(!home_turf)
		return

	/// Abandon hiding place to stalk our target
//	if(idle_xeno.current_target && get_dist(home_turf, idle_xeno.current_target) > stalking_distance)
//		home_turf = null
//		return /// uncomment for stalking

	if(idle_xeno.move_to_next_turf(home_turf, home_locate_range))
		if(get_dist(home_turf, idle_xeno) <= 0 && !ai_lurking)
			start_lurking()
	else
		home_turf = null

/datum/xeno_ai_movement/linger/lurking/ai_move_target(delta_time)
	var/mob/living/carbon/xenomorph/moving_xeno = parent
	if(moving_xeno.throwing)
		return

	if(moving_xeno.current_target.is_mob_incapacitated())
		return ..()

	var/turf/target_turf = get_turf(moving_xeno.current_target)
	if(ai_lurking)
//		if(get_dist(moving_xeno, target_turf) > stalking_distance)
//			return moving_xeno.move_to_next_turf(target_turf) /// uncomment for stalking
		return ai_move_idle(delta_time)

	annoyance = 0
	check_for_travelling_turf_change(moving_xeno)

	if(!moving_xeno.move_to_next_turf(travelling_turf))
		travelling_turf = target_turf
		return TRUE

/datum/xeno_ai_movement/linger/lurking/proc/check_annoyance()
	var/mob/living/carbon/xenomorph/annoyed_xeno = parent
	if(!annoyed_xeno.current_target || !ai_lurking)
		return

	if(annoyed_xeno.current_target in view(world.view, annoyed_xeno))
		return

	annoyance++

	if(prob(annoyance))
		try_bait()


#define LURKER_BAIT_TYPES list("Taunt","Emote","Interact")
#define LURKER_BAIT_EMOTES list("growl","roar","scream","needshelp")
#define LURKER_BAIT_TAUNTS list("Come here, little host","I won't bite","I see you","Safe to go, little one")
#define LURKER_BAITS_BEFORE_AMBUSH 4

/datum/xeno_ai_movement/linger/lurking/proc/try_bait(no_interact)
	var/mob/living/carbon/xenomorph/baiting_xeno = parent
	if(baiting_xeno.throwing)
		return

	if(total_baits >= LURKER_BAITS_BEFORE_AMBUSH)
		stop_lurking()
		total_baits = 0
		return

	var/bait_types = LURKER_BAIT_TYPES
	if(no_interact)
		bait_types -= "Interact"

	var/bait = pick(bait_types)
	switch(bait)
		if("Emote")
			baiting_xeno.emote(pick(LURKER_BAIT_EMOTES))
		if("Taunt")
			baiting_xeno.say(pick(LURKER_BAIT_TAUNTS))
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
		if(istype(O, /obj/structure/pipes))
			continue
		if(istype(O, /obj/structure/sign))
			continue
		if(!O.xeno_ai_act(X))
			continue
		return TRUE
	return FALSE


/datum/xeno_ai_movement/linger/lurking/proc/start_lurking()
	SIGNAL_HANDLER
	if(!ai_lurking)
		var/mob/living/carbon/xenomorph/lurking_xeno = parent
		animate(lurking_xeno, alpha = 20, time = 0.5 SECONDS, easing = QUAD_EASING)
		lurking_xeno.set_movement_intent(MOVE_INTENT_WALK)
		register_turf_signals()
		ai_lurking = TRUE

		var/datum/action/xeno_action/activable/pounce/lurker/LPA = get_xeno_action_by_type(lurking_xeno, /datum/action/xeno_action/activable/pounce/lurker)
		if(LPA && istype(LPA))
			LPA.knockdown = TRUE // pounce knocks down again
			LPA.freeze_self = TRUE

/datum/xeno_ai_movement/linger/lurking/proc/stop_lurking()
	SIGNAL_HANDLER
	if(ai_lurking)
		var/mob/living/carbon/xenomorph/lurking_xeno = parent
		animate(lurking_xeno, alpha = initial(lurking_xeno.alpha), time = 0.2 SECONDS, easing = QUAD_EASING)
		lurking_xeno.set_movement_intent(MOVE_INTENT_RUN)
		unregister_turf_signals()
		ai_lurking = FALSE

		INVOKE_ASYNC(lurking_xeno, TYPE_PROC_REF(/mob, stop_pulling))


/datum/xeno_ai_movement/linger/lurking/proc/register_turf_signals()
	for(var/turf/turf in view(world.view, parent))
		RegisterSignal(turf, COMSIG_TURF_ENTERED, PROC_REF(set_target), override = TRUE)
		registered_turfs += turf

/datum/xeno_ai_movement/linger/lurking/proc/unregister_turf_signals()
	for(var/turf/turf in view(world.view, parent))
		UnregisterSignal(turf, COMSIG_TURF_ENTERED)
	registered_turfs = list()

/datum/xeno_ai_movement/linger/lurking/proc/set_target(turf/hooked, atom/movable/subject)
	SIGNAL_HANDLER
	var/mob/living/carbon/xenomorph/lurking_xeno = parent
	if(subject in GLOB.alive_human_list)
		lurking_xeno.current_target = subject
