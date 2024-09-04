/obj/effect/detector_blip
	icon = 'icons/obj/items/tracker_blips.dmi'
	layer = BELOW_FULLSCREEN_LAYER
	plane = FULLSCREEN_PLANE

/obj/detector_hud
	icon = 'icons/obj/items/detectorscreen.dmi'
	screen_loc = "detector:1,1"
	mouse_opacity = FALSE

#define TRACKER_RANGE 20

/obj/item/device/motiondetector
	name = "motion tracker"
	desc = "A device that detects movement, but ignores marines."
	icon = 'icons/obj/items/marine-items.dmi'
	icon_state = "detector"
	item_state = "motion_detector"
	flags_atom = FPRINT | CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_MEDIUM
	inherent_traits = list(TRAIT_ITEM_NOT_IMPLANTABLE)

	var/obj/detector_hud/detector_image = new()
	var/list/blips = list()

	var/disable_sound = FALSE
	var/active = FALSE

	var/time_to_detect = 2 SECONDS
	var/iff_signal = FACTION_MARINE

	var/client/last_client

/mob/var/current_detector = null

/obj/item/device/motiondetector/Initialize()
	. = ..()
	update_icon()

/obj/item/device/motiondetector/update_icon()
	//clear overlays
	if(overlays)
		overlays.Cut()
	else
		overlays = list()

	if(blood_overlay)
		overlays += blood_overlay

	//add toggle switch overlay
	if(disable_sound)
		overlays += "+[initial(icon_state)]_long_switch"
	else
		overlays += "+[initial(icon_state)]_short_switch"

/obj/item/device/motiondetector/verb/toggle_ping_sound()
	set name = "Toggle Ping Sound"
	set category = "Object"
	set src in usr

	toggle_sound(usr)

/obj/item/device/motiondetector/clicked(mob/user, list/mods)
	if (isobserver(user) || isxeno(user)) return

	if (mods["alt"])
		if(!CAN_PICKUP(user, src))
			return ..()
		toggle_sound(usr)
		return TRUE

	return ..()

/obj/item/device/motiondetector/proc/toggle_sound(mob/user)
	if(isobserver(user) || isxeno(user) || !Adjacent(user))
		return

	disable_sound = !disable_sound

	to_chat(user, SPAN_NOTICE("You [disable_sound ? "disable" : "enable"] [src] ping sound."))
	update_icon()

	playsound(usr,'sound/machines/click.ogg', 15, TRUE)

/obj/item/device/motiondetector/attack_self(mob/user)
	..()

	if(active)
		turn_off(user)
		return

	turn_on(user)

/obj/item/device/motiondetector/proc/turn_on(mob/user)
	if(active)
		return

	if(user.current_detector == src)
		to_chat(user, SPAN_ALERT("You are already using another tracker!"))
		return

	icon_state = "detector_on_1_old"

	playsound(src.loc, 'sound/items/detector_turn_on.ogg', 30)
	to_chat(user, SPAN_NOTICE("You activate \the [src]."))

	winshow(user, "detectorwindow", TRUE)
	user.client.screen += detector_image

	user.current_detector = src
	last_client = user.client

	START_PROCESSING(SSobj, src)
	active = TRUE

/obj/item/device/motiondetector/proc/turn_off(mob/user)
	if(!active)
		return

	if(!user.current_detector)
		return

	icon_state = "detector"

	playsound(src.loc, 'sound/items/detector_turn_off.ogg', 30)
	to_chat(user, SPAN_NOTICE("You deactivate \the [src]."))

	var/client/client_to_use = user.client ? user.client : last_client
	winshow(client_to_use, "detectorwindow", FALSE)
	client_to_use.screen -= detector_image

	user.current_detector = null
	last_client = null

	STOP_PROCESSING(SSobj, src)
	active = FALSE

/obj/item/device/motiondetector/dropped(mob/user)
	. = ..()
	turn_off(user)

/obj/item/device/motiondetector/process(delta_time)
	playsound(loc, 'sound/items/detector.ogg', 60)
	flick("", detector_image)

	scan(2)

/obj/item/device/motiondetector/proc/scan(delay)
	set waitfor = FALSE

	sleep(delay)
	var/mob/living/user = get_user()

	if(!user.client)
		turn_off(user)
		return

	if(user.r_hand != src && user.l_hand != src)
		turn_off(user)
		return


	for(var/blip in blips)
		user.client.screen -= blip
		qdel(blip)

	var/min_distance = INFINITY
	for(var/mob/living/L as anything in GLOB.living_mob_list)
		var/distance = get_dist(user, L)
		if(distance > TRACKER_RANGE)
			continue

		if(isrobot(L))
			continue

		var/delta = L.l_move_time + time_to_detect
		if(!L.action_busy && delta < world.time)
			continue

		if(L.get_target_lock(iff_signal))
			continue

		if(distance < min_distance)
			min_distance = distance

		var/obj/effect/detector_blip/B = new /obj/effect/detector_blip()
		user.client.screen += B // Add it to the radar

		B.pixel_x = (L.x - user.x) * 4 - 4 // Move blip in the right position on the radar (multiplied by the icon dimensions)
		B.pixel_y = (L.y - user.y) * 4 - 4 // -4 is a slight offset south and west

		B.screen_loc = "detector:3:[B.pixel_x],3:[B.pixel_y]" // Make it appear on the radar map
		flick("blip", B)

	if(disable_sound || min_distance == INFINITY)
		return

	var/sound = pick('sound/items/detector_ping_1.ogg', 'sound/items/detector_ping_4.ogg')
	var/pitch = SOUND_FREQ_HIGH - (SOUND_FREQ_HIGH - SOUND_FREQ_LOW) / 1.5 * (min_distance / TRACKER_RANGE)
	playsound(loc, sound, 60, pitch, 5)

/obj/item/device/motiondetector/proc/get_user()
	if(isliving(loc))
		return loc

/obj/item/device/motiondetector/proc/apply_debuff(mob/M)
	return

/obj/item/device/motiondetector/sg

/obj/item/device/motiondetector/m717
	name = "M717 pocket motion tracker"
	desc = "This prototype motion detector sacrifices versatility, having only the long-range mode, for size, being so small it can even fit in pockets."
	icon_state = "pocket"
	item_state = "motion_detector"
	flags_atom = FPRINT| CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_SMALL

/obj/item/device/motiondetector/m717/hacked/contractor
	name = "modified M717 pocket motion detector"
	desc = "This prototype motion detector sacrifices versatility, having only the long-range mode, for size, being so small it can even fit in pockets. This one has been modified with an after-market IFF sensor to filter out Vanguard's Arrow Incorporated signals instead of USCM ones. Fight fire with fire!"
	iff_signal = FACTION_CONTRACTOR

/obj/item/device/motiondetector/hacked
	name = "hacked motion detector"
	desc = "A device that usually picks up non-USCM signals, but this one's been hacked to detect all non-UPP movement instead. Fight fire with fire!"
	iff_signal = FACTION_UPP

/obj/item/device/motiondetector/hacked/elite_merc
	name = "hacked motion detector"
	desc = "A device that usually picks up non-USCM signals, but this one's been hacked to detect all non-freelancer movement instead. Fight fire with fire!"
	iff_signal = FACTION_MERCENARY

/obj/item/device/motiondetector/hacked/pmc
	name = "corporate motion detector"
	desc = "A device that usually picks up non-USCM signals, but this one's been reprogrammed to detect all non-PMC movement instead. Very corporate."
	iff_signal = FACTION_PMC

/obj/item/device/motiondetector/hacked/dutch
	name = "hacked motion detector"
	desc = "A device that usually picks up non-USCM signals, but this one's been hacked to detect all non-Dutch's Dozen movement instead. Fight fire with fire!"
	iff_signal = FACTION_DUTCH

/obj/item/device/motiondetector/hacked/contractor
	name = "modified motion detector"
	desc = "A device that usually picks up non-USCM signals, but this one's been modified with after-market IFF sensors to detect all non-Vanguard's Arrow Incorporated movement instead. Fight fire with fire!"
	iff_signal = FACTION_CONTRACTOR

#undef TRACKER_RANGE
