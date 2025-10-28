/obj/item/hardpoint/primary/arc_frontalcannon
	name = "\improper Bleihagel RE-RE850 Frontal Rotary Cannon"
	desc = "A peculiar turret with two 20mm rotary cannons strapped to the front of it."
	icon = 'icons/obj/vehicles/hardpoints/arc.dmi'

	icon_state = "autocannon"
	disp_icon = "arc"
	disp_icon_state = "autocannon"
	activation_sounds = list('sound/weapons/gun_smartgun1.ogg', 'sound/weapons/gun_smartgun2.ogg', 'sound/weapons/gun_smartgun3.ogg')

	damage_multiplier = 0.15

	health = 2000
	firing_arc = 120

	allowed_seat = VEHICLE_DRIVER

	ammo = new /obj/item/ammo_magazine/hardpoint/m56_cupola/frontal_cannon
	max_clips = 2

	use_muzzle_flash = TRUE
	angle_muzzleflash = FALSE
	muzzleflash_icon_state = "muzzle_flash_double"

	muzzle_flash_pos = list(
		"1" = list(1, 11),
		"2" = list(1, -36),
		"4" = list(23, 3),
		"8" = list(-23, 3)
	)

	scatter = 1
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = 0.05 SECONDS
