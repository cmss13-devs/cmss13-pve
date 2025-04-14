//Space santa outfit suit
/obj/item/clothing/head/helmet/space/santahat
	name = "Santa's hat"
	desc = "Ho ho ho. Merrry X-mas!"
	icon_state = "santa_hat_red"
	flags_inventory = NOPRESSUREDMAGE|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEYES
	flags_armor_protection = BODY_FLAG_HEAD

/obj/item/clothing/head/helmet/space/santahat/green
	icon_state = "santa_hat_green"

/obj/item/clothing/suit/space/santa
	name = "Santa's suit"
	desc = "Festive!"
	icon_state = "santa"
	item_state = "santa"
	slowdown = 0
	allowed = list(/obj/item) //for stuffing extra special presents

/obj/item/clothing/head/helmet/marine/pressure
	name = "\improper pressure helmet"
	desc = "A heavy space helmet."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_1.dmi'
	)
	light_range = 6
	light_power = 0.8
	item_state = "pressure_white"
	icon_state = "pressure_white"
	blood_overlay_type = "helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	flags_inventory = COVEREYES|COVERMOUTH|NOPRESSUREDMAGE|BLOCKSHARPOBJ|PROTECTFROMWEATHER|BYPASSFORINJECTOR|ALLOWINTERNALS
	flags_inv_hide = HIDETOPHAIR
	flags_atom = FPRINT|CONDUCT|NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	flags_cold_protection = BODY_FLAG_HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROT
	flags_heat_protection = BODY_FLAG_HEAD
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROT
	actions_types = list(/datum/action/item_action/toggle)
	clothing_traits = list(TRAIT_EAR_PROTECTION)
	time_to_unequip = 20
	time_to_equip = 20
	var/helmet_color = "white"
	var/toggleable = TRUE
	var/can_be_broken = TRUE
	var/breaking_sound = 'sound/handling/click_2.ogg'

/obj/item/clothing/head/helmet/marine/pressure/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/head/helmet/marine/pressure/update_icon()
	. = ..()
	if(light_on)
		icon_state = "pressure_[helmet_color]_[light_on]"
		item_state = "pressure_[helmet_color]_[light_on]"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)

/obj/item/clothing/head/helmet/marine/pressure/attack_self(mob/user)
	. = ..()

	if(!toggleable)
		to_chat(user, SPAN_WARNING("You cannot toggle [src] on or off."))
		return FALSE

	if(!isturf(user.loc))
		to_chat(user, SPAN_WARNING("You cannot turn the light [light_on ? "off" : "on"] while in [user.loc].")) //To prevent some lighting anomalies.
		return FALSE

	turn_light(user, !light_on)

/obj/item/clothing/head/helmet/marine/pressure/turn_light(mob/user, toggle_on)

	. = ..()
	if(. != CHECKS_PASSED)
		return

	set_light_on(toggle_on)

	update_icon()

	if(user == loc)
		user.update_inv_head()

	for(var/datum/action/current_action as anything in actions)
		current_action.update_button_icon()

	if(!toggle_on)
		playsound(src, 'sound/handling/click_2.ogg', 50, 1)

	playsound(src, 'sound/handling/suitlight_on.ogg', 50, 1)
	update_icon(user)

/obj/item/clothing/head/helmet/marine/pressure/attack_alien(mob/living/carbon/xenomorph/attacking_xeno)

	if(!can_be_broken)
		return

	if(turn_light(attacking_xeno, toggle_on = FALSE) != CHECKS_PASSED)
		return

	if(!breaking_sound)
		return

	playsound(loc, breaking_sound, 25, 1)

/obj/item/clothing/suit/space/pressure
	name = "\improper pressure suit"
	desc = "A heavy, bulky civilian space suit, fitted with armored plates."
	icon = 'icons/obj/items/clothing/cm_suits.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/suit_1.dmi'
	)
	item_state = "pressure_white"
	icon_state = "pressure_white"
	blood_overlay_type = "suit"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	time_to_unequip = 50
	time_to_equip = 50
	flags_inventory = BLOCKSHARPOBJ|NOPRESSUREDMAGE|BYPASSFORINJECTOR|PROTECTFROMWEATHER
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROT
	siemens_coefficient = 0.1
	breach_vulnerability = SPACESUIT_BREACH_STANDARD
	actions_types = list(/datum/action/item_action/spacesuit/toggle_motion_detector)
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/prop/prop_gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/attachable/bayonet,
		/obj/item/storage/backpack/general_belt,
		/obj/item/storage/large_holster/machete,
		/obj/item/storage/belt/gun/type47,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/smartpistol,
		/obj/item/storage/belt/gun/flaregun,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
		/obj/item/storage/belt/gun/m39,
		/obj/item/storage/belt/utility,
		/obj/item/storage/belt/gun/utility,
	)
	var/obj/item/device/motiondetector/spacesuit/MD

/obj/item/clothing/suit/space/pressure/Initialize()
	. = ..()
	MD = new(src)

/obj/item/clothing/suit/space/pressure/Destroy()
	QDEL_NULL(MD)
	. = ..()

//Delay of long mode with range of short mode
/obj/item/device/motiondetector/spacesuit
	detector_mode = MOTION_DETECTOR_LONG
	detector_range = 7
	blip_type = "tracker"
	idle_sound_volume = 20

/obj/item/device/motiondetector/spacesuit/get_user()
	if(ishuman(loc.loc))
		return loc.loc

/obj/item/device/motiondetector/spacesuit
	iff_signal = FACTION_COLONIST


/datum/action/item_action/spacesuit/toggle_motion_detector/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Motion Detector"
	action_icon_state = "motion_detector"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/spacesuit/toggle_motion_detector/action_activate()
	. = ..()
	var/obj/item/clothing/suit/space/pressure/space_suit = holder_item
	space_suit.toggle_motion_detector(usr)

/datum/action/item_action/spacesuit/toggle_motion_detector/proc/update_icon()
	if(!holder_item)
		return
	var/obj/item/clothing/suit/space/pressure/space_suit = holder_item
	if(space_suit.MD.active)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/obj/item/clothing/suit/space/pressure/proc/toggle_motion_detector(mob/user)
	MD.active = !MD.active
	if(MD.active)
		START_PROCESSING(SSfastobj, MD)
	else
		STOP_PROCESSING(SSfastobj, MD)
	to_chat(user, "[icon2html(src, usr)] You [MD.active? "<B>enable</b>" : "<B>disable</b>" ] \the [src]'s motion detector.")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	var/datum/action/item_action/spacesuit/toggle_motion_detector/TMD = locate(/datum/action/item_action/spacesuit/toggle_motion_detector) in actions
	TMD.update_icon()
/*
/obj/item/clothing/suit/space/pressure/process()
	if(proximity.active)
		recycletime--
		if(!recycletime)
			recycletime = initial(recycletime)
			MD.refresh_blip_pool()

		long_range_cooldown--
		if(long_range_cooldown)
			return
		long_range_cooldown = initial(long_range_cooldown)
		MD.scan()
	..()*/

/obj/item/clothing/head/helmet/marine/pressure/orange
	item_state = "pressure_orange"
	icon_state = "pressure_orange"
	helmet_color = "orange"
/obj/item/clothing/suit/space/pressure/orange
	item_state = "pressure_orange"
	icon_state = "pressure_orange"

/obj/item/clothing/head/helmet/marine/pressure/yellow
	item_state = "pressure_yellow"
	icon_state = "pressure_yellow"
	helmet_color = "yellow"

/obj/item/clothing/suit/space/pressure/yellow
	item_state = "pressure_yellow"
	icon_state = "pressure_yellow"

/obj/item/clothing/head/helmet/marine/pressure/cyan
	item_state = "pressure_cyan"
	icon_state = "pressure_cyan"
	helmet_color = "cyan"

/obj/item/clothing/suit/space/pressure/cyan
	item_state = "pressure_cyan"
	icon_state = "pressure_cyan"

/obj/item/clothing/head/helmet/marine/pressure/red
	item_state = "pressure_red"
	icon_state = "pressure_red"
	helmet_color = "red"

/obj/item/clothing/suit/space/pressure/red
	item_state = "pressure_red"
	icon_state = "pressure_red"

/obj/item/clothing/suit/space/pressure/dark
	item_state = "pressure_dark"
	icon_state = "pressure_dark"

/obj/item/clothing/head/helmet/space/pressure/uscm/New()
	new /obj/item/clothing/head/helmet/space/pressure(loc)
	qdel(src)

/obj/item/clothing/head/helmet/marine/pressure/uscm
	name = "\improper USCM MK.35 pressure helmet"
	desc = "A heavy space helmet, designed to be coupled with the MK.35 pressure suit utilized by the United States Colonial Marines and a few other American or UA organizations. Feels like you could hotbox in here."
	item_state = "pressure_uscm"
	icon_state = "pressure_uscm"
	helmet_color = "uscm"

/obj/item/clothing/suit/space/pressure/uscm
	name = "\improper USCM MK.35 pressure suit"
	desc = "A heavy, bulky military-grade space suit utilized by the United States Colonial Marines and a few other American or UA organizations."
	item_state = "pressure_uscm"
	icon_state = "pressure_uscm"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	valid_accessory_slots = list(ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_PAINT)
	restricted_accessory_slots = list(ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_PAINT)
	flags_inventory = BLOCKSHARPOBJ|NOPRESSUREDMAGE|BYPASSFORINJECTOR|SMARTGUN_HARNESS|PROTECTFROMWEATHER
	breach_vulnerability = SPACESUIT_BREACH_COMBAT

/obj/item/clothing/suit/space/pressure/uscm/Initialize()
	. = ..()
	MD.iff_signal = FACTION_MARINE

/obj/item/clothing/head/helmet/marine/pressure/upp
	name = "\improper UPPAC Sokol-KV2 pressure helmet"
	desc = "A heavy space helmet, designed to be coupled with the Sokol-KV2 pressure suit utilized by the Union of Progressive Peoples Armed Collective and a few other UPP organizations."
	item_state = "pressure_upp"
	icon_state = "pressure_upp"
	helmet_color = "upp"
	built_in_visors = list(new /obj/item/device/helmet_visor/upp)

/obj/item/clothing/suit/space/pressure/upp
	name = "\improper UPPAC Sokol-KV2 pressure suit"
	desc = "A heavy, bulky military-grade space suit utilized by the Union of Progressive Peoples Armed Collective and a few other UPP organizations."
	item_state = "pressure_upp"
	icon_state = "pressure_upp"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	valid_accessory_slots = list(ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_PAINT)
	restricted_accessory_slots = list(ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_PAINT)
	flags_inventory = BLOCKSHARPOBJ|NOPRESSUREDMAGE|BYPASSFORINJECTOR|SMARTGUN_HARNESS|PROTECTFROMWEATHER
	breach_vulnerability = SPACESUIT_BREACH_COMBAT

/obj/item/clothing/suit/space/pressure/upp/Initialize()
	. = ..()
	MD.iff_signal = FACTION_UPP
// Souto man

/obj/item/clothing/suit/space/souto
	name = "\improper Souto Man tank top"
	desc = "The tank top worn by Souto Man. As fresh as a nice can of Souto Classic!"
	item_state = "souto_man"
	icon_state = "souto_man"
	armor_melee = CLOTHING_ARMOR_HARDCORE
	armor_bullet = CLOTHING_ARMOR_HARDCORE
	armor_laser = CLOTHING_ARMOR_HARDCORE
	armor_energy = CLOTHING_ARMOR_HARDCORE
	armor_bomb = CLOTHING_ARMOR_HARDCORE
	armor_bio = CLOTHING_ARMOR_HARDCORE
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_HARDCORE
	flags_inventory = CANTSTRIP|BLOCKSHARPOBJ
	unacidable = TRUE
	flags_inv_hide = null
	slowdown = 0

/obj/item/clothing/head/helmet/space/souto
	name = "\improper Souto Man hat"
	desc = "The hat worn by Souto Man. As tall as the new 24oz cans of Souto Lime!"
	item_state = "souto_man"
	icon_state = "souto_man"
	armor_melee = CLOTHING_ARMOR_HARDCORE
	armor_bullet = CLOTHING_ARMOR_HARDCORE
	armor_laser = CLOTHING_ARMOR_HARDCORE
	armor_energy = CLOTHING_ARMOR_HARDCORE
	armor_bomb = CLOTHING_ARMOR_HARDCORE
	armor_bio = CLOTHING_ARMOR_HARDCORE
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_HARDCORE
	flags_inventory = CANTSTRIP|COVEREYES|COVERMOUTH|ALLOWINTERNALS|ALLOWREBREATH|BLOCKGASEFFECT|ALLOWCPR|BLOCKSHARPOBJ
	unacidable = TRUE
	flags_inv_hide = null
