/obj/structure/barricade/razorwire
	name = "razorwire"
	desc = "A set of razorwire, able to slow down anything that tries to move through it."
	icon = 'icons/obj/structures/handrail.dmi'
	icon_state = "handrail_a_0"
	barricade_type = "handrail"
	health = 50
	maxhealth = 50
	density = FALSE
	climbable = FALSE
	stack_type = /obj/item/stack/barbed_wire
	debris = list(/obj/item/stack/barbed_wire)
	stack_amount = 3
	destroyed_stack_amount = 1
	crusher_resistant = FALSE
	can_wire = FALSE
	barricade_hitsound = 'sound/effects/metalhit.ogg'
	projectile_coverage = PROJECTILE_COVERAGE_NONE
	var/build_state = BARRICADE_BSTATE_SECURED
	var/reinforced = FALSE
	var/can_be_reinforced = FALSE

/obj/structure/barricade/razorwire/update_icon()
	overlays.Cut()
	switch(dir)
		if(SOUTH)
			layer = ABOVE_MOB_LAYER
		if(NORTH)
			layer = initial(layer) - 0.01
		else
			layer = initial(layer)
	if(!anchored)
		layer = initial(layer)

	for(var/datum/effects/E in effects_list)
		if(E.icon_path && E.obj_icon_state_path)
			overlays += image(E.icon_path, icon_state = E.obj_icon_state_path)

/obj/structure/barricade/razorwire/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_WIRECUTTERS) && !(user.a_intent == INTENT_HELP))
		user.visible_message(SPAN_NOTICE("[user] starts disassembling [src]."),
		SPAN_NOTICE("You start disassembling [src]."))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 25, 1)
		if(do_after(user, 50 * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION), INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			user.visible_message(SPAN_NOTICE("[user] disassembles [src]."),
			SPAN_NOTICE("You disassemble [src]."))
			deconstruct(TRUE)
		return

/obj/structure/barricade/razorwire/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/L = AM
	var/new_slowdown = L.next_move_slowdown + 10
	L.next_move_slowdown = new_slowdown
	to_chat(L, SPAN_WARNING("Moving through [src] slows you down substantially!"))
