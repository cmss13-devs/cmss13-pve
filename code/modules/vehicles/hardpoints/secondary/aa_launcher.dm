/obj/item/hardpoint/secondary/towlauncher/aa
	name = "Vertical-Launch System Array"
	desc = "A hull-mounted vertical launch system for the M579 ADS-C, typically loaded with ground-to-air missiles, this one instead is capable of firing ground-to-ground missiles with devestating effect."

	icon_state = "vls_launcher"
	disp_icon = "apc"
	disp_icon_state = "vlslauncher"

	health = 2000
	firing_arc = 120

	allowed_seat = VEHICLE_GUNNER

	ammo = new /obj/item/ammo_magazine/hardpoint/towlauncher/aa
	max_clips = 1

	px_offsets = list(
		"1" = list(0, 0),
		"2" = list(0, 0),
		"4" = list(0, 0),
		"8" = list(0, 0)
	)

	muzzle_flash_pos = list(
		"1" = list(8, -1),
		"2" = list(-8, -16),
		"4" = list(5, -8),
		"8" = list(-5, 10)
	)

	scatter = 1
	fire_delay = 7.0 SECONDS

/obj/item/hardpoint/secondary/towlauncher/aa/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff)
	))

