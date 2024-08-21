// SCANNER //

/obj/item/drg/scanner
	name = "field scanner"
	desc = "Device, used for scanning surrounding terrain."
	icon = 'void-marines/icons/drg_tools.dmi'
	icon_state = "scanner"

	var/list/search_categories = list("allied humans", "allied robots", "marked creature", "mission objective")
	var/was_used = FALSE
	var/cooldown = 20 SECONDS
	var/scanning_range = 35
	w_class = SIZE_MEDIUM

/obj/item/drg/scanner/afterattack(atom/A, mob/user as mob, proximity)
	if(get_dist(src, A) > 1)
		return FALSE

	if(istype(A, /obj))
		var/obj/target = A
		to_chat(user, SPAN_PURPLE("[target.lore]"))

/obj/item/drg/scanner/proc/recharge()
	was_used = FALSE

/obj/item/drg/scanner/attack_self(mob/user)
	SHOULD_CALL_PARENT(FALSE)
	if(was_used)
		to_chat(user, SPAN_DANGER("[src] still on cooldown!"))
		return FALSE
	var/options = tgui_input_list(user, "Choose wanted option!", "Scanning", search_categories)
	if(!options)
		return FALSE
	switch(options)

		if("allied humans")
			var/list/humans_in_range = list()
			var/list/closest = list()

			for(var/mob/living/target in orange(scanning_range, user))
				if(target.faction == user.faction && target.stat != DEAD)
					humans_in_range += target
				if(!humans_in_range.len)
					to_chat(user, SPAN_ORANGE("There is NO humans in your range!"))
					return TRUE
				to_chat(user, SPAN_GREEN("There is [humans_in_range.len] humans in your range!"))

			for(var/mob/living/target in humans_in_range)
				if(get_dist(target, user) <= 8)
					closest += target
				if(!closest.len)
					humans_in_range.Cut()
					return TRUE
				var/mob/living/simple_animal/hostile/drg/someone = pick(closest)
				to_chat(user, SPAN_GREEN("And [someone] is mostly close to you! Located on [someone.x] by X and [someone.y] by Y. (Yours coordinates is [user.x]-X and [user.y]-Y)"))
				humans_in_range.Cut()
				closest.Cut()
				was_used = TRUE
				addtimer(CALLBACK(src, PROC_REF(recharge)), cooldown)
				return TRUE

		if("allied robots")
			var/list/robots_in_range = list()
			var/list/closest = list()

			for(var/mob/living/simple_animal/hostile/drg/target in orange(scanning_range, user))
				if(target.faction == user.faction && target.stat != DEAD)
					robots_in_range += target
				if(!robots_in_range.len)
					to_chat(user, SPAN_ORANGE("There is NO active units in your range!"))
					return TRUE
				to_chat(user, SPAN_GREEN("There is atleast [robots_in_range.len] active units in your range!"))

			for(var/mob/living/simple_animal/hostile/drg/target in robots_in_range)
				if(get_dist(target, user) <= 8)
					closest += target
				if(!closest.len)
					robots_in_range.Cut()
					return TRUE
				var/mob/living/simple_animal/hostile/drg/someone = pick(closest)
				to_chat(user, SPAN_GREEN("And [someone] is mostly close to you! Located on [someone.x] by X and [someone.y] by Y. (Yours coordinates is [user.x]-X and [user.y]-Y)"))
				robots_in_range.Cut()
				closest.Cut()
				was_used = TRUE
				addtimer(CALLBACK(src, PROC_REF(recharge)), cooldown)
				return TRUE

		if("marked creature")
			var/list/creatures_to_find = list()

			for(var/mob/living/target in orange(scanning_range, user))
				if(target.marked_creature)
					creatures_to_find += target

			if(!creatures_to_find.len)
				to_chat(user, SPAN_ORANGE("There is NO targets in your range!"))
				return FALSE
			var/mob/living/main_interest = tgui_input_list(usr, "Choose your target!", "Creature Search", creatures_to_find)
			if(!main_interest)
				return FALSE
			var/distance = get_dist(main_interest, user)
			to_chat(user, SPAN_GREEN("Your choosed target currently at [main_interest.x]-X and [main_interest.y]-Y, which is [distance] meters from your location!"))
			creatures_to_find.Cut()
			was_used = TRUE
			addtimer(CALLBACK(src, PROC_REF(recharge)), cooldown)
			return TRUE

		if("mission objective")
			to_chat(user, SPAN_DANGER("CAN'T ACCESS THIS TOPIC RIGHT NOW"))
			return FALSE

// WRENCH //

/obj/item/weapon/drg/wrench
	name = "combat wrench"
	desc = "An utility weapon, used by DRG miners to fix various things."
	icon = 'void-marines/icons/drg_tools.dmi'
	icon_state = "fixing_wrench"
	w_class = SIZE_MEDIUM

/obj/item/weapon/drg/wrench/afterattack(atom/A, mob/user as mob, proximity)
	if(get_dist(src, A) > 1)
		return FALSE

	if(istype(A, /mob/living/simple_animal/hostile/drg))
		var/mob/living/simple_animal/hostile/drg/robo_friend = A
		if(robo_friend.damaged)
			playsound(src.loc, 'void-marines/sound/drg/fixing.wav', 25, 1)
			if(do_after(user, 10 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
				src.visible_message(SPAN_GREEN("[user] screwed some bolts on [robo_friend], making it move once again."),
				SPAN_NOTICE("You hot-fixed [robo_friend] external damage."))
				robo_friend.damaged = FALSE
				robo_friend.anchored = FALSE
				robo_friend.next_move_slowdown = 0
				robo_friend.icon_state = "[robo_friend.base_robot_icon]"
				return TRUE
		to_chat(user, SPAN_DANGER("[robo_friend] in a pretty good shape already! There is no need in additional repairs!"))
		return FALSE

// PICKAXE //

/obj/item/weapon/drg/pickaxe
	name = "combat pickaxe"
	desc = "An utility weapon, used by DRG miners not only to dig minerals, but also protect themselves."
	icon = 'void-marines/icons/drg_tools.dmi'
	icon_state = "drg_pickaxe"
	force = 85
	var/charges = 1 //do we have any charged hits?
	var/recharge_time = 20 SECONDS //how long it takes after charged hit to refill energy
	var/in_charged_state = FALSE //are we ready to make a blow?
	w_class = SIZE_MEDIUM

/obj/item/weapon/drg/pickaxe/Initialize()
	SHOULD_CALL_PARENT(FALSE)
	START_PROCESSING(SSobj, src)

/obj/item/weapon/drg/pickaxe/update_icon()
	if(in_charged_state)
		icon_state = "drg_pickaxe_charged"
	if(!in_charged_state || charges <= 0)
		icon_state = "drg_pickaxe"

/obj/item/weapon/drg/pickaxe/process()
	if(in_charged_state)
		force = 190
		update_icon()
	if(!in_charged_state || charges <= 0)
		force = 85
		update_icon()

/obj/item/weapon/drg/pickaxe/attack_self(mob/user)
	SHOULD_CALL_PARENT(FALSE)
	if(in_charged_state)
		to_chat(user, SPAN_DANGER("You cancelled [src] charged hit!"))
		in_charged_state = FALSE
		return TRUE
	if(charges <= 0)
		to_chat(user, SPAN_DANGER("[src] isn't recharged yet!"))
		return FALSE
	in_charged_state = TRUE
	to_chat(user, SPAN_PURPLE("You prepared [src] for a charged hit!"))

/obj/item/weapon/drg/pickaxe/proc/add_charge()
	charges++

/obj/item/weapon/drg/pickaxe/proc/change_mode() //ffs remove this
	in_charged_state = FALSE

/obj/item/weapon/drg/pickaxe/attack(mob/M, mob/user)
	if(in_charged_state)
		charges -= 1
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(5, 1, M.loc)
		s.start()
		playsound(loc, 'sound/weapons/Egloves.ogg', 25, 1, 6)
		addtimer(CALLBACK(src, PROC_REF(change_mode)), 2 SECONDS) //THIS IS THE BEST DECISION I COULD MADE, BUT ALSO THE WORST AT THE SAME TIME - PLEASE FIND BETTER WAY
		addtimer(CALLBACK(src, PROC_REF(add_charge)), recharge_time)
	..()

// GRENADES //

/obj/structure/drg/decoy
	desc = "Just an hologram, enough to distract primitive creatures or a very hungry to women mens."
	name = "decoy"
	icon = 'void-marines/icons/holograms.dmi'
	icon_state = "type2"
	var/work_duration = 1

/obj/structure/drg/decoy/Initialize()
	SHOULD_CALL_PARENT(FALSE)
	addtimer(CALLBACK(src, PROC_REF(disappear)), 10 SECONDS)

	AddComponent(/datum/component/ai_behavior_override/attack)
	var/datum/component/ai_behavior_override/override = datum_components[/datum/component/ai_behavior_override/attack]
	override.max_assigned = INFINITY

/obj/structure/drg/decoy/proc/disappear()
	animate(work_duration, alpha = 0)
	QDEL_IN(src, 6 SECONDS)

/obj/item/explosive/grenade/drg_decoy
	desc = "It is set to detonate in 5 seconds. It will display some random hologram, enough to distract primitive creatures or a very hungry to women mens."
	name = "decoy grenade"
	icon_state = "flashbang2"
	item_state = "flashbang"

/obj/item/explosive/grenade/drg_decoy/prime() // Prime now just handles the two loops that query for people in lockers and people who can see it.

	var/turf/T = get_turf(src)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
	for(var/mob/living/carbon/human/M in viewers(T, null))
		M.flash_eyes(EYE_PROTECTION_FLASH, TRUE)

	var/atom/movable/x = new /obj/structure/drg/decoy
	x.forceMove(T)

	qdel(src)
	return
