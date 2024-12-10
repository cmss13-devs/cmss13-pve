//Space santa outfit suit
/obj/item/clothing/head/helmet/space/santahat
	name = "Santa's hat"
	desc = "Ho ho ho. Merrry X-mas!"
	icon_state = "santa_hat_red"
	item_state = "santa_hat_red"
	icon = 'icons/obj/items/clothing/hats/hats.dmi'
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/clothing/head/hats.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/clothing/hats_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/clothing/hats_righthand.dmi',
	)
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
	icon = 'icons/obj/items/clothing/suits/misc_ert.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/suits/misc_ert.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/clothing/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/clothing/suits_righthand.dmi',
	)
	slowdown = 0
	allowed = list(/obj/item) //for stuffing extra special presents

/obj/item/clothing/head/helmet/space/compression
	name = "\improper MK.50 compression helmet"
	desc = "A heavy space helmet, designed to be coupled with the MK.50 compression suit, though it is less resilient than the suit. Feels like you could hotbox in here."
	item_state = "compression"
	icon_state = "compression"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/suit/space/compression
	name = "\improper MK.50 compression suit"
	desc = "A heavy, bulky civilian space suit, fitted with armored plates. Commonly seen in the hands of mercenaries, explorers, scavengers, and researchers."
	item_state = "compression"
	icon_state = "compression"
	icon = 'icons/obj/items/clothing/suits/hazard.dmi'
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/suits/hazard.dmi',
	)

/obj/item/clothing/head/helmet/space/pressure/orange
	item_state = "pressure_orange"
	icon_state = "pressure_orange"
	helmet_color = "orange"
/obj/item/clothing/suit/space/pressure/orange
	item_state = "pressure_orange"
	icon_state = "pressure_orange"

/obj/item/clothing/head/helmet/space/pressure/yellow
	item_state = "pressure_yellow"
	icon_state = "pressure_yellow"
	helmet_color = "yellow"

/obj/item/clothing/suit/space/pressure/yellow
	item_state = "pressure_yellow"
	icon_state = "pressure_yellow"

/obj/item/clothing/head/helmet/space/pressure/cyan
	item_state = "pressure_cyan"
	icon_state = "pressure_cyan"
	helmet_color = "cyan"

/obj/item/clothing/suit/space/pressure/cyan
	item_state = "pressure_cyan"
	icon_state = "pressure_cyan"

/obj/item/clothing/head/helmet/space/pressure/red
	item_state = "pressure_red"
	icon_state = "pressure_red"
	helmet_color = "red"

/obj/item/clothing/suit/space/pressure/red
	item_state = "pressure_red"
	icon_state = "pressure_red"

/obj/item/clothing/suit/space/pressure/dark
	item_state = "pressure_dark"
	icon_state = "pressure_dark"

/obj/item/clothing/head/helmet/space/pressure/uscm
	name = "\improper USCM MK.35 pressure helmet"
	desc = "A heavy space helmet, designed to be coupled with the MK.35 pressure suit utilized by the United States Colonial Marines and a few other American or UA organizations. Feels like you could hotbox in here."
	item_state = "pressure_uscm"
	icon_state = "pressure_uscm"
	helmet_color = "uscm"

/obj/item/clothing/suit/space/pressure/uscm
	name = "\improper USCM MK.35 pressure suit"
	desc = "A heavy, bulky military-grade space suit utilized by the United States Colonial Marines and a few other American or UA organizations."
	item_state = "pressure_uscm"
	icon_state = "pressure_uscm"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	allowed = list(/obj/item/weapon/gun,/obj/item/weapon/baton,/obj/item/restraint/handcuffs,/obj/item/tank)
	flags_inventory = SMARTGUN_HARNESS

/obj/item/clothing/head/helmet/space/pressure/upp
	name = "\improper UPPAC Sokol-KV2 pressure helmet"
	desc = "A heavy space helmet, designed to be coupled with the Sokol-KV2 pressure suit utilized by the Union of Progressive Peoples Armed Collective and a few other UPP organizations."
	item_state = "pressure_upp"
	icon_state = "pressure_upp"
	helmet_color = "upp"

/obj/item/clothing/suit/space/pressure/upp
	name = "\improper UPPAC Sokol-KV2 pressure suit"
	desc = "A heavy, bulky military-grade space suit utilized by the Union of Progressive Peoples Armed Collective and a few other UPP organizations."
	item_state = "pressure_upp"
	icon_state = "pressure_upp"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	allowed = list(/obj/item/weapon/gun,/obj/item/weapon/baton,/obj/item/restraint/handcuffs,/obj/item/tank)
	flags_inventory = SMARTGUN_HARNESS

// Souto man

/obj/item/clothing/suit/space/souto
	name = "\improper Souto Man tank top"
	desc = "The tank top worn by Souto Man. As fresh as a nice can of Souto Classic!"
	item_state = "souto_man"
	icon_state = "souto_man"
	icon = 'icons/obj/items/clothing/suits/misc_ert.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/suits/misc_ert.dmi',
	)
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
	icon = 'icons/obj/items/clothing/hats/hats.dmi'
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/clothing/head/hats.dmi'
	)
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
