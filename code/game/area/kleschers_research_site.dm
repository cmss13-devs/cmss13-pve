//==================================================================KLESCHERS RESEARCH SITE
//BASE
/area/kleschers
	name = "Kleschers Research"
	icon_state = "lv626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY
//============================================================PARENTS
/area/kleschers/outside
	name = "Kleschers Exterior"
	ceiling = CEILING_NONE
/area/kleschers/int_glass
	name = "Kleschers Glass"
	ceiling = CEILING_GLASS
/area/kleschers/int_reg
	name = "Kleschers Metal"
	ceiling = CEILING_METAL
/area/kleschers/int_heavy
	name = "Kleschers Reinforced"
	ceiling = CEILING_REINFORCED_METAL
/area/kleschers/caves
	name = "Kleschers Caves"
	ceiling = CEILING_DEEP_UNDERGROUND
//============================================================SHUTTLES
/area/kleschers/shuttles/drop1
	name = "Kleschers - Spaceport"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
/area/kleschers/shuttles/drop2
	name = "Kleschers - Cargo"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
//============================================================Northwest Portion (viro,marshal,clinic)
/area/kleschers/outside/spaceport
	name = "Kleschers Spaceport"
	icon_state = "away1"
/area/kleschers/int_reg/roofed_spaceport
	name = "Kleschers Spaceport"
	icon_state = "blueold"
/area/kleschers/int_reg/clinic
	name = "Saint Mikaels Clinic"
	icon_state = "medbay"
/area/kleschers/int_reg/marshals
	name = "Colonial Marshals Complex"
	icon_state = "security"
/area/kleschers/int_heavy/marshals_armory
	name = "Armory"
	icon_state = "secure_armory"
/area/kleschers/int_reg/virology
	name = "Virology"
	icon_state = "virology"
/area/kleschers/outside/northwest
	name = "Kleschers Northwestern Sector"
	icon_state = "northwest"
/area/kleschers/int_reg/telecomms
	name = "Spaceport Telecommunication Hub"
	icon_state = "yellow"
/area/kleschers/outside/telecomms_yard
	name = "Spaceport Telecommunication Yard"
	icon_state = "blue-red"
/area/kleschers/int_reg/garage
	name = "Spaceport Garage"
	icon_state = "storage"
/area/kleschers/caves/north_river
	name = "Northern Caves"
	icon_state = "cave"
//============================================================Western Portion (Cargo, Fitness, Engineering)
/area/kleschers/int_glass/fitness
	name = "Fitness & Rehabilitation Center"
	icon_state = "fitness"
/area/kleschers/int_reg/cargo
	name = "Cargo Bay"
	icon_state = "cargo"
/area/kleschers/int_reg/engineering
	name = "Engineering Complex"
	icon_state = "SMES"
/area/kleschers/caves/western_cave
	name = "Western Caves"
	icon_state = "caves"
/area/kleschers/outside/western
	name = "Kleschers Western Sector"
	icon_state = "west"
//============================================================Central Portion (Admin, Bar, Dorms)
/area/kleschers/int_reg/admin
	name = "Kleschers Administration Complex"
	icon_state = "command"
/area/kleschers/int_glass/admin_open
	name = "Kleschers Administration Complex"
	icon_state = "command"
/area/kleschers/int_reg/dorms
	name = "Dormitory Complex"
	icon_state = "yellow"
/area/kleschers/int_heavy/sec_armory
	name = "Secured Storage"
	icon_state = "secure_armory"
/area/kleschers/int_glass/bar
	name = "Bar Complex"
	icon_state = "away1"
/area/kleschers/outside/central_road
	name = "Klescher Central Sector"
	icon_state = "away2"
/area/kleschers/int_reg/connector
	name = "Engineering-Filtration Connector Hallway"
	icon_state = "yellow"
//============================================================Northeastern Portion (Diner, Library, Control, Hydro)
/area/kleschers/int_reg/control_cover
	name = "Klescher Northeastern Sector"
	icon_state = "cave"
/area/kleschers/int_reg/diner
	name = "Diner Complex"
	icon_state = "red"
/area/kleschers/int_glass/library
	name = "Library Complex"
	icon_state = "yellow"
/area/kleschers/int_reg/library
	name = "Library Complex"
	icon_state = "away1"
/area/kleschers/outside/northeast
	name = "Kleschers Northeastern Sector"
	icon_state = "northeast"
/area/kleschers/int_reg/control_tower
	name = "Control Tower Complex"
	icon_state = "command"
/area/kleschers/int_reg/hydroponics
	name = "Hydroponics Complex"
	icon_state = "green"
/area/kleschers/int_glass/hydroponics
	name = "Hydroponics Complex"
	icon_state = "green"
//============================================================Eastern Portion (filtration, offices)
/area/kleschers/int_reg/filtration
	name = "Filtration Complex"
	icon_state = "robotics"
/area/kleschers/int_reg/offices
	name = "General Office Complex"
	icon_state = "hallE1"
/area/kleschers/int_heavy/filtration_locks
	name = "Filtration Gate"
	icon_state = "red"
/area/kleschers/outside/east
	name = "Kleschers Eastern Sector"
	icon_state = "east"
/area/kleschers/outside/construction
	name = "Construction Site"
	icon_state = "yellow"
/area/kleschers/caves/east
	name = "Eastern Caves"
	icon_state = "away3"
//============================================================ETA LABS
/area/kleschers/outside/eta_courtyard
	name = "Eta Courtyard"
	icon_state = "south"
/area/kleschers/int_heavy/eta
	name = "Eta Labs"
	icon_state = "research"
/area/kleschers/caves/southern_caves
	name = "Southern Caves"
	icon_state = "cave"
/area/kleschers/int_heavy/reactor_excess
	name = "Kleschers Reactor Cooling Pipeline"
	icon_state = "engine_smes"
//============================================================LAMBDA LABS
/area/kleschers/int_reg/checkpoint
	name = "Lambda Entry Checkpoint"
	icon_state = "security"
/area/kleschers/outside/lambda_entry
	name = "Lambda Entry Zone"
	icon_state = "away1"
/area/kleschers/int_heavy/lambda_north_wing
	name = "Lambda North Wing"
	icon_state = "north"
/area/kleschers/int_heavy/lambda_south_wing
	name = "Lambda South Wing"
	icon_state = "south"
/area/kleschers/int_heavy/lambda_virology
	name = "Lambda Virology"
	icon_state = "research"
/area/kleschers/int_heavy/lambda_center
	name = "Lambda Central"
	icon_state = "yellow"
/area/kleschers/int_heavy/lambda_saferoom
	name = "Emergency Safe Room"
	icon_state = "blue-red2"
/area/kleschers/caves/northeast_caves
	name = "Northeastern Caves"
	icon_state = "cave"
//============================================================SOUTHWEST PORTION
/area/kleschers/int_reg/shuttle
	name = "Crusader Light-Hauler"
	icon_state = "shuttle"
/area/kleschers/outside/rebel_landing
	name = "Exterior Landing Site"
	icon_state = "away3"
/area/kleschers/caves/southwest_caves
	name = "Southwestern Caves"
	icon_state = "southwest"
/area/kleschers/int_reg/buildings
	name = "Landing Site Building"
	icon_state = "away2"
/area/kleschers/outside/southern_path
	name = "Southern Path"
	icon_state = "away1"
