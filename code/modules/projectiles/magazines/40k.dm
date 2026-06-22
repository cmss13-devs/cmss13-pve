//-------------------------------------------------------
// Lasgun Powerpacks

/obj/item/ammo_magazine/lasgun
	name = "\improper lasgun powerpack"
	desc = ""
	caliber = "18 megathule"
	icon_state = "lasgun_ammo"
	w_class = SIZE_MEDIUM
	flags_magazine = NO_FLAGS //It's a battery, can't yank bullets or shells outa this
	max_rounds = 50
	default_ammo = /datum/ammo/energy/lasgun
	gun_type = /obj/item/weapon/gun/lasgun

/obj/item/ammo_magazine/lasgun/laspistol
	name = "\improper laspistol powerpack"
	desc = ""
	icon_state = "laspistol_ammo"
	max_rounds = 20
	default_ammo = /datum/ammo/energy/lasgun/weak
	gun_type = /obj/item/weapon/gun/lasgun/laspistol
