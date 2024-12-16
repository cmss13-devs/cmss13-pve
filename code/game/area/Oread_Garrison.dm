/area/Oread_Garrison
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"
	ambience_exterior = AMBIENCE_JUNGLE
	minimap_color = MINIMAP_AREA_COLONY

/area/Oread_Garrison/outside
	name = "outside"
	icon_state = "green"
	always_unpowered = 1

/area/Oread_Garrison/outside/jungle
	minimap_color = MINIMAP_AREA_JUNGLE
	ceiling = CEILING_METAL
	icon_state = "central"
	//ambience = list('sound/ambience/jungle_amb1.ogg')

/area/Oread_Garrison/outside/jungle/clearing
	ceiling = CEILING_NONE
	icon_state = "south"

/area/Oread_Garrison/outside/jungle/river
	ceiling = CEILING_NONE
	icon_state = "bluenew"

/area/Oread_Garrison/outside/jungle/landing_zone
	ceiling = CEILING_NONE
	is_resin_allowed = FALSE
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ

/area/Oread_Garrison/inside
	name = "inside"
	icon_state = "purple"
	ceiling = CEILING_REINFORCED_METAL

/area/Oread_Garrison/inside/command
	icon_state = "blueold"
	minimap_color = MINIMAP_AREA_COMMAND

/area/Oread_Garrison/inside/medical
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/Oread_Garrison/inside/engineering
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/Oread_Garrison/inside/dorms
	icon_state = "Sleep"
	minimap_color = MINIMAP_AREA_SEC

/area/Oread_Garrison/inside/bunker
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC

/area/Oread_Garrison/inside/messhall
	icon_state = "cafeteria"
	minimap_color = MINIMAP_AREA_COLONY

/area/Oread_Garrison/inside/garage
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/Oread_Garrison/inside/flag
	icon_state = "head_quarters"
	minimap_color = MINIMAP_AREA_COMMAND

/area/Oread_Garrison/inside/requisitions
	icon_state = "quart"
	minimap_color = MINIMAP_AREA_SEC






