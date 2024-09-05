/****************************************/
/*
		    Grappling Hook
*/
/****************************************/

/obj/item/weapon/gun/drg_scout_hook
	name = "\improper grappling hook"
	desc = "The ultimate explorer's tool - this self-recharging grappling hook will get you out of any sticky situation, and onto any distant ledge. Handle with care - ending up dangling from the ceiling and then dropping 60 feet onto the floor is not covered by the employee insurance."

	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "bulldog"
	item_state = "bulldog_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)

	w_class = SIZE_LARGE
	force = MELEE_FORCE_WEAK

	flags_atom = NOBLOODY|CONDUCT
	flags_item = null

	fire_sound = 'void-marines/sound/drg/GrapplingGunFireCombined_01.ogg'
	flags_gun_features = GUN_UNUSUAL_DESIGN


	muzzle_flash = null
	ammo = /datum/ammo/drg_scout_hook

	traits_to_give = list()
	attachable_allowed = list()

	var/hook_delay = 3 SECONDS

/obj/item/weapon/gun/drg_scout_hook/set_gun_config_values()
	set_fire_delay(hook_delay)
	scatter = SCATTER_AMOUNT_NONE
	scatter_unwielded = SCATTER_AMOUNT_NONE
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_OFF

/obj/item/weapon/gun/drg_scout_hook/load_into_chamber()
	in_chamber = create_bullet(ammo, initial(name))
	return in_chamber

/obj/item/weapon/gun/drg_scout_hook/has_ammunition()
	return TRUE

/obj/item/weapon/gun/drg_scout_hook/reload_into_chamber()
	update_icon()
	return TRUE

/obj/item/weapon/gun/drg_scout_hook/delete_bullet(obj/projectile/projectile_to_fire, refund = 0)
	return TRUE

/*
	Ammo magazine / bullets
*/
/datum/ammo/drg_scout_hook
	name = "grappling hook"
	icon_state = null
	sound_bounce = 'sound/weapons/Genhit.ogg'
	ping = null

	flags_ammo_behavior = AMMO_HITS_TARGET_TURF|AMMO_IGNORE_COVER|AMMO_SKIPS_ALIENS

	accuracy = HIT_ACCURACY_TIER_MAX
	scatter = HIT_ACCURACY_TIER_MAX
	shell_speed = AMMO_SPEED_TIER_5

	max_range = 8

	var/grapple_speed = SPEED_AVERAGE
	var/grapple_range = INFINITY

/datum/ammo/drg_scout_hook/on_bullet_generation(obj/projectile/generated_projectile, mob/bullet_generator)
	. = ..()
	generated_projectile.bound_beam = generated_projectile.beam(generated_projectile.firer, "wire", 'icons/effects/beam.dmi')

	var/image/hook_overlay = new(icon = 'icons/obj/items/weapons/projectiles.dmi', icon_state = "SpearFlight", layer = BELOW_MOB_LAYER)
	generated_projectile.overlays += hook_overlay

/datum/ammo/drg_scout_hook/proc/grapple(atom/A, obj/projectile/P)
	var/mob/living/firer = P.firer
	if(!istype(firer))
		return

	playsound(firer, 'void-marines/sound/drg/GatlingGunslingMiddleA_1.ogg', 50, TRUE)
	firer.AdjustStun(2 SECONDS, TRUE)

	firer.throw_atom(get_turf(A), grapple_range, grapple_speed, firer, FALSE, HIGH_LAUNCH, PASS_MOB_IS)

	playsound(firer, 'void-marines/sound/drg/GatlingGunslingStopA_1.ogg', 50, TRUE)
	firer.AdjustStun(-2 SECONDS, TRUE)

/datum/ammo/drg_scout_hook/on_hit_turf(turf/T, obj/projectile/P)
	if(T.density)
		T = get_step(T, get_dir(T, P))

	grapple(T, P)

/datum/ammo/drg_scout_hook/on_hit_mob(mob/M, obj/projectile/P, mob/user)
	grapple(M, P)

/datum/ammo/drg_scout_hook/on_hit_obj(obj/O, obj/projectile/P)
	if(O.anchored)
		grapple(O, P)
		return

	var/atom/firer = P.firer

	playsound(firer, 'void-marines/sound/drg/GatlingGunslingMiddleA_1.ogg', 50, TRUE)

	qdel(P.bound_beam)
	P.overlays.Cut()

	P.bound_beam = firer.beam(O, "wire", 'icons/effects/beam.dmi')
	O.throw_atom(firer, grapple_range, grapple_speed, firer, FALSE, HIGH_LAUNCH, PASS_MOB_IS)

	playsound(firer, 'void-marines/sound/drg/GatlingGunslingStopA_1.ogg', 50, TRUE)
