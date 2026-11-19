/obj/item/ammo_magazine/hardpoint/railgun
	name = "Railgun Cannon Magazine"
	desc = "A magazine of advanced composite sabots for use in an experimental weapons system."
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/upp.dmi'
	caliber = "93mm" //Making this unique on purpose
	icon_state = "railgun_4"
	w_class = SIZE_LARGE //Heavy
	default_ammo = /datum/ammo/rocket/ap/railgun
	max_rounds = 4
	gun_type = /obj/item/hardpoint/primary/cannon/railgun

/obj/item/ammo_magazine/hardpoint/railgun/update_icon()
	icon_state = "railgun_[current_rounds]"

