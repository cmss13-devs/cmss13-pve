/obj/structure/machinery/door/poddoor/railing
	name = "\improper retractable railing"
	icon = 'icons/obj/structures/doors/railing.dmi'
	icon_state = "railing0"
	climbable = TRUE
	use_power = USE_POWER_NONE
	flags_atom = ON_BORDER
	opacity = FALSE
	unslashable = TRUE
	unacidable = TRUE
	projectile_coverage = PROJECTILE_COVERAGE_LOW

	throwpass = TRUE //You can throw objects over this, despite its density.
	open_layer = CATWALK_LAYER
	closed_layer = WINDOW_LAYER
	density = TRUE

/obj/structure/machinery/door/poddoor/railing/Initialize()
	. = ..()
	if(dir == SOUTH)
		closed_layer = ABOVE_MOB_LAYER
	if(density)//Allows preset-open to work
		layer = closed_layer

	set_opacity(initial(opacity))

/obj/structure/machinery/door/poddoor/railing/update_icon()
	if(density)
		icon_state = "railing1"
	else
		icon_state = "railing0"

/obj/structure/machinery/door/poddoor/railing/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_all = (PASS_OVER^PASS_OVER_FIRE)|PASS_CRUSHER_CHARGE

/obj/structure/machinery/door/poddoor/railing/open()
	if(operating) //doors can still open when emag-disabled
		return FALSE

	operating = TRUE
	flick("railingc0", src)
	icon_state = "railing0"
	layer = open_layer

	addtimer(CALLBACK(src, PROC_REF(finish_open)), 1.2 SECONDS)
	return TRUE

/obj/structure/machinery/door/poddoor/railing/finish_open()
	density = FALSE
	if(operating) //emag again
		operating = FALSE

/obj/structure/machinery/door/poddoor/railing/close()
	if(operating)
		return FALSE

	density = TRUE
	operating = TRUE
	layer = closed_layer
	flick("railingc1", src)
	icon_state = "railing1"

	addtimer(VARSET_CALLBACK(src, operating, FALSE), 1.2 SECONDS)
	return TRUE

/obj/structure/machinery/door/poddoor/railing/preopened
	density = FALSE
