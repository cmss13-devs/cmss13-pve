/obj/item/hardpoint/primary/flamer
	name = "\improper DRG-N Offensive Flamer Unit"
	desc = "A primary weapon for the tank that spews out high-combustion napalm in a wide radius. The fuel burns intensely and quickly, which allows for it to be used offensively by armoured vehicles."

	icon_state = "drgn_flamer"
	disp_icon = "tank"
	disp_icon_state = "drgn_flamer"
	activation_sounds = list(
		'sound/weapons/gun_flamethrower1.ogg',
		'sound/weapons/gun_flamethrower2.ogg',
		'sound/weapons/gun_flamethrower3.ogg',
	)

	health = 2000
	firing_arc = 90

	ammo = new /obj/item/ammo_magazine/hardpoint/primary_flamer
	max_clips = 1

	px_offsets = list(
		"1" = list(0, 21),
		"2" = list(0, -32),
		"4" = list(32, 1),
		"8" = list(-32, 1)
	)

	use_muzzle_flash = FALSE

	scatter = 5
	fire_delay = 0.1 SECONDS
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	COOLDOWN_DECLARE(fire_sound_cooldown)

/obj/item/hardpoint/primary/flamer/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff)
	))

/obj/item/hardpoint/primary/flamer/try_fire(atom/target, mob/living/user, params)
	if(get_turf(target) in owner.locs)
		to_chat(user, SPAN_WARNING("The target is too close."))
		return NONE

	return ..()

/obj/item/hardpoint/primary/flamer/play_firing_sounds()
	if(!COOLDOWN_FINISHED(src, fire_sound_cooldown))
		return
	COOLDOWN_START(src, fire_sound_cooldown, 1 SECONDS)
	playsound(get_turf(src), pick(activation_sounds), 60)

/obj/item/hardpoint/primary/flamer/start_fire(datum/source, atom/object, turf/location, control, params)
	. = ..()
	if(try_fire(object, source, params))
		playsound(get_turf(src), 'sound/weapons/flamethrower_start.ogg', 60)

/obj/item/hardpoint/primary/flamer/stop_fire()
	. = ..()
	playsound(get_turf(src), 'sound/weapons/flamethrower_complete.ogg', 60)
