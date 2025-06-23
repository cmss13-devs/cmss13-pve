/obj/item/ammo_magazine/hardpoint/towlauncher
	name = "TOW Launcher Magazine"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/event.dmi'
	desc = "A secondary armament rocket magazine"
	caliber = "rocket" //correlates to any rocket mags
	icon_state = "quad_rocket"
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/rocket/ap/tank_towlauncher
	max_rounds = 10
	gun_type = /obj/item/hardpoint/secondary/towlauncher

/obj/item/ammo_magazine/hardpoint/towlauncher/aa
	name = "M579 VLS Magazine"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/event.dmi'
	desc = "A magazine of ground-to-ground missiles for the M579 ADS-C frontal launch system."
	caliber = "rocket" //correlates to any rocket mags
	icon_state = "quad_rocket"
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/rocket/ap/tank_towlauncher/aa
	max_rounds = 4
	gun_type = /obj/item/hardpoint/secondary/towlauncher/aa
