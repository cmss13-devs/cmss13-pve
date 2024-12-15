//====================================================================================================BMG290 AREAS
//BASE
/area/bmg290
	name = "Otogi Egress"
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY
//=============================================================PARENT, this is the stuff to define ceilings i bet
/area/bmg290/colony_exterior
	name = "Otogi Egress - Exterior"
	ceiling = CEILING_NONE

/area/bmg290/colony_interior
	name = "Otogi Egress - Interior"
	ceiling = CEILING_METAL

/area/bmg290/relay_exterior
	name = "Otogi Relay - Coast"
	ceiling = CEILING_NONE

/area/bmg290/relay_interior
	name = "Otogi Relay - Interior"
	ceiling = CEILING_REINFORCED_METAL

/area/bmg290/relay_interior_b
	name = "Otogi Relay - Interior"
	ceiling = CEILING_METAL

/area/bmg290/keppitz_exterior
	name = "Keppitz - Exterior"
	ceiling = CEILING_NONE

/area/bmg290/keppitz_exterior_b
	name = "Keppitz - Exterior"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/bmg290/keppitz_interior
	name = "Keppitz Site - Public Section"
	ceiling = CEILING_GLASS

/area/bmg290/keppitz_interior_b
	name = "Keppitz Site - Private Section"
	ceiling = CEILING_METAL

/area/bmg290/ancie_eng
	name = "Keppitz Site - Ruins"
	ceiling = CEILING_DEEP_UNDERGROUND

/area/bmg290/ancie_eng_weakened
	name = "Keppitz Site - Onsite Research"
	ceiling = CEILING_REINFORCED_METAL

/area/bmg290/caverns
	name = "Murasaki Mountain"
	ceiling = CEILING_DEEP_UNDERGROUND

/area/bmg290/caverns_weakened
	name = "Murasaki Mountain"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/bmg290/oob
	name = "Solid State"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

//==================================================================Shuttles
/area/shuttle/drop1/bmg290
	name = "Otogi Egress Point - Logistics Hub Landing Pad"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ

/area/shuttle/drop2/bmg290
	name = "Otogi Egress Point - Otogi Outskirts"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ

/area/shuttle/drop3/bmg290
	name = "Otogi Egress Point - Keppitz Private Hangar"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ

//====================Otogi Colony, does not include filtration tunnel or beach
//
//===exterior
//
/area/bmg290/relay_exterior/cargo_drop
	name = "Otogi Colony - Cargo Area"
	icon_state = "storage"

/area/bmg290/relay_exterior/colony_center
	name = "Otogi Colony - Roadway"
	icon_state = "hall0"

/area/bmg290/relay_exterior/colony_sw
	name = "Otogi Colony - Southwest"
	icon_state = "hall1"

/area/bmg290/relay_exterior/colony_ne
	name = "Otogi Colony - Filtration"
	icon_state = "hall2"

/area/bmg290/relay_exterior/colony_nw
	name = "Otogi Colony - Northwest"
	icon_state = "hall3"
//
//===the multi-complex stuff
//
/area/bmg290/colony_interior/main_complex
	name = "Otogi Hub"
	icon_state = "green"

/area/bmg290/colony_interior/medical
	name = "Otogi Medical Station"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/bmg290/colony_interior/shop
	name = "Whalesales Yonder Shop"
	icon_state = "brown"

/area/bmg290/colony_interior/chapel
	name = "Otogi Chapel"
	icon_state = "brown"

/area/bmg290/colony_interior/substation
	name = "Otogi Telecommunication Substation"
	icon_state = "comms1"
	minimap_color = MINIMAP_AREA_ENGI

/area/bmg290/colony_interior/maintenance
	name = "Otogi Maintenance Station"
	icon_state = "comms1"
	minimap_color = MINIMAP_AREA_ENGI

/area/bmg290/colony_interior/marshal
	name = "Otogi Security Station"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_SEC

/area/bmg290/colony_interior/offices
	name = "Otogi Offices"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND
//
//===greenshift area
//
/area/bmg290/colony_interior/shed
	name = "Otogi Sports Closet"
	icon_state = "yellow"

/area/bmg290/colony_interior/bar
	name = "Otogi Bar"
	icon_state = "red"

/area/bmg290/colony_interior/diner
	name = "Otogi Diner"
	icon_state = "green"

/area/bmg290/colony_interior/motor_pool
	name = "Otogi Motor Pool"
	icon_state = "yellow"
//
//===Hangar Area
//
/area/bmg290/colony_interior/flight_control
	name = "Flight Control Deck"
	icon_state = "blue"

/area/bmg290/colony_interior/logistics_hub
	name = "Logistics Hub - Receiving"
	icon_state = "brown"

/area/bmg290/colony_interior/logistics_station
	name = "Logistics Hub - Deliveries"
	icon_state = "brown"
//
//===Engineering
//
/area/bmg290/colony_interior/power_plant
	name = "Otogi Main Power Station"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/bmg290/colony_interior/disposals
	name = "Otogi Disposals"
	icon_state = "black"

/area/bmg290/colony_interior/repair_station
	name = "Otogi Workshop"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/bmg290/colony_interior/engi_hall
	name = "Otogi Engineering Hall"
	icon_state = "brown"
	minimap_color = MINIMAP_AREA_ENGI

//==================================================================Otogi Relay, split up into general areas
//
//===Beach Area
//
/area/bmg290/relay_exterior/beach_bar
	name = "Bay Harbor Bar"
	icon_state = "blue"

/area/bmg290/relay_interior_b/beach_house_clean
	name = "Beach House - Owned"
	icon_state = "green"

/area/bmg290/relay_interior_b/beach_house_dirty
	name = "Beach House - For Sale"
	icon_state = "green"

/area/bmg290/relay_exterior/beach_roadside
	name = "Otogi Beach - Roadside"
	icon_state = "hall1"

/area/bmg290/relay_exterior/beach
	name = "Beach"
	icon_state = "yellow"

//
//===Outskirts
//
/area/bmg290/relay_exterior/outskirts
	name = "Otogi Outskirts"
	icon_state = "brown"

/area/bmg290/relay_interior_b/relay_substation
	name = "Otogi Outskirts - Relay Substation"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/bmg290/relay_exterior/east_bridge
	name = "Otogi Outskirts - Bridgeside"
	icon_state = "blue"

/area/bmg290/relay_exterior/outskirts_road
	name = "Otogi Outskirts - Roadway"
	icon_state = "hall3"

//
//===relay
//
/area/bmg290/relay_exterior/west_bridge
	name = "Relay - Bridgeside"
	icon_state = "green"

/area/bmg290/relay_exterior/relay_courtyard
	name = "Relay - Courtyard"
	icon_state = "hall1"

/area/bmg290/relay_interior_b/relay_courtyard_cargo
	name = "Relay - Garage"
	icon_state = "brown"

/area/bmg290/relay_interior/entry_hall
	name = "Relay - Entry Sector"
	icon_state = "red"

/area/bmg290/relay_interior/data_room
	name = "Relay - Data Farm"
	icon_state = "blue"

/area/bmg290/relay_interior/cargo_hall
	name = "Relay - Cargo Hall"
	icon_state = "yellow"

/area/bmg290/relay_interior/server_room
	name = "Relay - Telecommunication Servers"
	icon_state = "blue"

/area/bmg290/relay_interior/maintenance_hall //Synthetic room, Maintenance hall, Repair Station
	name = "Relay - Service Sector"
	icon_state = "brown"

/area/bmg290/relay_interior/turbine
	name = "Relay - Generator Room"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/bmg290/relay_interior/cargo_hall_transfer
	name = "Relay - Cargo Transfers"
	icon_state = "red"

/area/bmg290/relay_interior/vault
	name = "Relay - Secure Bunker"
	icon_state = "decotamination"

//
//Keppitz Research, does not include mining station, but includes small cave area
//
//===Public Sector
//
/area/bmg290/keppitz_interior_b/garage
	name = "Keppitz - Garage"
	icon_state = "brown"

/area/bmg290/keppitz_interior/ops_center
	name = "Keppitz - Operation Center"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND

/area/bmg290/keppitz_interior/archives
	name = "Keppitz - Archives"
	icon_state = "green"

/area/bmg290/keppitz_interior_b/secured_archives
	name = "Keppitz - Secured Archives"
	icon_state = "blue"

/area/bmg290/keppitz_interior_b/receiving
	name = "Keppitz - Receiving"
	icon_state = "brown"

/area/bmg290/keppitz_exterior_b/cave
	name = "Keppitz - Caves"
	icon_state = "brown"

/area/bmg290/keppitz_exterior/cargo_section
	name = "Keppitz - Public Cargo"
	icon_state = "storage"
//
//===Private Sector
//
/area/bmg290/keppitz_interior_b/sterilization
	name = "Keppitz - Sanitation Station"
	icon_state = "red"

/area/bmg290/keppitz_interior_b/research
	name = "Keppitz - Research Station"
	icon_state = "purple"

/area/bmg290/keppitz_interior_b/cargo_area
	name = "Keppitz - Loading Area"
	icon_state = "yellow"

/area/bmg290/keppitz_interior/research_rest_area
	name = "Keppitz - Rest"
	icon_state = "green"

/area/bmg290/keppitz_exterior/research_camp //******everything that is considered open jungle area
	name = "Keppitz - Field Post"
	icon_state = "hall1"

/area/bmg290/keppitz_interior_b/acquisitions
	name = "Keppitz - Acquisition Sector"
	icon_state = "purple"

/area/bmg290/keppitz_interior_b/research_director
	name = "Keppitz - Director's Office"
	icon_state = "purple"

/area/bmg290/keppitz_interior_b/research_standard
	name = "Keppitz - Standard Space"
	icon_state = "green"

/area/bmg290/keppitz_interior_b/research_containment
	name = "Keppitz - Containment"
	icon_state = "red"
//
//==============================================================Engineer Temple
//
/area/bmg290/ancie_eng_weakened/breached_hall
	name = "Ruin - Converted Hall"
	icon_state = "blue"

/area/bmg290/ancie_eng_weakened/hallway_section
	name = "Ruin - Site walkway"
	icon_state = "purple"

/area/bmg290/ancie_eng_weakened/antechamber
	name = "Ruin - Antechamber"
	icon_state = "red"

/area/bmg290/ancie_eng/deep_site
	name = "Ruin - Deep Site"
	icon_state = "blue"

/area/bmg290/ancie_eng/chamber1
	name = "Ruin - Chamber"
	icon_state = "brown"

/area/bmg290/ancie_eng/chamber2
	name = "Ruin - Chamber Pit"
	icon_state = "brown"

/area/bmg290/ancie_eng/chamber3
	name = "Ruin - Chamber Weapon"
	icon_state = "brown"

/area/bmg290/ancie_eng/main_chamber
	name = "Ruin - Main Chamber"
	icon_state = "brown"

/area/bmg290/ancie_eng/secondary_chamber
	name = "Ruin - Long Chamber"
	icon_state = "purple"

/area/bmg290/ancie_eng/hallway_section_untouched
	name = "Ruin - Hallway"
	icon_state = "hall1"

/area/bmg290/ancie_eng/odd_hall
	name = "Ruin - Long Hall"
	icon_state = "hall2"
//
//========================================================================Caves
//===Filtration Tunnel
//
/area/bmg290/caverns/filtration_tunnel
	name = "Murasaki - Filtration Tunnel"
	icon_state = "hall1"

/area/bmg290/caverns_weakened/filtration_perimeter
	name = "Murasaki - Filtration Perimeter"
	icon_state = "red"

/area/bmg290/colony_interior/filtration_station
	name = "Murasaki - Filtration Station"
	icon_state = "yellow"
//
//===Mining
//
/area/bmg290/caverns/area1
	name = "Murasaki - Mining Network"
	icon_state = "hall3"
/area/bmg290/caverns_weakened/mining_area
	name = "Murasaki - Developed Mining Sector"
	icon_state = "storage"
/area/bmg290/keppitz_exterior/mining_outside
	name = "Murasaki - Keppitz Mining"
	icon_state = "yellow"

/area/bmg290/keppitz_interior/mining_hub
	name = "Murasaki - Keppitz Mining Hub"
	icon_state = "brown"

//
//===Valley
//
/area/bmg290/colony_exterior/valley_site
	name = "Murasaki - Valley Site"
	icon_state = "green"

/area/bmg290/caverns_weakened/valley_entry
	name = "Murasaki - Valley Network"
	icon_state = "brown"
//
//===Cave
/area/bmg290/caverns/halls
	name = "Murasaki - Cave Network"
	icon_state = "hall2"

//
//=============================================Extras
//
/area/bmg290/caverns/ridgeline
	name = "Outskirts Ridgeline"
	icon_state = "blue-red2"

/area/bmg290/relay_exterior/open_ridgeline
	name = "Beach Ridgeline"
	icon_state = "blue"

/area/bmg290/oob/playfulstuff
	name = "Unknown Area"
	icon_state = "mechbay"

/area/bmg290/oob/ocean
	name = "Otogi Waters"
	icon_state = "blue-red2"

/area/bmg290/oob/blocker
	name = "Block"
	icon_state = "vault"

//okay, that done will probably work on more specifics later on
