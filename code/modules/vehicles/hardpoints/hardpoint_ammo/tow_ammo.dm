/obj/item/ammo_magazine/hardpoint/towlauncher
	name = "TOW Launcher Magazine"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/event.dmi'
	desc = "A magazine of laser-guided missiles used in the UA TOW launcher weapon-system."
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

// HJ-35 FOR UPP APC

/obj/item/ammo_magazine/hardpoint/hj35launcher
	name = "HJ-35 Launcher Magazine"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/upp.dmi'
	desc = "A magazine of laser-guided missiles used in the UPP HJ-35 launcher weapon-system."
	caliber = "rocket" //correlates to any rocket mags
	icon_state = "hj35"
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/rocket/ap/tank_towlauncher/hj35_launcher
	max_rounds = 3
	gun_type = /obj/item/hardpoint/secondary/hj35launcher
