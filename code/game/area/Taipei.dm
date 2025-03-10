//TAIPEI STATION AREAS//


/area/taipei
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	ceiling_muffle = FALSE
	powernet_name = "ground"
	can_build_special = TRUE
	icon_state = "lv-626"
	ambience_exterior = AMBIENCE_SHIP
	soundscape_interval = 0
	//ambience = list('sound/ambience/shipambience.ogg)

/area/taipei/underground
	always_unpowered = 1
	name = "\improper Asteroid"
	icon_state = "caves"

/area/taipei/club
	name = "\improper Velvet Tassle"
	icon_state = "blue"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/taipei/maints
	name = "Maintenance Tunnels"
	sound_environment = SOUND_ENVIRONMENT_HALLWAY
	soundscape_interval = 0

/area/taipei/maints/south
	name = "\improper Southern Maintenance Tunnels"
	icon_state = "south"

/area/taipei/maints/north
	name = "\improper Northern Maintenance Tunnels"
	icon_state = "north"

/area/taipei/atrium
	name = "\improper Main Atrium"
	sound_environment = SOUND_ENVIRONMENT_PARKING_LOT
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120
	icon_state = "green"

/area/taipei/atrium/medbay
	name = "\improper Clinic"
	icon_state = "medbay"
	sound_environment = SOUND_ENVIRONMENT_ROOM
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC
	soundscape_interval = 120

/area/taipei/cmb
	name = "\improper Colonial Marshall Bureau"
	icon_state = "security"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/taipei/cargo
	name = "\improper Cargo Access"
	icon_state = "primarystorage"
	sound_environment = SOUND_ENVIRONMENT_HANGAR

/area/taipei/hangar
	name = "\improper Access Hangar"
	icon_state = "yellow"
	sound_environment = SOUND_ENVIRONMENT_HANGAR
	soundscape_playlist = SCAPE_PL_HANGAR
	soundscape_interval = 30

/area/taipei/hangar/landingzone
	name = "\improper Landing Zone One"
	is_landing_zone = TRUE
	icon_state = "lv-626"

/area/taipei/telecomms
	name = "\improper Telecommunications"
	icon_state = "purple"
	soundscape_playlist = SCAPE_PL_AICORE
	soundscape_interval = 5
	sound_environment = SOUND_ENVIRONMENT_GENERIC

/area/taipei/atrium/laundry
	name = "\improper Laundromat"
	icon_state = "gruntrnr"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/taipei/atrium/store
	name = "\improper Conveniance-Mart"
	icon_state = "req"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/taipei/theatre
	name = "\improper Movie Star"
	icon_state = "almayer"
	sound_environment = SOUND_ENVIRONMENT_AUDITORIUM

/area/taipei/atrium/offices
	name = "\improper Management Office"
	icon_state = "livingspace"
	sound_environment = SOUND_ENVIRONMENT_LIVINGROOM

/area/taipei/reactor
	name = "\improper Reactor Control Room"
	icon_state = "upperengineering"
	sound_environment = SOUND_ENVIRONMENT_GENERIC
	soundscape_playlist = SCAPE_PL_ENG
	soundscape_interval = 15

/area/taipei/reactor/chamber
	name = "\improper Reactor Chamber"
	icon_state = "green"
	sound_environment = SOUND_ENVIRONMENT_MOUNTAINS

/area/taipei/atrium/restaurant
	name = "\improper Sal's Noodles"
	icon_state = "pink"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/taipei/atrium/bookstore
	name = "\improper Lots'o'Books"
	icon_state = "yellow"
	sound_environment = SOUND_ENVIRONMENT_LIVINGROOM

/area/taipei/hangar/cargoshuttle
	name = "\improper Cargo Skiff"
	icon_state = "green"
	sound_environment = SOUND_ENVIRONMENT_HALLWAY

/area/taipei/elevator
	name = "Elevator"
	icon_state = "yellow"

/area/taipei/elevator/arrivals
	name = "\improper Arrivals Elevator"

/area/taipei/elevator/departures
	name = "\improper Departures Elevator"

/area/taipei/atrium/hotel
	name = "\improper Short Stay Room and Board"
	icon_state = "green"
	sound_environment = SOUND_ENVIRONMENT_CARPETED_HALLWAY
