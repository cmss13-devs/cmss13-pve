/datum/fire_support
	///Fire support name
	var/name = "misc firesupport"
	///icon_state for radial menu
	var/icon_state
	///define name of the firesupport, used for assoc
	var/fire_support_type
	///How frequently this canbe used
	var/cooldown_duration = 2 MINUTES
	///Holder for the cooldown timer
	var/cooldown_timer
	///Fire support point cost to call in
	var/cost = 1
	///Special behavior flags
	var/fire_support_flags = FIRESUPPORT_AVAILABLE
	///How far the fire support can land from the target turf
	var/scatter_range = 6
	///How many impacts per use
	var/impact_quantity = 1
	///Chat message when initiating fire support
	var/initiate_chat_message = "TARGET ACQUIRED. FIRE SUPPORT INBOUND."
	///screentext message when initiating fire support
	var/list/initiate_screen_message = list("fire support inbound")
	///Screentext message title
	var/initiate_title = "Falcon-1"
	///Portrait used for screentext message
	var/portrait_type = "pilot_green"
	///Initiating sound effect
	var/initiate_sound = 'sound/weapons/dropship_sonic_boom.ogg'
	///Delay between initiation and impact
	var/delay_to_impact = 4 SECONDS
	///visual when impact starts
	var/start_visual = /obj/effect/temp_visual/dropship_flyby
	///visual when impact starts, spawns for every turf impacted
	var/impact_start_visual = null
	///sound when impact starts
	var/start_sound = 'sound/weapons/fire_support/casplane_flyby.ogg'

/datum/fire_support/New()
	name = "[name] ([cost])"

///Enables the firesupport option
/datum/fire_support/proc/enable_firesupport()
	fire_support_flags |= FIRESUPPORT_AVAILABLE

///Disables the firesupport entirely
/datum/fire_support/proc/disable()
	fire_support_flags &= ~FIRESUPPORT_AVAILABLE

///Initiates fire support proc chain
/datum/fire_support/proc/initiate_fire_support(turf/target_turf, mob/user)
	if(!(fire_support_flags & FIRESUPPORT_AVAILABLE))
		to_chat(user, SPAN_NOTICE("FIRE SUPPORT UNAVAILABLE"))
		return
	addtimer(CALLBACK(src, PROC_REF(start_fire_support), target_turf), delay_to_impact)

	if(initiate_sound)
		playsound(target_turf, initiate_sound, 100)
	if(initiate_chat_message)
		to_chat(user, SPAN_NOTICE(initiate_chat_message))
	if(portrait_type && initiate_title && initiate_screen_message)
		user.play_screen_text("<span class='langchat' style=font-size:24pt;text-align:left valign='top'><u>[uppertext(name)]</u></span><br>" + pick(initiate_screen_message), new /atom/movable/screen/text/screen_text/potrait(null, null, initiate_title, 'icons/ui_icons/screen_alert_images.dmi', portrait_type))

///Actually begins the fire support attack
/datum/fire_support/proc/start_fire_support(turf/target_turf)
	cooldown_timer = addtimer(VARSET_CALLBACK(src, cooldown_timer, null), cooldown_duration, TIMER_STOPPABLE)
	select_target(target_turf)

	if(start_visual)
		new start_visual(target_turf)
	if(start_sound)
		playsound(target_turf, start_sound, 100)

///Selects the final target turf(s) and calls impact procs
/datum/fire_support/proc/select_target(turf/target_turf)
	var/list/turf_list = RANGE_TURFS(scatter_range, target_turf)
	for(var/i = 1 to impact_quantity)
		var/turf/impact_turf = pick(turf_list)
		if(impact_start_visual)
			new impact_start_visual(impact_turf)
		addtimer(CALLBACK(src, PROC_REF(do_impact), impact_turf), 0.15 SECONDS * i)

///The actual impact of the fire support
/datum/fire_support/proc/do_impact(turf/target_turf)
	return
