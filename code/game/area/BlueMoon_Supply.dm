//BlueMoon Areas//

/area/bluemoon_supply
	icon_state = "unknown"
	can_build_special = TRUE
	powernet_name = "ground"

//parent types

/area/bluemoon_supply/indoors
	name = "Blue Moon Supply - Indoors"
	icon_state = "cliff_blocked"
	ceiling = CEILING_METAL

/area/bluemoon_supply/outdoors
	name = "Blue Moon Supply - Outdoors"
	icon_state = "cliff_blocked"
	ceiling = CEILING_METAL

//Landing Zone

/area/bluemoon_supply/outdoors/landing_zone
	name = "Blue Moon Supply - Landing Zone"
	icon_state = "explored"
	is_resin_allowed =  FALSE
	is_landing_zone = TRUE

/area/shuttle/drop1/bluemoon_supply
	name = "Blue Moon Supply - Secondary Landing Zone"
	icon_state = "shuttle"
	icon = 'icons/turf/area_shiva.dmi'

/area/bluemoon_supply/landing_zone/lz_console
	name = "Chance's Claim - Dropship Alamo Console"
	icon_state = "tcomsatcham"
	requires_power = FALSE


//Outdoors areas
/area/bluemoon_supply/outdoors/caves
	name = "Caves"
	icon_state = "black"
	ceiling = CEILING_NONE
	requires_power = FALSE

/area/bluemoon_supply/outdoors/deepcaves
	name	=	"Deep Caves"
	ceiling	=	CEILING_METAL

/area/bluemoon_supply/outdoors/caves/river
	name = "Cave River"
	ceiling = CEILING_NONE

/area/bluemoon_supply/outdoors/caves/drills
	name = "Ruined Drill Site"
	icon_state = "purple"
	requires_power = TRUE
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV522_INDOORS

/area/bluemoon_supply/outdoors/base
	name = "BlueMoon Supply Depot"
	icon_state = "red"
	ceiling = CEILING_NONE
	requires_power = FALSE

/area/bluemoon_supply/outdoors/lz_destroyed
	name = "BlueMoon Supply Depot"
	icon_state = "red"
	ceiling = CEILING_NONE
	requires_power = FALSE

//Northern Side/Misc

/area/bluemoon_supply/indoors/storage
	name = "Blue Moon Supply - Primary Storage"

/area/bluemoon_supply/indoors/command
	name = "Blue Moon Supply - Traffic Control and Command"

/area/bluemoon_supply/indoors/bunker_A
	name = "Blue Moon Supply - Primary Bunker Network"

/area/bluemoon_supply/indoors/bunker_B
	name = "Blue Moon Supply - Secondary Bunker Network"

/area/bluemoon_supply/indoors/upp_spy
	name = "Blue Moon Supply - UPP Spy Site"

/area/bluemoon_supply/indoors/secondary_storage
	name = "Blue Moon Supply - Secondary Storage"

//Southern Side
/area/bluemoon_supply/indoors/mountain_base
	name = "Blue Moon Supply - Main Base"

/area/bluemoon_supply/indoors/vehicle
	name = "Blue Moon Supply - Vehicle Storage"

/area/bluemoon_supply/indoors/bunks
	name = "Blue Moon Supply - Bunks"

/area/bluemoon_supply/indoors/medical
	name = "Blue Moon Supply - Medical Ward"

/area/bluemoon_supply/indoors/morgue
	name = "Blue Moon Supply - Morgue"

/area/bluemoon_supply/indoors/engi
	name = "Blue Moon Supply - Engineering"

/area/bluemoon_supply/indoors/servers
	name = "Blue Moon Supply - Server Room"

/area/bluemoon_supply/indoors/quarters
	name = "Blue Moon Supply - Major's Quarters"

/area/bluemoon_supply/indoors/armory
	name = "Blue Moon Supply - Armory"

/area/bluemoon_supply/indoors/mess
	name = "Blue Moon Supply - Mess Hall"
