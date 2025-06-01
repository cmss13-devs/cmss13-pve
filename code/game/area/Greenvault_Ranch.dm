//==================================================================Greenvault Ranch
//BASE
/area/Greenvault_Ranch
	name = "Greenvault Ranch"
	icon_state = "blue"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY
//============================================================PARENTS
/area/Greenvault_Ranch/outside
	name = "Greenvault Ranch Outside"
	ceiling = CEILING_NONE
/area/Greenvault_Ranch/int_glass
	name = "Greenvault Ranch Glass"
	ceiling = CEILING_GLASS
/area/Greenvault_Ranch/int_reg
	name = "Greenvault Ranch Metal"
	ceiling = CEILING_METAL
/area/Greenvault_Ranch/int_heavy
	name = "Greenvault Ranch Reinforced"
	ceiling = CEILING_REINFORCED_METAL
/area/Greenvault_Ranch/caves
	name = "Greenvault Ranch Caves"
	ceiling = CEILING_DEEP_UNDERGROUND
//============================================================SHUTTLES
/area/Greenvault_Ranch/shuttles/drop1
	name = "Greenvault Ranch Spaceport"
	icon_state = "shuttle"
	icon = 'icons/turf/area_varadero.dmi'
	minimap_color = MINIMAP_AREA_LZ
//============================================================MAIN MAP
/area/Greenvault_Ranch/int_reg/clinic
	name = "Clinic"
	icon_state = "medbay"
/area/Greenvault_Ranch/int_reg/marshals
	name = "Colonial Marshals Complex"
	icon_state = "security"
/area/Greenvault_Ranch/int_reg/virology
	name = "Veterinarian Clinic"
	icon_state = "virology"
/area/Greenvault_Ranch/outside/northwest
	name = "Greenvault Ranch Fields"
	icon_state = "northwest"
/area/Greenvault_Ranch/int_reg/telecomms
	name = "Spaceport Telecommunication Hub"
	icon_state = "yellow"
/area/Greenvault_Ranch/int_reg/telecomms_yard
	name = "Spaceport Telecommunication Yard"
	icon_state = "blue-red"
/area/Greenvault_Ranch/int_reg/garage
	name = "Spaceport"
	icon_state = "storage"
/area/Greenvault_Ranch/outside/north_river
	name = "Northern River"
	icon_state = "varadero2"
/area/Greenvault_Ranch/outside/pens
	name = "Animal Pens"
	icon_state = "northwest"
/area/Greenvault_Ranch/outside/wildplace
	name = "Southeasten Wilderness"
	icon_state = "purple"
/area/Greenvault_Ranch/int_reg/housing
	name = "Farm Dormitories"
	icon_state = "blue"
/area/Greenvault_Ranch/int_reg/kitchen
	name = "Farm Canteen"
	icon_state = "blue"
/area/Greenvault_Ranch/int_reg/farmbay
	name = "Farming Vehicle Storage"
	icon_state = "storage"
/area/Greenvault_Ranch/int_reg/trailerpark
	name = "Trailer Park"
	icon_state = "northeast"
/area/Greenvault_Ranch/outside/wheatfields
	name = "Southeast Wheat Fields"
	icon_state = "southwest"
/area/Greenvault_Ranch/int_heavy/powerplace
	name = "Power Generators"
	icon_state = "yellow"
/area/Greenvault_Ranch/int_reg/bar
	name = "Colony Bar"
	icon_state = "bar"

//============================================================Bunker
/area/Greenvault_Ranch/int_heavy/grainbunker
	name = "Colony Grain Bunker"
	icon_state = "orange"
/area/Greenvault_Ranch/int_heavy/bunkermedical
	name = "Grain Bunker Medical"
	icon_state = "medbay"
/area/Greenvault_Ranch/int_heavy/livingspaces
	name = "Emergency Living Spaces"
	icon_state = "green"
/area/Greenvault_Ranch/int_heavy/powergenerators
	name = "Bunker Power Generators"
	icon_state = "yellow"
/area/Greenvault_Ranch/int_heavy/controlroom
	name = "Bunker Control Room"
	icon_state = "cyan"
/area/Greenvault_Ranch/int_heavy/grainstorage
	name = "Bunker Grain Storage"
	icon_state = "blue"
/area/Greenvault_Ranch/int_heavy/secondarystorage
	name = "Bunker Auxilliary Storage"
	icon_state = "purple"
/area/Greenvault_Ranch/int_heavy/researchlab
	name = "Hidden Research Lab"
	icon_state = "south"

/area/Greenvault_Ranch/int_heavyoutofbounds
	name = "Greenvault Ranch Out Of Bounds"
	icon_state = "unknown"
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL
