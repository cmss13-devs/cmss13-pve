/obj/item/clothing/suit/marine/medium/rto/md
	name = "\improper XM4 pattern intelligence officer armor"
	specialty = "XM4 pattern intel"
	desc = "Tougher than steel, quieter than whispers, the XM4 Intel Armor provides capable protection combined with an experimental integrated motion tracker. It took an R&D team a weekend to develop and costs more than the Chinook Station... probably."
	desc_lore = "ARMAT Perfection. The XM4 Soldier Awareness System mixes M4-style hard armor and a distributed series of motion sensors clipped onto the breastplate. When connected to any HUD optic, it replicates the effects of an M314 Motion Detector unit, increasing user situational awareness. It is currently undergoing field trials by intelligence operatives."
	/// XM4 Integral Motion Detector Ability
	actions_types = list(/datum/action/item_action/toggle, /datum/action/item_action/intel/toggle_motion_detector)
	var/motion_detector = FALSE
	var/obj/item/device/motiondetector/xm4/proximity
	var/long_range_cooldown = 2
	var/recycletime = 120

/obj/item/clothing/suit/marine/medium/rto/md/Initialize(mapload, ...)
	. = ..()
	proximity = new(src)
	update_icon()

/obj/item/clothing/suit/marine/medium/rto/md/Destroy()
	QDEL_NULL(proximity)
	return ..()

/datum/action/item_action/intel/action_activate()
	. = ..()
	if(!ishuman(owner))
		return

/datum/action/item_action/intel/update_button_icon()
	return

/datum/action/item_action/intel/toggle_motion_detector/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Motion Detector"
	action_icon_state = "motion_detector"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/intel/toggle_motion_detector/action_activate()
	. = ..()
	var/obj/item/clothing/suit/marine/medium/rto/md/recon = holder_item
	recon.toggle_motion_detector(owner)

/datum/action/item_action/intel/toggle_motion_detector/proc/update_icon()
	if(!holder_item)
		return
	var/obj/item/clothing/suit/marine/medium/rto/md/recon = holder_item
	if(recon.motion_detector)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/obj/item/clothing/suit/marine/medium/rto/md/process()
	if(!motion_detector)
		STOP_PROCESSING(SSobj, src)
	if(motion_detector)
		recycletime--
		if(!recycletime)
			recycletime = initial(recycletime)
			proximity.refresh_blip_pool()
		long_range_cooldown--
		if(long_range_cooldown)
			return
		long_range_cooldown = initial(long_range_cooldown)
		proximity.scan()

/obj/item/clothing/suit/marine/medium/rto/md/proc/toggle_motion_detector(mob/user)
	to_chat(user,SPAN_NOTICE("You [motion_detector? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s motion detector."))
	if(!motion_detector)
		playsound(loc,'sound/items/detector_turn_on.ogg', 25, 1)
	else
		playsound(loc,'sound/items/detector_turn_off.ogg', 25, 1)
	motion_detector = !motion_detector
	var/datum/action/item_action/intel/toggle_motion_detector/TMD = locate(/datum/action/item_action/intel/toggle_motion_detector) in actions
	TMD.update_icon()
	motion_detector()

/obj/item/clothing/suit/marine/medium/rto/md/proc/motion_detector()
	if(motion_detector)
		START_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)

/obj/item/clothing/suit/marine/medium/rto/md/army
	name = "\improper XM4 pattern 'battlefield-awareness' armor"
	desc = "The XM4 experimental armor provides capable protection combined with an experimental integrated motion tracker."
	desc_lore = "ARMAT Perfection. The XM4 Soldier Awareness System mixes M4-style hard armor and a distributed series of motion sensors clipped onto the breastplate. When connected to any HUD optic, it replicates the effects of an M314 Motion Detector unit, increasing user situational awareness. It is currently undergoing field trials by intelligence operatives and those whose duties detract from constant situational awareness."
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/suit/marine/medium/rto/md/army/Initialize(mapload, ...)
	. = ..()
	proximity = new(src)
	var/obj/item/clothing/accessory/pads/groin/crotchplate = new()
	src.attach_accessory(null, crotchplate, TRUE)
	var/obj/item/clothing/accessory/pads/greaves/shinguards = new()
	src.attach_accessory(null, shinguards, TRUE)
	var/obj/item/clothing/accessory/pads/shoulderpads = new()
	src.attach_accessory(null, shoulderpads, TRUE)
	var/obj/item/clothing/accessory/pads/bracers/armguards = new()
	src.attach_accessory(null, armguards, TRUE)
	var/obj/item/clothing/accessory/pads/kneepads/knees = new()
	src.attach_accessory(null, knees, TRUE)
	update_icon()
