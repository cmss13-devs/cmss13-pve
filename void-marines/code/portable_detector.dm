/obj/structure/machinery/defenses/bell_tower/md/radio
	name = "R-1NG/S MOTION TOWER"
	desc = "A tactical advanced version of the motion detector. Also has installed radio reciever."
	icon_state = "md_port"
	icon = 'void-marines/icons/port_md.dmi'
	handheld_type = /obj/item/defenses/handheld/bell_tower/md
	var/obj/item/device/motiondetector/internal/no_debuff/mdr
	defense_type = "MD"

	/// if the laptop should announce events on radio, for live server testing
	var/silent = FALSE

	// radio which broadcasts updates
	var/obj/item/device/radio/marine/transceiver = new /obj/item/device/radio/marine
	// the hidden mob which voices updates
	var/mob/living/voice = new /mob/living/silicon

/obj/structure/machinery/defenses/bell_tower/md/radio/update_icon()
	return

/obj/item/defenses/handheld/bell_tower/md_radio
	name = "handheld R-1NG/S motion tower"
	icon = 'void-marines/icons/port_md.dmi'
	icon_state = "md_port_handheld"
	defense_type = /obj/structure/machinery/defenses/bell_tower/md/radio

/obj/item/device/motiondetector/internal/no_debuff
	name = "internal motion detector"
	detector_range = 12

/obj/item/device/motiondetector/internal/no_debuff/apply_debuff(mob/target)
	var/mob/living/to_apply = target
	if(istype(to_apply))
		sound_to(to_apply, 'sound/items/detector.ogg')

/obj/structure/machinery/defenses/bell_tower/md/radio/setup_tripwires(obj/structure/machinery/defenses/bell_tower/md/radio/mdradio)
	var/displayname = mdradio.name
	var/areaname = get_area(mdradio)
	mdr = new(src)
	mdr.linked_tower = src
	mdr.iff_signal = LAZYACCESS(faction_group, 1)
	mdr.toggle_active(null, FALSE)
	var/message = "[displayname]: MOVEMENT DETECTED IN [areaname]."
	INVOKE_ASYNC(src, PROC_REF(send_message), message)

	if(!mdr.iff_signal)
		mdr.iff_signal = FACTION_MARINE

/obj/structure/machinery/defenses/bell_tower/md/radio/proc/send_message(message)
	if(!silent && transceiver)
		transceiver.talk_into(voice, "[message]", RADIO_CHANNEL_SENTRY)
		voice.say(message)