#define FACTION_DRG "Deep Rock Galactic"

/area/drg
	name = "Deep Caves"
	icon = 'icons/turf/area_kutjevo.dmi'
	icon_state = "kutjevo"
	minimap_color = MINIMAP_AREA_ENGI

// ITEMS STARTING HERE //

/obj/item
	var/digging_buff = 0

/obj/item/drg/scanner
	name = "field scanner"
	desc = "Device, used for scanning surrounding terrain."
	icon = 'void-marines/icons/drg_tools.dmi'
	icon_state = "scanner"

	var/list/search_categories = list("allied humans", "allied robots", "minerals", "creatures", "mission objective")
	var/was_used = FALSE
	var/cooldown = 20 SECONDS
	var/scanning_range = 25
	w_class = SIZE_MEDIUM

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
					to_chat(user, SPAN_WARNING("There is NO humans in your range!"))
					return TRUE
				to_chat(user, SPAN_WARNING("There is [humans_in_range.len] humans in your range!"))
			for(var/mob/living/target in humans_in_range)
				if(get_dist(target, user) <= 8)
					closest += target
				if(!closest.len)
					humans_in_range.Cut()
					return TRUE
				var/someone = pick(closest)
				to_chat(user, SPAN_WARNING("And [someone] is mostly close to you!"))
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
					to_chat(user, SPAN_WARNING("There is NO active units in your range!"))
					return TRUE
				to_chat(user, SPAN_WARNING("There is atleast [robots_in_range.len] active units in your range!"))
			for(var/mob/living/simple_animal/hostile/drg/target in robots_in_range)
				if(get_dist(target, user) <= 8)
					closest += target
				if(!closest.len)
					robots_in_range.Cut()
					return TRUE
				var/someone = pick(closest)
				to_chat(user, SPAN_WARNING("And [someone] is mostly close to you!"))
				robots_in_range.Cut()
				closest.Cut()
				was_used = TRUE
				addtimer(CALLBACK(src, PROC_REF(recharge)), cooldown)
				return TRUE
		if("minerals")
			to_chat(user, SPAN_DANGER("CAN'T ACCESS THIS TOPIC RIGHT NOW"))
			return FALSE
		if("creatures")
			to_chat(user, SPAN_DANGER("CAN'T ACCESS THIS TOPIC RIGHT NOW"))
			return FALSE
		if("mission objective")
			to_chat(user, SPAN_DANGER("CAN'T ACCESS THIS TOPIC RIGHT NOW"))
			return FALSE

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
			if(do_after(user, 10 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
				playsound(src.loc, 'void-marines/sound/drg/fixing.wav', 25, 1)
				src.visible_message(SPAN_WARNING("[user] screwed some bolts on [robo_friend], making it move once again."),
				SPAN_NOTICE("You hot-fixed [robo_friend] external damage."))
				robo_friend.damaged = FALSE
				robo_friend.anchored = FALSE
				robo_friend.next_move_slowdown = 0
				robo_friend.icon_state = "[robo_friend.base_robot_icon]"
				return TRUE
		to_chat(user, SPAN_DANGER("[robo_friend] in a pretty good shape already! There is no need in additional repairs!"))
		return FALSE

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
	to_chat(user, SPAN_DANGER("You prepared [src] for a charged hit!"))

/obj/item/weapon/drg/pickaxe/proc/add_charge()
	charges++

/obj/item/weapon/drg/pickaxe/proc/change_mode() //ffs remove this
	in_charged_state = FALSE

/obj/item/weapon/drg/pickaxe/attack(mob/M, mob/user)
	if(in_charged_state)
		charges -= 1
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(5, 1, src.loc)
		s.start()
		playsound(loc, 'sound/weapons/Egloves.ogg', 25, 1, 6)
		addtimer(CALLBACK(src, PROC_REF(change_mode)), 2 SECONDS) //THIS IS THE BEST DECISION I COULD MADE, BUT ALSO THE WORST AT THE SAME TIME - PLEASE FIND BETTER WAY
		addtimer(CALLBACK(src, PROC_REF(add_charge)), recharge_time)
	..()

// ITEMS ENDING HERE //

// ROCKS START HERE //

/obj/structure/drg/land_crystals
	name = "land ore"
	desc = "Crystal rocks, growing from the floor, walls, and even from cave roof."
	icon = 'void-marines/icons/gray_crystal.dmi'
	icon_state = "crystal_stage1"
	density = TRUE
	opacity = FALSE
	anchored = TRUE

	//pretty same to rocks code
	var/list/allowed_instruments = list(/obj/item/weapon/drg/pickaxe) //what items can be used to dig it out
	var/have_minerals = FALSE //do we have anything tasty?
	var/mineral_drop = null //loot to drop

	var/stage = 1

	var/emmiter_range = 1
	var/emmiter_power = 0.1
	var/emmiter_color = "#ffffff"

/obj/structure/drg/land_crystals/Initialize()
	SHOULD_CALL_PARENT(FALSE)
	set_light(emmiter_range, emmiter_power, l_color = emmiter_color)
	icon_state = "crystal_stage[stage]"

/obj/structure/drg/land_crystals/update_icon()
	icon_state = "crystal_stage[stage]"

/obj/structure/drg/land_crystals/attackby(obj/item/W, mob/user, click_data)

	if(W.type in allowed_instruments)
		playsound(src.loc, 'sound/weapons/Genhit.ogg', 25, 1)
		if(do_after(user, 2 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			if(stage == 1)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
				SPAN_NOTICE("You destroyed some part of [src]."))
				stage = 2
				update_icon()
				return TRUE
			if(stage == 2)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
				SPAN_NOTICE("You destroyed some part of [src]. It's almost fully gone!"))
				stage = 3
				update_icon()
				return TRUE
			if(stage == 3)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[src] crumbles to dust."),
				SPAN_NOTICE("You dug through [src]."))
				qdel(src)
				return TRUE

//Literally all-cure pill
#define PROPERTY_OMNIPOTENT_NERFED "omninerf"

/datum/chem_property/special/omnipotent/nerfed
	name = PROPERTY_OMNIPOTENT_NERFED
	code = "OMN_NERF"
	description = "Mostly revitalizes all bodily functions."

/datum/chem_property/special/omnipotent/nerfed/process(mob/living/M, potency = 1, delta_time)
	M.reagents.remove_all_type(/datum/reagent/toxin, 2.5*REM * delta_time, 0, 1)
	M.setCloneLoss(-50)
	M.setOxyLoss(-50)
	M.heal_limb_damage(POTENCY_MULTIPLIER_MEDIUM * potency, POTENCY_MULTIPLIER_MEDIUM * potency)
	M.apply_damage(-POTENCY_MULTIPLIER_MEDIUM * potency, TOX)
	M.hallucination = 0
	M.setBrainLoss(-50)
	M.disabilities = 0
	M.sdisabilities = 0
	M.SetEyeBlur(0)
	M.SetEyeBlind(0)
	M.set_effect(0, WEAKEN)
	M.set_effect(0, STUN)
	M.set_effect(0, PARALYZE)
	M.silent = 0
	M.dizziness = 0
	M.drowsyness = 0
	M.stuttering = 0
	M.confused = 0
	M.sleeping = 0
	M.jitteriness = 0
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	for(var/datum/internal_organ/I in H.internal_organs)
		M.apply_internal_damage(-0.5 * potency * delta_time, I)

/datum/reagent/medical/red_sugar
	name = "Red sugar"
	id = "rsugar"
	description = "An shredded red sugar. Nothing else!"
	reagent_state = LIQUID
	color = "#C8A5DC" // rgb: 200, 165, 220
	chemclass = CHEM_CLASS_SPECIAL
	objective_value = OBJECTIVE_HIGH_VALUE
	properties = list(
		PROPERTY_NUTRITIOUS = 2,
		PROPERTY_OMNIPOTENT_NERFED = 2,
		PROPERTY_HEMOSTATIC = 2,
		PROPERTY_HEMOGENIC = 2
	)
	flags = REAGENT_TYPE_MEDICAL

/obj/structure/drg/land_crystals/sugar
	name = "red sugar crystal"
	desc = "Crystal rock, posessing strong regenerative abilities."

	color = "#e90505"

	emmiter_range = 3
	emmiter_power = 0.5
	emmiter_color = "#e90505"

/obj/structure/drg/land_crystals/sugar/attackby(obj/item/W, mob/user, click_data)

	if(W.type in allowed_instruments)
		playsound(src.loc, 'sound/weapons/Genhit.ogg', 25, 1)
		if(do_after(user, 2 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			if(stage == 1)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
				SPAN_NOTICE("You destroyed some part of [src]."))
				stage = 2
				update_icon()
				user.reagents.add_reagent("rsugar", 2)
				return TRUE
			if(stage == 2)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
				SPAN_NOTICE("You destroyed some part of [src]. It's almost fully gone!"))
				stage = 3
				update_icon()
				user.reagents.add_reagent("rsugar", 2)
				return TRUE
			if(stage == 3)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[src] crumbles to dust."),
				SPAN_NOTICE("You dug through [src]."))
				user.reagents.add_reagent("rsugar", 2)
				qdel(src)
				return TRUE

/obj/structure/surface/table/rock
	name = "hard surface"
	desc = "Dense rock, which can only be cleared by special tools."
	climbable = FALSE
	throwpass = FALSE
	breakable = FALSE
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
	name = "soft soil"
	desc = "Much easier to dig."
	color = "#3f3633"
	dig_time = 5 SECONDS
