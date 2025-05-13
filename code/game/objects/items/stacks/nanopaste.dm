/obj/item/stack/nanopaste
	name = "nanopaste"
	singular_name = "nanite swarm"
	desc = "A tube of paste containing swarms of repair nanites. Very effective in repairing robotic machinery."
	icon = 'icons/obj/items/items.dmi'
	icon_state = "tube"

	attack_speed = 3
	amount = 10
	max_amount = 10
	w_class = SIZE_SMALL
	stack_id = "nanopaste"
	black_market_value = 25
	flags_human_ai = HEALING_ITEM

/obj/item/stack/nanopaste/attack(mob/living/M as mob, mob/user as mob)
	if (!istype(M) || !istype(user))
		return 0

	if (istype(M,/mob/living/carbon/human)) //Repairing robolimbs
		var/mob/living/carbon/human/H = M
		var/obj/limb/S = H.get_limb(user.zone_selected)

		if (S && (S.status & (LIMB_ROBOT|LIMB_SYNTHSKIN)))
			if(S.get_damage())
				S.heal_damage(15, 15, robo_repair = 1)
				H.pain.recalculate_pain()
				H.updatehealth()
				use(1)
				var/others_msg = "\The [user] applies some nanite paste at[user != M ? " \the [M]'s" : " the"] [S.display_name] with \the [src]." // Needs to create vars for these messages because macro doesn't work otherwise
				var/user_msg = "You apply some nanite paste at [user == M ? "your" : "[M]'s"] [S.display_name]."
				user.visible_message(SPAN_NOTICE("[others_msg]"),\
					SPAN_NOTICE("[user_msg]"))
			else
				to_chat(user, SPAN_NOTICE("Nothing to fix here."))

/obj/item/stack/nanopaste/ai_can_use(mob/living/carbon/human/user, datum/human_ai_brain/ai_brain, mob/living/carbon/human/target)
	if(!issynth(target))
		return FALSE

	for(var/obj/limb/limb as anything in target.limbs)
		for(var/datum/wound/wound in limb.wounds)
			if(wound.internal)
				continue

			return TRUE

	return FALSE

/obj/item/stack/nanopaste/ai_use(mob/living/carbon/human/user, datum/human_ai_brain/ai_brain, mob/living/carbon/human/target)
	for(var/obj/limb/limb as anything in target.limbs)
		if(QDELETED(src))
			return

		for(var/datum/wound/wound in limb.wounds)
			if(wound.internal)
				continue

			if(QDELETED(src))
				return

			user.zone_selected = limb.name
			attack(target, user)
			sleep(ai_brain.short_action_delay * ai_brain.action_delay_mult)
