/obj/item/weapon/gun/shotgun/drg_scout_boomstick
	name = "Jury-Rigged Boomstick"
	desc = "You take a shotgun and cut it in half. You're left with a light handcannon that handles like a large pistol and has the stopping power of an 18-wheeler loaded with watermelons. A true classic."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
	icon_state = "cshotgun"
	item_state = "cshotgun"
	gauge = "8g"
	aim_slowdown = SLOWDOWN_ADS_QUICK

	fire_sound = 'void-marines/sound/drg/sawn_off.ogg'
	current_mag = /obj/item/ammo_magazine/internal/shotgun/drg_scout_boomstick

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_INTERNAL_MAG

/obj/item/weapon/gun/shotgun/drg_scout_boomstick/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0)
		load_into_chamber()

/obj/item/weapon/gun/shotgun/drg_scout_boomstick/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_10)
	accuracy_mult = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_8
	scatter = SCATTER_AMOUNT_TIER_6
	burst_scatter_mult = SCATTER_AMOUNT_TIER_4
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_3
	recoil_unwielded = RECOIL_AMOUNT_TIER_1

/obj/item/weapon/gun/shotgun/drg_scout_boomstick/get_examine_text(mob/user)
	. = ..()
	if(in_chamber) . += "It has a chambered round."

/obj/item/ammo_magazine/internal/shotgun/drg_scout_boomstick
	caliber = "8g"

	default_ammo = /datum/ammo/bullet/shotgun/heavy/buckshot/special
	max_rounds = 1
