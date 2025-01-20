//lv295 AREAS--------------------------------------//

/area/lv295
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY

//parent types

/area/lv295/indoors
	name = "LV295 - Indoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	soundscape_playlist = AMBIENCE_SHIP


/area/lv295/outdoors
	name = "LV295 - Outdoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_WIND

/area/lv295/oob
	name = "LV295 - Out Of Bounds"
	icon_state = "unknown"
	ceiling = CEILING_MAX
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL


//Landing Zones

/area/lv295/landing_zone_1
	name = "LV295 - Landing Zone One"
	icon_state = "explored"
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ

/area/lv295/landing_zone_2
	name = "LV295 - Landing Zone Two"
	icon_state = "explored"
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ

//Outdoors

/area/lv295/outdoors/compound
	name = "LV295 - Exterior Compound"
	icon_state = "red"
	requires_power = FALSE

/area/lv295/outdoors/barrens
	name = "LV295 - Outdoors"
	icon_state = "blue"
	requires_power = FALSE

//Maint

/area/lv295/indoors/maint
	name = "LV295 - Facility Maintenance"
	icon_state = "yellow"
	requires_power = FALSE

//Lab

/area/lv295/indoors/surface_lab
	name = "LV295 - Surface Facility"
	icon_state = "green"
	ceiling = CEILING_METAL

/area/lv295/indoors/sublevel_1
	name = "LV295 - Sublevel 1"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv295/indoors/sublevel_2
	name = "LV295 - Sublevel 2"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lv295/indoors/sublevel_3
	name = "LV295 - Sublevel 3"
	icon_state = "mechbay"
	minimap_color = MINIMAP_AREA_SEC

/area/lv295/indoors/sublevel_4
	name = "LV295 - Sublevel 4"
	icon_state = "toxlab"
	minimap_color = MINIMAP_AREA_MEDBAY
