/obj/item/ammo_magazine/hardpoint/p17702
	name = "P-177-02 93mm Cannon Magazine"
	desc = "A magazine of high-explosive, anti-tank cannon rounds."
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/upp.dmi'
	caliber = "93mm"
	icon_state = "p17702_8"
	w_class = SIZE_LARGE //Heavy
	default_ammo = /datum/ammo/rocket/ltb/p17702
	max_rounds = 8
	gun_type = /obj/item/hardpoint/primary/cannon/p17702

/obj/item/ammo_magazine/hardpoint/p17702/update_icon()
	icon_state = "p17702_[current_rounds]"

