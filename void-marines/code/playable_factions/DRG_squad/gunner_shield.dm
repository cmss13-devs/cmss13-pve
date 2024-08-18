/*
	Creates a forcefield which blocks everything from outside that isn't human
*/
/obj/item/explosive/grenade/shield_generator
	name = "shield generator"
	desc = "Used as a support Tool for the Gunner. It is a hand-held, disc shaped projector device that creates a forcefield."
	icon = 'icons/obj/items/weapons/grenade.dmi'
	icon_state = "delivery"
	item_state = "delivery"
	antigrief_protection = FALSE
	dangerous = TRUE
	harmful = FALSE
	det_time = 40

	light_color = "#74e696"
	light_power = 2

	var/obj/effect/shield/VSX
	var/blocker_type = /obj/structure/blocker/shield
	var/field_duration = 30 SECONDS
	var/field_radius = 3

/obj/item/explosive/grenade/shield_generator/prime(force)
	overlays.Cut() // Remove danger warnings
	if(isliving(loc))
		var/mob/living/L = loc
		L.drop_inv_item_on_ground(src) // Drop it, NOW

	playsound(loc, 'sound/mecha/powerup.ogg', 50)
	anchored = TRUE // No yoinky speloinky

	/// Surround us with blockers
	var/list/box = RANGE_TURFS(field_radius, src)
	for(var/turf/T as anything in box)
		if(get_dist(T, src) < field_radius)
			continue

		new blocker_type(T, src)

	spawn(field_radius * 2)
		set_light_range(field_radius+2)
		set_light_on(TRUE)

	VSX = new /obj/effect/shield(loc, field_radius, SINE_EASING|EASE_OUT, pixel_y, pixel_x, src)

	addtimer(CALLBACK(src, PROC_REF(remove_shield)), field_duration)

/obj/item/explosive/grenade/shield_generator/proc/remove_shield()
	playsound(loc, 'sound/effects/corsat_teleporter.ogg', 150)
	icon_state = initial(icon_state)
	spawn(4.5 SECONDS)
		QDEL_IN(src, field_radius * 2 - 1)
		VSX.disappear(field_radius)


/*
	Invisible Blocker Walls, they link up with the main shield and collapse with it
*/
/obj/structure/blocker/shield
	name = "shield"
	icon = 'icons/obj/structures/barricades.dmi'
	icon_state = "folding_0" // for map editing only
	flags_atom = ON_BORDER
	invisibility = INVISIBILITY_MAXIMUM
	density = TRUE
	/// The shieldgen this blocker relates to, will be destroyed along with it
	var/obj/item/explosive/grenade/shield_generator/linked_shield

/obj/structure/blocker/shield/Initialize(mapload, atom/generator, override_dir)
	. = ..()
	RegisterSignal(generator, COMSIG_PARENT_QDELETING, PROC_REF(collapse))
	linked_shield = generator
	icon_state = null

	if(override_dir)
		dir = override_dir
		return

	/// Let's face the opposite direction
	var/angle = get_angle(generator.loc, src)
	dir = get_dir_p_cardinals(angle)

	/// Corners needs to be duplicated and properly turned
	var/additional_dir
	switch(dir)
		if (NORTHEAST)
			additional_dir = NORTH
			dir = EAST
		if (SOUTHEAST)
			additional_dir = SOUTH
			dir = EAST
		if (SOUTHWEST)
			additional_dir = SOUTH
			dir = WEST
		if (NORTHWEST)
			additional_dir = NORTH
			dir = WEST

	addtimer(CALLBACK(src, PROC_REF(duplicate), generator, additional_dir), 1)

/obj/structure/blocker/shield/proc/duplicate(generator, dir)
	new type(loc, generator, dir)

/obj/structure/blocker/shield/Destroy(force)
	. = ..()
	linked_shield = null

/obj/structure/blocker/shield/proc/collapse()
	SIGNAL_HANDLER
	qdel(src)

/obj/structure/blocker/shield/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_front = PASS_MOB_IS_HUMAN
		PF.flags_can_pass_behind = PASS_ALL

/obj/structure/blocker/shield/get_projectile_hit_boolean(obj/projectile/P)
	var/is_reversed = (dir in reverse_nearby_direction(P.dir))
	if(!is_reversed)
		return FALSE

	loc.bullet_ping(P)
	return TRUE

/obj/structure/blocker/shield/get_explosion_resistance()
	return 9999

/obj/structure/blocker/shield/xeno_ai_obstacle()
	return 0

/*
	Shield effect, very warpy
*/
/obj/effect/shield
	icon = 'icons/effects/light_overlays/shockwave.dmi'
	icon_state = "shockwave"
	plane = DISPLACEMENT_PLATE_RENDER_LAYER
	pixel_x = -496
	pixel_y = -496

/obj/effect/shield/Initialize(mapload, radius = 3, easing_type = SINE_EASING|EASE_OUT, y_offset, x_offset, generator)
	. = ..()
	RegisterSignal(generator, COMSIG_PARENT_QDELETING, PROC_REF(disappear))
	if(y_offset)
		pixel_y += y_offset
	if(x_offset)
		pixel_x += x_offset
	transform = matrix().Scale(32 / 1024, 32 / 1024)
	animate(src, time = radius * 2, transform=matrix().Scale((32 / 1024) * (radius + 3.5)), easing = easing_type)

/obj/effect/shield/proc/disappear(radius = 3, easing_type = SINE_EASING|EASE_OUT)
	animate(src, time = radius * 2, transform=matrix().Scale((32 / 1024) * 0.2), easing = easing_type)
	QDEL_IN(src, radius * 2)
	set_light_on(FALSE)

/*
	Compass helper proc which prioritizes cardinals over diagonals in edge cases
*/
/proc/get_dir_p_cardinals(angle)
	switch(angle)
		if (45)
			return NORTHEAST
		if (135)
			return SOUTHEAST
		if (225)
			return SOUTHWEST
		if (315)
			return NORTHWEST
		if (0 to 44)
			return NORTH
		if (46 to 134)
			return EAST
		if (136 to 224)
			return SOUTH
		if (226 to 314)
			return WEST
		else
			return NORTH


