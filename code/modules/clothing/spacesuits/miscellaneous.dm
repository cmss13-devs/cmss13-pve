//Space santa outfit suit
/obj/item/clothing/head/helmet/space/santahat
	name = "Santa's hat"
	desc = "Ho ho ho. Merrry X-mas!"
	icon_state = "santa_hat_red"
	flags_inventory = NOPRESSUREDMAGE|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEYES
	flags_armor_protection = BODY_FLAG_HEAD

/obj/item/clothing/head/helmet/space/santahat/green
	icon_state = "santa_hat_green"

/obj/item/clothing/suit/space/santa
	name = "Santa's suit"
	desc = "Festive!"
	icon_state = "santa"
	item_state = "santa"
	slowdown = 0
	allowed = list(/obj/item) //for stuffing extra special presents

//Space pirate outfit
/obj/item/clothing/head/helmet/space/pirate
	name = "pirate hat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	flags_inventory = NOPRESSUREDMAGE|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEYES
	flags_armor_protection = 0
	siemens_coefficient = 0.9

/obj/item/clothing/suit/space/pirate
	name = "pirate coat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	w_class = SIZE_MEDIUM
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/baton,/obj/item/restraint/handcuffs,/obj/item/tank/emergency_oxygen)
	slowdown = 0
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	siemens_coefficient = 0.9
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/head/helmet/space/compression
	name = "\improper compression helmet"
	desc = "A heavy space helmet."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_1.dmi'
	)
	light_range = 4
	light_power = 0.8
	item_state = "compression_white"
	icon_state = "compression_white"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	actions_types = list(/datum/action/item_action/toggle)
	time_to_unequip = 10
	time_to_equip = 10
	var/helmet_color = "white"
	var/toggleable = TRUE
	var/can_be_broken = TRUE
	var/breaking_sound = 'sound/handling/click_2.ogg'

/obj/item/clothing/head/helmet/space/compression/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/head/helmet/space/compression/update_icon()
	. = ..()
	if(light_on)
		icon_state = "compression_[helmet_color]_[light_on]"
		item_state = "compression_[helmet_color]_[light_on]"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)

/obj/item/clothing/head/helmet/space/compression/attack_self(mob/user)
	. = ..()

	if(!toggleable)
		to_chat(user, SPAN_WARNING("You cannot toggle [src] on or off."))
		return FALSE

	if(!isturf(user.loc))
		to_chat(user, SPAN_WARNING("You cannot turn the light [light_on ? "off" : "on"] while in [user.loc].")) //To prevent some lighting anomalies.
		return FALSE

	turn_light(user, !light_on)

/obj/item/clothing/head/helmet/space/compression/turn_light(mob/user, toggle_on)

	. = ..()
	if(. != CHECKS_PASSED)
		return

	set_light_on(toggle_on)

	update_icon()

	if(user == loc)
		user.update_inv_head()

	for(var/datum/action/current_action as anything in actions)
		current_action.update_button_icon()

/obj/item/clothing/head/helmet/space/compression/attack_alien(mob/living/carbon/xenomorph/attacking_xeno)

	if(!can_be_broken)
		return

	if(turn_light(attacking_xeno, toggle_on = FALSE) != CHECKS_PASSED)
		return

	if(!breaking_sound)
		return

	playsound(loc, breaking_sound, 25, 1)

/obj/item/clothing/suit/space/compression
	name = "\improper compression suit"
	desc = "A heavy, bulky civilian space suit, fitted with armored plates."
	icon = 'icons/obj/items/clothing/cm_suits.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/suit_1.dmi'
	)
	item_state = "compression_white"
	icon_state = "compression_white"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	time_to_unequip = 25
	time_to_equip = 25

/obj/item/clothing/head/helmet/space/compression/orange
	item_state = "compression_orange"
	icon_state = "compression_orange"
	helmet_color = "orange"
/obj/item/clothing/suit/space/compression/orange
	item_state = "compression_orange"
	icon_state = "compression_orange"

/obj/item/clothing/head/helmet/space/compression/yellow
	item_state = "compression_yellow"
	icon_state = "compression_yellow"
	helmet_color = "yellow"

/obj/item/clothing/suit/space/compression/yellow
	item_state = "compression_yellow"
	icon_state = "compression_yellow"

/obj/item/clothing/head/helmet/space/compression/cyan
	item_state = "compression_cyan"
	icon_state = "compression_cyan"
	helmet_color = "cyan"

/obj/item/clothing/suit/space/compression/cyan
	item_state = "compression_cyan"
	icon_state = "compression_cyan"

/obj/item/clothing/head/helmet/space/compression/red
	item_state = "compression_red"
	icon_state = "compression_red"
	helmet_color = "red"

/obj/item/clothing/suit/space/compression/red
	item_state = "compression_red"
	icon_state = "compression_red"

/obj/item/clothing/head/helmet/space/compression/uscm
	name = "\improper USCM MK.35 compression helmet"
	desc = "A heavy space helmet, designed to be coupled with the MK.35 compression suit utilized by the United States Colonial Marines and a few other American or UA organizations. Feels like you could hotbox in here."
	item_state = "compression_uscm"
	icon_state = "compression_uscm"
	helmet_color = "uscm"

/obj/item/clothing/suit/space/compression/uscm
	name = "\improper USCM MK.35 compression suit"
	desc = "A heavy, bulky military-grade space suit utilized by the United States Colonial Marines and a few other American or UA organizations."
	item_state = "compression_uscm"
	icon_state = "compression_uscm"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	allowed = list(/obj/item/weapon/gun,/obj/item/weapon/baton,/obj/item/restraint/handcuffs,/obj/item/tank)


/obj/item/clothing/head/helmet/space/compression/upp
	name = "\improper UPPAC CCC5 compression helmet"
	desc = "A heavy space helmet, designed to be coupled with the CCC5 compression suit utilized by the Union of Progressive Peoples Armed Collective and a few other UPP organizations."
	item_state = "compression_upp"
	icon_state = "compression_upp"
	helmet_color = "upp"

/obj/item/clothing/suit/space/compression/upp
	name = "\improper UPPAC CCC5 compression suit"
	desc = "A heavy, bulky military-grade space suit utilized by the Union of Progressive Peoples Armed Collective and a few other UPP organizations."
	item_state = "compression_upp"
	icon_state = "compression_upp"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	allowed = list(/obj/item/weapon/gun,/obj/item/weapon/baton,/obj/item/restraint/handcuffs,/obj/item/tank)

// Souto man

/obj/item/clothing/suit/space/souto
	name = "\improper Souto Man tank top"
	desc = "The tank top worn by Souto Man. As fresh as a nice can of Souto Classic!"
	item_state = "souto_man"
	icon_state = "souto_man"
	armor_melee = CLOTHING_ARMOR_HARDCORE
	armor_bullet = CLOTHING_ARMOR_HARDCORE
	armor_laser = CLOTHING_ARMOR_HARDCORE
	armor_energy = CLOTHING_ARMOR_HARDCORE
	armor_bomb = CLOTHING_ARMOR_HARDCORE
	armor_bio = CLOTHING_ARMOR_HARDCORE
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_HARDCORE
	flags_inventory = CANTSTRIP|BLOCKSHARPOBJ
	unacidable = TRUE
	flags_inv_hide = null
	slowdown = 0

/obj/item/clothing/head/helmet/space/souto
	name = "\improper Souto Man hat"
	desc = "The hat worn by Souto Man. As tall as the new 24oz cans of Souto Lime!"
	item_state = "souto_man"
	icon_state = "souto_man"
	armor_melee = CLOTHING_ARMOR_HARDCORE
	armor_bullet = CLOTHING_ARMOR_HARDCORE
	armor_laser = CLOTHING_ARMOR_HARDCORE
	armor_energy = CLOTHING_ARMOR_HARDCORE
	armor_bomb = CLOTHING_ARMOR_HARDCORE
	armor_bio = CLOTHING_ARMOR_HARDCORE
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_HARDCORE
	flags_inventory = CANTSTRIP|COVEREYES|COVERMOUTH|ALLOWINTERNALS|ALLOWREBREATH|BLOCKGASEFFECT|ALLOWCPR|BLOCKSHARPOBJ
	unacidable = TRUE
	flags_inv_hide = null
