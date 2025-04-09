/obj/item/device/binoculars/fire_support
	name = "tactical binoculars"
	desc = "A pair of binoculars, used to mark targets for airstrikes and orbital support. Unique action to toggle mode. Ctrl+Click when using to target something."
	icon = 'icons/obj/items/binoculars.dmi'
	icon_state = "advanced_binoculars"
	w_class = SIZE_SMALL
	///Faction locks this item if specified
	var/faction = null
	///lase effect
	var/image/laser_overlay
	///lasing time
	var/target_acquisition_delay = 5 SECONDS
	///Last stored turf targetted by rangefinders
	var/turf/target_atom
	///Current mode for support request
	var/datum/fire_support/mode = null
	///firemodes available for these binos
	var/list/datum/fire_support/mode_list = list(
		FIRESUPPORT_TYPE_GUN,
		FIRESUPPORT_TYPE_LASER,
		FIRESUPPORT_TYPE_ROCKETS,
		FIRESUPPORT_TYPE_MISSILE,
		FIRESUPPORT_TYPE_HE_MORTAR,
		FIRESUPPORT_TYPE_INCENDIARY_MORTAR,
		FIRESUPPORT_TYPE_SMOKE_MORTAR,
		FIRESUPPORT_TYPE_NERVE_SMOKE_MORTAR,
	)
	///How much fire support points does this binocular have
	var/fire_support_points = 10

/obj/item/device/binoculars/fire_support/Initialize()
	. = ..()
	update_icon()
	for(var/fire_support_type in mode_list)
		mode_list[fire_support_type] = GLOB.fire_support_types[fire_support_type]

/obj/item/device/binoculars/fire_support/proc/InterceptClickOn(mob/user, params, atom/object)
	var/list/pa = params2list(params)
	if(!pa.Find("ctrl") && pa.Find("shift"))
		acquire_coordinates(object, user)
		return TRUE

	if(pa.Find("ctrl") && !pa.Find("shift"))
		acquire_target(object, user)
		return TRUE

	return FALSE

/obj/item/device/binoculars/fire_support/clicked(mob/user, list/mods)
	if(mods["ctrl"])
		if(!CAN_PICKUP(user, src))
			return ..()
		select_radial(user)
		return TRUE
	return ..()

/obj/item/device/binoculars/fire_support/examine(mob/user)
	. = ..()
	if(!mode)
		return
	. += SPAN_BOLDNOTICE("They are currently set to [mode.name] mode.")
	if(!mode.cooldown_timer)
		return
	. += SPAN_WARNING("Available in [round(timeleft(mode.cooldown_timer) MILLISECONDS)] seconds.")

/obj/item/device/binoculars/fire_support/Destroy()
	unset_target()
	mode = null
	mode_list = null
	return ..()

/obj/item/device/binoculars/fire_support/handle_click(mob/living/carbon/human/user, atom/targeted_atom, list/mods)
	if(mods["ctrl"] && mods["shift"])
		acquire_coordinates(targeted_atom, user)
		return TRUE

	if(mods["ctrl"] && !(mods["shift"]))
		acquire_target(targeted_atom, user)
		return TRUE

	return FALSE

/obj/item/device/binoculars/fire_support/on_set_interaction(mob/living/user)
	. = ..()
	user.reset_perspective(src)
	user.update_sight()
	user.client.click_intercept = src

/obj/item/device/binoculars/fire_support/on_unset_interaction(mob/living/user)
	. = ..()

	unset_target()

	if(!user?.client)
		return

	user.client.click_intercept = null
	user.reset_perspective(user)
	user.update_sight()

///Selects a firemode
/obj/item/device/binoculars/fire_support/proc/select_radial(mob/user)
	var/list/radial_options = list()
	for(var/fire_support_type in mode_list)
		if(!(mode_list[fire_support_type].fire_support_flags & FIRESUPPORT_AVAILABLE))
			continue
		radial_options[mode_list[fire_support_type].name] = image(icon = 'icons/mob/radial.dmi', icon_state = mode_list[fire_support_type].icon_state)

	var/mode_selected = show_radial_menu(user, src, radial_options, null, 48, null, TRUE, TRUE)
	for(var/option in mode_list)
		if(mode_list[option].name != mode_selected)
			continue
		mode = mode_list[option]
		user.balloon_alert(user, "[mode_selected] mode")
	update_icon()

///lases a target and calls fire support on it
/obj/item/device/binoculars/fire_support/proc/acquire_target(atom/target, mob/living/carbon/human/user)
	set waitfor = 0
	if(is_mainship_level(user.z))
		user.balloon_alert(user, "Can't use here")
		return
	if(faction && user.faction != faction)
		balloon_alert_to_viewers("Security locks engaged")
		return
	if(laser_overlay)
		to_chat(user, SPAN_WARNING("You're already targeting something."))
		return
	if(!bino_checks(target, user))
		return
	if(!can_see_target(target, user))
		balloon_alert_to_viewers("No clear view")
		return

	playsound(src, 'sound/effects/nightvision.ogg', 35)
	to_chat(user, SPAN_NOTICE("INITIATING LASER TARGETING. Stand still."))
	target_atom = target
	laser_overlay = image('icons/obj/items/weapons/projectiles.dmi', icon_state = "laser_target2", layer =- LASER_LAYER)
	target_atom.apply_fire_support_laser(laser_overlay)
	if(!do_after(user, target_acquisition_delay, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, user, BUSY_ICON_HOSTILE, extra_checks = CALLBACK(src, PROC_REF(can_see_target), target, user)))
		to_chat(user, SPAN_DANGER("You lose sight of your target!"))
		playsound(user,'sound/machines/click.ogg', 25, 1)
		unset_target()
		return
	if(!bino_checks(target, user))
		return
	if(!target_atom)
		return

	playsound(src, 'sound/effects/binoctarget.ogg', 35)
	mode.initiate_fire_support(get_turf(target_atom), user)
	fire_support_points -= mode.cost
	unset_target()

///Internal bino checks, mainly around firemode
/obj/item/device/binoculars/fire_support/proc/bino_checks(atom/target, mob/living/user)
	if(!mode)
		balloon_alert_to_viewers("Select a mode!")
		return FALSE
	if(!(mode.fire_support_flags & FIRESUPPORT_AVAILABLE))
		balloon_alert_to_viewers("[mode.name] unavailable")
		return FALSE
	if(mode.cooldown_timer)
		balloon_alert_to_viewers("On cooldown")
		return FALSE
	var/area/targ_area = get_area(target)
	if(targ_area.ceiling >= CEILING_UNDERGROUND_BLOCK_CAS)
		to_chat(user, SPAN_WARNING("DEPTH WARNING: Target too deep for ordnance."))
		return FALSE
	return TRUE

///Checks if we can draw LOS to the target
/obj/item/device/binoculars/fire_support/proc/can_see_target(atom/target, mob/living/user)
	if(QDELETED(target))
		return FALSE
	if(target.z != user.z)
		return FALSE
	if(!(user in viewers(zoom_offset + view_range + 1, target)))
		return FALSE
	return TRUE

///Unsets the target and cleans up
/obj/item/device/binoculars/fire_support/proc/unset_target()
	if(target_atom)
		target_atom.remove_fire_support_laser(laser_overlay)
		target_atom = null
	if(laser_overlay)
		QDEL_NULL(laser_overlay)

///Acquires coords of a target turf
/obj/item/device/binoculars/fire_support/proc/acquire_coordinates(atom/A, mob/living/carbon/human/user)
	var/turf/target_turf = get_turf(A)
	to_chat(user, SPAN_NOTICE("COORDINATES: LONGITUDE [target_turf.x]. LATITUDE [target_turf.y]."))
	playsound(src, 'sound/effects/binoctarget.ogg', 35)

///Sets a laser overlay for fire support binos
/atom/proc/apply_fire_support_laser(image/laser_overlay)
	overlays += (laser_overlay)

/mob/living/carbon/apply_fire_support_laser(image/laser_overlay)
	overlays_standing[LASER_LAYER] = laser_overlay
	apply_overlay(LASER_LAYER)

///Removes a laser overlay for fire support binos
/atom/proc/remove_fire_support_laser(image/laser_overlay)
	overlays -= laser_overlay

/mob/living/carbon/remove_fire_support_laser(image/laser_overlay)
	remove_overlay(LASER_LAYER)
