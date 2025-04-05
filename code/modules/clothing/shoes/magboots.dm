/obj/item/clothing/shoes/marine/magboots
	desc = "Magnetic boots, often used during extravehicular activity to ensure the user remains safely attached to the vehicle."
	name = "magboots"
	icon_state = "magboots0"
	var/magpulse = FALSE
	actions_types = list(/datum/action/item_action/toggle)
	allowed_items_typecache = null
	var/obj/item/cell/crap/battery

/obj/item/clothing/shoes/marine/magboots/Initialize()
	. = ..()
	battery = new(src)

/obj/item/clothing/shoes/marine/magboots/attackby(obj/item/W, mob/user)
	if(!can_insert_battery(user, W, battery))
		return ..()
	else
		battery = W
	return ..()

/obj/item/clothing/shoes/marine/magboots/attack_hand(mob/user)
	if(!can_remove_battery(user, battery, TRUE))
		return ..()
	else
		battery = null

/obj/item/clothing/shoes/marine/magboots/attack_self(mob/user)
	..()

	if(magpulse)
		flags_inventory &= ~NOSLIPPING
		slowdown = SHOES_SLOWDOWN
		magpulse = FALSE
		icon_state = "magboots0"
		to_chat(user, SPAN_NOTICE("You disable the mag-pulse traction system."))
		playsound(loc, 'sound/effects/magnet.ogg', 10, TRUE)
	else
		flags_inventory |= NOSLIPPING
		slowdown = 0
		magpulse = TRUE
		icon_state = "magboots1"
		to_chat(user, SPAN_NOTICE("You enable the mag-pulse traction system."))
		playsound(loc, 'sound/effects/magnet.ogg', 10, TRUE)
	user.update_inv_shoes() //so our mob-overlays update

	for(var/X in actions)
		var/datum/action/A = X
		A.update_button_icon()


/obj/item/clothing/shoes/marine/magboots/get_examine_text(mob/user)
	. = ..()
	var/state = "disabled"
	if(flags_inventory&NOSLIPPING)
		state = "enabled"
	. += "Its mag-pulse traction system appears to be [state]."

/obj/item/clothing/shoes/magboots/New() //replacement
	new /obj/item/clothing/shoes/marine/magboots(loc)
	qdel(src)
