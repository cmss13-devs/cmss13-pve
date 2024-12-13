//LV314 Osiris AREAS--------------------------------------//

/area/lv314
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY

//parent types

/area/lv314/indoors
	name = "LV-314 - Outdoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV522_INDOORS


/area/lv314/outdoors
	name = "LV-314 - Outdoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV522_OUTDOORS

/area/lv314/oob
	name = "LV-314 - Basalt"
	icon_state = "unknown"
	ceiling = CEILING_MAX
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL

// LZ

/area/lv314/outdoors/lz
	name = "LV-314 - Landing Zone"
	icon_state = "landing_pad"
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ


//bottom level
/area/lv314/outdoors/caverns
	name = "LV-314 Caverns"
	icon_state = "dark"
	minimap_color = MINIMAP_AREA_CAVES

/area/lv314/outdoors/caverns/north
	name = "Northern Caverns"
	icon_state = "north"

/area/lv314/outdoors/caverns/central
	name = "Central Caverns"
	icon_state = "central"

/area/lv314/outdoors/caverns/central
	name = "Southern Caverns"
	icon_state = "south"

/area/lv314/outdoors/caverns/lavaflats
	name = "Underground Eastern Lava Flats"
	icon_state = "red"

/area/lv314/outdoors/caverns/elevator
	name = "Elevator - Underground"
	icon_state = "yellow"
	minimpa_color = MINIMAP_AREA_LZ

/area/lv314/outdoors/caverns/campsite
	name = "Underground Campsite"
	icon_state = "lam_research"
	requires_power = FALSE

/area/lv314/outdoors/caverns/campsite/telecommunications
	name = "Underground Telecommunications Hub Exterior"
	icon_state = "tcomsatcham"

/area/lv314/indoors/campsite
	name = "Underground Campsite Interiors"

/area/lv314/indoors/campsite/habs
	name = "Underground Campsite Habitats"
	icon_state = "crew_quarters"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/lv314/indoors/campsite/habs/one
	name = "Underground Campsite Hab 1"

/area/lv314/indoors/campsite/habs/two
	name = "Underground Campsite Hab 2"

/area/lv314/indoors/campsite/habs/three
	name = "Underground Campsite Hab 3"

/area/lv314/indoors/campsite/habs/four
	name = "Underground Campsite Hab 4"

/area/lv314/indoors/campsite/telecommunications
	name = "Underground Telecommunications Hub Interior"
	icon_state = "tcomsatcham"
	minimap_color MINIMAP_AREA_ENGI

//top level
/area/lv314/outdoors/valley
	name = "LV-314 Valleys"
	icon_state = "dark"
	minimap_color = MINIMAP_AREA_CAVES

/area/lv314/outdoors/valley/north
	name = "Northern Valleys"
	icon_state = "north"

/area/lv314/outdoors/valley/central
	name = "Central Valleys"
	icon_state = "central"

/area/lv314/outdoors/valley/south
	name = "Southern Valleys"
	icon_state = "south"

/area/lv314/indoors/mining
	name = "Valley Mines"
	icon_state = "mining"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/lv314/indoors/processing_station
	name = "LV-314 Processing Station"
	icon_state = "mining_production"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv314/indoors/processing_station/security
	name = "Processing Station - Security"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/lv314/indoors/processing_station/garage
	name = "Processing Station - Garage"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_ENGI_CAVE

/area/lv314/indoors/processing_station/storage
	name = "Processing Station - Storage"
	icon_state = "storage"

/area/lv314/indoors/processing_station/intake
	name = "Processing Station - Geological Intake"
	minimap_color = MINIMAP_AREA_ENGI_CAVE

/area/lv314/indoors/powerplant
	name = "Lava Powerplant"
	icon_state = "substation"
	minimap_color = MINIMAP_AREA_ENGI
