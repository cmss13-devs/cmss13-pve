//----------------10x28mm Ammunition Boxes (for smartguns)------------------

/obj/item/ammo_box/rounds/smartgun
	name = "\improper smartgun ammunition box (10x28mm)"
	icon_state = "base_m56rd"
	desc = "A 10x28mm ammunition box. Used to refill smartgun drum magazines. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_reg"
	default_ammo = /datum/ammo/bullet/rifle/heavy/tracer
	caliber = "10x28mm"
	bullet_amount = 1000
	max_bullet_amount = 1000

/obj/item/ammo_box/rounds/smartgun/empty
	empty = TRUE

// RMC SG
/obj/item/ammo_box/rounds/smartgun/holo_target
	name = "\improper holo-targetting smartgun ammunition box (10x28mm)"
	desc = "An ammunition box full of 10x28mm holo-targetting rounds. Used to refill L58A3 smartgun drums. It comes with a leather strap allowing to wear it on the back."
	overlay_content = "_impact"
	default_ammo = /datum/ammo/bullet/rifle/heavy/holo_target

/obj/item/ammo_box/rounds/smartgun/holo_target/empty
	empty = TRUE
