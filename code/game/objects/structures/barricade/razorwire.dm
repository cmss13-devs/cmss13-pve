/obj/structure/barricade/razorwire
	name = "razorwire"
	desc = "A set of razorwire, able to slow down anything that tries to move through it."
	icon = 'icons/obj/structures/barbed.dmi'
	icon_state = "barbed_wire"
	barricade_type = "barbed_wire"
	health = 100
	maxhealth = 100
	density = FALSE
	climbable = FALSE
	stack_type = /obj/item/stack/barbed_wire
	debris = list(/obj/item/stack/barbed_wire)
	stack_amount = 2
	destroyed_stack_amount = 1
	crusher_resistant = FALSE
	can_wire = FALSE
	barricade_hitsound = 'sound/effects/metalhit.ogg'
	projectile_coverage = PROJECTILE_COVERAGE_NONE
	var/build_state = BARRICADE_BSTATE_SECURED
	var/cut = FALSE

	brute_multiplier = 1.5
	brute_projectile_multiplier = 0.375

/obj/structure/barricade/razorwire/update_icon()
	if(build_state == BARRICADE_BSTATE_UNSECURED)
		icon_state = "barbed_wire_broken"

/obj/structure/barricade/razorwire/attackby(obj/item/W, mob/user)
	switch(build_state)
		if(BARRICADE_BSTATE_SECURED)
			if(HAS_TRAIT(W, TRAIT_TOOL_WIRECUTTERS) && !(user.a_intent == INTENT_HELP))
				user.visible_message(SPAN_NOTICE("[user] starts cutting [src]."),
				SPAN_NOTICE("You start cutting [src]."))
				playsound(src.loc, 'sound/items/Wirecutter.ogg', 25, 1)
				if(do_after(user, 50 * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
					user.visible_message(SPAN_NOTICE("[user] cuts [src]."),
					SPAN_NOTICE("You cut [src]."))
					build_state = BARRICADE_BSTATE_UNSECURED
					update_icon()
					return
		if(BARRICADE_BSTATE_UNSECURED)
			if(HAS_TRAIT(W, TRAIT_TOOL_WRENCH) && !(user.a_intent == INTENT_HELP))
				user.visible_message(SPAN_NOTICE("[user] starts deconstructing [src]."),
				SPAN_NOTICE("You start deconstructing [src]."))
				playsound(src.loc, 'sound/items/Deconstruct.ogg', 25, 1)
				if(do_after(user, 50 * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
					user.visible_message(SPAN_NOTICE("[user] deconstructs [src]."),
					SPAN_NOTICE("You deconstructs [src]."))
					deconstruct(TRUE)
					return
	. = ..()

/obj/structure/barricade/razorwire/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/L = AM
	if(build_state == BARRICADE_BSTATE_SECURED)
		var/new_slowdown = L.next_move_slowdown + 16
		L.next_move_slowdown = new_slowdown
		to_chat(L, SPAN_WARNING("Moving through [src] slows you down substantially!"))
