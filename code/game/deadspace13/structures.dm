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
	icon = 'icons/obj/furniture.dmi'
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


/obj/structure/reagent_dispensers/biomass
	name = "biomass storage"
	desc = "It is every citizen's final duty to go into the tanks, and to become one with all the people."
	icon = 'icons/obj/machines/ds13/bpl.dmi'
	icon_state = "tank"
	density = TRUE
	anchored = TRUE

/obj/machinery/recycling_tank
	name = "recycling tank"
	desc = "A organic-breakdown machine that takes organic matter and turns it into a substance known simply as 'biomass' which it then automatically feeds into the storage tank next to it."
	icon = 'icons/obj/machines/ds13/bpl.dmi'
	icon_state = "biogen-empty"

/obj/structure/shuttle
	name = "shuttle"
	icon = 'icons/turf/shuttle.dmi'

/obj/structure/shuttle/window
	name = "shuttle window"
	icon = 'icons/obj/podwindows.dmi'
	icon_state = "1"
	density = 1
	opacity = 0
	anchored = 1

/obj/structure/shuttle/window/pod
	name = "escape pod window"
	icon = 'icons/obj/podwindows2.dmi'
	icon_state = "p_window"

	/*
 * Tool Closet
 */
/obj/structure/closet/toolcloset
	name = "tool closet"
	desc = "It's a storage unit for tools."
	icon_state = "toolcloset"
	icon_closed = "toolcloset"
	icon_opened = "toolclosetopen"

/obj/structure/closet/toolcloset/New()
	..()
	new /obj/random/tool(src)
	new /obj/random/tool(src)
	new /obj/random/tool(src)
	new /obj/random/loot/often(src)
	new /obj/random/tool_upgrade(src) //Guaranteeed toolmod
	if(prob(50))
		new /obj/random/tool_upgrade(src)//Good chance for another
	if(prob(10))
		new /obj/random/tool_upgrade(src)//Small chance for a third

	if(prob(40))
		new /obj/item/clothing/suit/storage/hazardvest(src)
	if(prob(50))
		new /obj/item/flashlight(src)
	if(prob(50))
		new /obj/item/tool/screwdriver(src)
	if(prob(50))
		new /obj/item/tool/wrench(src)
	if(prob(50))
		new /obj/item/tool/weldingtool(src)
	if(prob(50))
		new /obj/item/tool/crowbar(src)
	if(prob(50))
		new /obj/item/tool/wirecutters(src)
	if(prob(50))
		new /obj/item/t_scanner(src)
	if(prob(20))
		new /obj/item/storage/belt/utility(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(20))
		new /obj/item/tool/multitool(src)
	if(prob(5))
		new /obj/item/clothing/gloves/insulated(src)
	if(prob(40))
		new /obj/item/clothing/head/hardhat(src)


/obj/structure/net/net_wall
	icon_state = "net_w"
	density = 1
	layer = 2.24
