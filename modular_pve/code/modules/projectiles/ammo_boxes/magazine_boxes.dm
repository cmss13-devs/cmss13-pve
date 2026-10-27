//-----------------------LARGE M41A MK1 Rifle Mag Boxes-----------------------

/obj/item/ammo_box/magazine/mk1/large
	name = "magazine box (M41A MK1 x 32)"
	icon_state = "base_large"
	overlay_ammo_type = "_reglarge"
	overlay_gun_type = "_blank"
	overlay_content = "_reglarge"
	limit_per_tile = 1
	flags_equip_slot = null
	magazine_type = /obj/item/ammo_magazine/rifle/m41aMK1
	num_of_magazines = 32
	allowed_magazines = list(/obj/item/ammo_magazine/rifle/m41aMK1/recon)
	var/move_delay_mult = 3
	w_class = SIZE_MASSIVE

/obj/item/ammo_box/magazine/mk1/large/pickup(mob/user, silent)
	. = ..()
	RegisterSignal(user, COMSIG_HUMAN_POST_MOVE_DELAY, PROC_REF(handle_movedelay))

/obj/item/ammo_box/magazine/mk1/large/proc/handle_movedelay(mob/user, list/movedata)
	SIGNAL_HANDLER
	if(locate(/obj/item/ammo_box/magazine/mk1/large) in user.contents)
		movedata["move_delay"] += move_delay_mult

/obj/item/ammo_box/magazine/mk1/large/dropped(mob/user, silent)
	. = ..()
	UnregisterSignal(user, COMSIG_HUMAN_POST_MOVE_DELAY)

/obj/item/ammo_box/magazine/mk1/large/recon
	name = "magazine box (M41A MK1 Recon x 32)"
	magazine_type = /obj/item/ammo_magazine/rifle/m41aMK1/recon

/obj/item/ammo_box/magazine/mk1/large/empty
	empty = TRUE

/obj/item/ammo_box/magazine/mk1/large/ap
	name = "magazine box (AP M41A MK1 x 32)"
	overlay_ammo_type = "_aplarge"
	overlay_content = "_aplarge"
	magazine_type = /obj/item/ammo_magazine/rifle/m41aMK1/ap

/obj/item/ammo_box/magazine/mk1/large/ap/empty
	empty = TRUE

/obj/item/ammo_box/magazine/mk1/large/heap
	name = "magazine box (HEAP M41A MK1 x 32)"
	overlay_ammo_type = "_heaplarge"
	overlay_content = "_heaplarge"
	magazine_type = /obj/item/ammo_magazine/rifle/m41aMK1/heap

/obj/item/ammo_box/magazine/mk1/large/heap/empty
	empty = TRUE

/obj/item/ammo_box/magazine/mk1/large/rubber
	name = "magazine box (Rubber M41A MK1 x 32)"
	overlay_ammo_type = "_rubberlarge"
	magazine_type = /obj/item/ammo_magazine/rifle/m41aMK1/rubber

/obj/item/ammo_box/magazine/mk1/large/rubber/empty
	empty = TRUE
