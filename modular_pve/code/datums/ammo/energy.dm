//fukken laser beams


//rxf-m5 eva pistol
/datum/ammo/energy/laserpistol
	name = "pistol laser"
	icon_state = "laser_new"
	flags_ammo_behavior = AMMO_BALLISTIC
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 35
	damage_type = BURN
	penetration = -ARMOR_PENETRATION_TIER_1
	accurate_range = 10
	effective_range_max = 4
	max_range = 20
	shell_speed = AMMO_SPEED_TIER_HITSCAN
	scatter = SCATTER_AMOUNT_TIER_8
	accuracy = HIT_ACCURACY_MULT_TIER_6
	damage_falloff = DAMAGE_FALLOFF_TIER_1
	ammo_glowing = TRUE
	bullet_light_color = COLOR_RED

