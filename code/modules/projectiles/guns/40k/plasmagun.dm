// Plasmagun

/obj/item/weapon/gun/plasmagun
	name = "\improper MK.IV Hiephan Pattern Plasmagun"
	desc = "The MK.IV Hiephan pattern plasmagun is a specialist weapon used by the Adeptus Astartes and the Imperial Guard. It is a high-powered energy weapon that fires superheated plasma bolts capable of melting through armor and flesh alike."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/uscm.dmi'
	icon_state = "plasmagun"
	item_state = "plasmagun"
	muzzleflash_iconstate  = "muzzle_flash_blue"
	muzzle_flash_color = COLOR_BLUE
	muzzle_flash_lum = 5
	w_class = SIZE_LARGE
	flags_equip_slot = SLOT_BACK|SLOT_SUIT_STORE
	unacidable = TRUE
	map_specific_decoration = FALSE
	indestructible = 1
	fire_sound = 'sound/weapons/gun_plasma.ogg'
	reload_sound = 'sound/weapons/handling/nsg23_reload.ogg'
	unload_sound = 'sound/weapons/handling/nsg23_unload.ogg'
	current_mag = /obj/item/ammo_magazine/plasmagun
	force = 12
	wield_delay = WIELD_DELAY_SLOW
	delay_style = WEAPON_DELAY_NO_FIRE
	actions_types = list(
		/datum/action/item_action/plasmagun/overcharge,
	)
	attachable_allowed = list(
	)
	flags_gun_features = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER
	flags_item = TWOHANDED
	var/datum/ammo/ammo_standard = /datum/ammo/energy/plasmagun
	var/datum/ammo/ammo_overcharged = /datum/ammo/energy/plasmagun/overcharged
	var/detonating = FALSE
	var/overcharged = FALSE

/obj/item/weapon/gun/plasmagun/Initialize(mapload, ...)
	ammo_standard = GLOB.ammo_list[ammo_standard] //Gun initialize calls replace_ammo() so we need to set these first.
	ammo_overcharged = GLOB.ammo_list[ammo_overcharged]
	ammo = ammo_standard
	. = ..()
	update_icon()

/obj/item/weapon/gun/plasmagun/Destroy()
	ammo_standard = null
	ammo_overcharged = null
	. = ..()

/obj/item/weapon/gun/plasmagun/load_into_chamber(mob/user)
	return ready_in_chamber()

/obj/item/weapon/gun/plasmagun/reload_into_chamber(mob/user)
	if(current_mag.current_rounds <= 0)
		playsound(src, empty_sound, 25, 1)
	return TRUE

/obj/item/weapon/gun/plasmagun/delete_bullet(obj/projectile/projectile_to_fire, refund = 0)
	if(!current_mag)
		return
	qdel(projectile_to_fire)
	if(refund)
		current_mag.current_rounds++
	return TRUE

/obj/item/weapon/gun/plasmagun/proc/make_powercell(mob/user, remaining_rounds = 0)
	if(!current_mag)
		return

	var/obj/item/ammo_magazine/plasmagun/cell = new current_mag.type()
	if(remaining_rounds <= 0)
		cell.current_rounds = 0
		user.put_in_hands(cell)
	else
		cell.current_rounds = remaining_rounds
		user.put_in_hands(cell)
	cell.update_icon()

/obj/item/weapon/gun/plasmagun/reload(mob/user, obj/item/ammo_magazine/plasmagun)
	if(!plasmagun || !istype(plasmagun) || !istype(src, plasmagun.gun_type))
		to_chat(user, SPAN_WARNING("That's not going to fit!"))
		return

	if(current_mag)
		to_chat(user, SPAN_WARNING("[src] is already loaded!"))
		return

	if(plasmagun.current_rounds <= 0)
		to_chat(user, SPAN_WARNING("That powerpack is empty!"))
		return

	else
		to_chat(user, SPAN_NOTICE("You begin reloading [src]. Hold still..."))
		if(do_after(user, 4, INTERRUPT_ALL, BUSY_ICON_FRIENDLY))
			user.drop_inv_item_on_ground(plasmagun)
			current_mag = plasmagun
			plasmagun.forceMove(src)
			replace_ammo(,plasmagun)
			to_chat(user, SPAN_NOTICE("You load the new powerpack into [src]."))
			playsound(user, reload_sound, 25, 1)
		else
			to_chat(user, SPAN_WARNING("Your reload was interrupted!"))
			return
	update_icon()
	return TRUE

/obj/item/weapon/gun/plasmagun/unload(mob/user, reload_override = 0)
	if(user && !current_mag)
		to_chat(user, SPAN_WARNING("[src] is already empty!"))
		return
	if(user && (current_mag != null))
		to_chat(user, SPAN_NOTICE("You unload [src]."))
		playsound(user, unload_sound, 25, 1)
		if(current_mag.current_rounds > 0)
			user.visible_message(SPAN_NOTICE("[user] unloads [current_mag] from [src]."),
			SPAN_NOTICE("You unload [current_mag] from [src]."))
			make_powercell(user, current_mag.current_rounds)
		if(current_mag.current_rounds <= 0)
			user.visible_message(SPAN_NOTICE("[user] unloads [current_mag] from [src]."),
			SPAN_NOTICE("You unload [current_mag] from [src]."))
			make_powercell(user, current_mag.current_rounds)
		current_mag = null
		update_icon()

/datum/action/item_action/plasmagun/overcharge/New(Target, obj/item/holder)
	. = ..()
	name = "Overcharge Mode"
	action_icon_state = "ammo_swap_normal"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/plasmagun/overcharge/action_activate()
	. = ..()
	var/obj/item/weapon/gun/plasmagun/G = holder_item
	G.overcharge(usr)

/datum/action/item_action/plasmagun/overcharge/proc/update_icon()
	var/obj/item/weapon/gun/plasmagun/G = holder_item
	if(G.ammo == G.ammo_standard)
		action_icon_state = "ammo_swap_normal"
	else if(G.ammo == G.ammo_overcharged)
		action_icon_state = "ammo_swap_pen"
	else
		action_icon_state = "ammo_swap_normal"
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/obj/item/weapon/gun/plasmagun/proc/overcharge(mob/user)
	if(ammo == ammo_standard)
		ammo = ammo_overcharged
		overcharged = TRUE
		to_chat(user, "[icon2html(src, usr)] You changed \the [src]'s firemode. You now fire overcharged projectiles. These rounds are highly destructive but take longer to recharge, and have the chance to overheat the weapon if fired too many times in a row.")
		balloon_alert(user, "firing overcharged")
		set_fire_delay(350)
	else
		ammo = ammo_standard
		overcharged = FALSE
		to_chat(user, "[icon2html(src, usr)] You changed \the [src]'s firemode. You now fire standard projectiles. These rounds takes less time to operate but hold less destructive potential.")
		balloon_alert(user, "firing standard")
		set_fire_delay(200)
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	var/obj/item/weapon/gun/plasmagun/TAT = locate(/datum/action/item_action/plasmagun/overcharge) in actions
	TAT.update_icon()

/obj/item/weapon/gun/plasmagun/replace_ammo()
	var/old_ammo = ammo
	..()
	if(old_ammo)
		ammo = old_ammo

/obj/item/weapon/gun/plasmagun/Fire(atom/target, mob/living/user, params, reflex, dual_wield)
	if(overcharged == TRUE && detonating == FALSE && prob(10))
		user.visible_message(SPAN_HIGHDANGER("The plasmagun begins to overheats, and projects deadly hot plasma into it's surroundings!"), SPAN_HIGHDANGER("You can feel the plasmagun in-hand begin to overheat. Uh oh..."))
		playsound(user, 'sound/weapons/gun_plasma_explode.ogg', 100, 1)
		addtimer(CALLBACK(src, PROC_REF(detonate), FALSE), 5 SECONDS)
		detonating = TRUE
	else
		return ..()

/obj/item/weapon/gun/plasmagun/proc/detonate(mob/living/user)
	var/datum/cause_data/cause_data = create_cause_data(initial(name), user)
	cell_explosion(loc, 60, 60, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
	detonating = FALSE

/obj/item/weapon/gun/plasmagun/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 39, "muzzle_y" = 17,"rail_x" = 11, "rail_y" = 21, "under_x" = 19, "under_y" = 14, "stock_x" = 19, "stock_y" = 14, "side_rail_x" = 23, "side_rail_y" = 17)

/obj/item/weapon/gun/plasmagun/set_gun_config_values()
	..()
	set_fire_delay(200)
	set_burst_amount(BURST_AMOUNT_TIER_1)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_6
	burst_scatter_mult = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_4

/obj/item/weapon/gun/plasmagun/pistol
	name = "\improper Yuvin MK.I Pattern Plasma pistol"
	icon_state = "plasmapistol"
	item_state = "plasmapistol"
	muzzle_flash_lum = 5
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_MEDIUM
	indestructible = 1
	current_mag = /obj/item/ammo_magazine/plasmagun
	force = 12
	wield_delay = WIELD_DELAY_VERY_FAST
	attachable_allowed = list(
	)
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_ONE_HAND_WIELDED|GUN_AMMO_COUNTER
	flags_item = null

/obj/item/weapon/gun/plasmagun/pistol/set_gun_config_values()
	..()
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_2

/obj/item/weapon/gun/plasmagun/pistol/Fire(atom/target, mob/living/user, params, reflex, dual_wield)
	if(overcharged == TRUE && detonating == FALSE && prob(100))
		user.visible_message(SPAN_HIGHDANGER("The plasmapistol begins to overheats, and projects deadly hot plasma into it's surroundings!"), SPAN_HIGHDANGER("You can feel the plasmagun in-hand begin to overheat. Uh oh..."))
		playsound(user, 'sound/weapons/gun_plasma_explode.ogg', 100, 1)
		addtimer(CALLBACK(src, PROC_REF(detonate), FALSE), 5 SECONDS)
		detonating = TRUE
	else
		return ..()
