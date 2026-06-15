//-------------------------------------------------------
// Lasgun Powerpacks

/obj/item/ammo_magazine/lasgun
	name = "\improper Lasgun Powerpack"
	desc = ""
	caliber = "40W"
	icon_state = "xm99a_cell"
	w_class = SIZE_MEDIUM
	flags_magazine = NO_FLAGS //It's a battery, can't yank bullets or shells outa this
	max_rounds = 100
	default_ammo = /datum/ammo/energy/lasgun
	gun_type = /obj/item/weapon/gun/lasgun
