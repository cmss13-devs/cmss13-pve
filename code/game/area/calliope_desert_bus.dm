//================================================CALLIOPE DESERT BUS
//BASE
/area/calliope_route
	name = "Calliope Highway"
	icon_state = "lv626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY
//==============================================PARENTS
/area/calliope_route/highway
	name = "Calliope Passage"
	ceiling = CEILING_NONE
/area/calliope_route/exterior_buildings
	name = "Building"
	ceiling = CEILING_METAL
/area/calliope_route/tunnel
	name = "Tunnel"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
/area/calliope_route/oob
	name = "oob"
	ceiling = CEILING_DEEP_UNDERGROUND
/area/calliope_route/oob_o
	name = "open oob"
	ceiling = CEILING_NONE
//===============================================SHUTTLES
/area/calliope_route/shuttles/drop1
	name = "New Arkansas - Perimeter Gates"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
/area/calliope_route/shuttles/drop2
	name = "Calliope Highway - Tunnel Opening"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
/area/calliope_route/shuttles/drop3
	name = "Calliope Highway - Far South Opening"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
/area/calliope_route/shuttles/drop4
	name = "Calliope Highway - Far South Opening - SECONDARY"
	icon_state = "shuttle3"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
//===============================================SOUTH
/area/calliope_route/highway/far_south
	name = "Highway Far South Roadway"
	icon_state = "south"
	base_lighting_alpha = 175
/area/calliope_route/highway/exchange
	name = "Highway Interchange"
	icon_state = "away1"
	base_lighting_alpha = 175
/area/calliope_route/highway/close_south
	name = "Highway South Roadway"
	icon_state = "south"
	base_lighting_alpha = 175
/area/calliope_route/tunnel/tunnel_s
	name = "South Tunnel Segment"
	icon_state = "hall1"
	base_lighting_alpha = 150
//===============================================NORTH
/area/calliope_route/tunnel/maintenance_hall
	name = "Tunnel Maintenance Segment"
	icon_state = "hall2"
	base_lighting_alpha = 150
/area/calliope_route/tunnel/generator_maints
	name = "Tunnel Maintenance Power Segment"
	icon_state = "engine_smes"
	base_lighting_alpha = 150
/area/calliope_route/tunnel/tunnel_n
	name = "North Tunnel Segment"
	icon_state = "hall3"
	base_lighting_alpha = 150
/area/calliope_route/highway/north
	name = "Highway North Roadway"
	icon_state = "north"
	base_lighting_alpha = 175
/area/calliope_route/tunnel/caves
	name = "Highway Cavern System"
	icon_state = "cave"
	base_lighting_alpha = 150
//===============================================BUIDLINGS
/area/calliope_route/exterior_buildings/buildings
	name = "Highway Structure"
	icon_state = "red"
	base_lighting_alpha = 175
/area/calliope_route/exterior_buildings/gateways
	name = "Highway Gateways"
	icon_state = "red"
	base_lighting_alpha = 175
