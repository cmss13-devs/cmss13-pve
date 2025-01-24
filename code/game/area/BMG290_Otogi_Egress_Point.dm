//====================================================================================================BMG290 AREAS
//BASE
/area/bmg290
	name = "Otogi Egress"
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY
//=============================================================================================PARENT, this is the stuff to define ceilings i bet
/area/bmg290/wilderness
	name = "Wilderness"
	ceiling = CEILING_NONE
/area/bmg290/wilderness_roof
	name = "Sheltered"
	ceiling = CEILING_METAL
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
/area/bmg290/caverns
	name = "Murasaki Sector"
	ceiling = CEILING_DEEP_UNDERGROUND
/area/bmg290/colony
	name = "Otogi Sector"
	ceiling = CEILING_METAL
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
/area/bmg290/keppitz
	name = "Keppitz Sector"
	ceiling = CEILING_METAL
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
/area/bmg290/relay
	name = "Relay Sector"
	ceiling = CEILING_REINFORCED_METAL
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
/area/bmg290/site
	name = "Site Area"
	ceiling = CEILING_DEEP_UNDERGROUND
/area/bmg290/oob
	name = "OOB"
	ceiling = CEILING_NO_PROTECTION
//===============================================================================SHUTTLES
/area/bmg290/shuttles/drop1
	name = "Otogi - Colony Logistics Hub"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
/area/bmg290/shuttles/drop2
	name = "Otogi - Outskirts"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 175
/area/bmg290/shuttles/drop3
	name = "Keppitz - Private Hangar"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 150
/area/bmg290/shuttles/drop4
	name = "Site Landing"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	base_lighting_alpha = 125
//===============================================================================OUTSKIRTS
/area/bmg290/wilderness/road
	name = "Otogi Roadside"
	icon_state = "blue-red2"
	base_lighting_alpha = 175
/area/bmg290/wilderness/outskirts
	name = "Otogi Outskirts"
	icon_state = "hallf"
	base_lighting_alpha = 175
/area/bmg290/wilderness/beach
	name = "Otogi Beach"
	icon_state = "varadero2"
	base_lighting_alpha = 175
/area/bmg290/wilderness/site
	name = "Site Perimeter"
	icon_state = "varadero2"
	base_lighting_alpha = 125
/area/bmg290/wilderness/farmland
	name = "Farmland"
	icon_state = "varadero2"
	base_lighting_alpha = 175
/area/bmg290/wilderness/archaeology
	name = "Archaeology Site"
	icon_state = "varadero0"
	base_lighting_alpha = 125
/area/bmg290/wilderness/colony_exterior
	name = "Otogi Inner Area"
	icon_state = "hallf"
	base_lighting_alpha = 175
/area/bmg290/wilderness/relay_exterior
	name = "Relay Inner Area"
	icon_state = "hallf"
	base_lighting_alpha = 175
//===============================================OUTSKIRTS roofing
/area/bmg290/wilderness_roof/beach_house
	name = "Beach Housing"
	icon_state = "varadero0"
	base_lighting_alpha = 175
/area/bmg290/wilderness_roof/telecomms_station
	name = "Relay Substation"
	icon_state = "varadero0"
	base_lighting_alpha = 175
/area/bmg290/wilderness_roof/checkpoint
	name = "Checkpoint"
	icon_state = "varadero0"
	base_lighting_alpha = 175
/area/bmg290/wilderness_roof/farm_house
	name = "Farm House"
	icon_state = "red"
	base_lighting_alpha = 175
/area/bmg290/wilderness_roof/storage_house
	name = "Storage House"
	icon_state = "storage"
	base_lighting_alpha = 150
/area/bmg290/wilderness_roof/archaeology_check
	name = "Archaeology Foward Post"
	icon_state = "storage"
	base_lighting_alpha = 125
//===============================================================================COLONY
/area/bmg290/colony/logistics
	name = "Otogi Logistics Services"
	icon_state = "storage"
	base_lighting_alpha = 175
/area/bmg290/colony/logistics_hub
	name = "Otogi Logistics Warehouse"
	icon_state = "storage"
	base_lighting_alpha = 175
/area/bmg290/colony/hospital
	name = "Otogi Hospital"
	icon_state = "medbay"
	base_lighting_alpha = 175
/area/bmg290/colony/security
	name = "Otogi Security"
	icon_state = "security"
	base_lighting_alpha = 175
/area/bmg290/colony/diner
	name = "Otogi Diner"
	icon_state = "green"
	base_lighting_alpha = 175
/area/bmg290/colony/bar
	name = "Otogi Bar"
	icon_state = "red"
	base_lighting_alpha = 175
/area/bmg290/colony/shed
	name = "Otogi Shed"
	icon_state = "yellow"
	base_lighting_alpha = 175
/area/bmg290/colony/engineering
	name = "Otogi Engineering"
	icon_state = "SMES"
	base_lighting_alpha = 175
/area/bmg290/colony/admin
	name = "Otogi Operations & Public Services"
	icon_state = "command"
	base_lighting_alpha = 175
/area/bmg290/colony/complex
	name = "Otogi Multi-Complex Hub"
	icon_state = "hallE"
	base_lighting_alpha = 175
/area/bmg290/colony/flightdeck
	name = "Otogi Flight Control"
	icon_state = "command"
	base_lighting_alpha = 175
/area/bmg290/colony/motorpool
	name = "Otogi Motor Pool"
	icon_state = "engineering"
	base_lighting_alpha = 175
/area/bmg290/colony/hangar
	name = "Otogi Logistics Hangars"
	icon_state = "lz1"
	base_lighting_alpha = 175
//===============================================================================RELAY
/area/bmg290/relay/cargo
	name = "Relay Cargo Area"
	icon_state = "storage"
	base_lighting_alpha = 175
/area/bmg290/relay/engineering
	name = "Relay Generator Room"
	icon_state = "smes"
	base_lighting_alpha = 175
/area/bmg290/relay/synthetic
	name = "Relay Synthetic Storage Bay"
	icon_state = "robotics"
	base_lighting_alpha = 175
/area/bmg290/relay/dataserver
	name = "Relay Data Room"
	base_lighting_alpha = 175
/area/bmg290/relay/hallway
	name = "Relay Entry Section"
	icon_state = "hallE"
	base_lighting_alpha = 175
/area/bmg290/relay/telecommunication
	name = "Relay Telecommunication Center"
	icon_state = "telecomms"
	base_lighting_alpha = 175
/area/bmg290/relay/exterior_storage
	name = "Relay Cargo Stowage"
	icon_state = "storage"
	base_lighting_alpha = 175
/area/bmg290/relay/underground_shelter
	name = "Relay Mass Evacuation Shelter"
	icon_state = "secure armory"
	base_lighting_alpha = 125
//===============================================================================KEPPITZ
/area/bmg290/keppitz/command
	name = "Keppitz Public Services Center"
	icon_state = "command"
	base_lighting_alpha = 150
/area/bmg290/keppitz/archives
	name = "Keppitz Public Archives"
	icon_state = "blue-red2"
	base_lighting_alpha = 150
/area/bmg290/keppitz/research
	name = "Keppitz Private Laboratory"
	icon_state = "research"
	base_lighting_alpha = 150
/area/bmg290/keppitz/acquisitions
	name = "Keppitz Private Acquisitions Section"
	icon_state = "mech"
	base_lighting_alpha = 150
/area/bmg290/keppitz/security
	name = "Keppitz Private Security Section"
	icon_state = "security"
	base_lighting_alpha = 150
/area/bmg290/keppitz/test
	name = "Keppitz Private Testing Chambers"
	icon_state = "mech"
	base_lighting_alpha = 150
/area/bmg290/keppitz/entry
	name = "Keppitz Entry Section"
	icon_state = "blue-red2"
	base_lighting_alpha = 150
/area/bmg290/keppitz/entry_pub
	name = "Keppitz Public Entry Section"
	icon_state = "blue-red2"
	base_lighting_alpha = 150
/area/bmg290/keppitz/interlude
	name = "Keppitz Interlude Section"
	icon_state = "fitness"
	base_lighting_alpha = 150
/area/bmg290/keppitz/hangar
	name = "Keppitz Private Hangar"
	icon_state = "lz2"
	base_lighting_alpha = 150
//===============================================================================SITE
/area/bmg290/site/undiscovered
	name = "Unknown Area"
	icon_state = "hallE"
	base_lighting_alpha = 100
/area/bmg290/site/discovered
	name = "Research Site"
	icon_state = "research"
	base_lighting_alpha = 100
//===============================================================================CAVERNS
/area/bmg290/caverns/cave_east
	name = "Murasaki Depths"
	icon_state = "cave"
	base_lighting_alpha = 125
/area/bmg290/caverns/filtration
	name = "Otogi Filtration Tunnel"
	icon_state = "filtration"
	base_lighting_alpha = 125
/area/bmg290/caverns/site_caves
	name = "Site Depths"
	icon_state = "cave2"
	base_lighting_alpha = 125
/area/bmg290/caverns/cave_west
	name = "Murasaki Depths"
	icon_state = "cave"
	base_lighting_alpha = 125
/area/bmg290/caverns/terranium
	name = "Keppitz Research Grounds"
	icon_state = "yellow"
	base_lighting_alpha = 125
//===============================================================================OOB
/area/bmg290/oob/button_stuff
	name = "Outside Area of Operations"
	icon_state = "mech"
/area/bmg290/oob/plg
	name = "Perimeter Lockdown Gate"
	icon_state = "mech"
	base_lighting_alpha = 150
