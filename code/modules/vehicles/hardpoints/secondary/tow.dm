/obj/item/hardpoint/secondary/towlauncher
	name = "\improper TOW Launcher"
	desc = "A secondary weapon for tanks that shoots rockets"

	icon_state = "tow_launcher"
	disp_icon = "tank"
	disp_icon_state = "towlauncher"

	health = 2000
	firing_arc = 120

	ammo = new /obj/item/ammo_magazine/hardpoint/towlauncher
	max_clips = 1

	px_offsets = list(
		"1" = list(1, 10),
		"2" = list(-1, 5),
		"4" = list(0, 0),
		"8" = list(0, 18)
	)

	muzzle_flash_pos = list(
		"1" = list(8, -1),
		"2" = list(-8, -16),
		"4" = list(5, -8),
		"8" = list(-5, 10)
	)

	scatter = 2
	fire_delay = 7.0 SECONDS

/obj/item/hardpoint/secondary/towlauncher/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff)
	))

