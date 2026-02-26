/obj/item/ammo_magazine/hardpoint/plasmacannon
	name = "Plasma Cannon Battery"
	desc = "A magazine of advanced composite sabots for use in an experimental weapons system."
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/uscm.dmi'
	caliber = "93mm" //Making this unique on purpose
	icon_state = "plasmacannon_3"
	w_class = SIZE_LARGE //Heavy
	default_ammo = /datum/ammo/energy/plasma
	max_rounds = 3
	gun_type = /obj/item/hardpoint/primary/cannon/plasmacannon

/obj/item/ammo_magazine/hardpoint/plasmacannon/update_icon()
	icon_state = "plasmacannon_[current_rounds]"

