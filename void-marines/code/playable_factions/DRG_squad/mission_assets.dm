#define FACTION_DRG "Deep Rock Galactic"

/mob/living/simple_animal/hostile/drg
	name = "Robot"
	desc = "An DRG Company personal automaton, used for various purposes."
	icon = 'void-marines/icons/robots.dmi'
	icon_state = "Detective Ball"
	icon_dead = "gib7"
	wander = FALSE
	health = 500
	maxHealth = 500

	attacktext = "pokes"
	attack_sound = null
	friendly = "pokes"
	faction = FACTION_DRG

/mob/living/simple_animal/hostile/drg/howard
	name = "H-0W-RD"
	desc = "An DRG Company personal automaton. This one made for bar duty and service assistance."
	icon = 'void-marines/icons/robots.dmi'
	icon_state = "Howard"

	health = 99999
	maxHealth = 99999

	var/list/reagents_to_choose = list("beer", "bilk", "ale", "manlydorf", "grog")
	var/reagent_to_dispense = null

/mob/living/simple_animal/hostile/drg/howard/UnarmedAttack(atom/A, proximity, click_parameters)
	if(A == src)
		reagent_to_dispense = tgui_input_list(usr, "Choose the drink you need!", "Reagent Selection", reagents_to_choose)
		to_chat(usr, SPAN_DANGER("Now you will dispense [reagent_to_dispense]!"))
		return TRUE
	if(istype(A, /obj/item/reagent_container))
		var/obj/item/reagent_container/target = A
		if(target.reagents.total_volume >= target.reagents.maximum_volume)
			to_chat(usr, SPAN_DANGER("[target] is full!"))
			return FALSE
		src.visible_message(SPAN_WARNING("[src] happily beeps, and then starts to pour some liquid into [target]."),
		SPAN_NOTICE("You filled [target] with 5U of [reagent_to_dispense]."))
		playsound(src.loc, 'sound/effects/refill.ogg', 25, 1, 3)
		target.reagents.add_reagent(reagent_to_dispense, 5)
		return TRUE
	..()

/mob/living/simple_animal/hostile/drg/ranged //will shoot enemies on sight, player will NOT have control over this, so make survivors the same faction!
	COOLDOWN_DECLARE(ranged_cooldown)
	var/projectile_to_fire = /datum/ammo/bullet/rifle
	var/attack_range = 10
	var/cooldown_duration = 2 SECONDS
	var/list/possible_target = list()

/mob/living/simple_animal/hostile/drg/ranged/Life(delta_time)
	if(COOLDOWN_FINISHED(src, ranged_cooldown))
		for(var/mob/living/target in orange(attack_range, src))
			if(target.faction != src.faction)
				possible_target += target
			if(!possible_target.len)
				return FALSE
			var/current_target = pick(possible_target)

			var/datum/ammo/projectile_type = GLOB.ammo_list[projectile_to_fire]

			var/obj/projectile/projectile = new /obj/projectile(loc, create_cause_data(src))
			projectile.generate_bullet(projectile_type)
			projectile.permutated += src
			projectile.fire_at(current_target, src, src, projectile_type.max_range, projectile_type.shell_speed)
			COOLDOWN_START(src, ranged_cooldown, cooldown_duration)

	. = ..()

/mob/living/simple_animal/hostile/drg/ranged/robert
	name = "R-0B-ER-T"
	desc = "An DRG Company personal automaton. This one made for simple on-duty work."
	icon = 'void-marines/icons/robots.dmi'
	icon_state = "Robert"

	health = 1000
	maxHealth = 1000

	var/lives = 2
	var/damaged = FALSE
	projectile_to_fire = /datum/ammo/bullet/rifle/explosive
	cooldown_duration = 4 SECONDS

/mob/living/simple_animal/hostile/drg/ranged/robert/Life(delta_time)
	..()
	if(damaged)
		anchored = TRUE
		icon_state = "Robert_broken"
		next_move_slowdown = 100
	if(health <= 50 && lives > 0)
		health = maxHealth
		lives -= 1
		damaged = TRUE

/obj/item
	var/digging_buff = 0

/obj/item/weapon/drg/pickaxe
	name = "combat pickaxe"
	desc = "An utility weapon, used by DRG miners not only to dig minerals, but also protect themselves."
	icon = 'void-marines/icons/drg_tools.dmi'
	icon_state = "drg_pickaxe"
	force = 85
	var/charges = 1 //do we have any charged hits?
	var/recharge_time = 20 SECONDS //how long it takes after charged hit to refill energy
	var/in_charged_state = FALSE //are we ready to make a blow?

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
		force = 170
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
		addtimer(CALLBACK(src, PROC_REF(change_mode)), 2 SECONDS) //THIS IS THE BEST DECISION I COULD MADE, BUT ALSO THE WORST AT THE SAME TIME - PLEASE FIND BETTER WAY
		addtimer(CALLBACK(src, PROC_REF(add_charge)), recharge_time)
	..()

/obj/structure/surface/table/rock
	name = "hard surface"
	desc = "Dense rock, which can only be cleared by special tools."
	climbable = FALSE
	throwpass = FALSE
	breakable = FALSE
	reinforced = TRUE
	opacity = TRUE
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

/obj/structure/surface/table/rock/Crossed(atom/movable/O)
	return

/obj/structure/surface/table/rock/MouseDrop(over_object, src_location, over_location)
	return

/obj/structure/surface/table/rock/MouseDrop_T(obj/item/I, mob/user)
	return

/obj/structure/surface/table/rock/attackby(obj/item/W, mob/user, click_data)
	if(!W)
		return

	if(W.type in allowed_instruments)
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
