// APC cannons
/obj/item/hardpoint/primary/dualcannon
	name = "\improper PARS-159 Boyars Dualcannon"
	desc = "A primary two-barrel cannon for the M577 APC that shoots telescoped 40mm IFF-compatible rounds."
	icon = 'icons/obj/vehicles/hardpoints/apc.dmi'

	icon_state = "dual_cannon"
	disp_icon = "apc"
	disp_icon_state = "dualcannon"
	activation_sounds = list('sound/weapons/vehicles/dual_autocannon_fire.ogg')

	damage_multiplier = 0.15

	health = 1500
	firing_arc = 60

	origins = list(0, 1)

	allowed_seat = VEHICLE_DRIVER

	ammo = new /obj/item/ammo_magazine/hardpoint/boyars_dualcannon
	max_clips = 2

	use_muzzle_flash = TRUE
	angle_muzzleflash = FALSE
	muzzleflash_icon_state = "muzzle_flash_double"

	muzzle_flash_pos = list(
		"1" = list(11, -35),
		"2" = list(-11, 16),
		"4" = list(-20, 9),
		"8" = list(20, 9)
	)

	scatter = 1
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = 0.3 SECONDS

/obj/item/hardpoint/primary/dualcannon/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff)
	))

/obj/item/hardpoint/primary/watercannon
	name = "watercannon"

	icon = 'icons/obj/vehicles/hardpoints/apc.dmi'

	icon_state = "dual_cannon"
	disp_icon = "apc"
	disp_icon_state = "dualcannon"
	activation_sounds = list('sound/weapons/vehicles/dual_autocannon_fire.ogg')

	damage_multiplier = 0.15

	health = 1500
	firing_arc = 60

	origins = list(0, 1)

	allowed_seat = VEHICLE_DRIVER

	ammo = new /obj/item/ammo_magazine/hardpoint/boyars_dualcannon
	max_clips = 2

	use_muzzle_flash = TRUE
	angle_muzzleflash = FALSE
	muzzleflash_icon_state = "muzzle_flash_double"

	muzzle_flash_pos = list(
		"1" = list(11, -35),
		"2" = list(-11, 16),
		"4" = list(-20, 9),
		"8" = list(20, 9)
	)

	scatter = 1
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = 0.3 SECONDS
	var/power = 48

/obj/item/hardpoint/primary/watercannon/handle_fire(atom/target, mob/living/user, params)
	var/turf/origin_turf = get_origin_turf()

	var/obj/effect/particle_effect/water/W = new /obj/effect/particle_effect/water(origin_turf)
	ammo.current_rounds--

	W.create_reagents(5)
	reagents.trans_to(W, 1)
	for(var/b in 0 to (7))
		step_towards(W, target)
		if (!W || QDELETED(W))
			return
		else if (!W.reagents || get_turf(W) == origin_turf)
			break
		W.reagents.reaction(get_turf(W))
		for(var/atom/atm in get_turf(W))
			if(!W)
				return
			if(!W.reagents)
				break
			W.reagents.reaction(atm)
			if(istype(atm, /obj/flamer_fire))
				var/obj/flamer_fire/FF = atm
				if((FF.firelevel > power) && (!FF.fire_variant)) //If fire_variant = 0, default fire extinguish behavior.
					FF.firelevel -= power
					FF.update_flame()
				else //See: aliens.dm acid extinguishing behavior for more variant cases if needed.
					qdel(atm)
				continue
			if(isliving(atm)) //For extinguishing mobs on fire
				var/mob/living/M = atm
				M.ExtinguishMob()
			if(iscarbon(atm) || istype(atm, /obj/structure/barricade))
				atm.extinguish_acid()
		origin_turf = get_turf(W)
		if(origin_turf == target)
			break
		sleep(2)
	qdel(W)
	if(use_muzzle_flash)
		muzzle_flash(Get_Angle(origin_turf, target))

	set_fire_cooldown(gun_firemode)

	return AUTOFIRE_CONTINUE