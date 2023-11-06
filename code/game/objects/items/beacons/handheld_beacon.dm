/// Generic beacon for objectives
/obj/item/handheld_beacon
	name = "handheld beacon"
	desc = "A standard handheld beacon. Generally used by teams who may be out of regular communications range but must signal for various reasons. This one is branded with a Weyland Yutani symbol and sold en masse."
	icon = 'icons/obj/items/handheld_beacon.dmi'
	icon_state = "beacon_inactive"
	w_class = SIZE_SMALL

	/// Whether the beacon is active or not
	var/active = FALSE

/obj/item/handheld_beacon/get_examine_text(mob/user)
	. = ..()

	if(active)
		. += "The beacon has been activated!"

/obj/item/handheld_beacon/update_icon()
	. = ..()

	if(active)
		icon_state = "beacon_active"
		return
	icon_state = initial(icon_state)

/obj/item/handheld_beacon/attack_self(mob/user)
	. = ..()

	if(.)
		return

	active = !active
	update_icon()

	to_chat(user, SPAN_NOTICE("The beacon pings quietly and turns [active ? "on" : "off"]."))

	if(!active)
		return

	for(var/client/admin_client in GLOB.admins)
		if((R_ADMIN|R_MOD) & admin_client.admin_holder.rights)
			playsound_client(admin_client,'sound/effects/sos-morse-code.ogg',10)

	message_admins("[key_name(user)] has activated [src]! [ADMIN_JMP_USER(user)]")
