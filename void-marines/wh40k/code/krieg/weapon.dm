
/obj/item/weapon/gun/lasgun/lucius
	name = "Lucius-pattern Lasgun"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "luciuslas"
	item_state = "lasgun"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/wh40k/icons/lefthand_guns.dmi',
		WEAR_R_HAND = 'void-marines/wh40k/icons/righthand_guns.dmi'
	)

	w_class = SIZE_LARGE
	current_mag = /obj/item/ammo_magazine/rifle/lascell

	fire_sound = 'void-marines/wh40k/sounds/weapons/lasgun2.ogg'
	reload_sound = 'void-marines/wh40k/sounds/weapons/smg_magin.ogg'
	unload_sound = 'void-marines/wh40k/sounds/weapons/smg_magout.ogg'
	cocked_sound = null

	muzzle_flash = "muzzle_las"
	muzzle_flash_icon = 'void-marines/wh40k/icons/weapon/projectiles.dmi'
	muzzle_flash_lum = 4
	muzzle_flash_color = "#ff3333"

	aim_slowdown = SLOWDOWN_ADS_RIFLE
	flags_gun_features = GUN_AMMO_COUNTER|GUN_ANTIQUE
	gun_category = GUN_CATEGORY_RIFLE

/obj/item/weapon/gun/warhammer/lucius/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_11)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil = RECOIL_OFF


/obj/item/ammo_magazine/rifle/lascell
	name = "\improper lasgun guncell"
	desc = "An guncell for lasgun."
	caliber = "energy"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "lasmag_100"
	w_class = SIZE_SMALL
	transfer_handful_amount = 0
	default_ammo = /datum/ammo/bullet/rifle/laser
	max_rounds = 45
	gun_type = /obj/item/weapon/gun/lasgun/lucius

/datum/ammo/bullet/rifle/laser
	name = "lasbolt"
	icon = 'void-marines/wh40k/icons/weapon/projectiles.dmi'
	icon_state = "lasbolt"

	damage_type = BURN
	flags_ammo_behavior = AMMO_ENERGY
	shrapnel_chance = 0
	damage = 45
	accurate_range = 24
	penetration = ARMOR_PENETRATION_TIER_10
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_NONE
	shell_speed = AMMO_SPEED_TIER_6
	penetration = 25
	effective_range_max = 15
	damage_falloff = DAMAGE_FALLOFF_TIER_1
	max_range = 30

/obj/item/weapon/gun/shotgun/pump/kriegshotgun
	name = "Lucius Pattern Shotgun"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "kriegshotgun_loaded"
	current_mag = /obj/item/ammo_magazine/internal/shotgun/krieg

// There is no more SPECIAL shotgun, so we will make our type.

/obj/item/ammo_magazine/internal/shotgun/krieg
	name = "shotgun tube"
	desc = "An internal magazine. It is not supposed to be seen or removed."
	default_ammo = /datum/ammo/bullet/shotgun/buckshot/special
	caliber = "12g"
	max_rounds = 7
	current_rounds = 0
	chamber_closed = 0
