/datum/element/bullet_tracer
	// General bullet trait vars
	element_flags = ELEMENT_DETACH|ELEMENT_BESPOKE
	id_arg_index = 2

	///Light color to set
	var/light_color = COLOR_SOFT_RED
	var/icon_state_change = "bullet_red"

/datum/element/bullet_tracer/Attach(datum/target)
	. = ..()
	if(!istype(target, /obj/projectile))
		return ELEMENT_INCOMPATIBLE

	var/obj/projectile/proj = target
	proj.ammo.ammo_glowing = TRUE
	proj.ammo.bullet_light_color = light_color
	proj.ammo.icon_state = icon_state_change

/datum/element/bullet_tracer/green
	light_color = COLOR_SOFT_GREEN
	icon_state_change = "bullet_green"
