//====================================================================================================Redemption Valley AREAS
//BASE
/area/redemptionvalley
	name = "Redemption Valley"
	icon_state = "lv-626"
	can_build_special = TRUE
	minimap_color = MINIMAP_AREA_COLONY
//=============================================================================================PARENT
/area/redemptionvalley/valley
	name = "Outside"
	ceiling = CEILING_NONE
	powernet_name = "outpost"
/area/redemptionvalley/valleyroof
	name = "Sheltered"
	ceiling = CEILING_METAL
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
	powernet_name = "settlement"
/area/redemptionvalley/caverns
	name = "Caves"
	ceiling = CEILING_DEEP_UNDERGROUND
	ambience_exterior = AMBIENCE_CAVE
	soundscape_playlist = SCAPE_PL_CAVE
	base_muffle = MUFFLE_HIGH
/area/redemptionvalley/outpost
	name = "Redemption Outpost"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM
	powernet_name = "outpost"
/area/redemptionvalley/oob
	name = "OOB"
	ceiling = CEILING_NO_PROTECTION
	minimap_color = MINIMAP_SOLID
//===============================================================================SHUTTLES
/area/redemptionvalley/shuttles/drop1
	name = "Redemption Valley - Supply Pad"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ
	powernet_name = "settlement"
/area/redemptionvalley/shuttles/drop2
	name = "Military Base - Clifftop Landing Pad"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
	is_landing_zone = TRUE
	soundscape_playlist = SCAPE_PL_LV522_OUTDOORS
	powernet_name = "outpost"
//=============================================================================================VALLEY
/area/redemptionvalley/valley/proper
	name = "Redemption Valley Main Road"
	icon_state = "south"
	powernet_name = "settlement"
/area/redemptionvalley/valley/checkpoint
	name = "Redemption Valley Checkpoint"
	icon_state = "central"
/area/redemptionvalley/valley/Westbound
	name = "Redemption Valley Westbound"
	icon_state = "west"
/area/redemptionvalley/valley/cliff
	name = "Redemption Valley - Clifftop"
	icon_state = "north"
	soundscape_playlist = SCAPE_PL_LV522_OUTDOORS
//=============================================================================================VALLEY ROOF
/area/redemptionvalley/valleyroof/store
	name = "Redemption Valley - Store"
	icon_state = "quart"
/area/redemptionvalley/valleyroof/security
	name = "Redemption Valley - Security Office"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC
/area/redemptionvalley/valleyroof/medical
	name = "Redemption Valley - Medical"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY
/area/redemptionvalley/valleyroof/admin
	name = "Redemption Valley - Site Administration"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND
/area/redemptionvalley/valleyroof/server
	name = "Redemption Valley - Site Server Room"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND_CAVE
/area/redemptionvalley/valleyroof/cafe
	name = "Redemption Valley - Cafe"
	icon_state = "cafeteria"
/area/redemptionvalley/valleyroof/laundro
	name = "Redemption Valley - Laundromat"
	icon_state = "janitor"
/area/redemptionvalley/valleyroof/engi
	name = "Redemption Valley - Engineering"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI
/area/redemptionvalley/valleyroof/company
	name = "Redemption Valley - Company Housing"
	icon_state = "purple"
/area/redemptionvalley/valleyroof/hydro
	name = "Redemption Valley - Hydroponics"
	icon_state = "hydro"
/area/redemptionvalley/valleyroof/storage
	name = "Redemption Valley - Pod Storage"
	icon_state = "storage"
/area/redemptionvalley/valleyroof/houseone
	name = "Redemption Valley - House One"
	icon_state = "green"
/area/redemptionvalley/valleyroof/housetwo
	name = "Redemption Valley - House Two"
	icon_state = "green"
/area/redemptionvalley/valleyroof/housethree
	name = "Redemption Valley - House Three"
	icon_state = "green"
/area/redemptionvalley/valleyroof/housefour
	name = "Redemption Valley - House Four"
	icon_state = "green"
/area/redemptionvalley/valleyroof/housefive
	name = "Redemption Valley - House Five"
	icon_state = "green"
/area/redemptionvalley/valleyroof/housesix
	name = "Redemption Valley - House Six"
	icon_state = "green"
/area/redemptionvalley/valleyroof/cliffcomms
	name = "Clifftop - T-Comms"
	icon_state = "yellow"
	soundscape_playlist = SCAPE_PL_LV522_OUTDOORS
	powernet_name = "outpost"
//=============================================================================================CAVERNS
/area/redemptionvalley/caverns/north
	name = "Redemption Valley - Caves Upper"
	icon_state = "cave"
	minimap_color = MINIMAP_SOLID
/area/redemptionvalley/caverns/east
	name = "Redemption Valley - Caves Valley"
	icon_state = "cave"
	minimap_color = MINIMAP_SOLID
/area/redemptionvalley/caverns/bunker
	name = "Redemption Valley - Caves Bunker"
	ceiling = CEILING_UNDERGROUND_BLOCK_CAS
	icon_state = "cave"
/area/redemptionvalley/caverns/lake
	name = "Redemption Valley - Caves Lake"
	icon_state = "cave"
	minimap_color = MINIMAP_SOLID
/area/redemptionvalley/caverns/entry
	name = "Redemption Valley - Caves Central"
	icon_state = "cave"
	ceiling = CEILING_UNDERGROUND_ALLOW_CAS
/area/redemptionvalley/caverns/west
	name = "Redemption Valley - Caves Lower"
	icon_state = "cave"
	minimap_color = MINIMAP_SOLID
/area/redemptionvalley/caverns/ruin
	name = "Valley Ruins"
	icon_state = "cave"
//=============================================================================================OUTPOST
/area/redemptionvalley/outpost/elevup
	name = "Military Base - Elevator Upper"
	icon_state = "away3"
	soundscape_playlist = SCAPE_PL_LV522_INDOORS
/area/redemptionvalley/outpost/flight
	name = "Military Base - Flight Control"
	icon_state = "purple"
	soundscape_playlist = SCAPE_PL_LV522_INDOORS
/area/redemptionvalley/outpost/ops
	name = "Military Base - Operations Room"
	icon_state = "blue"
	soundscape_playlist = SCAPE_PL_LV522_INDOORS
	minimap_color = MINIMAP_AREA_COMMAND
/area/redemptionvalley/outpost/elevlow
	name = "Military Base - Elevator Lower"
	icon_state = "away2"
/area/redemptionvalley/outpost/bunkwest
	name = "Military Base - Bunkers West"
	icon_state = "red"
/area/redemptionvalley/outpost/bunkeast
	name = "Military Base - Bunkers East"
	icon_state = "red"
/area/redemptionvalley/outpost/cavestruct
	name = "Military Base - Cave Structures"
	icon_state = "red"
/area/redemptionvalley/outpost/entry
	name = "Military Base - Entryway"
	icon_state = "away1"
/area/redemptionvalley/outpost/halls
	name = "Military Base - Hallways"
	icon_state = "green"
/area/redemptionvalley/outpost/armory
	name = "Military Base - Armory"
	icon_state = "armory"
	minimap_color = MINIMAP_AREA_SEC
/area/redemptionvalley/outpost/barracks
	name = "Military Base - Barracks"
	icon_state = "yellow"
/area/redemptionvalley/outpost/canteen
	name = "Military Base - Canteen"
	icon_state = "cafeteria"
/area/redemptionvalley/outpost/toilet
	name = "Military Base - Toilets"
	icon_state = "toilet"
/area/redemptionvalley/outpost/medical
	name = "Military Base - Medical"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY
/area/redemptionvalley/outpost/brief
	name = "Military Base - Briefing Hall"
	icon_state = "blue"
/area/redemptionvalley/outpost/cells
	name = "Military Base - Holding Cells"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE
/area/redemptionvalley/outpost/engi
	name = "Military Base - Engineering"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI_CAVE
	soundscape_playlist = SCAPE_PL_ENG
//=============================================================================================OOB
/area/redemptionvalley/oob/buttons
	name = "Out of Bounds"
	icon_state = "mech"
	requires_power = FALSE
