///***MINES***///
//Mines have an invisible "tripwire" atom that explodes when crossed
//Stepping directly on the mine will also blow it up
/obj/item/explosive/mine
	name = "\improper M20 Claymore anti-personnel mine"
	desc = "The M20 Claymore is a directional proximity-triggered anti-personnel mine designed by Armat Systems for use by the United States Colonial Marines. The mine is triggered by movement both on the mine itself, and on the space immediately in front of it. Detonation sprays shrapnel forwards in a 120-degree cone. The words \"FRONT TOWARD ENEMY\" are embossed on the front."
	icon = 'icons/obj/items/weapons/grenade.dmi'
	icon_state = "m20"
	force = 5
	w_class = SIZE_SMALL
	//layer = MOB_LAYER - 0.1 //You can't just randomly hide claymores under boxes. Booby-trapping bodies is fine though
	throwforce = 5
	throw_range = 6
	throw_speed = SPEED_VERY_FAST
	unacidable = TRUE
	flags_atom = FPRINT|CONDUCT
	antigrief_protection = TRUE
	allowed_sensors = list(/obj/item/device/assembly/prox_sensor)
	max_container_volume = 120
	reaction_limits = list( "max_ex_power" = 105, "base_ex_falloff" = 60, "max_ex_shards" = 32,
							"max_fire_rad" = 5, "max_fire_int" = 12, "max_fire_dur" = 18,
							"min_fire_rad" = 2, "min_fire_int" = 3, "min_fire_dur" = 3
	)
	angle = 60
	use_dir = TRUE
	var/iff_signal = FACTION_MARINE
	var/triggered = FALSE
	var/hard_iff_lock = FALSE
	var/obj/effect/mine_tripwire/tripwire
	var/base_disarm_fail_chance = 50
	var/base_disarm_time = 45

	var/map_deployed = FALSE
	var/has_tripwire = TRUE //this should provide an easy way of just letting us configure this for alternative mines.
	var/blast_tolerance = 15 //This represents the absolute minimum threshold of explosion damage necessary before the mine is disarmed. Meet or beat.
	//var/blast_hardening = 0 //This is additional threshold, but also pseudohealth. Repeated explosions will eventually reduce it to the base blast_tolerance. Not yet implemented.

/obj/item/explosive/mine/Initialize()
	. = ..()
	if(map_deployed)
		deploy_mine(null)

/obj/item/explosive/mine/Destroy()
	QDEL_NULL(tripwire)
	. = ..()

/obj/item/explosive/mine/ex_act(severity)
	if(severity >= blast_tolerance)
		prime()

/obj/item/explosive/mine/emp_act()
	. = ..()
	disarm() //breaks the thing instead of exploding it.


//checks for things that would prevent us from placing the mine.
/obj/item/explosive/mine/proc/check_for_obstacles(mob/living/user)
	if(locate(/obj/item/explosive/mine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return TRUE
	if(user.loc && (user.loc.density || locate(/obj/structure/fence) in user.loc))
		to_chat(user, SPAN_WARNING("You can't plant a mine here."))
		return TRUE
	if(SSinterior.in_interior(user))
		to_chat(user, SPAN_WARNING("It's too cramped in here to deploy \a [src]."))
		return TRUE



//Arming
/obj/item/explosive/mine/attack_self(mob/living/user)
	if(!..())
		return

	if(check_for_obstacles(user))
		return

	if(active || user.action_busy)
		return

	if(antigrief_protection && user.faction == FACTION_MARINE && explosive_antigrief_check(src, user))
		to_chat(user, SPAN_WARNING("\The [name]'s safe-area accident inhibitor prevents you from planting!"))
		msg_admin_niche("[key_name(user)] attempted to plant \a [name] in [get_area(src)] [ADMIN_JMP(src.loc)]")
		return

	user.visible_message(SPAN_NOTICE("[user] starts deploying the [src]."),
		SPAN_NOTICE("You start deploying the [src]."))
	if(!do_after(user, 40, INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
		user.visible_message(SPAN_NOTICE("[user] stops deploying the [src]."), \
			SPAN_NOTICE("You stop deploying \the [src]."))
		return

	if(active)
		return

	if(check_for_obstacles(user))
		return

	user.visible_message(SPAN_NOTICE("[user] finishes deploying the [src]."), \
		SPAN_NOTICE("You finish deploying the [src]."))

	deploy_mine(user)

/obj/item/explosive/mine/proc/deploy_mine(mob/user)
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	anchored = TRUE
	playsound(loc, 'sound/weapons/mine_armed.ogg', 25, 1)
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()


//Disarming
/obj/item/explosive/mine/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL))
		if(active)
			if(user.action_busy)
				return
			if(user.faction == iff_signal)
				user.visible_message(SPAN_NOTICE("[user] starts deactivating the [src]."), \
				SPAN_NOTICE("You start deactivating [src]."))
			else
				user.visible_message(SPAN_NOTICE("[user] starts attempting to disarm \the [src], while being careful to not set it off."), \
				SPAN_NOTICE("You start disarming the [src], handling it with care."))
			//handles custom skill dependent disarm chances.
			var/disarm_time = base_disarm_time
			var/disarm_fail_chance = base_disarm_fail_chance
			if(user.skills)
				if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_MASTER))
					to_chat(user, SPAN_WARNING("Intelligent landmine, Claymore, M20. You pick out the right procedure and do it in seconds."))
					disarm_time = 10
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_ENGI))
					to_chat(user, SPAN_WARNING("You quickly and efficiently set to work disarming the [src]."))
					disarm_time = 20
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_TRAINED))
					to_chat(user, SPAN_WARNING("You take stock. It's just like training. The LIDAR sensors are what you need to start with..."))
					disarm_time = 30
					disarm_fail_chance = 0

				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_NOVICE))
					to_chat(user, SPAN_WARNING("The manuals had a lot to say about the M20, but not much about how to disarm them, other than staying out of the front arc."))
					disarm_time = 40
					disarm_fail_chance = 20
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_UNTRAINED))
					to_chat(user, SPAN_WARNING("You aren't trained in demining... This might be tricky."))
					disarm_time = 50
					disarm_fail_chance = 80

			if(!do_after(user, disarm_time, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops disarming the [src]."), \
					SPAN_WARNING("You stop disarming the [src]."))
				return
			if(user.faction != iff_signal) //ow!
				if(prob(disarm_fail_chance))
					triggered = TRUE
					if(tripwire)
						var/direction = GLOB.reverse_dir[src.dir]
						var/step_direction = get_step(src, direction)
						tripwire.forceMove(step_direction)
					prime()
			if(!active)//someone beat us to it
				return
			user.visible_message(SPAN_NOTICE("[user] finishes disarming the [src]."), \
			SPAN_NOTICE("You finish disarming the [src]."))
			disarm()

	else
		return ..()

/obj/item/explosive/mine/proc/disarm()
	if(customizable)
		activate_sensors()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	update_icon()
	QDEL_NULL(tripwire)

/obj/item/explosive/mine/activate_sensors()
	if(active)
		return

	if(!customizable && has_tripwire == TRUE)
		set_tripwire()
		return;

	if(!detonator)
		active = TRUE
		return

	if(customizable && assembly_stage == ASSEMBLY_LOCKED)
		if(isigniter(detonator.a_right) && isigniter(detonator.a_left))
			set_tripwire()
			use_dir = TRUE
			return
		else
			..()
			use_dir = FALSE // Claymore defaults to radial in these case. Poor man C4
			triggered = TRUE // Delegating the tripwire/crossed function to the sensor.


/obj/item/explosive/mine/proc/set_tripwire()
	if(!active && !tripwire && has_tripwire == TRUE)
		var/tripwire_loc = get_turf(get_step(loc, dir))
		tripwire = new(tripwire_loc)
		tripwire.linked_claymore = src
		active = TRUE


//Mine can also be triggered if you "cross right in front of it" (same tile)
/obj/item/explosive/mine/Crossed(atom/A)
	..()
	if(isliving(A))
		var/mob/living/L = A
		if(!L.stat == DEAD)//so dragged corpses don't trigger mines.
			return
		else
			try_to_prime(A)

/obj/item/explosive/mine/Collided(atom/movable/AM)
	try_to_prime(AM)


/obj/item/explosive/mine/proc/try_to_prime(mob/living/L)
	if(!active || triggered || (customizable && !detonator))
		return
	if(!istype(L))
		return
	if(L.stat == DEAD)
		return
	if(L.get_target_lock(iff_signal))
		return
	if(HAS_TRAIT(L, TRAIT_ABILITY_BURROWED))
		return
	L.visible_message(SPAN_DANGER("[icon2html(src, viewers(src))] The [name] clicks as [L] triggers it!"), \
	SPAN_DANGER("[icon2html(src, L)] The [name] clicks as you trigger it!"), \
	SPAN_DANGER("You hear a click."))

	triggered = TRUE
	playsound(loc, 'sound/weapons/mine_tripped.ogg', 25, 1)
	prime()



//Note : May not be actual explosion depending on linked method
/obj/item/explosive/mine/prime()
	set waitfor = 0

	if(!customizable)
		create_shrapnel(loc, 12, dir, angle, , cause_data)
		cell_explosion(loc, 60, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, cause_data)
		qdel(src)
	else
		. = ..()
		if(!QDELETED(src))
			disarm()


/obj/item/explosive/mine/attack_alien(mob/living/carbon/xenomorph/M)
	if(triggered) //Mine is already set to go off
		return XENO_NO_DELAY_ACTION

	if(M.a_intent == INTENT_HELP)
		to_chat(M, SPAN_XENONOTICE("If you hit this hard enough, it would probably explode."))
		return XENO_NO_DELAY_ACTION

	M.animation_attack_on(src)
	M.visible_message(SPAN_DANGER("[M] has slashed [src]!"), \
		SPAN_DANGER("You slash [src]!"))
	playsound(loc, 'sound/weapons/slice.ogg', 25, 1)

	//We move the tripwire randomly in either of the four cardinal directions
	triggered = TRUE
	if(tripwire)
		var/direction = pick(GLOB.cardinals)
		var/step_direction = get_step(src, direction)
		tripwire.forceMove(step_direction)
	prime()
	if(!QDELETED(src))
		disarm()
	return XENO_ATTACK_ACTION

/obj/item/explosive/mine/flamer_fire_act(damage, flame_cause_data) //adding mine explosions
	cause_data = flame_cause_data
	disarm()//insensitive explosives. but it destroys the electronics.


/obj/effect/mine_tripwire
	name = "claymore tripwire"
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	invisibility = 101
	unacidable = TRUE //You never know
	var/obj/item/explosive/mine/linked_claymore

/obj/effect/mine_tripwire/Destroy()
	if(linked_claymore)
		if(linked_claymore.tripwire == src)
			linked_claymore.tripwire = null
		linked_claymore = null
	. = ..()

//immune to explosions.
/obj/effect/mine_tripwire/ex_act(severity)
	return

/obj/effect/mine_tripwire/Crossed(atom/movable/AM)
	if(!linked_claymore)
		qdel(src)
		return

	if(linked_claymore.triggered) //Mine is already set to go off
		return

	if(linked_claymore)
		linked_claymore.try_to_prime(AM)

/obj/item/explosive/mine/active
	icon_state = "m20_active"
	base_icon_state = "m20"
	map_deployed = TRUE

/obj/item/explosive/mine/no_iff
	iff_signal = null

/obj/item/explosive/mine/active/no_iff
	iff_signal = null


/obj/item/explosive/mine/pmc
	name = "\improper M20P Claymore anti-personnel mine"
	desc = "The M20P Claymore is a directional proximity triggered anti-personnel mine designed by Armat Systems for use by the United States Colonial Marines. It has been modified for use by the Wey-Yu PMC forces."
	icon_state = "m20p"
	iff_signal = FACTION_PMC
	hard_iff_lock = TRUE

/obj/item/explosive/mine/pmc/active
	icon_state = "m20p_active"
	base_icon_state = "m20p"
	map_deployed = TRUE

/obj/item/explosive/mine/custom
	name = "custom mine"
	desc = "A custom chemical mine built from an M20 casing."
	icon_state = "m20_custom"
	customizable = TRUE
	matter = list("metal" = 3750)
	has_blast_wave_dampener = TRUE


/obj/item/explosive/mine/m760ap
	name = "M760 antipersonnel landmine"
	desc = "A standard issue American antipersonnel landmine. Minimum metal and blast-resistant, with integrated anti-tamper features. Due to counter-demining design, it contains little primary fragmentation liner."
	icon_state = "m760"
	angle = 360
	var/disarmed = FALSE
	var/explosion_power = 300
	var/explosion_falloff = 100
	base_disarm_fail_chance = 70
	base_disarm_time = 40
	has_tripwire = FALSE
	blast_tolerance = 85 //A C4 directly next to it will disarm the mine. Mostly for giving an option for disarming it.

/obj/item/explosive/mine/m760ap/check_for_obstacles(mob/living/user)
	return FALSE

/obj/item/explosive/mine/m760ap/attackby(obj/item/W, mob/user)
	return

/obj/item/explosive/mine/m760ap/prime(mob/user)
	set waitfor = 0
	if(!cause_data)
		cause_data = create_cause_data(initial(name), user)
	cell_explosion(loc, explosion_power, explosion_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, CARDINAL_ALL_DIRS, cause_data)
	playsound(loc, 'sound/weapons/mine_tripped.ogg', 45)
	qdel(src)

/obj/item/explosive/mine/m760ap/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL))
		if(active)
			if(user.action_busy)
				return
			if(user.faction == iff_signal)
				user.visible_message(SPAN_NOTICE("[user] starts unearthing and deactivating the [src]."), \
				SPAN_NOTICE("You start unearthing and deactivating the [src]."))
			else
				user.visible_message(SPAN_NOTICE("[user] starts attempting to disarm \the [src], while being careful to not set it off."), \
				SPAN_NOTICE("You start disarming [src], handling it with care."))
			//handles custom skill dependent disarm chances.
			var/disarm_time = base_disarm_time
			var/disarm_fail_chance = base_disarm_fail_chance
			if(user.skills) //in reverse order. do not make the oldest if/else tree mistake in the book like I did.
				if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_MASTER))
					to_chat(user, SPAN_WARNING("Landmine, M760. Antitamper can be defeated like so... And its fuze can be broken like this."))
					disarm_time = 20
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_ENGI))
					to_chat(user, SPAN_WARNING("You've done this a thousand times. It doesn't get any easier, but at least you've gotten faster."))
					disarm_time = 30
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_TRAINED))
					to_chat(user, SPAN_WARNING("You take a moment to remember the manual for handling the M760, before setting to work."))
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_NOVICE))
					to_chat(user, SPAN_WARNING("Even with the diagrams the M760 was painful to disarm in training. Careful..."))
					disarm_time = 50
					disarm_fail_chance = 20
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_UNTRAINED))
					to_chat(user, SPAN_WARNING("You aren't trained in demining... This is almost impossible."))
					disarm_time = 60
					disarm_fail_chance = 80

			if(!do_after(user, disarm_time, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops disarming the [src]."), \
					SPAN_WARNING("You stop disarming the [src]."))
				return
			if(user.faction != iff_signal) //ow!
				if(prob(disarm_fail_chance))
					triggered = TRUE
					if(tripwire)
						var/direction = GLOB.reverse_dir[src.dir]
						var/step_direction = get_step(src, direction)
						tripwire.forceMove(step_direction)
					prime()
			if(!active)//someone beat us to it
				return
			user.visible_message(SPAN_NOTICE("[user] finishes disarming the [src]."), \
			SPAN_NOTICE("You finish disarming the [src]."))
			disarm()

	else
		return ..()

/obj/item/explosive/mine/m760ap/disarm()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	QDEL_NULL(tripwire)
	disarmed = TRUE
	add_to_garbage(src)

/obj/item/explosive/mine/m760ap/attack_self(mob/living/user)
	if(disarmed)
		return
	. = ..()

/obj/item/explosive/mine/m760ap/deploy_mine(mob/user)
	if(disarmed)
		return
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()
	for(var/mob/living/carbon/mob in range(1, src))
		src.try_to_prime(mob)

/obj/item/explosive/mine/m760ap/attack_alien()
	if(disarmed)
		..()
	else
		return


/obj/item/explosive/mine/m5a3betty
	name = "M5A3 bounding mine"
	desc = "An intelligent blast-resistant bounding landmine with enhanced fragmentation."
	icon_state = "m5"
	angle = 360
	var/disarmed = FALSE
	var/explosion_power = 175
	var/explosion_falloff = 75
	base_disarm_time = 60 //innately sensitive...
	base_disarm_fail_chance = 30 //...but lacks robust anti-tamper implementation.
	blast_tolerance = 25 //Even at its furthest point, C4 will disarm the mine. Gives some form of counterplay.
	has_tripwire = TRUE

/obj/item/explosive/mine/m5a3betty/check_for_obstacles(mob/living/user)
	return FALSE

/obj/item/explosive/mine/m5a3betty/attackby(obj/item/W, mob/user)
	return

/obj/item/explosive/mine/m5a3betty/prime(mob/user)
	set waitfor = 0
	if(!cause_data)
		cause_data = create_cause_data(initial(name), user)
	create_shrapnel(loc, 72, dir, 360, /datum/ammo/bullet/shrapnel/landmine/bounding, cause_data)
	cell_explosion(loc, explosion_power, explosion_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, CARDINAL_ALL_DIRS, cause_data)
	playsound(loc, 'sound/weapons/mine_tripped.ogg', 45)
	qdel(src)

/obj/item/explosive/mine/m5a3betty/attackby(obj/item/W, mob/user)//technically this won't matter due to the omnidirectional tripwire.
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL))
		if(active)
			if(user.action_busy)
				return
			if(user.faction == iff_signal)
				user.visible_message(SPAN_NOTICE("[user] starts unearthing and deactivating [src]."), \
				SPAN_NOTICE("You start unearthing and deactivating [src]."))
			else
				user.visible_message(SPAN_NOTICE("[user] starts attempting to disarm \the [src], while being careful to not set it off."), \
				SPAN_NOTICE("You start disarming [src], handling it with care."))
			//handles custom skill dependent disarm chances.
			var/disarm_time = base_disarm_time
			var/disarm_fail_chance = base_disarm_fail_chance
			if(user.skills)
				if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_MASTER))
					to_chat(user, SPAN_WARNING("Landmine, M5A3. Trivial to break."))
					disarm_time = 20
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_ENGI))
					to_chat(user, SPAN_WARNING("This shouldn't be too hard. The M5A3's actually pretty easy to disarm, to your experience."))
					disarm_time = 40
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_TRAINED))
					to_chat(user, SPAN_WARNING("Spoof the sensor like so, and start work on the mechanism. You've got this."))
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_NOVICE))
					to_chat(user, SPAN_WARNING("You examine the mine and remember how sensitive even training versions were. Following procedure, you start disarming the [src]."))
					disarm_fail_chance = 15
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_UNTRAINED))
					to_chat(user, SPAN_WARNING("You ignore the lingering sense of dread and start tinkering with the landmine."))
					disarm_fail_chance = 60

			if(!do_after(user, disarm_time, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops disarming [src]."), \
					SPAN_WARNING("You stop disarming [src]."))
				return
			if(user.faction != iff_signal) //ow!
				if(prob(disarm_fail_chance))
					triggered = TRUE
					if(tripwire)
						var/direction = GLOB.reverse_dir[src.dir]
						var/step_direction = get_step(src, direction)
						tripwire.forceMove(step_direction)
					prime()
			if(!active)//someone beat us to it
				return
			user.visible_message(SPAN_NOTICE("[user] finishes disarming [src]."), \
			SPAN_NOTICE("You finish disarming [src]."))
			disarm()


/obj/item/explosive/mine/m5a3betty/disarm()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	QDEL_NULL(tripwire)
	disarmed = TRUE
	add_to_garbage(src)

/obj/item/explosive/mine/m5a3betty/attack_self(mob/living/user)
	if(disarmed)
		return
	. = ..()

/obj/item/explosive/mine/m5a3betty/deploy_mine(mob/user)
	if(disarmed)
		return
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()
	for(var/mob/living/carbon/mob in range(1, src))
		src.try_to_prime(mob)

/obj/item/explosive/mine/m5a3betty/attack_alien()
	if(disarmed)
		..()
	else
		return

/obj/item/explosive/mine/fzd91
	name = "FZD-91 Landmine"
	desc = "Regular issue area denial landmine for Union of Progressive Peoples' forces in the field. Powerful, with a strong fragmentation liner. Produced by Gruppo Meccanico Militare Vasella."
	icon_state = "fzd91"
	angle = 360
	var/disarmed = FALSE
	var/explosion_power = 250
	var/explosion_falloff = 125
	base_disarm_time = 45
	base_disarm_fail_chance = 50
	blast_tolerance = 95 //Will require a C4 directly on top of it...!
	has_tripwire = FALSE

/obj/item/explosive/mine/fzd91/check_for_obstacles(mob/living/user)
	return FALSE

/obj/item/explosive/mine/fzd91/attackby(obj/item/W, mob/user)
	return

/obj/item/explosive/mine/fzd91/prime(mob/user)
	set waitfor = 0
	if(!cause_data)
		cause_data = create_cause_data(initial(name), user)
	create_shrapnel(loc, 36, dir, 360, /datum/ammo/bullet/shrapnel/landmine, cause_data)
	cell_explosion(loc, explosion_power, explosion_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, CARDINAL_ALL_DIRS, cause_data)
	playsound(loc, 'sound/weapons/mine_tripped.ogg', 45)
	qdel(src)

/obj/item/explosive/mine/fzd91/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL))
		if(active)
			if(user.action_busy)
				return
			if(user.faction == iff_signal)
				user.visible_message(SPAN_NOTICE("[user] starts unearthing and deactivating [src]."), \
				SPAN_NOTICE("You start unearthing and deactivating [src]."))
			else
				user.visible_message(SPAN_NOTICE("[user] starts attempting to disarm \the [src], while being careful to not set it off."), \
				SPAN_NOTICE("You start disarming [src], handling it with care."))
			//handles custom skill dependent disarm chances.
			var/disarm_time = base_disarm_time
			var/disarm_fail_chance = base_disarm_fail_chance
			if(user.skills)
				if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_MASTER))
					to_chat(user, SPAN_WARNING("The FZD-91 is tamper resistant but its anti-handling features are outdated. You can make short work of it."))
					disarm_time = 25
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_ENGI))
					to_chat(user, SPAN_WARNING("Could be worse. Could be a lot worse, honestly. You start rapidly disarming and making safe the landmine."))
					disarm_time = 35
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_TRAINED))
					to_chat(user, SPAN_WARNING("You examine the [src] for a moment. It's an FZD-91, not the hardest nut to crack."))
					disarm_fail_chance = 0
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_NOVICE))
					to_chat(user, SPAN_WARNING("You examine the mine. It's Union issue for sure. With some caution, you begin disarming the [src]."))
					disarm_fail_chance = 15
				else if(skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_UNTRAINED))
					to_chat(user, SPAN_WARNING("It looks just like how they do on TV. Hopefully you have better luck than the stuntmen..."))

			if(!do_after(user, disarm_time, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops disarming [src]."), \
					SPAN_WARNING("You stop disarming [src]."))
				return
			if(user.faction != iff_signal) //ow!
				if(prob(disarm_fail_chance))
					triggered = TRUE
					if(tripwire)
						var/direction = GLOB.reverse_dir[src.dir]
						var/step_direction = get_step(src, direction)
						tripwire.forceMove(step_direction)
					prime()
			if(!active)//someone beat us to it
				return
			user.visible_message(SPAN_NOTICE("[user] finishes disarming [src]."), \
			SPAN_NOTICE("You finish disarming [src]."))
			disarm()

/obj/item/explosive/mine/fzd91/disarm()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	QDEL_NULL(tripwire)
	disarmed = TRUE
	add_to_garbage(src)

/obj/item/explosive/mine/fzd91/attack_self(mob/living/user)
	if(disarmed)
		return
	. = ..()

/obj/item/explosive/mine/fzd91/deploy_mine(mob/user)
	if(disarmed)
		return
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()
	for(var/mob/living/carbon/mob in range(1, src))
		src.try_to_prime(mob)

/obj/item/explosive/mine/fzd91/attack_alien()
	if(disarmed)
		..()
	else
		return


/obj/item/explosive/mine/tn13
	name = "TN-13"
	desc = "A somewhat basic landmine. It has no intelligent or electronic components, but is easily disarmed. Formerly produced by the Oberon Mechanical Concern's military ordinance division. While not in use anymore, vast stockpiles still exist."
	icon_state = "tn13"
	angle = 360
	var/disarmed = FALSE
	var/explosion_power = 75
	var/explosion_falloff = 25
	blast_tolerance = 0 //always goes off.
	has_tripwire = FALSE

/obj/item/explosive/mine/tn13/check_for_obstacles(mob/living/user)
	return FALSE

/obj/item/explosive/mine/tn13/attackby(obj/item/W, mob/user)
	return

/obj/item/explosive/mine/tn13/prime(mob/user)
	set waitfor = 0
	if(!cause_data)
		cause_data = create_cause_data(initial(name), user)
	create_shrapnel(loc, 36, dir, 360, /datum/ammo/bullet/shrapnel/landmine/light, cause_data)
	cell_explosion(loc, explosion_power, explosion_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, CARDINAL_ALL_DIRS, cause_data)
	playsound(loc, 'sound/weapons/mine_tripped.ogg', 45)
	qdel(src)

/obj/item/explosive/mine/tn13/disarm()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	QDEL_NULL(tripwire)
	disarmed = TRUE
	add_to_garbage(src)

/obj/item/explosive/mine/tn13/attack_self(mob/living/user)
	if(disarmed)
		return
	. = ..()

/obj/item/explosive/mine/tn13/deploy_mine(mob/user)
	if(disarmed)
		return
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()
	for(var/mob/living/carbon/mob in range(1, src))
		src.try_to_prime(mob)

/obj/item/explosive/mine/tn13/attack_alien()
	if(disarmed)
		..()
	else
		return

//guaranteed disarming.
/obj/item/explosive/mine/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL))
		if(active)
			if(user.action_busy)
				return
			if(user.faction == iff_signal)
				user.visible_message(SPAN_NOTICE("[user] starts disarming [src]."), \
				SPAN_NOTICE("You start disarming [src]."))
			else
				user.visible_message(SPAN_NOTICE("[user] starts working with \the [src], trying to disarm it."), \
				SPAN_NOTICE("You start disarming [src], opening the case with care."))
			if(!do_after(user, 30, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops disarming [src]."), \
					SPAN_WARNING("You stop disarming [src]."))
				return
			if(!active)//someone beat us to it
				return
			user.visible_message(SPAN_NOTICE("[user] finishes disarming [src]. Whew."), \
			SPAN_NOTICE("You finish disarming [src]."))
			disarm()

	else
		return ..()


/obj/item/explosive/mine/sharp
	name = "\improper XM9 SHARP explosive dart"
	desc = "An experimental XM9 SHARP proximity mine designed by Armat Systems for use in the SHARP rifle. A series of passive IR sensors give it coverage in a 360 perimeter once embedded into the ground."
	icon_state = "sonicharpoon_g"
	angle = 360
	var/disarmed = FALSE
	var/explosion_size = 200
	var/explosion_falloff = 100

/obj/item/explosive/mine/sharp/check_for_obstacles(mob/living/user)
	return FALSE

/obj/item/explosive/mine/sharp/attackby(obj/item/W, mob/user)
	return

/obj/item/explosive/mine/sharp/set_tripwire()
	if(!active && !tripwire)
		for(var/direction in CARDINAL_ALL_DIRS)
			var/tripwire_loc = get_turf(get_step(loc,direction))
			tripwire = new(tripwire_loc)
			tripwire.linked_claymore = src
			active = TRUE

/obj/item/explosive/mine/sharp/prime(mob/user)
	set waitfor = 0
	if(!cause_data)
		cause_data = create_cause_data(initial(name), user)
	cell_explosion(loc, explosion_size, explosion_falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, CARDINAL_ALL_DIRS, cause_data)
	playsound(loc, 'sound/weapons/gun_sharp_explode.ogg', 45)
	qdel(src)

/obj/item/explosive/mine/sharp/disarm()
	anchored = FALSE
	active = FALSE
	triggered = FALSE
	icon_state = base_icon_state + "_disarmed"
	QDEL_NULL(tripwire)
	disarmed = TRUE
	add_to_garbage(src)

/obj/item/explosive/mine/sharp/attack_self(mob/living/user)
	if(disarmed)
		return
	. = ..()

/obj/item/explosive/mine/sharp/deploy_mine(mob/user)
	if(disarmed)
		return
	if(!hard_iff_lock && user)
		iff_signal = user.faction

	cause_data = create_cause_data(initial(name), user)
	if(user)
		user.drop_inv_item_on_ground(src)
	setDir(user ? user.dir : dir) //The direction it is planted in is the direction the user faces at that time
	activate_sensors()
	update_icon()
	for(var/mob/living/carbon/mob in range(1, src))
		src.try_to_prime(mob)

/obj/item/explosive/mine/sharp/attack_alien()
	if(disarmed)
		..()
	else
		return
/obj/item/explosive/mine/sebb
	name = "\improper G2 Electroshock grenade"
	icon_state = "grenade_sebb_planted"
	desc = "A G2 electroshock grenade planted as a landmine."
	pixel_y = -5
	anchored = TRUE // this is supposed to be planeted already when spawned

/obj/item/explosive/mine/sebb/disarm()
	. = ..()
	new /obj/item/explosive/grenade/sebb(get_turf(src))
	qdel(src)

/obj/item/explosive/mine/sebb/prime()
	new /obj/item/explosive/grenade/sebb/primed(get_turf(src))
	qdel(src)

/obj/item/explosive/mine/sebb/active
	icon_state = "grenade_sebb_planted_active"
	base_icon_state = "grenade_sebb"
	map_deployed = TRUE
