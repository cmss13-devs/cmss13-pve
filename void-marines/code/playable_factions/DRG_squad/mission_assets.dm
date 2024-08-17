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
	to_chat(user, SPAN_DANGER("You readied [src] for a charged hit!"))

/obj/item/weapon/drg/pickaxe/proc/add_charge()
	charges++

/obj/item/weapon/drg/pickaxe/attack(mob/M, mob/user)
	if(in_charged_state)
		if(charges <= 0)
			to_chat(user, SPAN_DANGER("[src] isn't recharged yet! You can't use it's charged hit!"))
			return FALSE
		charges -= 1
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

	for(var/obj/item/mining_instruments in allowed_instruments)
		if(do_after(user, dig_time - mining_instruments.digging_buff, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
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
