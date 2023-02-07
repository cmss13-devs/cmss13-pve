//LV624_Outpost_Furidamu AREAS--------------------------------------//

/area/LV624_Outpost_Furidamu
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"

//parent types

/area/LV624_Outpost_Furidamu/indoors
	name = "LV624_Outpost_Furidamu - Indoors"
	icon_state = "blue" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_METAL
	//ambience = list('sound/ambience/jungle_amb1.ogg')


/area/LV624_Outpost_Furidamu/outdoors
	name = "LV624_Outpost_Furidamu - Outdoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	//ambience = list('sound/ambience/jungle_amb1.ogg')

/area/LV624_Outpost_Furidamu/outdoors/civilian
	name = "LV624_Outpost_Furidamu - North Colony Outdoors"

/area/LV624_Outpost_Furidamu/outdoors/militia
	name = "LV624_Outpost_Furidamu - South Colony Outdoors"

/area/LV624_Outpost_Furidamu/outdoors/ua_bunker
	name = "LV624_Outpost_Furidamu - West Colony Caves"

/area/LV624_Outpost_Furidamu/oob
	name = "LV624_Outpost_Furidamu - Out Of Bounds"
	icon_state = "unknown"
	ceiling = CEILING_MAX
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL

//Landing Zone 1

/area/LV624_Outpost_Furidamu/landing_zone_1
	name = "LV624_Outpost_Furidamu - Landing Zone One"
	icon_state = "explored"
	is_resin_allowed =  FALSE
	is_landing_zone = TRUE

/area/LV624_Outpost_Furidamu/landing_zone_1/ceiling
	ceiling = CEILING_METAL

/area/LV624_Outpost_Furidamu/landing_zone_1/tunnel
	name = "LV624_Outpost_Furidamu - Landing Zone One Tunnels"
	ceiling = CEILING_METAL

/area/shuttle/drop1/LV624_Outpost_Furidamu
	name = "LV624_Outpost_Furidamu - Dropship Alamo Landing Zone"
	icon_state = "shuttle"
	icon = 'icons/turf/area_shiva.dmi'
	lighting_use_dynamic = TRUE

/area/LV624_Outpost_Furidamu/landing_zone_1/lz1_console
	name = "LV624_Outpost_Furidamu - Dropship Alamo Console"
	icon_state = "tcomsatcham"
	requires_power = FALSE

//Landing Zone 2

/area/LV624_Outpost_Furidamu/landing_zone_2
	name = "LV624_Outpost_Furidamu - Landing Zone Two"
	icon_state = "explored"
	is_resin_allowed =  FALSE
	is_landing_zone = TRUE

/area/LV624_Outpost_Furidamu/landing_zone_2/ceiling
	ceiling = CEILING_METAL

/area/shuttle/drop2/LV624_Outpost_Furidamu
	name = "LV624_Outpost_Furidamu - Dropship Normandy Landing Zone"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_shiva.dmi'
	lighting_use_dynamic = TRUE

/area/LV624_Outpost_Furidamu/landing_zone_2/lz2_console
	name = "LV624_Outpost_Furidamu - Dropship Normandy Console"
	icon_state = "tcomsatcham"
	requires_power = FALSE

