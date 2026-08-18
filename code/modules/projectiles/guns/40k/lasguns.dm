// Lasguns - Basic

/obj/item/weapon/gun/lasgun
	name = "\improper M36 Kantrael Pattern Lasgun"
	desc = "The M36 Kantrael lasgun is one of if not the most common lasgun pattern within the reaches of the Imperium. Used by the likes of the Cadians before being used by the rest of the galaxy, it can be seen in the hands of a guardsman, a traitor and even the lowest scum."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/uscm.dmi'
	icon_state = "lasgun"
	item_state = "lasgun"
	muzzleflash_iconstate  = "muzzle_flash_red"
	muzzle_flash_color = COLOR_RED
	muzzle_flash_lum = 3
	w_class = SIZE_LARGE
	flags_equip_slot = SLOT_BACK|SLOT_SUIT_STORE
	unacidable = TRUE
	map_specific_decoration = FALSE
	indestructible = 1
	fire_sound = 'sound/weapons/lasgun_fire.ogg'
	reload_sound = 'sound/weapons/handling/nsg23_reload.ogg'
	unload_sound = 'sound/weapons/handling/nsg23_unload.ogg'
	current_mag = /obj/item/ammo_magazine/lasgun
	force = 12
	wield_delay = WIELD_DELAY_NORMAL
	flags_gun_features = GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_CAN_POINTBLANK
	flags_item = TWOHANDED

	var/obj/effect/ebeam/lasgun_beam_type = /obj/effect/ebeam/laser/lasgun
	///world.time value, to prevent a lightshow without actually firing
	var/beam_cooldown = 0
	///Delay before another beam can start again, in tenths of seconds
	var/beam_delay = 10

	attachable_allowed = list(
		/obj/item/attachable/sling,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/lasersight,
	)
	start_automatic = TRUE

/obj/item/weapon/gun/lasgun/load_into_chamber(mob/user)
	return ready_in_chamber()

/obj/item/weapon/gun/lasgun/reload_into_chamber(mob/user)
	if(current_mag.current_rounds <= 0)
		playsound(src, empty_sound, 25, 1)
	return TRUE

/obj/item/weapon/gun/lasgun/delete_bullet(obj/projectile/projectile_to_fire, refund = 0)
	if(!current_mag)
		return
	qdel(projectile_to_fire)
	if(refund)
		current_mag.current_rounds++
	return TRUE

/obj/item/weapon/gun/lasgun/proc/make_battery_drum(mob/user, remaining_rounds = 0)
	if(!current_mag)
		return

	var/obj/item/ammo_magazine/lasgun/cell = new current_mag.type()
	if(remaining_rounds <= 0)
		cell.current_rounds = 0
		user.put_in_hands(cell)
	else
		cell.current_rounds = remaining_rounds
		user.put_in_hands(cell)
	cell.update_icon()

/obj/item/weapon/gun/lasgun/reload(mob/user, obj/item/ammo_magazine/lasgun)
	if(!lasgun || !istype(lasgun) || !istype(src, lasgun.gun_type))
		to_chat(user, SPAN_WARNING("That's not going to fit!"))
		return

	if(current_mag)
		to_chat(user, SPAN_WARNING("[src] is already loaded!"))
		return

	if(lasgun.current_rounds <= 0)
		to_chat(user, SPAN_WARNING("That powerpack is empty!"))
		return

	else
		to_chat(user, SPAN_NOTICE("You begin reloading [src]."))
		if(do_after(user, 0, INTERRUPT_ALL, BUSY_ICON_FRIENDLY))
			user.drop_inv_item_on_ground(lasgun)
			current_mag = lasgun
			lasgun.forceMove(src)
			replace_ammo(,lasgun)
			to_chat(user, SPAN_NOTICE("You load the new powerpack into [src]."))
			playsound(user, reload_sound, 25, 1)
		else
			to_chat(user, SPAN_WARNING("Your reload was interrupted!"))
			return
	update_icon()
	return TRUE

/obj/item/weapon/gun/lasgun/unload(mob/user, reload_override = 0)
	if(user && !current_mag)
		to_chat(user, SPAN_WARNING("[src] is already empty!"))
		return
	if(user && (current_mag != null))
		to_chat(user, SPAN_NOTICE("You unload [src]."))
		playsound(user, unload_sound, 25, 1)
		if(current_mag.current_rounds > 0)
			user.visible_message(SPAN_NOTICE("[user] unloads [current_mag] from [src]."),
			SPAN_NOTICE("You unload [current_mag] from [src]."))
			make_battery_drum(user, current_mag.current_rounds)
		if(current_mag.current_rounds <= 0)
			user.visible_message(SPAN_NOTICE("[user] unloads [current_mag] from [src]."),
			SPAN_NOTICE("You unload [current_mag] from [src]."))
			make_battery_drum(user, current_mag.current_rounds)
		current_mag = null
		update_icon()

/obj/item/weapon/gun/lasgun/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_6)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_7)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_6
	burst_scatter_mult = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5


/obj/item/weapon/gun/lasgun/handle_fire(atom/target, mob/living/user, params, reflex = FALSE, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)

	var/datum/beam/lasgun_beam
	if(!current_mag)
		click_empty(user)
		return
	if(current_mag.current_rounds <= 0)
		return
	lasgun_beam = target.beam(user, "las_beam", 'icons/effects/beam.dmi', time = 0.4 SECONDS, maxdistance = 30, beam_type = lasgun_beam_type, always_turn = TRUE)
	animate(lasgun_beam.visuals, alpha = 255, time = 0.4 SECONDS, color = COLOR_RED, luminosity = 3 , easing = SINE_EASING|EASE_OUT)
	. = ..()

/obj/item/weapon/gun/lasgun/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 23, "under_y" = 13, "stock_x" = 24, "stock_y" = 14, "side_rail_x" = 23, "side_rail_y" = 16)

/obj/item/weapon/gun/lasgun/laspistol
	name = "\improper Accatran pattern Mk.III Laspistol"
	desc = "The MK.III Accatran laspistol is a common sidearm for the Imperium's officers and NCOs. It is relitively weak compared to the lasgun, but is still a deadly weapon in the right hands."
	icon_state = "laspistol"
	item_state = "laspistol"
	muzzle_flash_lum = 2
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_MEDIUM
	indestructible = 1
	current_mag = /obj/item/ammo_magazine/lasgun/laspistol
	fire_sound = 'sound/weapons/laspistol_fire.ogg'
	force = 12
	wield_delay = WIELD_DELAY_VERY_FAST
	attachable_allowed = list(
	)
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_ONE_HAND_WIELDED|GUN_AMMO_COUNTER
	flags_item = null

	beam_cooldown = 0
	beam_delay = 10

	attachable_allowed = list(
		/obj/item/attachable/lasersight,
	)
	start_automatic = FALSE

/obj/item/weapon/gun/lasgun/laspistol/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 18,"rail_x" = 12, "rail_y" = 23, "under_x" = 23, "under_y" = 13, "stock_x" = 24, "stock_y" = 14, "side_rail_x" = 23, "side_rail_y" = 16)

/obj/item/weapon/gun/lasgun/laspistol/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_8)
	set_burst_amount(BURST_AMOUNT_TIER_1)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/lasgun/heretic

	desc = "The M36 Kantrael lasgun is one of if not the most common lasgun pattern within the reaches of the Imperium. Used by the likes of the Cadians before being used by the rest of the galaxy, it can be seen in the hands of a guardsman, a traitor and even the lowest scum. This one specifically has been cobbled together by a traitor."
	icon_state = "lasgun_heretic"
	item_state = "lasgun_heretic"

/obj/item/weapon/gun/lasgun/heretic/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_7)
	accuracy_mult = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_6
	burst_scatter_mult = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/lasgun/laspistol/heretic

	desc = "The MK.III Accatran laspistol is a common sidearm for the Imperium's officers and NCOs. It is relitively weak compared to the lasgun, but is still a deadly weapon in the right hands. This one has been painted black and is often seen use by traitor forces."
	icon_state = "laspistol_heretic"
	item_state = "laspistol_heretic"

/obj/item/weapon/gun/lasgun/laspistol/heretic/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_6)
	set_burst_amount(BURST_AMOUNT_TIER_1)
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/lasgun/hellgun

	name = "\improper UTI-48 Pattern Light Hellgun"
	desc = "The UTI-48 Pattern Light Hellgun is an uncommon hellgun pattern that, instead of using a backpack-based charging system, uses charge packs similar to standard lasguns, though it is still a hellgun and has the same destructive power as a standard hellgun. It is mainly seen in the hands of elite Imperial Guard units."
	icon_state = "hellgun"
	item_state = "hellgun"
	current_mag = /obj/item/ammo_magazine/lasgun/hellgun

	attachable_allowed = list(
		/obj/item/attachable/hellgunbarrel,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/scope/hellgun,
	)
	starting_attachment_types = list(
		/obj/item/attachable/hellgunbarrel,
		/obj/item/attachable/scope/hellgun,
	)

/obj/item/weapon/gun/lasgun/hellgun/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 16,"rail_x" = 16, "rail_y" = 17, "under_x" = 23, "under_y" = 13, "stock_x" = 24, "stock_y" = 14, "side_rail_x" = 23, "side_rail_y" = 16)

/obj/item/weapon/gun/lasgun/hellgun/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_7)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_8)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_6
	burst_scatter_mult = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/lasgun/volleygun

	name = "\improper UTI-49 Pattern Light Volleygun"
	desc = "The UTI-49 Pattern Light Volleygun is an uncommon volleygun pattern that, instead of using a backpack-based charging system, uses charge packs similar to standard lasguns, though it is still a volleygun and has the same destructive power as a standard volleygun. It is mainly seen in the hands of Imperial Guard units."
	icon_state = "volleygun"
	current_mag = /obj/item/ammo_magazine/lasgun/volleygun
	start_automatic = TRUE

	attachable_allowed = list(
		/obj/item/attachable/volleygunbarrel,
	)
	starting_attachment_types = list(
		/obj/item/attachable/volleygunbarrel,
	)

/obj/item/weapon/gun/lasgun/volleygun/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_10)
	set_burst_amount(BURST_AMOUNT_TIER_1)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_6
	burst_scatter_mult = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/lasgun/volleygun/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 48, "muzzle_y" = 16,"rail_x" = 12, "rail_y" = 23, "under_x" = 23, "under_y" = 13, "stock_x" = 24, "stock_y" = 14, "side_rail_x" = 23, "side_rail_y" = 16)
