/datum/fire_support
	///Fire support name
	var/name = "misc firesupport"
	///icon_state for radial menu
	var/icon_state
	///faction the fire support would belong to
	var/faction = FACTION_MARINE
	///define name of the firesupport, used for assoc
	var/fire_support_type
	///How frequently this can be used
	var/cooldown_duration = 2 MINUTES
	///Holder for the cooldown timer
	var/cooldown_timer
	///Fire support point cost to call in
	var/cost = 1
	///Special behavior flags
	var/fire_support_flags
	///The type of firer of the fire support, used to change callsigns
	var/fire_support_firer
	///How far the fire support can land from the target turf
	var/scatter_range = 6
	///How many impacts per use
	var/impact_quantity = 1
	///How much delay between impacts
	var/impact_delay = 0.15 SECONDS
	///How much delay between visual effect of impacts
	var/visual_impact_delay = 0.15 SECONDS
	///Chat message when initiating fire support
	var/initiate_chat_message = "TARGET ACQUIRED. FIRE SUPPORT INBOUND."
	///screentext message when initiating fire support
	var/list/initiate_screen_message = list("fire support inbound")
	///Screentext message title
	var/initiate_title = "Falcon-1"
	///Portrait used for screentext message
	var/portrait_type = "pilot_3_green"
	///Initiating sound effect
	var/initiate_sound = 'sound/weapons/dropship_sonic_boom.ogg'
	///Delay between initiation and impact
	var/delay_to_impact = 4 SECONDS
	///visual when initiated
	var/initiate_visual = null
	///visual when impact starts
	var/start_visual = /obj/effect/temp_visual/dropship_flyby
	///visual for every impact
	var/impact_start_visual = null
	///sound when impact starts
	var/start_sound = 'sound/weapons/fire_support/casplane_flyby.ogg'
	///sound per impact
	var/impact_sound = null

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

	if(initiate_visual)
		new initiate_visual(target_turf)
	if(initiate_sound)
		playsound(target_turf, initiate_sound, 100)
	if(initiate_chat_message)
		to_chat(user, SPAN_NOTICE(initiate_chat_message))
	if(!(MODE_HAS_TOGGLEABLE_FLAG(MODE_DISABLE_FS_PORTRAIT)))
		if(portrait_type && initiate_title && initiate_screen_message)
			var/list/alert_receivers = list()
			var/picked_screen_message = pick(initiate_screen_message)
			for(var/mob/living/carbon/human/human as anything in GLOB.alive_human_list)
				if(human.faction == user.faction)
					alert_receivers += human
			alert_receivers += GLOB.observer_list
			for(var/mob/mob_receiver in alert_receivers)
				playsound_client(mob_receiver.client, 'sound/effects/radiostatic.ogg', 35, channel = CHANNEL_ANNOUNCEMENTS)
				mob_receiver.play_screen_text("<span class='langchat' style=font-size:24pt;text-align:left valign='top'><u>[uppertext(name)]</u></span><br>" + picked_screen_message, new /atom/movable/screen/text/screen_text/potrait/faster(null, null, initiate_title, 'icons/ui_icons/screen_alert_images.dmi', portrait_type))

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
		addtimer(CALLBACK(src, PROC_REF(do_impact), impact_turf), impact_delay * i)
		addtimer(CALLBACK(src, PROC_REF(do_impact_effect), impact_turf), visual_impact_delay * i)

///The actual impact of the fire support
/datum/fire_support/proc/do_impact(turf/target_turf)
	return

/datum/fire_support/proc/do_impact_effect(turf/target_turf)
	if(impact_sound)
		playsound(target_turf, impact_sound, 100, 1)
	if(impact_start_visual)
		new impact_start_visual(target_turf)
	return
