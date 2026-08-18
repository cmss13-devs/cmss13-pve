//-------------------------------------------------------
// Lasgun Powerpacks

/obj/item/ammo_magazine/lasgun
	name = "\improper lasgun powerpack"
	desc = "A powerpack that powers most standard lasguns."
	caliber = "18 megathule"
	icon_state = "lasgun_ammo"
	w_class = SIZE_MEDIUM
	flags_magazine = NO_FLAGS //It's a battery, can't yank bullets or shells outa this
	max_rounds = 100
	default_ammo = /datum/ammo/energy/lasgun
	gun_type = /obj/item/weapon/gun/lasgun

/obj/item/ammo_magazine/lasgun/laspistol
	name = "\improper laspistol powerpack"
	desc = "A powerpack that powers most standard laspistols."
	icon_state = "laspistol_ammo"
	w_class = SIZE_SMALL
	max_rounds = 45
	default_ammo = /datum/ammo/energy/lasgun/weak
	gun_type = /obj/item/weapon/gun/lasgun/laspistol

/obj/item/ammo_magazine/lasgun/hellgun
	name = "\improper hellgun powerpack"
	desc = "A powerpack that powers most standard hellguns."
	icon_state = "hellgun_ammo"
	w_class = SIZE_MEDIUM
	max_rounds = 85
	default_ammo = /datum/ammo/energy/lasgun/hellgun
	gun_type = /obj/item/weapon/gun/lasgun/hellgun

/obj/item/ammo_magazine/lasgun/volleygun
	name = "\improper volleygun powerpack"
	desc = "A powerpack that powers most standard volleyguns."
	icon_state = "volleygun_ammo"
	max_rounds = 250
	gun_type = /obj/item/weapon/gun/lasgun/volleygun

//-------------------------------------------------------
// Flamer Fuel Tanks

/obj/item/ammo_magazine/flamer_tank/imperial
	icon_state = "flamer_ammo"
	item_state = "flamer_ammo"
	max_rounds = 250

/obj/item/ammo_magazine/flamer_tank/imperial/weak
	name = "incinerator tank (Weak)"
	caliber = "Impure Napalm"
	flamer_chem = "weaknapalm"
	max_range = 5

//-------------------------------------------------------
// Boltpistol magazines

/obj/item/ammo_magazine/pistol/boltpistol
	name = "\improper boltpistol magazine (19.5mm)"
	desc = "A boltpistol magazine."
	caliber = "19.5mm"
	icon_state = "boltpistol_ammo"
	max_rounds = 8
	w_class = SIZE_SMALL
	default_ammo = /datum/ammo/bullet/pistol/boltpistol
	gun_type = /obj/item/weapon/gun/pistol/boltpistol

//-------------------------------------------------------
// Plasmagun powerpacks

/obj/item/ammo_magazine/plasmagun
	name = "\improper plasmagun powerpack"
	desc = "A plasmagun powerpack, able to fit inside most forms of plasma-weaponry."
	caliber = "plasma"
	icon_state = "plasma_ammo"
	w_class = SIZE_MEDIUM
	flags_magazine = NO_FLAGS
	max_rounds = 4
	default_ammo = /datum/ammo/energy/plasmagun
	gun_type = /obj/item/weapon/gun/plasmagun
