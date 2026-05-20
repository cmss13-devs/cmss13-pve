/obj/structure/foamedmetal
	icon = 'icons/effects/effects.dmi'
	icon_state = "metalfoam"
	density = 1
	opacity = 1 // changed in New()
	anchored = 1
	name = "foamed metal"
	desc = "A lightweight foamed metal wall."
	var/metal = 1 // 1 = aluminum, 2 = iron

/obj/structure/bed/chair/tram
	name = "bench"
	desc = "A rusting tram bench. Sturdy enough to protect passengers from sudden changes in acceleration."
	icon_state = "trambench"
	color = "#FFFFFF"

/obj/structure/skele_stand
	name = "hanging skeleton model"
	density = 1
	icon = 'icons/obj/surgery.dmi'
	icon_state = "hangskele"
	desc = "It's an anatomical model of a human skeletal system made of plaster."

/*
 * Tram Walls
 */
/obj/structure/tramwall
	name = "bulkhead"
	desc = "A huge chunk of metal used to separate rooms."
	anchored = TRUE
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "tram"
	layer = BELOW_OBJ_LAYER
	density = TRUE
	// This is intended to lower SSlighting load
	opacity = FALSE
	indestructible = TRUE
