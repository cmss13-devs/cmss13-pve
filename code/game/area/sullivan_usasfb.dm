// USASFB Sullivan Areas--------------------------------------//

//grandparent

/area/usasfb_sullivan
	name = "Sullivan Aerospace Force Base"
	icon = 'icons/turf/area_strata.dmi'
	//ambience = list('figuresomethingout.ogg')
	icon_state = "strata"
	can_build_special = TRUE
	powernet_name = "ground"
	temperature = SOROKYNE_TEMPERATURE
	minimap_color = MINIMAP_AREA_COLONY
	base_lighting_alpha = 0

//parents

/area/usasfb_sullivan/indoors
	name = "Sullivan Aerospace Force Base - Indoors"
	icon_state = "offices" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_METAL
	weather_enabled = FALSE
	base_lighting_alpha = 0


/area/usasfb_sullivan/outdoors
	name = "Sullivan Aerospace Force Base - Outdoors"
	icon_state = "rstation_deck" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_WIND
	weather_enabled = TRUE
	base_lighting_alpha = 0

/area/usasfb_sullivan/oob
	name = "Sullivan Aerospace Force Base - Out of Bounds"
	ceiling = CEILING_MAX
	icon_state = "disposal"
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL
	weather_enabled = FALSE

//areas

//lzs

/area/usasfb_sullivan/outdoors/lz/one
	name = "Sullivan Aerospace Force Base - South-West Landing Zone"
	icon_state = "landingzone_1"
	is_resin_allowed = FALSE
	minimap_color = MINIMAP_AREA_LZ
	is_landing_zone = TRUE


/area/usasfb_sullivan/outdoors/lz/two
	name = "Sullivan Aerospace Force Base - North-East Landing Zone"
	icon_state = "landingzone_2"
	is_resin_allowed = FALSE
	minimap_color = MINIMAP_AREA_LZ
	is_landing_zone = TRUE

/area/usasfb_sullivan/outdoors/lz/console
	name = "Sullivan Aerospace Force Base - Dropship Console"
	requires_power = FALSE
	minimap_color = MINIMAP_AREA_LZ
	unlimited_power = 1
	icon_state = "shuttle"
	icon = 'icons/turf/area_shiva.dmi'

//actual areas

area/usasfb_sullivan/indoors/ammo_elevator
	name = "Sullivan Aerospace Force Base - Ammunition Storage"


area/usasfb_sullivan/indoors/security
	name = "Sullivan Aerospace Force Base - Airfield Security"
	minimap_color = MINIMAP_AREA_SEC
	icon_state = "outpost_sec_0"

/area/usasfb_sullivan/indoors/security/armoury
	name = "Sullivan Aerospace Force Base - Airfield Security - Armoury"
	icon_state = "outpost_sec_1"

/area/usasfb_sullivan/indoors/security/confiscated
	name = "Sullivan Aerospace Force Base - Confiscated Equipment Room"
	icon_state = "outpost_sec_2"

/area/usasfb_sullivan/indoors/hangar/one_one
	name = "Sullivan Aerospace Force Base - Hangar 1-1"
	icon_state = "hangars1"
	icon = 'icons/turf/area_shiva.dmi'
	ceiling = CEILING_REINFORCED_METAL
	minimap_color = MINIMAP_AREA_CAVES


/area/usasfb_sullivan/indoors/hangar/one_one/one_two
	name = "Sullivan Aerospace Force Base - Hangar 1-2"
	icon_state = "hangars2"

/area/usasfb_sullivan/indoors/hangar/one_one/two_one
	name = "Sullivan Aerospace Force Base - Hangar 2-1"
	icon_state = "hangars3"

/area/usasfb_sullivan/indoors/warehouse
	name = "Sullivan Aerospace Force Base - Warehouse"
	ceiling = CEILING_UNDERGROUND_METAL_ALLOW_CAS
	icon_state = "junkyard0"
	icon = 'icons/turf/area_shiva.dmi'
