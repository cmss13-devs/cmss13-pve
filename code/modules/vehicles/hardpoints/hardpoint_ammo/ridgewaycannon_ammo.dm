/obj/item/ammo_magazine/hardpoint/ridgeway
	name = "115mm Ridgeway Cannon Magazine"
	desc = "A magazine of high-explosive, anti-tank cannon rounds."
	caliber = "115mm" //Making this unique on purpose
	icon_state = "ridgewaycannon_6"
	w_class = SIZE_LARGE //Heavy fucker
	default_ammo = /datum/ammo/rocket/ltb/ridgeway
	max_rounds = 6
	gun_type = /obj/item/hardpoint/primary/cannon/ridgeway

/obj/item/ammo_magazine/hardpoint/ltb_cannon/ridgeway/update_icon()
	icon_state = "ridgewaycannon_[current_rounds]"
