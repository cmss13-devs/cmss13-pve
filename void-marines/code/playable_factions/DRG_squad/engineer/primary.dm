/****************************************/
/*
			'Warthog' shotgun
*/
/****************************************/

/obj/item/weapon/gun/drg_engineer_shotgun
	name = "\improper 'Warthog' Auto 210"
	desc = "The 'Warthog' Auto 210 is a primary weapon for the Engineer. It is a sleek and powerful semi-automatic shotgun (its pump-action mechanism is only used to cycle the action during a reload) that performs best at close range, though it is serviceable at mid to long range."
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "warthog"
	item_state = "warthog_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)
	has_empty_icon = FALSE // TODO: needs empty sprites

	w_class = SIZE_LARGE
	force = MELEE_FORCE_NORMAL
	flags_atom = FPRINT|NOBLOODY|CONDUCT

	current_mag = /obj/item/ammo_magazine/drg_engineer_shotgun

	fire_sound = 'void-marines/sound/drg/CombatShotgunCombinedA_03.ogg'
	reload_sound = 'void-marines/sound/drg/scout_smg_reload.wav'

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_SHOTGUN

	aim_slowdown = SLOWDOWN_ADS_SHOTGUN
	wield_delay = WIELD_DELAY_NORMAL //Shotguns are as hard to pull up as a rifle. They're quite bulky afterall

	start_automatic = TRUE
	start_semiauto = FALSE

	fire_delay_group = list(FIRE_DELAY_GROUP_SHOTGUN)

	starting_attachment_types = list(/obj/item/attachable/stock/drg_engineer_shotgun)
	attachable_allowed = list(/obj/item/attachable/stock/drg_engineer_shotgun)

/obj/item/weapon/gun/drg_engineer_shotgun/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_10
	scatter = SCATTER_AMOUNT_TIER_6
	burst_scatter_mult = SCATTER_AMOUNT_TIER_8
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_4
	recoil_unwielded = RECOIL_AMOUNT_TIER_2

/obj/item/weapon/gun/drg_engineer_shotgun/set_gun_attachment_offsets()
	attachable_offset = list("stock_x" = 11, "stock_y" = 15)

/*
	Ammo magazine / bullets
*/
/obj/item/ammo_magazine/drg_engineer_shotgun
	name = "\improper 'Warthog' buckshot drum (12g)"
	desc = "A 12g automatic shotgun drum magazine."
//	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "m56d_drum" // TODO: make an icon
	default_ammo = /datum/ammo/bullet/shotgun/buckshot
	caliber = "12g"
	gun_type = /obj/item/weapon/gun/drg_engineer_shotgun
	max_rounds = 12
	w_class = SIZE_MEDIUM
	handful_state = "buckshot_shell"
	transfer_handful_amount = 5

/obj/item/ammo_magazine/drg_engineer_shotgun/update_icon(round_diff = 0)
	if(current_rounds <= 0)
		add_to_garbage(src) // TODO: make an empty sprite
	else if(current_rounds - round_diff <= 0)
		icon_state = base_mag_icon
		item_state = base_mag_item
	if(iscarbon(loc))
		var/mob/living/carbon/C = loc
		if(C.r_hand == src)
			C.update_inv_r_hand()
		else if(C.l_hand == src)
			C.update_inv_l_hand()
	if(ammo_band_color && ammo_band_icon)
		update_ammo_band()

/obj/item/ammo_magazine/drg_engineer_shotgun/slug
	name = "\improper 'Warthog' slug drum (12g)"
	default_ammo = /datum/ammo/bullet/shotgun/slug
	handful_state = "slug_shell"

/*
	Stock attachment
*/
/obj/item/attachable/stock/drg_engineer_shotgun
	name = "\improper 'Warthog' skeletal stock"
	desc = "A sturdy, light and reliable stock."
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "warthog_stock"
	wield_delay_mod = WIELD_DELAY_SLOW
	hud_offset_mod = 6

/obj/item/attachable/stock/drg_engineer_shotgun/New()
	..()
	accuracy_mod = HIT_ACCURACY_MULT_TIER_4
	recoil_mod = -RECOIL_AMOUNT_TIER_5
	scatter_mod = -SCATTER_AMOUNT_TIER_10
	burst_scatter_mod = -SCATTER_AMOUNT_TIER_8
	movement_onehanded_acc_penalty_mod = -MOVEMENT_ACCURACY_PENALTY_MULT_TIER_5
	accuracy_unwielded_mod = HIT_ACCURACY_MULT_TIER_1
	recoil_unwielded_mod = -RECOIL_AMOUNT_TIER_5
	scatter_unwielded_mod = -SCATTER_AMOUNT_TIER_10
