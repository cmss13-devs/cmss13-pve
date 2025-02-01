/obj/item/hardpoint/primary/autocannon
	name = "\improper AC3-E Autocannon"
	desc = "A primary autocannon for tanks that shoots explosive flak rounds"

	icon_state = "ace_autocannon"
	disp_icon = "tank"
	disp_icon_state = "ace_autocannon"
	activation_sounds = list('sound/weapons/vehicles/autocannon_fire.ogg')

	health = 2000
	firing_arc = 60

	ammo = new /obj/item/ammo_magazine/hardpoint/ace_autocannon
	max_clips = 2

	px_offsets = list(
		"1" = list(0, 22),
		"2" = list(0, -32),
		"4" = list(32, 0),
		"8" = list(-32, 0)
	)

	firing_smoke_offset = list(
		"1" = list(0, 78),
		"2" = list(0, -50),
		"4" = list(78, 20),
		"8" = list(-78, 20)
	)

	scatter = 1
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = 0.7 SECONDS

/obj/item/hardpoint/primary/autocannon/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff)
	))

/obj/item/hardpoint/primary/autocannon/update_smoke_dir(datum/source, dir, newdir)
	switch(newdir)
		if(SOUTH)
			smoke_holder.particles.position = list(55, 70, 0)
		if(NORTH)
			smoke_holder.particles.position = list(50, 55, 0)
		if(EAST)
			smoke_holder.particles.position = list(45, 80, 0)
		if(WEST)
			smoke_holder.particles.position = list(50, 72, 0)
