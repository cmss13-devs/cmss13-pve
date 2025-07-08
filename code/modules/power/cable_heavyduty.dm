/obj/item/stack/cable_coil/heavyduty
	name = "heavy cable coil"
	icon = 'icons/obj/structures/machinery/power.dmi'
	icon_state = "wire"

/obj/structure/cable/heavyduty
	icon = 'icons/obj/pipes/power_cond_heavy.dmi'
	name = "large power cable"
	desc = "This cable is tough. It cannot be cut with simple hand tools."
	layer = BELOW_ATMOS_PIPE_LAYER

/obj/structure/cable/heavyduty/attackby(obj/item/W, mob/user)

	var/turf/T = src.loc
	if(T.intact_tile)
		return

	if(HAS_TRAIT(W, TRAIT_TOOL_WIRECUTTERS))
		to_chat(usr, SPAN_NOTICE(" These cables are too tough to be cut with those [W.name]."))
		return
	else if(istype(W, /obj/item/stack/cable_coil))
		to_chat(usr, SPAN_NOTICE(" You will need heavier cables to connect to these."))
		return
	else
		..()

/obj/structure/cable/heavyduty/cableColor(colorC)
	return

/obj/structure/cable/heavyduty/south
	icon_state = "0-2"

/obj/structure/cable/heavyduty/east
	icon_state = "0-4"

/obj/structure/cable/heavyduty/west
	icon_state = "0-8"

/obj/structure/cable/heavyduty/north_south
	icon_state = "1-2"

/obj/structure/cable/heavyduty/north_east
	icon_state = "1-4"

/obj/structure/cable/heavyduty/north_west
	icon_state = "1-8"

/obj/structure/cable/heavyduty/east_south
	icon_state = "2-4"

/obj/structure/cable/heavyduty/west_south
	icon_state = "2-8"

/obj/structure/cable/heavyduty/west_east
	icon_state = "4-8"

/obj/structure/cable/heavyduty/north_east_south
	icon_state = "1-2-4"

/obj/structure/cable/heavyduty/north_east_west
	icon_state = "1-4-8"

/obj/structure/cable/heavyduty/north_west_south
	icon_state = "1-2-8"

/obj/structure/cable/heavyduty/north_south_east_west
	icon_state = "1-2-4-8"
