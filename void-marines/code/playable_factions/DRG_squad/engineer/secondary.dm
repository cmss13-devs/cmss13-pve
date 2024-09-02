/****************************************/
/*
			40mm PGL launcher
*/
/****************************************/

/obj/item/weapon/gun/launcher/grenade/m81/m79/drg_engineer_launcher
	name = "\improper Deepcore 40mm PGL"
	desc = "Whoever coined the phrase 'Bang for the Buck' must have had this lovely thing in mind. Cheap, dependable, and utterly devastating."
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "deepcorepgl"
	item_state = "deepcorepgl_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)
	flags_equip_slot = SLOT_BACK
	preload = /obj/item/explosive/grenade/high_explosive/drg_engineer_launcher
	is_lobbing = TRUE
	actions_types = list(/datum/action/item_action/toggle_firing_level)

	fire_sound = 'void-marines/sound/drg/engineer_launcher_shot.wav'
	cocked_sound = 'void-marines/sound/drg/engineer_launcher_open.ogg'
	reload_sound = 'void-marines/sound/drg/engineer_launcher_load.ogg'
	unload_sound = 'void-marines/sound/drg/engineer_launcher_unload.ogg'

	attachable_allowed = list()

/obj/item/weapon/gun/launcher/grenade/m81/m79/drg_engineer_launcher/handle_starting_attachment()
	return

/*
	Ammo magazine / bullets
*/
/obj/item/explosive/grenade/high_explosive/drg_engineer_launcher
	name = "heavy-duty 40mm grenade"
	desc = "High explosive direct-hit munitions."
	icon_state = "grenade_40mm_he"
	item_state = "grenade_40mm_he_active"
	explosion_falloff = 35
	explosion_power = 150
	det_time = 0 // Unused, because we don't use prime.
	hand_throwable = FALSE

/obj/item/explosive/grenade/high_explosive/drg_engineer_launcher/prime()
// We don't prime, we use launch_impact.

/obj/item/explosive/grenade/high_explosive/drg_engineer_launcher/launch_impact(atom/hit_atom)
	..()
	var/detonate = TRUE
	if(isobj(hit_atom) && !rebounding)
		detonate = FALSE
	if(isturf(hit_atom) && hit_atom.density && !rebounding)
		detonate = FALSE
	if(active && detonate) // Active, and we reached our destination
		if(shrapnel_count)
			create_shrapnel(loc, shrapnel_count, , ,shrapnel_type, cause_data)
		apply_explosion_overlay()
		cell_explosion(loc, explosion_power, explosion_falloff, falloff_mode, null, cause_data)
		qdel(src)
