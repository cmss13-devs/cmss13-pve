/****************************************/
/*
			Sticky Grenade
*/
/****************************************/

/obj/item/explosive/grenade/high_explosive/drg_gunner_sticky
	name = "\improper sticky grenade"
	desc = "Will stick to any surface or creature, and then explode after a short time. Sometimes keeping it simple is best."
	icon_state = "concussion"
	item_state = "concussion"
	explosion_falloff = 35
	explosion_power = 150
	underslug_launchable = FALSE

	var/atom/stick_target
	var/image/overlay

/obj/item/explosive/grenade/high_explosive/drg_gunner_sticky/prime()
	. = ..()

	stick_target.overlays -= overlay
	qdel(overlay)

	if(QDELETED(stick_target))
		return

	if(!ismob(stick_target))
		return

	var/mob/living/L = stick_target

	L.apply_effect(2 SECONDS, SUPERSLOW)
	L.Stun(1 SECONDS)

/obj/item/explosive/grenade/high_explosive/drg_gunner_sticky/launch_impact(atom/hit_atom)
	if(!active)
		return ..()

	if(stick_target)
		return // how?

	if(istype(hit_atom, /obj/effect))
		return ..()

	throwing = FALSE
	rebounding = FALSE

	stick_target = hit_atom
	layer = BELOW_MOB_LAYER

	visible_message(SPAN_WARNING("[src] sticks to \the [stick_target]!"))
	forceMove(stick_target)

	if(isturf(stick_target))
		return

	overlay = image(icon, icon_state)
	overlay.layer = ABOVE_XENO_LAYER

	overlay.overlays += overlays // Merging with danger overlay
	stick_target.overlays += overlay

/obj/item/explosive/grenade/high_explosive/drg_gunner_sticky/pull_response(mob/puller)
	if(stick_target)
		to_chat(puller, SPAN_WARNING("You can't just grab [src] while it is active!"))
		return FALSE
	return TRUE

/obj/item/explosive/grenade/high_explosive/drg_gunner_sticky/explosion_throw(severity, direction, scatter_multiplier)
	if(stick_target)
		return
	return ..()

/obj/item/explosive/grenade/high_explosive/drg_gunner_sticky/attack_hand(mob/user)
	if(stick_target)
		to_chat(user, SPAN_WARNING("You can't just pickup [src] while it is active!"))
		return
	. = ..()
