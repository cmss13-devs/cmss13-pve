//==================================================================BOSENMORI BASHO
//BASE
/area/bosenmori
	name = "Bosenmori Basho"
	icon_state = "lv626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY
//============================================================PARENTS
/area/bosenmori/outside
	name = "Bosenmori Wilds"
	ceiling = CEILING_NONE
/area/bosenmori/interior_glass
	name = "Bosenmori Glass"
	ceiling = CEILING_GLASS
/area/bosenmori/interior_regular
	name = "Bosenmori Roofing"
	ceiling = CEILING_METAL
/area/bosenmori/interior_heavy
	name = "Bosenmori Secured Roofing"
	ceiling = CEILING_REINFORCED_METAL
/area/bosenmori/mountain
	name = "Bosenmori Mountain"
	ceiling = CEILING_DEEP_UNDERGROUND
/area/bosenmori/oob
	name = "oob"
	ceiling = CEILING_METAL
//============================================================SHUTTLES
/area/bosenmori/shuttles/drop1
	name = "Bosenmori Basho - Cargo Landing"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 50
/area/bosenmori/shuttles/drop2
	name = "Bosenmori Basho - Corporate Landing"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 50
/area/bosenmori/shuttles/drop3
	name = "Bosenmori Basho - Mountain Landing"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 50
//============================================================NEXUS
/area/bosenmori/interior_glass/nexus
	name = "Nexus Main Hall"
	icon_state = "hallC1"
	base_lighting_alpha = 50
/area/bosenmori/interior_regular/security
	name = "Security Department"
	icon_state = "security"
	base_lighting_alpha = 50
/area/bosenmori/interior_regular/security_armory
	name = "Armory"
	icon_state = "armory"
	base_lighting_alpha = 50
/area/bosenmori/interior_regular/kitchen
	name = "Kitchen Department"
	icon_state = "kitchen"
	base_lighting_alpha = 50
/area/bosenmori/interior_regular/store
	name = "Store Department"
	icon_state = "store"
	base_lighting_alpha = 50
/area/bosenmori/interior_regular/operations
	name = "Colony Operation Center"
	icon_state = "command"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/cargo
	name = "Cargo Department"
	icon_state = "cargo"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/shipment
	name = "Shipment Department"
	icon_state = "cargo2"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/tree
	name = "Terrarium"
	icon_state = "green"
	base_lighting_alpha = 50
//============================================================SOUTH DOMES
/area/bosenmori/interior_regular/engineering
	name = "Engineering Department"
	icon_state = "engineering"
	base_lighting_alpha = 50
/area/bosenmori/interior_regular/telecommunication
	name = "Telecommunication Department"
	icon_state = "yellow"
	base_lighting_alpha = 50
/area/bosenmori/interior_heavy/secured_armory
	name = "Secured Armory"
	icon_state = "storage"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/corporate
	name = "Weyland-Yutani Corporate Dome"
	icon_state = "blueold"
	base_lighting_alpha = 50
//============================================================NORTH DOMES above tree
/area/bosenmori/interior_glass/offices
	name = "Human Resources Department"
	icon_state = "blueold"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/fitness
	name = "Bosenmori Extreme Physical Rehabilitation Department"
	icon_state = "fitness"
	base_lighting_alpha = 50
/area/bosenmori/interior_regular/research
	name = "Research Department"
	icon_state = "research"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/living
	name = "Living Sector"
	icon_state = "dormitory"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/hospital
	name = "Medical Department"
	icon_state = "medbay"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/food_processing
	name = "Food Processing Department"
	icon_state = "hydroponics"
	base_lighting_alpha = 50
/area/bosenmori/interior_glass/filtration
	name = "Filtration Department"
	icon_state = "filtration"
	base_lighting_alpha = 50
//============================================================COLONY PROPER EXTERIOR
/area/bosenmori/outside/cargo
	name = "Construction Site"
	icon_state = "cargo"
	base_lighting_alpha = 50
/area/bosenmori/outside/east_area
	name = "Southeast Sector"
	icon_state = "southeast"
	base_lighting_alpha = 50
/area/bosenmori/outside/south_area
	name = "Southwest Sector"
	icon_state = "southwest"
	base_lighting_alpha = 50
/area/bosenmori/outside/west_area
	name = "West Sector"
	icon_state = "west"
	base_lighting_alpha = 50
/area/bosenmori/outside/north_area
	name = "North Sector"
	icon_state = "north"
	base_lighting_alpha = 50
/area/bosenmori/outside/west_barrens
	name = "West Barrens"
	icon_state = "west"
	base_lighting_alpha = 50
/area/bosenmori/outside/north_barrens
	name = "North Barrens"
	icon_state = "red"
	base_lighting_alpha = 50
/area/bosenmori/outside/east_barrens
	name = "East Barrens"
	icon_state = "east"
	base_lighting_alpha = 50
/area/bosenmori/outside/filtration
	name = "Filtration Sector"
	icon_state = "bluered"
	base_lighting_alpha = 50
/area/bosenmori/outside/river
	name = "Bosenmori River"
	icon_state = "blue"
	base_lighting_alpha = 50
//============================================================CAVES
/area/bosenmori/mountain/mining
	name = "Mining Sector"
	icon_state = "mining"
	base_lighting_alpha = 20
/area/bosenmori/mountain/abandoned
	name = "Abandoned Sector"
	icon_state = "cave"
	base_lighting_alpha = 20
/area/bosenmori/mountain/pilgrim
	name = "Pilgrim Path"
	icon_state = "away1"
	base_lighting_alpha = 20
/area/bosenmori/mountain/river
	name = "Cavern River"
	icon_state = "blue"
	base_lighting_alpha = 20
/area/bosenmori/mountain/field_post
	name = "Field Research Site"
	icon_state = "away2"
	base_lighting_alpha = 20
/area/bosenmori/mountain/temple_proper
	name = "Temple Proper"
	icon_state = "away3"
	base_lighting_alpha = 20
/area/bosenmori/mountain/temple_ruins
	name = "Ruins Perimeter"
	icon_state = "away"
	base_lighting_alpha = 20
/area/bosenmori/mountain/clearing
	name = "Mountain Clearing"
	icon_state = "away1"
	base_lighting_alpha = 35
//============================================================UNDERGROUND COLONY
/area/bosenmori/interior_heavy/Mai_hall
	name = "Maintenance Segment"
	icon_state = "away1"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_tree
	name = "Terranium Lower-Level"
	icon_state = "away2"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_sewer
	name = "Bosenmori Sewage System"
	icon_state = "yellow"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_research
	name = "Research Lower-Level"
	icon_state = "research"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_food
	name = "Food Processing Lower-Level"
	icon_state = "away3"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_engineering
	name = "Engineering Lower-Level"
	icon_state = "smes_engine"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_armory
	name = "Armory Lower-Level"
	icon_state = "security"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_secure_arm
	name = "Secure Armory Lower-Level"
	icon_state = "secure"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_cargo
	name = "Cargo Lower-Level"
	icon_state = "storage"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_corpo
	name = "Corporate Lower-Level"
	icon_state = "wy"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_caves
	name = "Underground Local Cave Network"
	icon_state = "cave"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_nexus
	name = "Nexus Lower-Level"
	icon_state = "nexus"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_shipment
	name = "Shipment Lower-Level"
	icon_state = "cargo"
	base_lighting_alpha = 35
/area/bosenmori/interior_heavy/Mai_ops
	name = "Emergency Operations Lower-Level"
	icon_state = "command"
	base_lighting_alpha = 35
/area/bosenmori/interior_glass/Mai_tree_under
	name = "Terrarium"
	icon_state = "green"
	base_lighting_alpha = 40
/area/bosenmori/outside/Mai_cargo_under
	name = "Construction Site"
	icon_state = "cargo"
	base_lighting_alpha = 40
//============================================================UNDERGROUND CAVERNS
/area/bosenmori/mountain/temple_under
	name = "Ruins Internal"
	icon_state = "away"
	base_lighting_alpha = 10
/area/bosenmori/mountain/first_level_caves
	name = "Underground Cave Network"
	icon_state = "away2"
	base_lighting_alpha = 10
/area/bosenmori/mountain/unknown_level_caves
	name = "Unknown"
	icon_state = "cave"
	base_lighting_alpha = 1
/area/bosenmori/mountain/unknown_level_temple
	name = "Unknown"
	icon_state = "away3"
	base_lighting_alpha = 1
/area/bosenmori/mountain/abandoned_dome_under
	name = "Abandoned Dome"
	icon_state = "hallc1"
	base_lighting_alpha = 10
