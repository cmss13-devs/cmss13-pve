/obj/item/clothing/suit/cardborg
	name = "cardborg suit"
	desc = "An ordinary cardboard box with holes cut in the sides."
	icon_state = "cardborg"
	item_state = "cardborg"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/straight_jacket
	name = "straight jacket"
	desc = "A suit that completely restrains the wearer."
	icon_state = "straight_jacket"
	item_state = "straight_jacket"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_inv_hide = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL

/obj/item/clothing/suit/straight_jacket/equipped(mob/user, slot)
	if(slot == WEAR_JACKET && ishuman(user))
		var/mob/living/carbon/human/H = user
		H.drop_inv_item_on_ground(H.handcuffed)
		H.drop_l_hand()
		H.drop_r_hand()
	..()

/obj/item/clothing/suit/storage/webbing
	name = "external webbing"
	desc = "Designed to be worn over a jumpsuit rather than clipped on."
	icon_state = "webbing"
	item_state = "webbing"
	allowed = list(
		/obj/item/weapon/baton,
		/obj/item/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,

		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,
		/obj/item/weapon/gun,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tool/crowbar,
		/obj/item/tool/crew_monitor,
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
		/obj/item/storage/large_holster/katana,
		/obj/item/device/motiondetector,
	)

/obj/item/clothing/suit/storage/webbing/utility_vest
	name = "utility vest"
	desc = "A utility vest to hold tools in."
	icon_state = "synth_utility_vest"
	item_state = "synth_utility_vest"

/obj/item/clothing/suit/xenos
	name = "xenos suit"
	desc = "A suit made out of chitinous alien hide."
	icon_state = "xenos"
	item_state = "xenos_helm"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_inv_hide = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2

//Blue suit jacket toggle
/* /obj/item/clothing/suit/suit/verb/toggle()
	set name = "Toggle Jacket Buttons"
	set category = "Object"
	set src in usr

	if(usr.is_mob_incapacitated())
		return 0

	if(src.icon_state == "suitjacket_blue_open")
		src.icon_state = "suitjacket_blue"
		src.item_state = "suitjacket_blue"
		to_chat(usr, "You button up the suit jacket.")
	else if(src.icon_state == "suitjacket_blue")
		src.icon_state = "suitjacket_blue_open"
		src.item_state = "suitjacket_blue_open"
		to_chat(usr, "You unbutton the suit jacket.")
	else
		to_chat(usr, "You button-up some imaginary buttons on your [src].")
		return
	update_clothing_icon() */
