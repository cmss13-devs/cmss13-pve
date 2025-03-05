/****************************************/
/*
			CRSPR Flamer
*/
/****************************************/

/obj/item/weapon/gun/flamer/drg_driller_flamer
	name = "\improper CRSPR Flamethrower"
	desc = "The CRSPR Flamethrower is the Driller's default primary weapon. It is a combat-ready flamethrower which gets its fuel from large tanks inserted into a cage on the side."
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "crspr"
	item_state = "crspr_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)

	force = MELEE_FORCE_NORMAL
	flags_atom = FPRINT|NOBLOODY|CONDUCT

	unload_sound = 'void-marines/sound/drg/FlameThrowerReloadC_1.ogg'
	reload_sound = 'void-marines/sound/drg/FlameThrowerReloadB_1.ogg'

	attachable_allowed = list()

/obj/item/weapon/gun/flamer/drg_driller_flamer/gun_safety_handle(mob/user)
	to_chat(user, SPAN_NOTICE("You [SPAN_BOLD(flags_gun_features & GUN_TRIGGER_SAFETY ? "extinguish" : "ignite")] the pilot lights."))
	playsound(user, 'void-marines/sound/drg/FlameThrowerFireTailCombinedA_1.ogg', 25, 1)
	update_icon()

/obj/item/weapon/gun/flamer/drg_driller_flamer/update_icon()
	..()

	// Have to redo this here because we don't want the empty sprite when the tank is empty (just when it's not in the gun)
	var/new_icon_state = base_gun_icon
	if(has_empty_icon && !current_mag)
		new_icon_state += "_e"
	icon_state = new_icon_state

	if(!(flags_gun_features & GUN_TRIGGER_SAFETY))
		var/image/I = image('icons/obj/items/weapons/guns/guns_by_faction/uscm.dmi', src, "+lit")
		I.pixel_x -= 1
		I.pixel_y -= 3
		overlays += I

/obj/item/weapon/gun/flamer/drg_driller_flamer/get_fire_sound()
	var/list/fire_sounds = list(
							'void-marines/sound/drg/FlameThrowerFireTailCombinedB_1.ogg',
							'void-marines/sound/drg/FlameThrowerFireTailCombinedB_2.ogg',
							'void-marines/sound/drg/FlameThrowerFireTailCombinedB_3.ogg',
							'void-marines/sound/drg/FlameThrowerFireTailCombinedB_4.ogg')
	return pick(fire_sounds)
