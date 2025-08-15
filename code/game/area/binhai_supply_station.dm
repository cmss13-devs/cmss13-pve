//====================================================================================================
//BASE
/area/binhai
	name = "Binhai Supply Station"
	icon_state = "lv-626"
	can_build_special = TRUE
	minimap_color = MINIMAP_AREA_COLONY
	powernet_name = "station"
//======================================================================================PARENT
/area/binhai/basemil
	name = "MSS & UPP Base"
	ceiling = CEILING_REINFORCED_METAL
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
	soundscape_playlist = AMBIENCE_SHIP
	powernet_name = "base"
/area/binhai/caves
	name = "Binhai Caves"
	ceiling = CEILING_UNDERGROUND_BLOCK_CAS
	ambience_exterior = AMBIENCE_CAVE
	soundscape_playlist = SCAPE_PL_CAVE
	base_muffle = MUFFLE_HIGH
/area/binhai/hab
	name = "Binhai Habitation Block"
	ceiling = CEILING_UNDERGROUND_METAL_BLOCK_CAS
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
	soundscape_playlist = AMBIENCE_SHIP
/area/binhai/main
	name = "Binhai Main Block"
	ceiling = CEILING_UNDERGROUND_METAL_BLOCK_CAS
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
	soundscape_playlist = AMBIENCE_SHIP
/area/binhai/oob
	name = "OOB"
	ceiling = CEILING_UNDERGROUND_METAL_BLOCK_CAS
	requires_power = FALSE
/area/binhai/other
	name = "Binhai Other"
	ceiling = CEILING_UNDERGROUND_METAL_BLOCK_CAS
//=============================================================================SHUTTLES
/area/binhai/shuttles/drop1
	name = "Hangar Block - Supply Pad"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
/area/binhai/shuttles/drop2
	name = "Military Block - Landing Pad"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	soundscape_playlist = SCAPE_PL_HANGAR
	powernet_name = "base"
//==============================================================================BASEMIL
/area/binhai/basemil/lower
	name = "MSS Block - Operations Space"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_SEC_CAVE
/area/binhai/basemil/lowerss
	name = "MSS Block - Substation"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	soundscape_playlist = SCAPE_PL_ENG
/area/binhai/basemil/office
	name = "MSS Block - Office"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_SEC_CAVE
/area/binhai/basemil/lowertoilet
	name = "MSS Block - Water Closet"
	icon_state = "toilet"
/area/binhai/basemil/lowerbunks
	name = "MSS Block - Bunks"
	icon_state = "red"
/area/binhai/basemil/lowerarmory
	name = "MSS Block - Armory"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC
/area/binhai/basemil/command
	name = "Military Block - Command Room"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND
	soundscape_playlist = SCAPE_PL_CIC
/area/binhai/basemil/airoom
	name = "Military Block - Human AI Interface"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND_CAVE
	soundscape_playlist = SCAPE_PL_AICORE
/area/binhai/basemil/lobby
	name = "Military Block - Lobby"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_SEC_CAVE
/area/binhai/basemil/hallway
	name = "Military Block - Hallway"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_SEC_CAVE
/area/binhai/basemil/upperss
	name = "Military Block - Substation"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	soundscape_playlist = SCAPE_PL_ENG
/area/binhai/basemil/maint
	name = "Military Block - Maintenance"
	icon_state = "yellow"
/area/binhai/basemil/uppertoilet
	name = "Military Block - Water Closet"
	icon_state = "toilet"
/area/binhai/basemil/upperbunks
	name = "Military Block - Quarters"
	icon_state = "green"
/area/binhai/basemil/upperarmory
	name = "Military Block - Armory"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC
//===============================================================================CAVES
/area/binhai/caves/main
	name = "Binhai Caves"
	icon_state = "cave"
	temperature = T0C
/area/binhai/caves/upper
	name = "Binhai Upper Caves"
	icon_state = "cave"
	temperature = T0C
	powernet_name = "base"
/area/binhai/caves/depths
	name = "Binhai Depths"
	icon_state = "cave"
	temperature = ICE_COLONY_TEMPERATURE
//======================================================================MAIN BLOCK & HANGAR
/area/binhai/main/hangar
	name = "Hangar Block - Arrivals and Storage"
	icon_state = "away1"
	soundscape_playlist = SCAPE_PL_HANGAR
/area/binhai/main/shed
	name = "Binhai - Storage Shed"
	icon_state = "storage"
/area/binhai/main/commissary
	name = "Hangar Block - Commissary"
	icon_state = "quart"
/area/binhai/main/lobby
	name = "Main Block - Arrivals Lobby"
	icon_state = "blue-red"
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
/area/binhai/main/hallway
	name = "Main Block - Hallway"
	icon_state = "blue-red"
/area/binhai/main/pap
	name = "Main Block - PAP Space"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE
/area/binhai/main/paparmory
	name = "Main Block - PAP Armory"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC
/area/binhai/main/operations
	name = "Main Block - Colony Operations"
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_COMMAND
/area/binhai/main/server
	name = "Main Block - Server Room"
	icon_state = "purple"
	minimap_color = MINIMAP_AREA_COMMAND_CAVE
/area/binhai/main/diner
	name = "Main Block - Diner"
	icon_state = "cafeteria"
/area/binhai/main/bar
	name = "Main Block - Bar"
	icon_state = "cafeteria"
/area/binhai/main/kitchen
	name = "Main Block - Kitchen"
	icon_state = "kitchen"
/area/binhai/main/toilet
	name = "Main Block - Water Closet"
	icon_state = "toilet"
/area/binhai/main/hall
	name = "Main Block - Assembly Hall"
	icon_state = "blue-red2"
/area/binhai/main/janitor
	name = "Main Block - Sanitation Closet"
	icon_state = "janitor"
/area/binhai/main/supply
	name = "Main Block - Supply Closet"
	icon_state = "storage"
/area/binhai/main/synth
	name = "Main Block - Synthetic Storage"
	icon_state = "yellow"
/area/binhai/main/atmos
	name = "Main Block - Atmospherics"
	icon_state = "atmos"
/area/binhai/main/engineering
	name = "Main Block - Engineering"
	icon_state = "engine"
	minimap_color = MINIMAP_AREA_ENGI
	soundscape_playlist = SCAPE_PL_ENG
/area/binhai/main/treatment
	name = "Main Block - Treatment Space"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY
//=============================================================================HABITATION
/area/binhai/hab/hallway
	name = "Hab Block - Hallway"
	icon_state = "blue"
/area/binhai/hab/north
	name = "Hab Block - Apartments North"
	icon_state = "blue"
/area/binhai/hab/east
	name = "Hab Block - Apartments East"
	icon_state = "blue"
/area/binhai/hab/west
	name = "Hab Block - Apartments West"
	icon_state = "blue"
/area/binhai/hab/south
	name = "Hab Block - Apartments South"
	icon_state = "blue"
/area/binhai/hab/study
	name = "Hab Block - Study Space"
	icon_state = "blue"
/area/binhai/hab/washing
	name = "Hab Block - Washing Space"
	icon_state = "blue"
/area/binhai/hab/canteen
	name = "Hab Block - Canteen"
	icon_state = "cafeteria"
/area/binhai/hab/bunks
	name = "Hab Block - Bunks"
	icon_state = "blue"
/area/binhai/hab/toilet
	name = "Hab Block - Bunk Water Closet"
	icon_state = "toilet"
/area/binhai/hab/substation
	name = "Hab Block - Substation"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	soundscape_playlist = SCAPE_PL_ENG
//===============================================================================Other
/area/binhai/other/ship1
	name = "Cargo Freight Shuttle - Herschel OBERON-Class"
	icon_state = "blue-red2"
	requires_power = FALSE
/area/binhai/other/checkpoint
	name = "Binhai - Checkpoint"
	icon_state = "red"
/area/binhai/other/hablower
	name = "Hab Block - Lower Access"
	icon_state = "yellow"
/area/binhai/other/mainlower
	name = "Main Block - Lower Access"
	icon_state = "yellow"
/area/binhai/other/Engineeringlower
	name = "Main Block - Engineering Lower Access"
	icon_state = "engine_storage"
	minimap_color = MINIMAP_AREA_ENGI_CAVE
/area/binhai/other/powerstation
	name = "Binhai - Power Station"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI
	soundscape_playlist = SCAPE_PL_ENG
/area/binhai/other/watertreat
	name = "Binhai - Water Treatment Control"
	icon_state = "yellow"
/area/binhai/other/research
	name = "Binhai - Research"
	icon_state = "research"
	minimap_color = MINIMAP_AREA_RESEARCH
/area/binhai/other/morgue
	name = "Binhai - Morgue"
	icon_state = "medbay2"
	minimap_color = MINIMAP_AREA_MEDBAY_CAVE
/area/binhai/other/mineprep
	name = "Mining Block - Prep"
	icon_state = "purple"
/area/binhai/other/mineoffice
	name = "Mining Block - Office"
	icon_state = "purple"
/area/binhai/other/minelower
	name = "Mining Block - Lower Excavation"
	icon_state = "purple"
/area/binhai/other/hyrdo
	name = "Binhai - Hydroponics"
	icon_state = "hydro"
/area/binhai/other/umbilical
	name = "Binhai - Umbillical Arrivals"
	icon_state = "yellow"
//===============================================================================OOB
/area/binhai/oob/buttons
	name = "Out of Bounds"
	icon_state = "mech"
	requires_power = FALSE
