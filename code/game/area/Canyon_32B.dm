//PARENT AREAS

/area/canyon32B
	icon = 'icons/turf/areas.dmi'
	powernet_name = "ground"
	temperature = ICE_COLONY_TEMPERATURE
	minimap_color = MINIMAP_AREA_COLONY

/area/canyon32B/OOB
	icon = 'icons/turf/area_shiva.dmi'
	name = "Canyon 32B - Under The Ice"
	ceiling = CEILING_MAX

/area/canyon32B/interior
	ceiling = CEILING_METAL
	sound_environment = SOUND_ENVIRONMENT_ROOM
	temperature = T20C

/area/canyon32B/exterior
	soundscape_playlist = SCAPE_PL_WIND
	sound_environment = SOUND_ENVIRONMENT_MOUNTAINS
	ceiling = CEILING_NONE
	icon = 'icons/turf/areas.dmi'

//INTERIOR

/area/canyon32B/interior/bar
	name = "Canyon 32B - Bar"
	icon_state = "cafeteria"

/area/canyon32B/interior/gatehouse
	icon = 'icons/turf/area_shiva.dmi'
	icon_state = "hangars0"

/area/canyon32B/interior/gatehouse/northern
	name = "Checkpoint Four - Northern Gatehouse"

/area/canyon32B/interior/gatehouse/southern
	name = "Checkpoint Four - Southern Gatehouse"

/area/canyon32B/interior/gatehouse/pillbox_alpha
	name = "Checkpoint Four - Pillbox Alpha"

/area/canyon32B/interior/gatehouse/pillbox_bravo
	name = "Checkpoint Four - Pillbox Bravo"

/area/canyon32B/interior/overhang
	name = "Checkpoint Four - Bunker Entrance"
	icon_state = "blue"
	ceiling = CEILING_UNDERGROUND_ALLOW_CAS

/area/canyon32B/interior/bunker
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

/area/canyon32B/interior/bunker/entrance
	name = "Checkpoint Four - Security Airlock"
	icon = 'icons/turf/area_shiva.dmi'
	icon_state = "caves3"

/area/canyon32B/interior/bunker/hallway
	name = "Checkpoint Four - Main Hallway"
	sound_environment = SOUND_ENVIRONMENT_HALLWAY
	icon_state = "hallC1"

/area/canyon32B/interior/bunker/unloading
	name = "Checkpoint Four - Unloading Bay"
	icon_state = "ass_line"

/area/canyon32B/interior/bunker/storage
	name = "Checkpoint Four - Storage Closet"
	icon_state = "storage"

/area/canyon32B/interior/bunker/medbay
	name = "Checkpoint Four - Medical Bay"
	icon_state = "medbay"

/area/canyon32B/interior/bunker/detainment
	name = "Checkpoint Four - Detainment Cells"
	icon_state = "security"

/area/canyon32B/interior/bunker/bathroom
	name = "Checkpoint Four - Bathroom"
	icon_state = "toilet"

/area/canyon32B/interior/bunker/armory
	name = "Checkpoint Four - Armory"
	icon_state = "armory"

/area/canyon32B/interior/bunker/bunks
	name = "Checkpoint Four - Bunks"
	icon_state = "Sleep"

/area/canyon32B/interior/bunker/mess
	name = "Checkpoint Four - Mess Hall"
	icon_state = "kitchen"

/area/canyon32B/interior/bunker/overwatch
	name = "Checkpoint Four - Overwatch Office"
	icon_state = "captain"

/area/canyon32B/interior/bunker/engineering
	name = "Checkpoint Four - Maintenance"
	icon_state = "engine_smes"

/area/canyon32B/interior/bunker/engineering/power
	name = "Checkpoint Four - Generators"
//EXTERIOR

/area/canyon32B/exterior/checkpoint
	name = "Checkpoint Four - Surface"
	icon_state = "blue"

/area/canyon32B/exterior/north
	name = "Canyon 32B - Northern Canyon"
	icon_state = "north"

/area/canyon32B/exterior/south
	name = "Canyon 32B - Southern Canyon"
	icon_state = "south"

/area/canyon32B/exterior/south/bar
	name = "Canyon 32B - Bar Parking Lot"
