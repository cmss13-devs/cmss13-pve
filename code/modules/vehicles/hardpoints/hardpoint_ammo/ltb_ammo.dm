/obj/item/ammo_magazine/hardpoint/ltb_cannon
	name = "LTB Cannon Magazine"
	desc = "A magazine of high-explosive, anti-tank cannon rounds."
	caliber = "85mm" //Making this unique on purpose
	icon_state = "ltbcannon_4"
	w_class = SIZE_LARGE //Heavy fucker
	default_ammo = /datum/ammo/rocket/ltb
	max_rounds = 8
	gun_type = /obj/item/hardpoint/primary/cannon

/obj/item/ammo_magazine/hardpoint/ltb_cannon/update_icon()
	icon_state = "ltbcannon_[current_rounds]"
