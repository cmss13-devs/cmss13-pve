#define BELL_TOWER_RANGE 4
#define BELL_TOWER_EFFECT 6
#define BELL_TOWER_COOLDOWN 1 SECONDS

/obj/structure/machinery/defenses/bell_tower/md/radio
	name = "M313-P MOTION TOWER"
	desc = "A tactical, stationary version of the motion detector. Also has installed radio reciever."
	icon_state = "md_port"
	icon = 'void-marines/icons/port_md.dmi'
	handheld_type = /obj/item/defenses/handheld/bell_tower/md_radio
	var/obj/item/device/motiondetector/internal/no_debuff/mdr
	defense_type = "MD"

	var/code = ""
	var/serial_number = 0

/obj/structure/machinery/defenses/bell_tower/md/radio/Initialize()
	. = ..()

	code = pick("TANGO","CHARLIE","FOXTROT","GAMMA","BETA","ALPHA","BRAVO","WHISKEY","EPSILON","DELTA","VODKA")
	serial_number = rand(1,500)
	name = "M313-P MOTION TOWER:UNIT-[serial_number]-[code]"

/obj/structure/machinery/defenses/bell_tower/md/radio/update_icon()
	return

/obj/item/defenses/handheld/bell_tower/md_radio
	name = "handheld M313-P motion tower"
	icon = 'void-marines/icons/port_md.dmi'
	icon_state = "md_port_handheld"
	flags_equip_slot = SLOT_BACK
	defense_type = /obj/structure/machinery/defenses/bell_tower/md/radio

/obj/item/device/motiondetector/internal/no_debuff
	name = "internal motion detector"
	detector_range = 12

	var/obj/structure/machinery/defenses/bell_tower/md/radio/linked_tower2

/obj/item/device/motiondetector/internal/no_debuff/apply_debuff(mob/target)
	return

/*	var/mob/living/to_apply = target
	if(istype(to_apply))
		sound_to(to_apply, 'sound/items/detector.ogg')*/

/obj/structure/machinery/defenses/bell_tower/md/radio/setup_tripwires()
	clear_tripwires()
	for(var/turf/T in orange(BELL_TOWER_RANGE, loc))
		var/obj/effect/bell_tripwire/md/FE = new /obj/effect/bell_tripwire/md(T, faction_group)
		FE.linked_bell2 = src
		tripwires_placed += FE

	mdr = new(src)
	mdr.linked_tower2 = src
	mdr.iff_signal = LAZYACCESS(faction_group, 1)
	mdr.toggle_active(null, FALSE)

	if(!mdr.iff_signal)
		mdr.iff_signal = FACTION_MARINE

/obj/structure/machinery/defenses/bell_tower/md/radio/clear_tripwires()
	for(var/obj/effect/bell_tripwire/md/FE in tripwires_placed)
		qdel(FE)

/obj/effect/bell_tripwire/md
	var/silent = FALSE
	// radio which broadcasts updates
	var/obj/item/device/radio/marine/transceiver = new /obj/item/device/radio/marine
	// the hidden mob which voices updates
	var/mob/living/voice = new /mob/living/silicon
	var/obj/structure/machinery/defenses/bell_tower/md/radio/linked_bell2

/obj/effect/bell_tripwire/md/Initialize()
	. = ..()
	transceiver.forceMove(src)
	transceiver.set_frequency(SENTRY_FREQ)
	transceiver.config(list(RADIO_CHANNEL_SENTRY=1))
	transceiver.subspace_transmission = TRUE
	voice.name = "MT UNIT-[linked_bell2.serial_number]-[linked_bell2.code]"
	voice.forceMove(src)

/obj/effect/bell_tripwire/md/Destroy()
	if(linked_bell2)
		linked_bell2.tripwires_placed -= src
		linked_bell2 = null
	. = ..()

/obj/effect/bell_tripwire/md/Crossed(atom/movable/A)
	var/areaname = get_area(linked_bell2)

	if(!linked_bell2)
		qdel(src)
		return

	if(!iscarbon(A))
		return

	var/mob/living/carbon/M = A
	if(M.get_target_lock(faction))
		return

	var/list/turf/path = getline2(src, linked_bell2, include_from_atom = TRUE)
	for(var/turf/PT in path)
		if(PT.density)
			return

	if(linked_bell2.last_mob_activated == M)
		return

	if(linked_bell2.bell_cooldown > world.time)
		return

	linked_bell2.last_mob_activated = M

	// Clear last mob after 4 times the length of the cooldown timer, about 6 seconds
	addtimer(CALLBACK(linked_bell2, TYPE_PROC_REF(/obj/structure/machinery/defenses/bell_tower/md/radio, clear_last_mob_activated)), 4 * BELL_TOWER_COOLDOWN, TIMER_UNIQUE|TIMER_OVERRIDE)

	linked_bell2.mob_crossed(M)
	var/message = "MT UNIT-[linked_bell2.serial_number]-[linked_bell2.code]: MOVEMENT DETECTED IN [areaname]."
	INVOKE_ASYNC(src, PROC_REF(send_message), message)
	linked_bell2.bell_cooldown = world.time + BELL_TOWER_COOLDOWN //1.5s cooldown between RINGS

/obj/effect/bell_tripwire/md/proc/send_message(message)
	if(!silent && transceiver)
		transceiver.talk_into(voice, "[message]", RADIO_CHANNEL_SENTRY)
		voice.say(message)

#undef BELL_TOWER_RANGE
#undef BELL_TOWER_EFFECT
#undef BELL_TOWER_COOLDOWN
