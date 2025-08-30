/obj/item/ammo_magazine/hardpoint/boyars_dualcannon
	name = "PARS-159 Dualcannon IFF Magazine"
	desc = "A magazine for the PARS-159 Boyars Dualcannon filled with telescoped 40mm rounds. Slightly contuses targets upon hit. Supports IFF."
	caliber = "40mm"
	icon_state = "ace_autocannon"
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/bullet/tank/dualcannon
	max_rounds = 80
	gun_type = /obj/item/hardpoint/primary/dualcannon

/obj/item/ammo_magazine/hardpoint/boyars_dualcannon/update_icon()
	if(current_rounds > 0)
		icon_state = "ace_autocannon"
	else
		icon_state = "ace_autocannon_empty"
