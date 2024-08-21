/obj/item/weapon/gun/drg/deepcoregk2
	name = "DeepCore GK2"
	desc = "A dependable, hefty weapon. Usually not the first choice of proper Dwarves, but the combination of heft, weight, and satisfying boom makes it worthwhile all the same."

	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "deepcoregk2"
	item_state = "deepcoregk2_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)

	pickup_sound = "gunequip"
	drop_sound = "gunrustle"
	pickupvol = 7
	dropvol = 15

	w_class = SIZE_LARGE
	force = 10
	flags_atom = NOBLOODY|CONDUCT
	flags_item = TWOHANDED

	current_mag = /obj/item/ammo_magazine/rifle/drg/deepcoregk2

	fire_sound = 'void-marines/sound/drg/scout_smg_twoshot.wav'
	reload_sound = 'void-marines/sound/drg/scout_smg_reload.wav'
	unload_sound = 'sound/weapons/handling/smg_unload.ogg'
	cocked_sound = 'sound/weapons/gun_cocked2.ogg'

	movement_onehanded_acc_penalty_mult = 4
	wield_delay = WIELD_DELAY_VERY_FAST

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_AMMO_COUNTER
	gun_category = GUN_CATEGORY_RIFLE

	start_automatic = TRUE

/obj/item/weapon/gun/drg/deepcoregk2/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/drg/deepcoregk2/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_9)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	set_burst_amount(BURST_AMOUNT_TIER_1)
	scatter_unwielded = SCATTER_AMOUNT_TIER_8
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_AMOUNT_TIER_4

/obj/item/ammo_magazine/rifle/drg/deepcoregk2
	name = "\improper DeepCore GK2 magazine (10x24mm)"
	desc = "A 10x24mm assault rifle magazine."
	caliber = "10x24mm"
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "deepcoregk2_mag"
	item_state = "generic_mag"
	w_class = SIZE_MEDIUM
	default_ammo = /datum/ammo/bullet/rifle/drg/deepcoregk2
	max_rounds = 30
	gun_type = /obj/item/weapon/gun/drg/deepcoregk2

/obj/item/ammo_magazine/rifle/drg/deepcoregk2/marker
	name = "\improper DeepCore GK2 marker magazine (10x24mm)"
	desc = "A 10x24mm assault rifle magazine, fit with little spy-bugs."
	default_ammo = /datum/ammo/bullet/rifle/drg/deepcoregk2/marker
	icon_state = "deepcoregk2_marker_mag"

/datum/ammo/bullet/rifle/drg/deepcoregk2
	name = "rifle bullet"

	damage = 35
	accurate_range = 24
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = AMMO_SPEED_TIER_5
	effective_range_max = 12
	damage_falloff = DAMAGE_FALLOFF_TIER_1
	max_range = 30

/datum/ammo/bullet/rifle/drg/deepcoregk2/marker
	damage = 15

/datum/ammo/bullet/rifle/drg/deepcoregk2/marker/on_hit_mob(mob/M, obj/projectile/P)
	. = ..()
	if(!M.marked_creature)
		M.mark_mob()
