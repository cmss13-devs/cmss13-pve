
///This is super messy and unorganized, doesn't account for other turfs before I started to organize the deadspace files here

/obj/structure/industrial_lift/tram
	name = "tram"
	desc = "A tram for tramversing the station."
	icon = 'icons/turf/floors.dmi'
	icon_state = "titanium_yellow"
	layer = 2

/obj/effect/catwalk_plated
	name = "plated catwalk spawner"
	icon = 'icons/obj/catwalks.dmi'
	icon_state = "catwalk_plated"
	density = 1
	anchored = 1.0
	var/activated = FALSE
	layer = CATWALK_LAYER
	var/plating_type = /decl/flooring/tiling/mono

/obj/effect/catwalk_plated/dark
	icon_state = "catwalk_plateddark"
	plating_type = /decl/flooring/tiling/mono/dark

/obj/effect/catwalk_plated/white
	icon_state = "catwalk_platedwhite"
	plating_type = /decl/flooring/tiling/mono/white

//ds13 variants

/obj/effect/catwalk_plated/dank
	icon_state = "catwalk_platedgrim"
	plating_type = /decl/flooring/tiling/mono/dark
