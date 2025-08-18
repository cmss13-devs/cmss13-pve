/obj/item/hardpoint/armor/reactive
	name = "\improper Reactive Armor"
	desc = "A set of explosive reactive armor panels for the tank hull that increases its resistance to shaped charges and kinetic penetrators."

	icon = 'icons/obj/vehicles/hardpoints/upptank.dmi'
	icon_state = "reactive_armor"
	disp_icon = "upptank"
	disp_icon_state = "reactive_armor"

	health = 2000

	type_multipliers = list(
		"explosive" = 0.70,
		"bullet" = 0.70,
		"slash" = 0.70,
		"blunt" = 0.50,
		"all" = 0.9
	)
