//-------------------------------------------------------
//Imperial Guard Rocket Launcher

/obj/item/weapon/gun/launcher/rocket/imperial
	name = "\improper Locke Pattern rocket launcher"
	desc = "The Locke Pattern rocket launcher is a variant of the missile launcher that fires unguided, self-proppeled projectiles, and used mainly by the Imperial Guard forces across the Imperium."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/uscm.dmi'
	icon_state = "imperial_launcher"
	item_state = "imperial_launcher"
	skill_locked = FALSE
	current_mag = /obj/item/ammo_magazine/rocket/imperial

	attachable_allowed = list(/obj/item/attachable/imperial_launcher_breech)

	flags_gun_features = GUN_WIELDED_FIRING_ONLY

	flags_item = TWOHANDED

/obj/item/weapon/gun/launcher/rocket/imperial/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 38, "muzzle_y" = 18,"rail_x" = 6, "rail_y" = 19, "under_x" = 19, "under_y" = 14, "stock_x" = -6, "stock_y" = 16, "special_x" = 37, "special_y" = 16)

/obj/item/weapon/gun/launcher/rocket/imperial/handle_starting_attachment()
	..()
	var/obj/item/attachable/imperial_launcher_breech/S = new(src)
	S.flags_attach_features &= ~ATTACH_REMOVABLE
	S.Attach(src)
	update_attachables()

	var/obj/item/attachable/scope/mini/army/scope = new(src)
	scope.hidden = TRUE
	scope.flags_attach_features &= ~ATTACH_REMOVABLE
	scope.Attach(src)
	update_attachable(scope.slot)

/obj/item/weapon/gun/launcher/rocket/imperial/apply_bullet_effects(obj/projectile/projectile_to_fire, mob/user, i = 1, reflex = 0)
	. = ..()
	if(!HAS_TRAIT(user, TRAIT_EAR_PROTECTION) && ishuman(user))
		return

	var/backblast_loc = get_turf(get_step(user.loc, turn(user.dir, 180)))
	smoke.set_up(1, 0, backblast_loc, turn(user.dir, 180))
	smoke.start()
	playsound(src, 'sound/weapons/gun_rocketlauncher.ogg', 100, TRUE, 10)
	for(var/mob/living/carbon/C in backblast_loc)
		if(C.body_position == STANDING_UP && !HAS_TRAIT(C, TRAIT_EAR_PROTECTION))
			C.apply_damage(15, BRUTE)
			C.apply_effect(4, STUN)
			C.apply_effect(6, STUTTER)
			C.emote("pain")

/obj/item/weapon/gun/launcher/rocket/imperial/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY_ID("vehicles", /datum/element/bullet_trait_damage_boost, 10, GLOB.damage_boost_vehicles),
	))
