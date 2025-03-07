/obj/item/hardpoint/support/smoke_launcher
	name = "\improper M-39P Smoke Discharger"
	desc = "A support module for ATVs that shoots M60 incendiary smoke grenades to deter hitchhikers."
	icon = 'icons/obj/vehicles/hardpoints/apc.dmi'

	icon_state = "slauncher"
	disp_icon = "apc"
	disp_icon_state = "slauncher"
	activation_sounds = list('sound/weapons/gun_m92_attachable.ogg')

	activatable = TRUE

	health = 1500
	firing_arc = 120

	allowed_seat = VEHICLE_DRIVER

	ammo = new /obj/item/ammo_magazine/hardpoint/turret_smoke/incen
	max_clips = 3

	use_muzzle_flash = FALSE

	fire_delay = 1.0 SECONDS

/obj/item/hardpoint/support/smoke_launcher/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff)
	))
