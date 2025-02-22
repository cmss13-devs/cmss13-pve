//Spacesuit
//Note: Everything in modules/clothing/spacesuits should have the entire suit grouped together.
//   Meaning the suit is defined directly after the corrisponding helmet. Just like below!
/obj/item/clothing/head/helmet/space
	name = "Space helmet"
	icon_state = "space"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment."
	item_state = "space"
	permeability_coefficient = 0.01
	armor_melee = CLOTHING_ARMOR_NONE
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_ULTRAHIGH
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_inventory = COVEREYES|COVERMOUTH|NOPRESSUREDMAGE|BLOCKSHARPOBJ
	flags_inv_hide = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEALLHAIR
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	flags_cold_protection = BODY_FLAG_HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROT
	siemens_coefficient = 0.9
	eye_protection = EYE_PROTECTION_WELDING

/obj/item/clothing/suit/space
	name = "Space suit"
	desc = "A suit that protects against low pressure environments."
	icon_state = "space"
	item_state = "s_suit"
	w_class = SIZE_LARGE//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	allowed = list(/obj/item/device/flashlight,/obj/item/tank/emergency_oxygen)
	slowdown = 3
	armor_melee = CLOTHING_ARMOR_NONE
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_ULTRAHIGH
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_inventory = BLOCKSHARPOBJ|NOPRESSUREDMAGE
	flags_inv_hide = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROT
	siemens_coefficient = 0.9
	var/can_support_limbs = TRUE
	var/list/supporting_limbs = list()//If not-null, automatically splints breaks. Checked when removing the suit.

/obj/item/clothing/suit/space/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/space/process()
    if (!ishuman(loc))
        return
    var/mob/living/carbon/human/wearer = loc
    var/loc_temp = loc.return_temperature()
    if (loc_temp < wearer.bodytemperature) // Place is colder than we are
        var/thermal_protection = max(0, 1 - ((min_cold_protection_temperature + damage*SPACESUIT_COOLING_WHEN_DAMAGED_MULTIPLIER) - loc_temp) / 40) // Scales between 1 and 0 over 40K
        if (thermal_protection < 1)
            wearer.bodytemperature += (1 - thermal_protection) * ((loc_temp - wearer.bodytemperature) / 30) // Smaller, more linear scaling



/obj/item/clothing/suit/space/equipped(mob/M, put_into_slot)
	if(flags_equip_slot && slotdefine2slotbit(put_into_slot))
		addtimer(CALLBACK(src, PROC_REF(check_limb_support), FALSE,	 M), 0)
	..()

/obj/item/clothing/suit/space/unequipped(mob/M, slot)
	addtimer(CALLBACK(src, PROC_REF(check_limb_support), TRUE, M), 0)
	..()

// Some space suits are equipped with reactive membranes that support
// broken limbs - at the time of writing, only the ninja suit, but
// I can see it being useful for other suits as we expand them. ~ Z
// The actual splinting occurs in /obj/limb/proc/fracture()
/obj/item/clothing/suit/space/proc/check_limb_support(being_taken_off = FALSE, human)
	if(!can_support_limbs)
		return
	// If this isn't set, then we don't need to care.
	//if(!LAZYLEN(supporting_limbs))
	//	return

	var/mob/living/carbon/human/H = human

	// If this isn't set, then we don't need to care.
	if(!being_taken_off)
		for(var/obj/limb/O in H.limbs)
			if(!(O.status & LIMB_SPLINTED) && (O.status & LIMB_BROKEN))
				to_chat(H, SPAN_HELPFUL("You feel the internal cushioning of the [src] begin to inflate against your [O.display_name]."))
				if(do_after(usr, 5 SECONDS, INTERRUPT_NONE))
					playsound(loc, 'sound/machines/hiss.ogg', 15, 1)
					to_chat(H, SPAN_HELPFUL("\The [src] constricts around your [O.display_name], supporting the fracture."))
					supporting_limbs += O.display_name
					O.status |= LIMB_SPLINTED
					O.status |= LIMB_SPLINTED_INDESTRUCTIBLE
	else
	// Otherwise, remove the splints.
		playsound(loc, 'sound/machines/hiss.ogg', 15, 1)
		for(var/obj/limb/O in H.limbs)
			if((O.status & LIMB_SPLINTED) && (O.status & LIMB_BROKEN) && supporting_limbs.Find(O.display_name))
				O.status &= ~ LIMB_SPLINTED
				O.status &= ~LIMB_SPLINTED_INDESTRUCTIBLE
		if(supporting_limbs.len)
			to_chat(H, SPAN_USERDANGER("\The [src] stops supporting your [jointext(supporting_limbs, ", ")]."))
		supporting_limbs.Cut()
