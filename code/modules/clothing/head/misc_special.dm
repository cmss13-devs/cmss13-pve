/*
 * Contents:
 * Welding mask
 * Cakehat
 * Ushanka
 * Pumpkin head
 *
 */

/*
 * Welding mask
 */
/obj/item/clothing/head/welding
	name = "welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye."
	icon_state = "welding"
	item_state = "welding"
	matter = list("metal" = 3000, "glass" = 1000)
	var/up = 0
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	flags_atom = FPRINT|CONDUCT
	flags_inventory = COVEREYES|COVERMOUTH|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	actions_types = list(/datum/action/item_action/toggle)
	siemens_coefficient = 0.9
	w_class = SIZE_MEDIUM
	eye_protection = EYE_PROTECTION_WELDING
	vision_impair = VISION_IMPAIR_MAX

/obj/item/clothing/head/welding/attack_self(mob/user)
	..()
	toggle()


/obj/item/clothing/head/welding/verb/toggle()
	set category = "Object"
	set name = "Adjust welding mask"
	set src in usr

	if(usr.is_mob_incapacitated())
		return

	if(up)
		vision_impair = VISION_IMPAIR_MAX
		flags_inventory |= COVEREYES|COVERMOUTH|BLOCKSHARPOBJ
		flags_inv_hide |= HIDEEARS|HIDEEYES|HIDEFACE
		icon_state = initial(icon_state)
		eye_protection = initial(eye_protection)
		to_chat(usr, "You flip the [src] down to protect your eyes.")
	else
		vision_impair = VISION_IMPAIR_NONE
		flags_inventory &= ~(COVEREYES|COVERMOUTH|BLOCKSHARPOBJ)
		flags_inv_hide &= ~(HIDEEARS|HIDEEYES|HIDEFACE)
		icon_state = "[initial(icon_state)]up"
		eye_protection = EYE_PROTECTION_NONE
		to_chat(usr, "You push the [src] up out of your face.")
	up = !up

	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.head == src)
			H.update_tint()

	update_clothing_icon() //so our mob-overlays update

	for(var/X in actions)
		var/datum/action/A = X
		A.update_button_icon()
