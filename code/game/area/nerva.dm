/area/nerva
	icon = 'icons/turf/area_almayer.dmi'
	// ambience = list('sound/ambience/shipambience.ogg')
	icon_state = "almayer"
	ceiling = CEILING_METAL
	powernet_name = "nerva"
	sound_environment = SOUND_ENVIRONMENT_ROOM
	soundscape_interval = 30
	// soundscape_playlist = list('sound/effects/xylophone1.ogg', 'sound/effects/xylophone2.ogg', 'sound/effects/xylophone3.ogg')
	ambience_exterior = AMBIENCE_ALMAYER
	ceiling_muffle = FALSE

	///Whether this area is used for hijack evacuation progress
	var/hijack_evacuation_area = FALSE

	///The weight this area gives towards hijack evacuation progress
	var/hijack_evacuation_weight = 0

	///Whether this area is additive or multiplicative towards evacuation progress
	var/hijack_evacuation_type = EVACUATION_TYPE_NONE

/area/nerva/fourth
	fake_zlevel = 4

/area/nerva/fourth/maint
	name = "\improper Fourth Deck Maintenance"
	icon_state = "upperhull"

/area/nerva/fourth/hallway
	name = "\improper Fourth Deck Hallway"
	icon_state = "missionplanner"

/area/nerva/fourth/core
	name = "\improper Fourth Deck AI Core"
	icon_state = "airoom"

/area/nerva/third
	fake_zlevel = 3

/area/nerva/third/maint
	name = "\improper Third Deck Maintenance"
	icon_state = "upperhull"

/area/nerva/third/chapel
	name = "\improper Third Deck Chapel"
	icon_state = "officerrnr"

/area/nerva/third/laundry
	name = "\improper Third Deck Laundry"
	icon_state = "laundry"

/area/nerva/third/reporter
	name = "\improper Third Deck Reporter"
	icon_state = "selfdestruct"

/area/nerva/third/hallway
	name = "\improper Third Deck Hallway"
	icon_state = "stern"

/area/nerva/third/brig
	name = "\improper Third Deck Brig Habitat"
	icon_state = "brigcells"

/area/nerva/third/thruster
	name = "\improper Third Deck Thrusters"
	icon_state = "selfdestruct"

/area/nerva/third/psych
	name = "\improper Third Deck Counselor Office"
	icon_state = "gruntrnr"

/area/nerva/third/engineerrnr
	name = "\improper Third Deck Engineering Lounge"
	icon_state = "gruntrnr"

/area/nerva/third/air
	name = "\improper Third Deck Engineering Air Supply"
	icon_state = "lifesupport"

/area/nerva/third/escapepod
	name = "\improper Third Deck Escape Pod(2)"
	icon_state = "shuttle2"

/area/nerva/third/officerbunkfore
	name = "\improper Third Deck Fore Officer Bedrooms"
	icon_state = "livingspace"

/area/nerva/third/officerbunkmid
	name = "\improper Third Deck Central Officer Bunks"
	icon_state = "livingspace"

/area/nerva/third/officerbunkmid
	name = "\improper Third Deck Central Officer Bunks"
	icon_state = "livingspace"

/area/nerva/third/commonbunks
	name = "\improper Third Deck Common Bunks"
	icon_state = "livingspace"

/area/nerva/third/commontools
	name = "\improper Third Deck Tool Access"
	icon_state = "workshop"

/area/nerva/second
	fake_zlevel = 2

/area/nerva/second/maint
	name = "\improper Second Deck Maintenance"
	icon_state = "lowerhull"

/area/nerva/second/medical
	name = "\improper Second Deck Medbay"
	icon_state = "medical"

/area/nerva/second/researchdesk
	name = "\improper Second Deck Research Desk"
	icon_state = "science"

/area/nerva/second/req
	name = "\improper Second Deck Requisitions"
	icon_state = "req"

/area/nerva/second/hallway
	name = "\improper Second Deck Hallway"
	icon_state = "starboard"

/area/nerva/second/bar
	name = "\improper Second Deck Bar"
	icon_state = "food"

/area/nerva/second/headbunks
	name = "\improper Second Deck Head of Personal Bedrooms"
	icon_state = "livingspace"

/area/nerva/second/eva
	name = "\improper Second Deck EVA Equipment"
	icon_state = "blue-old"

/area/nerva/second/eva
	name = "\improper Second Deck EVA Equipment"
	icon_state = "blue-old"

/area/nerva/second/cryopods
	name = "\improper Second Deck Cryo Pods"
	icon_state = "cryo"

/area/nerva/second/engineering
	name = "\improper Second Deck Engineering Workshop"
	icon_state = "cryo"

/area/nerva/second/engineering/burn
	name = "\improper Second Deck Power Combustion Chamber"
	icon_state = "cryo"

/area/nerva/second/engineering/tcomms
	name = "\improper Second Deck Telecommunications"
	icon_state = "tcomms"

/area/nerva/second/cic
	name = "\improper Second Deck Bridge"
	icon_state = "cic"

/area/nerva/second/sec
	name = "\improper Second Deck Security Wing"
	icon_state = "brig"

/area/nerva/second/sec/armory
	name = "\improper Second Deck Brig Armory"
	icon_state = "brig"

/area/nerva/first
	fake_zlevel = 1

/area/nerva/first/maint
	name = "\improper First Deck Maintenance"
	icon_state = "lowerhull"

/area/nerva/first/hanger/port
	icon_state = "dropship"

/area/nerva/first/hanger/port
	name = "\improper First Deck Port Hanger"

/area/nerva/first/hanger/aft
	name = "\improper First Deck Aft Hanger"

/area/nerva/first/hallway
	name = "\improper First Deck Hallway"
	icon_state = "starboardumbilical"

/area/nerva/first/escapepods
	name = "\improper First Deck Escape Pods"
	icon_state = "lifeboat"

/area/nerva/first/thrusters
	name = "\improper First Deck Escape Pods"
	icon_state = "selfdestruct"

/area/nerva/first/research
	name = "\improper First Deck Laboratories"
	icon_state = "science"

/area/nerva/first/panic
	name = "\improper First Deck Weapons Controls and Panic Room"
	icon_state = "brig"

/area/nerva/first/
	name = "\improper First Deck AI Interface"
	icon_state = "airoom"

