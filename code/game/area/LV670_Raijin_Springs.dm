/area/LV670
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"
	ambience_exterior = AMBIENCE_BIGRED
	soundscape_playlist = SCAPE_PL_THUNDER
	soundscape_interval = 50
	minimap_color = MINIMAP_AREA_COLONY

/area/LV670/outside
	icon_state = "green"
	always_unpowered = 1
	ceiling = "CEILING_NONE"
	minimap_color = MINIMAP_AREA_JUNGLE


/area/LV670/inside
	icon_state = "blue"
	ceiling = "CEILING_METAL"
	minimap_color = MINIMAP_AREA_COLONY

/area/LV670/landing_zone
	icon_state = "red"
	ceiling = "CEILING_NONE"
	is_resin_allowed = FALSE
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ
