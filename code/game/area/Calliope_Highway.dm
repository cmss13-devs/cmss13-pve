//================================================CALLIOPE HIGHWAY
//BASE
/area/calliope
	name = "Calliope Highway"
	icon_state = "lv626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY
//==============================================PARENTS
/area/calliope/highway
	name = "Calliope Passage"
	ceiling = CEILING_NONE
/area/calliope/exterior_buildings
	name = "Building"
	ceiling = CEILING_METAL
/area/calliope/bunker
	name = "Sterling Bunker"
	ceiling = CEILING_REINFORCED_METAL
/area/calliope/bunker_exterior_buildings
	name = "Sterling Outer"
	ceiling = CEILING_METAL
/area/calliope/oob
	name = "oob"
	ceiling = CEILING_DEEP_UNDERGROUND
/area/calliope/oob_o
	name = "open oob"
	ceiling = CEILING_NONE
//===============================================SHUTTLES
/area/calliope/shuttles/drop1
	name = "Sterling Outpost - Checkpoint Landing"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
/area/calliope/shuttles/drop2
	name = "Calliope Highway - Northern Approach"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
/area/calliope/shuttles/drop3
	name = "Calliope Highway - Southern Approach"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
//===============================================HIGHWAY
/area/calliope/highway/northbound
	name = "Calliope Highway Northbound"
	icon_state = "north"
	base_lighting_alpha = 175
/area/calliope/highway/southbound
	name = "Calliope Highway Southbound"
	icon_state = "south"
	base_lighting_alpha = 175
/area/calliope/highway/checkpoint
	name = "Calliope Highway Checkpoint"
	icon_state = "central"
	base_lighting_alpha = 175
/area/calliope/exterior_buildings/north_buildings
	name = "Calliope Highway Building"
	icon_state = "storage"
	base_lighting_alpha = 170
/area/calliope/exterior_buildings/ghost_town
	name = "Ghost Town"
	icon_state = "cave"
	base_lighting_alpha = 160
//===============================================STERLING BUNKER EXT
/area/calliope/bunker_exterior_buildings/west_checkpoint
	name = "Southbound Checkpoint"
	icon_state = "red"
	base_lighting_alpha = 170
/area/calliope/bunker_exterior_buildings/east_checkpoint
	name = "Northbound Checkpoint"
	icon_state = "red"
	base_lighting_alpha = 170
/area/calliope/bunker_exterior_buildings/complex
	name = "Complex"
	icon_state = "red"
	base_lighting_alpha = 170
//================================================STERLING BUNKER PROPER
/area/calliope/bunker/fuel_depot
	name = "Fuel Depot"
	icon_state = "blue-red"
	base_lighting_alpha = 160
/area/calliope/bunker/entry_checkpoint
	name = "Sterling Entry Checkpoint"
	icon_state = "red"
	base_lighting_alpha = 160
/area/calliope/bunker/sterlingtransfer
	name = "Sterling Transfers"
	icon_state = "away1"
	base_lighting_alpha = 160
/area/calliope/bunker/pillbox
	name = "Pillbox"
	icon_state = "away2"
	base_lighting_alpha = 160
/area/calliope/bunker/cargo_area
	name = "Cargo"
	icon_state = "away3"
	base_lighting_alpha = 150
/area/calliope/bunker/closet
	name = "Supply Closet"
	icon_state = "storage"
	base_lighting_alpha = 150
/area/calliope/bunker/hospital
	name = "Hospital"
	icon_state = "medbay"
	base_lighting_alpha = 150
/area/calliope/bunker/abandoned_section
	name = "Research Labs"
	icon_state = "research"
	base_lighting_alpha = 150
/area/calliope/bunker/armory
	name = "Armory"
	icon_state = "red"
	base_lighting_alpha = 150
/area/calliope/bunker/hallway
	name = "Sterling Main Hall"
	icon_state = "central"
	base_lighting_alpha = 150
/area/calliope/bunker/cafeteria
	name = "Sterling Cafe"
	icon_state = "cafeteria"
	base_lighting_alpha = 150
/area/calliope/bunker/barracks
	name = "Barracks"
	icon_state = "green"
	base_lighting_alpha = 150
/area/calliope/bunker/command
	name = "Operations Center"
	icon_state = "bluenew"
	base_lighting_alpha = 150
/area/calliope/bunker/engineering
	name = "Engineering"
	icon_state = "engine_smes"
	base_lighting_alpha = 150
/area/calliope/bunker/holding
	name = "Holding Cell"
	icon_state = "security"
	base_lighting_alpha = 150
//================================================================================OOB
/area/calliope/oob/mountain
	name = "oob"
	icon_state = "cave2"
	base_lighting_alpha = 175
/area/calliope/oob/gate
	name = "Highway Entry"
	icon_state = "bluered"
	base_lighting_alpha = 175
/area/calliope/oob_o/playground
	name = "Out of Bounds Fun"
	icon_state = "yellow"
	base_lighting_alpha = 175
//=================================================================================UNDERGROUND BUNKERS
/area/calliope/bunker/engineering_under
	name = "Generator Station"
	icon_state = "engineering"
/area/calliope/bunker/north_section
	name = "Maintenance Hallway"
	icon_state = "lower hull"
/area/calliope/bunker/cargo_under
	name = "Sterling Cargo Storage"
	icon_state = "storage"
/area/calliope/bunker/south_section
	name = "Maintenance Hallway"
	icon_state = "lower hull"
/area/calliope/bunker/escape
	name = "Emergency Escape Hatch"
	icon_state = "evac"
