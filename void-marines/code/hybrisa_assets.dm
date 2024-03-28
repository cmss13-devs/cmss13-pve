//AREAS START//

//lv759 AREAS--------------------------------------//

/area/lv759
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY

//parent types

/area/lv759/indoors
	name = "Hybrisa - Outdoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV522_INDOORS


/area/lv759/outdoors
	name = "Hybrisa - Outdoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV522_OUTDOORS

/area/lv759/oob
	name = "LV759 - Out Of Bounds"
	icon_state = "unknown"
	ceiling = CEILING_MAX
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL

//Landing Zone 1

/area/lv759/landing_zone_1
	name = "Hybrisa - Landing Zone One"
	icon_state = "explored"
	is_resin_allowed =  FALSE
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ

/area/lv759/landing_zone_1/ceiling
	ceiling = CEILING_METAL

/area/lv759/landing_zone_1/tunnel
	name = "Hybrisa - Landing Zone One Tunnels"
	ceiling = CEILING_METAL

/area/shuttle/drop1/lv759
	name = "Hybrisa - Dropship Alamo Landing Zone"
	icon_state = "shuttle"
	icon = 'icons/turf/area_shiva.dmi'

/area/lv759/landing_zone_1/lz1_console
	name = "Hybrisa - Dropship Alamo Console"
	icon_state = "tcomsatcham"
	requires_power = FALSE

//Landing Zone 2

/area/lv759/landing_zone_2
	name = "Hybrisa - Landing Zone Two"
	icon_state = "explored"
	is_resin_allowed =  FALSE
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ

/area/lv759/landing_zone_2/ceiling
	ceiling = CEILING_METAL

/area/shuttle/drop2/lv759
	name = "Hybrisa - Dropship Normandy Landing Zone"
	icon_state = "shuttle2"
	icon = 'icons/turf/area_shiva.dmi'

/area/lv759/landing_zone_2/lz2_console
	name = "Hybrisa - Dropship Normandy Console"
	icon_state = "tcomsatcham"
	requires_power = FALSE

//Landing Zone 3 & 4

/area/lv759/landing_zone
	name = "Hybrisa - Shuttle"
	icon_state = "shuttle"
	ceiling =  CEILING_METAL

/area/lv759/landing_zone/landing_zone_3
	name = "Hybrisa - Landing Zone 3"
	icon_state = "blue"
	ceiling = CEILING_NONE

/area/lv759/landing_zone/landing_zone_4
	name = "Hybrisa - Landing Zone 4"
	icon_state = "blue"
	ceiling = CEILING_NONE

/area/lv759/landing_zone/starglider
	name = "Hybrisa - WY-LWI StarGlider SG-200"
	requires_power = FALSE

/area/lv759/landing_zone/horizon_runner
	name = "Hybrisa - WY-LWI Horizon Runner HR-150"
	requires_power = FALSE

//Outdoors areas
/area/lv759/outdoors/colony_streets
	name = "Colony Streets"
	icon_state = "green"
	ceiling = CEILING_NONE

/area/lv759/outdoors/colony_streets/windbreaker
	name = "Colony Windbreakers"
	icon_state = "tcomsatcham"
	requires_power = FALSE
	ceiling = CEILING_NONE

/area/lv759/outdoors/colony_streets/windbreaker/observation
	name = "Colony Windbreakers - Observation"
	icon_state = "purple"
	requires_power = FALSE
	ceiling = CEILING_GLASS
	soundscape_playlist = SCAPE_PL_LV522_INDOORS

/area/lv759/outdoors/colony_streets/central_streets
	name = "Central Street - West"
	icon_state = "west"

/area/lv759/outdoors/colony_streets/east_central_street
	name = "Central Street - East"
	icon_state = "east"

/area/lv759/outdoors/colony_streets/south_street
	name = "Colony Streets - South"
	icon_state = "south"

/area/lv759/outdoors/colony_streets/south_east_street
	name = "Colony Streets - Southeast"
	icon_state = "southeast"

/area/lv759/outdoors/colony_streets/south_west_street
	name = "Colony Streets - Southwest"
	icon_state = "southwest"

/area/lv759/outdoors/colony_streets/north_west_street
	name = "Colony Streets - Northwest"
	icon_state = "northwest"

/area/lv759/outdoors/colony_streets/north_east_street
	name = "Colony Streets - Northeast"
	icon_state = "northeast"

/area/lv759/outdoors/colony_streets/north_street
	name = "Colony Streets - North"
	icon_state = "north"

//spaceport indoors
/area/lv759/indoors/spaceport
	name = "North LZ1 - Spaceport Auxiliary"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_LZ

/area/lv759/indoors/spaceport/engineering
	name = "North LZ1 - Spaceport Engineering"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_LZ

/area/lv759/indoors/spaceport/administration/east
	name = "North LZ1 - Spaceport West Administration"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_LZ

/area/lv759/indoors/spaceport/administration/west
	name = "North LZ1 - Spaceport East Administration"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_LZ

/area/lv759/indoors/spaceport/security
	name = "North LZ1 - Spaceport Engineering"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_LZ

/area/lv759/indoors/spaceport/cargo
	name = "North LZ1 - Spaceport Cargo"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_LZ

/area/lv759/indoors/spaceport/cuppajoes
	name = "North LZ1 - Spaceport Cuppajoes"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_LZ

// Garage

/area/lv759/indoors/garage_office
	name = "LV759 - Garage Office"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/garage_workshop
	name = "LV759 - Garage Workshop"
	icon_state = "engine_smes"
	minimap_color = MINIMAP_AREA_ENGI

//Recreation

/area/lv759/indoors/casino
	name = "LV759 - Night Gold Casino"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/pizzaria
	name = "LV759 - Pizzaria"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_ENGI

/area/lv759/indoors/weymart
	name = "LV759 - Weymart Floor"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC

/area/lv759/indoors/weymart_backrooms
	name = "LV759 - Weymart Backrooms"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lv759/indoors/chapel
	name = "LV759 - Chapel Pulpit"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_COLONY
	soundscape_playlist = SCAPE_PL_ELEVATOR_MUSIC

/area/lv759/indoors/chapel_maintenance
	name = "LV759 - Chapel Office and Maintenance"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/apartment/west
	name = "LV759 - West Apartment Bedrooms and Recroom"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/apartment_services/west
	name = "LV759 - West Apartment Services"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/apartment/east
	name = "LV759 - East Apartment Bedrooms and Foyer"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/apartment_services/east
	name = "LV759 - East Apartment Services"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/weyyu_office
	name = "LV759 - Weyland Yutani Offices Hallways"
	icon_state = "blue"
	minimap_color = MINIMAP_AREA_COMMAND

/area/lv759/indoors/weyyu_office/floor
	name = "LV759 - Weyland Yutani Offices Floor"

/area/lv759/indoors/weyyu_office/breakroom
	name = "LV759 - Weyland Yutani Offices Breakroom"

/area/lv759/indoors/weyyu_office/vip
	name = "LV759 - Weyland Yutani Offices VIP Meeting Room and Office"

/area/lv759/indoors/weyyu_office/pressroom
	name = "LV759 - Weyland Yutani Offices Press Room"

/area/lv759/indoors/bar
	name = "LV759 - Karl's Bar"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/indoors/bar/recroom
	name = "LV759 - Karl's Bar Recroom and Bathrooms"

/area/lv759/indoors/bar/maintenance
	name = "LV759 - Karl's Bar Maintenance"

/area/lv759/indoors/bar/kitchen
	name = "LV759 - Karl's Bar Kitchen"

/area/lv759/indoors/bar/botany
	name = "LV759 - Karl's Bar Botany"

/area/lv759/indoors/hospital
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY
/area/lv759/indoors/hospital/paramedics_garage
	name = "LV759 - Elpida's Memorial Hospital Paramedic's Garage"

/area/lv759/indoors/hospital/cryo_room
	name = "LV759 - Elpida's Memorial Hospital Cryo Ward"

/area/lv759/indoors/hospital/emergency_room
	name = "LV759 - Elpida's Memorial Hospital Emergency Room"

/area/lv759/indoors/hospital/reception
	name = "LV759 - Elpida's Memorial Hospital Reception"

/area/lv759/indoors/hospital/cmo_office
	name = "LV759 - Elpida's Memorial Hospital Chief Medical Officer's Office"

/area/lv759/indoors/hospital/maintenance
	name = "LV759 - Elpida's Memorial Hospital Engineering Maintenance"

/area/lv759/indoors/hospital/pharmacy
	name = "LV759 - Elpida's Memorial Hospital Pharmacy and Outgoing Foyer"

/area/lv759/indoors/hospital/outgoing
	name = "LV759 - Elpida's Memorial Hospital Outgoing Ward"

/area/lv759/indoors/hospital/central_hallway
	name = "LV759 - Elpida's Memorial Hospital Central Hallway"

/area/lv759/indoors/hospital/east_hallway
	name = "LV759 - Elpida's Memorial Hospital East Hallway"

/area/lv759/indoors/hospital/medical_storage
	name = "LV759 - Elpida's Memorial Hospital Medical Storage"

/area/lv759/indoors/hospital/operation
	name = "LV759 - Elpida's Memorial Hospital Operation Theatres and Observation"

/area/lv759/indoors/hospital/patient_ward
	name = "LV759 - Elpida's Memorial Hospital Patient Ward"

/area/lv759/indoors/hospital/virology
	name = "LV759 - Elpida's Memorial Hospital Virology"

/area/lv759/indoors/hospital/morgue
	name = "LV759 - Elpida's Memorial Hospital Morgue"

/area/lv759/indoors/hospital/icu
	name = "LV759 - Elpida's Memorial Hospital Intensive Care Ward"

/area/lv759/lone_buildings/mining_outpost
	name = "LV759 - North Mining Outpost"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/lone_buildings/synthetic_storage
	name = "LV759 - Synthetic Storage"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/recycling_plant
	name = "LV759 - Recycling Plant"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/recycling_plant/garage
	name = "LV759 - Recycling Plant Garage"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/power_plant
	name = "LV759 - Power Plant Central Hallway"
	icon_state = "yellow"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/power_plant/south_hallway
	name = "LV759 - Power Plant South Hallway"

/area/lv759/power_plant/geothermal_generators
	name = "LV759 - Power Plant Geothermal Generators Room"

/area/lv759/power_plant/power_storage
	name = "LV759 - Power Plant Battery Array and Transformers"

/area/lv759/power_plant/gas_generators
	name = "LV759 - Power Plant Backup Gas Generators"


/area/lv759/power_plant/fusion_generators
	name = "LV759 - Power Plant Fusion Generators"

/area/lv759/power_plant/telecomms
	name = "LV759 - Power Plant Telecommunications"

/area/lv759/power_plant/workers_canteen
	name = "LV759 - Power Plant Worker's Canteen"

/area/lv759/colonial_marshals
	name = "LV759 - CMB Police Station Prisoner's Recroom"
	icon_state = "red"
	minimap_color = MINIMAP_AREA_SEC

/area/lv759/colonial_marshals/prisoners_cells
	name = "LV759 - CMB Police Station Prisoner's Cells"

/area/lv759/colonial_marshals/garage
	name = "LV759 - CMB Police Station Garage and Lockers"

/area/lv759/colonial_marshals/armory
	name = "LV759 - CMB Police Station Armory"

/area/lv759/colonial_marshals/office
	name = "LV759 - CMB Police Station South Office"

/area/lv759/colonial_marshals/hallway
	name = "LV759 - CMB Police Station Central Hallway"

/area/lv759/colonial_marshals/holding_cells
	name = "LV759 - CMB Police Station Holding Cells"

/area/lv759/colonial_marshals/head_office
	name = "LV759 - CMB Police Station Head Office"

/area/lv759/colonial_marshals/north_office
	name = "LV759 - CMB Police Station North Office"

/area/lv759/colonial_marshals/press_room
	name = "LV759 - CMB Police Station Press Room"

/area/lv759/lone_buildings/jacks_surplus
	name = "LV759 - Jack's Surplus"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_COLONY

/area/lv759/lone_buildings/south_public_restroom
	name = "LV759 - Southern Public Restroom"
	icon_state = "green"
	minimap_color = MINIMAP_AREA_COLONY

//AREAS END//

//ASSETS START//

//POSTERS

/datum/poster/poster_42
	icon_state="poster42"
	name = "Join the Colonial Marines. Enlist today, protect tomorrow!"
	desc = "Join the Colonial Marines. Enlist today, protect tomorrow!"

/datum/poster/poster_43
	icon_state="poster43"
	name = "Koorlander - lovingly machine-rolled for YOUR pleasure."
	desc = "Koorlander - lovingly machine-rolled for YOUR pleasure."

/datum/poster/poster_44
	icon_state="poster44"
	name = "WASTE damages PROFIT - Think On!"
	desc = "WASTE damages PROFIT - Think On!"

/datum/poster/poster_45
	icon_state="poster45"
	name = "Pizza Galaxy poster"
	desc = "This poster depicts a delicious looking slice of Pizza, Yum."

/datum/poster/poster_46
	icon_state="poster46"
	name = "Kelland Mining co. poster"
	desc = "A simplified version of the Kelland Mining co. logo.The Kelland Mining Company is owned by Prospectia, a sub-division of the San Rei Corporation, which is in turn owned by the Weyland-Yutani Corporation."

/datum/poster/poster_47
	icon_state="poster47"
	name = "EAT"
	desc = "This is less of a poster and more of an advertisement for those gross power bars."

/datum/poster/poster_48
	icon_state="poster48"
	name = "Classic Cola poster"
	desc = "This poster depicts a classic cola can. With a taste that's been around for centuries. Nobody can beat it."

/datum/poster/poster_49
	icon_state="poster49"
	name = "Join the Colonial Marines. Enlist today, protect tomorrow!"
	desc = "Join the Colonial Marines. Enlist today, protect tomorrow!"

/datum/poster/poster_50
	icon_state="poster50"
	name = "Synthetic 'Daniel' poster"
	desc = "An ominous forward facing profile of the Synthetic model 'Daniel'. Not quite a second generation model but something inbetween, suited for the needs of colonists. The poster is more art then an advertisement."

/datum/poster/poster_51
	icon_state="poster51"
	name = "Synthetic 'Daniel' poster"
	desc = "An ominous side facing profile of the Synthetic model 'Daniel'. Not quite a second generation model but something inbetween, suited for the needs of colonists. The poster is more art then an advertisement."

/datum/poster/poster_52
	icon_state="poster52"
	name = "Colonial Marshalls poster"
	desc = "To live, to serve, wherever humanity roams."

/datum/poster/poster_53
	icon_state="poster53"
	name = "Colonial Marshalls poster"
	desc = "The laws of Earth stretch beyond the Sol: The Colonial Marshals."

/datum/poster/poster_54
	icon_state="poster54"
	name = "Pimp Clown poster"
	desc = "Always returning. Always watching."

/datum/poster/poster_55
	icon_state="poster55"
	name = "Weyland-Yutani poster"
	desc = "You don't have much choice in brand loyalty when there's basically only one brand."

/datum/poster/poster_56
	icon_state="poster56"
	name = "Koorlander Gold"
	desc = "Koorlander Golds, lovingly machine rolled for YOUR pleasure."

/datum/poster/poster_57
	icon_state="poster57"
	name = "art?"
	desc = "This poster depicts some curved lines that some pretentious art snob valued at over $12,000,000. Too bad this is just a low-resolution print."

/datum/poster/poster_58
	icon_state="poster58"
	name = "art?"
	desc = "This poster depicts outsider geometric postmodern ascetic abject social expressionism art...you think."

/datum/poster/poster_59
	icon_state="poster59"
	name = "Davenport Gin poster"
	desc = "On your way back home? Toast your return with Davenport gin."

/datum/poster/poster_60
	icon_state="poster60"
	name = "Weyland Yutani - 'Daniel' Model Synthetic poster"
	desc = "A poster depicting a child in the arms of a Weyland Yutani 'Daniel' model Synthetic, Who thought this was a good idea?"

/datum/poster/poster_61
	icon_state="poster61"
	name = "Silence is not a Virtue - Do Not Share Sensitive Information..."
	desc = "Silence is not a Virtue - Do Not Share Sensitive Information..."

/datum/poster/poster_62
	icon_state="poster62"
	name = "Synthetic 'Daniel' poster"
	desc = "An ominous forward facing profile of the Synthetic model 'Daniel'. Not quite a second generation model but something inbetween, suited for the needs of colonists. The poster is more art then an advertisement."

/datum/poster/poster_63
	icon_state="poster63"
	name = "Synthetic 'Daniel' poster"
	desc = "An ominous side facing profile of the Synthetic model 'Daniel'. Not quite a second generation model but something inbetween, suited for the needs of colonists. The poster is more art then an advertisement."

/datum/poster/poster_64
	icon_state="poster64"
	name = "Colonial Marine Corps poster"
	desc = "Every Paycheck a Fortune! Every Formation a Parade! - Join the Colonial Marines!"

/datum/poster/poster_65
	icon_state="poster65"
	name = "Colonial Marine Corps poster"
	desc = "This poster depicts the logo of the Colonial Marine Corps, Oorah!"

/datum/poster/poster_66
	icon_state="poster66"
	name = "Save Resources! Switch Off Before You Clock Off."
	desc = "Save Resources! Switch Off Before You Clock Off."

/datum/poster/poster_67
	icon_state="poster67"
	name = "Weyland Yutani - 'Daniel' Model Synthetic poster"
	desc = "A poster depicting a child holding the hands of a Weyland Yutani 'Daniel' model Synthetic, Who thought this was a good idea?"

/datum/poster/poster_68
	icon_state="poster68"
	name = "Clutter Clouds the Mind - Clean Workstation = Clear Head!"
	desc = "Clutter Clouds the Mind - Clean Workstation = Clear Head!"

/datum/poster/poster_69
	icon_state="poster69"
	name = "NO foreign objects allowed - that means YOU Smokey Joe!"
	desc = "NO foreign objects allowed - that means YOU Smokey Joe!"

/datum/poster/poster_70
	icon_state="poster70"
	name = "Souto Blue"
	desc = "Souto Blue. If you don't drink Souto, you probably do stuff like floss and value your kidneys...wimp. Printed in Havana."

/datum/poster/poster_71
	icon_state="poster71"
	name = "REMEMBER - Check Once, Twice, Thrice!"
	desc = "REMEMBER - Check Once, Twice, Thrice!"

/datum/poster/poster_72
	icon_state="poster72"
	name = "Souto Lime"
	desc = "Souto Lime. If you don't drink Souto, you probably do stuff like floss and value your kidneys...wimp. Printed in Havana."

/obj/structure/sign/poster/corporate
	icon = 'void-marines/icons/posters.dmi'
	icon_state = "poster50"

/obj/structure/sign/poster/corporate/Initialize()
	serial_number = pick(50,51,60,61,62,63,67)
	.=..()
/obj/structure/sign/poster/kellandmining
	icon = 'void-marines/icons/posters.dmi'
	icon_state = "poster46"

/obj/structure/sign/poster/kellandmining/Initialize()
	serial_number = 46
	.=..()
/obj/structure/sign/poster/marshalls
	icon = 'void-marines/icons/posters.dmi'
	icon_state = "poster52"

/obj/structure/sign/poster/marshalls/Initialize()
	serial_number = pick(52,53)
	.=..()
/obj/structure/sign/poster/wylogo
	icon = 'void-marines/icons/posters.dmi'
	icon_state = "poster55"

/obj/structure/sign/poster/wylogo/Initialize()
	serial_number = pick(18,55)
	.=..()
/obj/structure/sign/poster/pimp
	icon = 'void-marines/icons/posters.dmi'
	icon_state = "poster54"

/obj/structure/sign/poster/pimp/Initialize()
	serial_number = 54
	.=..()

//DECALS

/obj/effect/hybrisa
	icon = 'icons/effects/64x64hybrisa_decals.dmi'
	icon_state = "weylandyutanilogo1"
	layer = TURF_LAYER
	plane = FLOOR_PLANE

// Roadlines

/obj/effect/hybrisa/decal/road
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_W1"
/obj/effect/hybrisa/decal/road/lines1
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_W1"
/obj/effect/hybrisa/decal/road/lines2
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_N2"
/obj/effect/hybrisa/decal/road/lines3
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_S3"
/obj/effect/hybrisa/decal/road/lines4
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_E4"
/obj/effect/hybrisa/decal/road/lines5
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_M1"
/obj/effect/hybrisa/decal/road/lines6
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_M2"
/obj/effect/hybrisa/decal/road/corner
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_corner"
/obj/effect/hybrisa/decal/road/roadmiddle
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "roadlinesmiddle"

// Dam Roadlines smaller

/obj/effect/hybrisa/decal/road/road_edge
	name = "road"
	icon_state = "road_edge_decal1"
/obj/effect/hybrisa/decal/road/road_stop
	name = "road"
	icon_state = "stop_decal1"

// Double Roadlines

/obj/effect/hybrisa/decal/doubleroad
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "ZD_W1"
/obj/effect/hybrisa/decal/doubleroad/lines1
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "ZD_W1"
/obj/effect/hybrisa/decal/doubleroad/lines2
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "ZD_N2"
/obj/effect/hybrisa/decal/doubleroad/lines3
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "ZD_S3"
/obj/effect/hybrisa/decal/doubleroad/lines4
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "ZD_E4"
/obj/effect/hybrisa/decal/doubleroad/lines5
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "ZD_M1"
/obj/effect/hybrisa/decal/doubleroad/lines6
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "ZD_M2"

// Gold lines

/obj/effect/hybrisa/decal/gold
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_S"
/obj/effect/hybrisa/decal/gold/line1
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_S"
/obj/effect/hybrisa/decal/gold/line2
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_E"
/obj/effect/hybrisa/decal/gold/line3
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_N"
/obj/effect/hybrisa/decal/gold/line4
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "Z_W"

// Red & White Warning Stripes

/obj/effect/hybrisa/decal/warning/redandwhite_SEcorner
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "red_SE-out"
/obj/effect/hybrisa/decal/warning/redandwhite_S
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "red_S"
/obj/effect/hybrisa/decal/warning/redandwhite_SWcorner
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "red_SW-out"
/obj/effect/hybrisa/decal/warning/redandwhite_E
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "red_E"
/obj/effect/hybrisa/decal/warning/redandwhite_W
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "red_W"
/obj/effect/hybrisa/decal/warning/redandwhite_NEcorner
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "red_NE-out"
/obj/effect/hybrisa/decal/warning/redandwhite_N
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "red_N"
/obj/effect/hybrisa/decal/warning/redandwhite_NWcorner
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "red_NW-out"

// Angled Warning-Stripes

/obj/effect/hybrisa/decal/warningstripes_angled
	name = "warning stripes"
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "warningstripes_angled"
/obj/effect/hybrisa/decal/warningstripes_angled_corner
	name = "warning stripes"
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "warningstripes_angled_corner"

// Grate

/obj/effect/hybrisa/decal/grate
	name = "solid metal grate"
	desc = "A metal grate."
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "zhalfgrate1"

// 64x64 Decals

/obj/effect/hybrisa/decal/WY/WY1
	icon = 'icons/effects/64x64hybrisa_decals.dmi'
	icon_state = "weylandyutanilogo1"

/obj/effect/hybrisa/decal/WY/WYworn
	icon = 'icons/effects/64x64hybrisa_decals.dmi'
	icon_state = "weylandyutanilogo2"

/obj/effect/hybrisa/decal/roadcross
	icon = 'icons/effects/64x64hybrisa_decals.dmi'
	icon_state = "roadcross"
/obj/effect/hybrisa/decal/checkpoint_decal
	icon = 'icons/effects/64x64hybrisa_decals.dmi'
	icon_state = "checkpoint_decal"
/obj/effect/hybrisa/decal/workers_decal
	icon = 'icons/effects/64x64hybrisa_decals.dmi'
	icon_state = "workers_decal"

// 64x128 Decals

/obj/effect/hybrisa/decal/meridianlogo
	icon = 'icons/effects/meridianlogo.dmi'
	icon_state = "meridian_left"
/obj/effect/hybrisa/decal/meridianlogo/meridianlogo_left
	icon_state = "meridian_left"
/obj/effect/hybrisa/decal/meridianlogo/meridianlogo_right
	icon_state = "meridian_right"

/// Dirt & Grime

/obj/effect/hybrisa/decal/dirt
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "dirt"

/obj/effect/hybrisa/decal/dirt_2
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "dirt_2"

/obj/effect/hybrisa/decal/bloodtrail
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "bloodtrail"

/obj/effect/hybrisa/decal/tiretrack
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "tiremarks"

/obj/effect/hybrisa/decal/trash
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "trash_1"

/// Engineer_ship

/obj/effect/hybrisa/decal/engineership_corners
	icon = 'icons/effects/hybrisa_decals.dmi'
	icon_state = "engPlatform_corners"

//PROPS

/obj/structure/prop/hybrisa
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	icon_state = "pimp"

// Cave props

/obj/structure/prop/hybrisa/boulders
	icon = 'icons/obj/structures/props/boulder_largedark.dmi'
	icon_state = "boulder_largedark1"

/obj/structure/prop/hybrisa/boulders/large_boulderdark
	name = "boulder"
	desc = "A large rock. It's not cooking anything."
	icon = 'icons/obj/structures/props/boulder_largedark.dmi'
	icon_state = "boulder_largedark1"
	density = TRUE
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
/obj/structure/prop/hybrisa/boulders/large_boulderdark/boulder_dark1
	icon_state = "boulder_largedark1"
/obj/structure/prop/hybrisa/boulders/large_boulderdark/boulder_dark2
	icon_state = "boulder_largedark2"
/obj/structure/prop/hybrisa/boulders/large_boulderdark/boulder_dark3
	icon_state = "boulder_largedark3"
/obj/structure/prop/hybrisa/boulders/wide_boulderdark
	name = "boulder"
	desc = "A large rock. It's not cooking anything."
	icon = 'icons/obj/structures/props/boulder_widedark.dmi'
	icon_state = "boulderwidedark"
	density = TRUE
	bound_height = 32
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
/obj/structure/prop/hybrisa/boulders/wide_boulderdark/wide_boulder1
	icon_state = "boulderwidedark"
/obj/structure/prop/hybrisa/boulders/wide_boulderdark/wide_boulder2
	icon_state = "boulderwidedark2"
/obj/structure/prop/hybrisa/boulders/smallboulderdark
	name = "boulder"
	icon_state = "bouldersmalldark1"
	desc = "A large rock. It's not cooking anything."
	icon = 'icons/obj/structures/props/boulder_small.dmi'
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/boulders/smallboulderdark/boulder_dark1
	icon_state = "bouldersmalldark1"
/obj/structure/prop/hybrisa/boulders/smallboulderdark/boulder_dark2
	icon_state = "bouldersmalldark2"
/obj/structure/prop/hybrisa/boulders/smallboulderdark/boulder_dark3
	icon_state = "bouldersmalldark3"

/obj/structure/prop/hybrisa/cavedecor
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	name = "stalagmite"
	icon_state = "stalagmite"
	desc = "A cave stalagmite."
/obj/structure/prop/hybrisa/cavedecor/stalagmite0
	icon_state = "stalagmite"
/obj/structure/prop/hybrisa/cavedecor/stalagmite1
	icon_state = "stalagmite1"
/obj/structure/prop/hybrisa/cavedecor/stalagmite2
	icon_state = "stalagmite2"
/obj/structure/prop/hybrisa/cavedecor/stalagmite3
	icon_state = "stalagmite3"
/obj/structure/prop/hybrisa/cavedecor/stalagmite4
	icon_state = "stalagmite4"
/obj/structure/prop/hybrisa/cavedecor/stalagmite5
	icon_state = "stalagmite5"

// Vehicles

/obj/structure/prop/hybrisa/vehicles
    icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
    icon_state = "SUV"

/obj/structure/prop/hybrisa/vehicles/suv
    icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
    icon_state = "SUV"

/obj/structure/prop/hybrisa/vehicles/suvdamaged
    icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
    icon_state = "SUV_damaged"

/obj/structure/prop/hybrisa/vehicles/largetruck
    icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
    icon_state = "zenithlongtruck3"

/obj/structure/prop/hybrisa/vehicles/Car
    icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
    icon_state = "MeridianCar_1"

/obj/structure/prop/hybrisa/vehicles/Car
    icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
    icon_state = "MeridianCar_1"

/obj/structure/prop/hybrisa/vehicles/suv
	name = "SUV"
	desc = "Seems to be broken down."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	icon_state = "SUV"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/suv/suv_1
	icon_state = "SUV1"
/obj/structure/prop/hybrisa/vehicles/suv/suv_2
	icon_state = "SUV2"
/obj/structure/prop/hybrisa/vehicles/suv/suv_5
	icon_state = "SUV5"
/obj/structure/prop/hybrisa/vehicles/suv/suv_6
	icon_state = "SUV6"
/obj/structure/prop/hybrisa/vehicles/suv/suv_7
	icon_state = "SUV7"
/obj/structure/prop/hybrisa/vehicles/suv/suv_8
	icon_state = "SUV8"

// Meridian Cars

/obj/structure/prop/hybrisa/vehicles/Car
	name = "Mono-Spectra"
	desc = "The 'Mono-Spectra', a mass-produced civilian vehicle for the colonial markets, in and outside of the United Americas. Produced by 'Meridian' a car marque and associated operating division of the Weyland-Yutani Corporation."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	icon_state = "MeridianCar_1"
	bound_height = 32
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/vehicles/Car/Car_1
	icon_state = "MeridianCar_2"
/obj/structure/prop/hybrisa/vehicles/Car/Car_2
	icon_state = "MeridianCar_3"
/obj/structure/prop/hybrisa/vehicles/Car/Car_3
	icon_state = "MeridianCar_4"
/obj/structure/prop/hybrisa/vehicles/Car/Car_4
	icon_state = "MeridianCar_5"
/obj/structure/prop/hybrisa/vehicles/Car/Car_5
	icon_state = "MeridianCar_6"

// Car Chassis

/obj/structure/prop/hybrisa/vehicles/Car/Car_chassis
    desc = "A Mono-Spectra chassis in the early stages of assembly."

/obj/structure/prop/hybrisa/vehicles/Car/Car_chassis
	name = "Mono-Spectra Chassis"
	icon_state = "MeridianCar_shell"

// Meridian Cars

/obj/structure/prop/hybrisa/vehicles/Car
	name = "Mono-Spectra"
	desc = "The 'Mono-Spectra', a mass-produced civilian vehicle for the colonial markets, in and outside of the United Americas. Produced by 'Meridian' a car marque and associated operating division of the Weyland-Yutani Corporation."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	icon_state = "MeridianCar_1"
	bound_height = 32
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/vehicles/Car/Car_1
	icon_state = "MeridianCar_2"
/obj/structure/prop/hybrisa/vehicles/Car/Car_2
	icon_state = "MeridianCar_3"
/obj/structure/prop/hybrisa/vehicles/Car/Car_3
	icon_state = "MeridianCar_4"
/obj/structure/prop/hybrisa/vehicles/Car/Car_4
	icon_state = "MeridianCar_5"
/obj/structure/prop/hybrisa/vehicles/Car/Car_5
	icon_state = "MeridianCar_6"

// Car Chassis

/obj/structure/prop/hybrisa/vehicles/Car/Car_chassis
    desc = "A Mono-Spectra chassis in the early stages of assembly."

/obj/structure/prop/hybrisa/vehicles/Car/Car_chassis
	name = "Mono-Spectra Chassis"
	icon_state = "MeridianCar_shell"

// damaged suv

/obj/structure/prop/hybrisa/vehicles/suvdamaged
    name = "heavily damaged SUV"
    desc = "A shell of a vehicle, broken down beyond repair."

/obj/structure/prop/hybrisa/vehicles/suvdamaged/suv_damaged0
	icon_state = "SUV_damaged"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/suvdamaged/suv_damaged1
	icon_state = "SUV1_damaged"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/suvdamaged/suv_damaged2
	icon_state = "SUV2_damaged"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE

// small trucks

/obj/structure/prop/hybrisa/vehicles/truck
	name = "truck"
	icon_state = "zentruck1"
	desc = "Seems to be broken down."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/truck/truck1
	icon_state = "zentruck2"
/obj/structure/prop/hybrisa/vehicles/truck/truck2
	icon_state = "zentruck3"
/obj/structure/prop/hybrisa/vehicles/truck/truck3
	icon_state = "zentruck4"
/obj/structure/prop/hybrisa/vehicles/truck/truck4
	icon_state = "zentruck5"
/obj/structure/prop/hybrisa/vehicles/truck/garbage
	name = "garbage truck"
	icon_state = "zengarbagetruck"
	desc = "Seems to be broken down."

// large trucks

/obj/structure/prop/hybrisa/vehicles/largetruck
	name = "mega-hauler truck"
	icon_state = "zenithlongtruck4"
	desc = "Seems to be broken down."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruck1
	icon_state = "zenithlongtruck2"
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruck2
	icon_state = "zenithlongtruck3"
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruck3
	icon_state = "zenithlongtruck4"
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruck4
	icon_state = "zenithlongtruck5"

// mining truck

/obj/structure/prop/hybrisa/vehicles/largetruck/largetruckmining
	icon_state = "zenithlongtruckkellandmining1"
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruckmining
    name = "Kelland mining mega-hauler truck"
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruckmining/mining
	icon_state = "zenithlongtruckkellandmining1"

// w-y truck

/obj/structure/prop/hybrisa/vehicles/largetruck/largetruckwy
	icon_state = "zenithlongtruckweyland1"
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruckwy
    name = "Weyland-Yutani mega-hauler truck"
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruckwy/wy1
	icon_state = "zenithlongtruckweyland1"
/obj/structure/prop/hybrisa/vehicles/largetruck/largetruckwy/wy2
	icon_state = "zenithlongtruckweyland2"

// Colony Crawlers

/obj/structure/prop/hybrisa/vehicles/colonycrawlers
	icon_state = "crawler_wy2"
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE

/obj/structure/prop/hybrisa/vehicles/colonycrawlers/mining
	icon_state = "miningcrawler1"
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Weyland Yutani."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'

/obj/structure/prop/hybrisa/vehicles/colonycrawlers/science
	icon_state = "crawler_wy2"
	desc = "It is a tread bound crawler used in harsh conditions. This one is designed for personnel transportation. Supplied by Orbital Blue International; 'Your friends, in the Aerospace business.' A subsidiary of Weyland Yutani."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'

// science crawlers

/obj/structure/prop/hybrisa/vehicles/colonycrawlers/science
    name = "weyland-yutani colony crawler"

/obj/structure/prop/hybrisa/vehicles/colonycrawlers/science/science1
	icon_state = "crawler_wy1"
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
/obj/structure/prop/hybrisa/vehicles/colonycrawlers/science/science2
	icon_state = "crawler_wy2"
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'

// Mining Crawlers

/obj/structure/prop/hybrisa/vehicles/colonycrawlers/mining
    name = "kelland mining colony crawler"

/obj/structure/prop/hybrisa/vehicles/colonycrawlers/mining/mining1
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Weyland Yutani."
	icon_state = "miningcrawler2"
/obj/structure/prop/hybrisa/vehicles/colonycrawlers/mining/mining2
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Weyland Yutani."
	icon_state = "miningcrawler3"
/obj/structure/prop/hybrisa/vehicles/colonycrawlers/mining/mining3
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Weyland Yutani."
	icon_state = "miningcrawler4"
/obj/structure/prop/hybrisa/vehicles/colonycrawlers/mining/mining4
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Weyland Yutani."
	icon_state = "miningcrawlerblank"

// Special SUV's

/obj/structure/prop/hybrisa/vehicles/suv/misc
	name = "Weyland-Yutani rapid response vehicle"
	desc = "Seems to be broken down."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	icon_state = "WYSUV1"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/suv/misc/wy1
	icon_state = "WYSUV1"
/obj/structure/prop/hybrisa/vehicles/suv/misc/wy2
	icon_state = "WYSUV2"
/obj/structure/prop/hybrisa/vehicles/suv/misc/wy3
	icon_state = "WYSUV3"
/obj/structure/prop/hybrisa/vehicles/suv/misc/ambulance
	name = "emergency response medical van"
	desc = "Seems to be broken down."
	icon_state = "ambulance"
/obj/structure/prop/hybrisa/vehicles/suv/misc/whitevan
	name = "maintenance SUV"
	desc = "Seems to be broken down."
	icon_state = "whitevan"
/obj/structure/prop/hybrisa/vehicles/suv/misc/maintenance
	name = "maintenance SUV"
	desc = "Seems to be broken down."
	icon_state = "maintenaceSUV"
/obj/structure/prop/hybrisa/vehicles/suv/misc/marshalls
	name = "colonial marshalls rapid response SUV"
	desc = "Seems to be broken down."
	icon_state = "marshalls"
/obj/structure/prop/hybrisa/vehicles/suv/misc/marshalls2
	name = "colonial marshalls rapid response SUV"
	desc = "Seems to be broken down."
	icon_state = "marshalls2"
/obj/structure/prop/hybrisa/vehicles/suv/misc/expensive
	name = "Expensive looking SUV"
	desc = "Seems to be broken down."
	icon_state = "SUV9"
/obj/structure/prop/hybrisa/vehicles/suv/misc/expensive2
	name = "Expensive Weyland-Yutani SUV"
	desc = "Seems to be broken down."
	icon_state = "blackSUV"
/obj/structure/prop/hybrisa/vehicles/suv/misc/expensive3
	name = "The Pimp-Mobile"
	desc = "Seems to be broken down."
	icon_state = "pimpmobile"

// Vans

/obj/structure/prop/hybrisa/vehicles/van
	name = "van"
	desc = "Seems to be broken down."
	icon = 'icons/obj/structures/props/vehiclesexpanded2.dmi'
	icon_state = "greyvan"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/van/vandamaged
	name = "van"
	desc = "A shell of a vehicle, broken down beyond repair."
	icon_state = "greyvan_damaged"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/van/vanpizza
	name = "pizza delivery van"
	desc = "Seems to be broken down."
	icon_state = "pizzavan"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
/obj/structure/prop/hybrisa/vehicles/van/vanmining
	name = "Kelland Mining van"
	desc = "Seems to be broken down."
	icon_state = "kellandminingvan"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE

/obj/structure/prop/hybrisa/vehicles/crashedcarsleft
	name = "car pileup"
	desc = "Burned out wrecked vehicles block your path."
	icon = 'icons/obj/structures/props/crashedcars.dmi'
	icon_state = "crashedcarsleft"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
	layer = 5
/obj/structure/prop/hybrisa/vehicles/crashedcarsright
	name = "car pileup"
	desc = "Burned out wrecked vehicles block your path."
	icon = 'icons/obj/structures/props/crashedcars.dmi'
	icon_state = "crashedcarsright"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	density = TRUE
	layer = 5

// Supermart

/obj/structure/prop/hybrisa/supermart
	name = "long rack"
	icon_state = "longrack1"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'icons/obj/structures/props/supermart.dmi'
	density = TRUE

/obj/structure/prop/hybrisa/supermart/rack/longrackempty
	name = "shelf"
	desc = "A long empty shelf."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "longrackempty"
/obj/structure/prop/hybrisa/supermart/rack/longrack1
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "longrack1"
/obj/structure/prop/hybrisa/supermart/rack/longrack2
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "longrack2"
/obj/structure/prop/hybrisa/supermart/rack/longrack3
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "longrack3"
/obj/structure/prop/hybrisa/supermart/rack/longrack4
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "longrack4"
/obj/structure/prop/hybrisa/supermart/rack/longrack5
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "longrack5"
/obj/structure/prop/hybrisa/supermart/rack/longrack6
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "longrack6"
/obj/structure/prop/hybrisa/supermart/rack/longrack7
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "longrack7"

/obj/structure/prop/hybrisa/supermart/supermartbelt
	name = "conveyor belt"
	desc = "A conveyor belt."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "checkoutbelt"

/obj/structure/prop/hybrisa/supermart/freezer
	name = "commercial freezer"
	desc = "A commercial grade freezer."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "freezerupper"
	density = TRUE
/obj/structure/prop/hybrisa/supermart/freezer/supermartfreezer1
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "freezerupper"
/obj/structure/prop/hybrisa/supermart/freezer/supermartfreezer2
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "freezerlower"
/obj/structure/prop/hybrisa/supermart/freezer/supermartfreezer3
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "freezermid"
/obj/structure/prop/hybrisa/supermart/freezer/supermartfreezer4
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "freezerupper1"
/obj/structure/prop/hybrisa/supermart/freezer/supermartfreezer5
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "freezerlower1"
/obj/structure/prop/hybrisa/supermart/freezer/supermartfreezer6
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "freezermid1"

/obj/structure/prop/hybrisa/supermart/supermartfruitbasketempty
	name = "basket"
	desc = "A basket."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "supermarketbasketempty"
/obj/structure/prop/hybrisa/supermart/supermartfruitbasketoranges
	name = "basket"
	desc = "A basket full of oranges."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "supermarketbasket1"
/obj/structure/prop/hybrisa/supermart/supermartfruitbasketpears
	name = "basket"
	desc = "A basket full of pears."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "supermarketbasket2"
/obj/structure/prop/hybrisa/supermart/supermartfruitbasketcarrots
	name = "basket"
	desc = "A basket full of carrots."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "supermarketbasket3"
/obj/structure/prop/hybrisa/supermart/supermartfruitbasketmelons
	name = "basket"
	desc = "A basket full of melons."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "supermarketbasket4"
/obj/structure/prop/hybrisa/supermart/supermartfruitbasketapples
	name = "basket"
	desc = "A basket full of apples."
	icon = 'icons/obj/structures/props/supermart.dmi'
	icon_state = "supermarketbasket5"

// Hospital

/obj/structure/prop/hybrisa/hospital
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "hospital"

/obj/structure/prop/hybrisa/hospital/hospitalbedrollerbody
	name = "hospital bed"
	desc = "A hospital bed, there's a body under the cloth..."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "bigrollerbody_up"
	density = TRUE
	wrenchable = TRUE
/obj/structure/prop/hybrisa/hospital/hospitalbedrollerbody1
	name = "hospital bed"
	desc = "A hospital bed, there's a body under the cloth..."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "bigrollerbody2_up"
	density = TRUE
	wrenchable = TRUE
/obj/structure/prop/hybrisa/hospital/hospitalbedrollerbody2
	name = "hospital bed"
	desc = "A hospital bed, there's a body under the cloth..."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "bigrollerbodybloodalt_up"
	density = TRUE
	wrenchable = TRUE
/obj/structure/prop/hybrisa/hospital/hospitalbedrollerbody3
	name = "hospital bed"
	desc = "A hospital bed, there's blood on the surface..."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "bigrolleremptyblood_up"
	density = TRUE
	wrenchable = TRUE

/obj/structure/prop/hybrisa/hospital/hospitaldivider
	name = "hospital divider"
	desc = "A hospital divider for privacy."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "hospitalcurtain"
	layer = ABOVE_MOB_LAYER

// Furniture

//Hospital Rollers (non foldable)

/obj/structure/bed/roller/hospital
	name = "hospital bed"
	icon = 'void-marines/icons/rollerbed.dmi'
	icon_state = "bigrollerempty"
	foldabletype = null
	base_bed_icon = "bigrollerempty"

	var/body_icon_state = "bigroller"
	var/raised_with_body = TRUE
	var/mob/living/carbon/human/body
	var/datum/equipment_preset/body_preset = /datum/equipment_preset/corpse/colonist/random

/obj/structure/bed/roller/hospital/Initialize(mapload, ...)
	. = ..()
	create_body()
	update_icon()

/obj/structure/bed/roller/hospital/Destroy()
	if(body)
		QDEL_NULL(body)
	return ..()

/obj/structure/bed/roller/hospital/attackby()
	if(body)
		return
	..()

/obj/structure/bed/roller/hospital/attack_hand()
	if(body)
		if(raised_with_body)
			raised_with_body = FALSE
			update_icon()
			return
		else
			dump_body()
			update_icon()
			return
	..()

/obj/structure/bed/roller/hospital/update_icon()
	overlays.Cut()
	if(body)
		icon_state = body_icon_state + "body"
		if(raised_with_body)
			icon_state = icon_state + "_up"
		else
			icon_state = icon_state + "_down"
	else
		..()

/obj/structure/bed/roller/hospital/MouseDrop_T(atom/dropping, mob/user)
	if(body)
		return
	..()

/obj/structure/bed/roller/hospital/proc/create_body()
	body = new()
	contents += body
	arm_equipment(body, body_preset, TRUE, FALSE)
	body.death(create_cause_data("exposure"))

/obj/structure/bed/roller/hospital/proc/dump_body()
	var/turf/dump_turf = get_turf(src)
	body.forceMove(dump_turf)
	contents -= body
	body = null

/obj/structure/bed/roller/hospital/bloody
	base_bed_icon = "bigrollerbloodempty"
	body_icon_state = "bigrollerblood"
	body_preset = /datum/equipment_preset/corpse/colonist/random/burst

/obj/structure/prop/hybrisa/furniture
    icon = 'icons/obj/structures/props/zenithtables.dmi'
    icon_state = "blackmetaltable"

/obj/structure/prop/hybrisa/furniture/tables
    icon = 'icons/obj/structures/props/zenithtables.dmi'
    icon_state = "table_pool"

/obj/structure/prop/hybrisa/furniture/tables/tableblack
	name = "large metal table"
	desc = "A large black metal table, looks very expensive."
	icon_state = "blackmetaltable"
	density = TRUE
	climbable = TRUE
	breakable = TRUE
	bound_height = 32
	bound_width = 64
	debris = list(/obj/item/stack/sheet/metal)

/obj/structure/prop/hybrisa/furniture/tables/tableblack/blacktablecomputer
    icon = 'icons/obj/structures/props/zenithtables.dmi'
    icon_state = "blackmetaltable_computer"

/obj/structure/prop/hybrisa/furniture/tables/tablewood
	name = "large wood table"
	desc = "A large wooden table, looks very expensive."
	icon_state = "brownlargetable"
	density = TRUE
	climbable = TRUE
	breakable = TRUE
	bound_height = 32
	bound_width = 64
	debris = list(/obj/item/stack/sheet/wood)

/obj/structure/prop/hybrisa/furniture/tables/tablewood/woodtablecomputer
    icon = 'icons/obj/structures/props/zenithtables.dmi'
    icon_state = "brownlargetable_computer"

/obj/structure/prop/hybrisa/furniture/tables/tablepool
	name = "pool table"
	desc = "A large table used for Pool."
	icon = 'icons/obj/structures/props/zenithtables.dmi'
	icon_state = "table_pool"
	density = TRUE
	bound_height = 32
	bound_width = 64
	climbable = TRUE
	breakable = TRUE
	debris = list(/obj/item/stack/sheet/wood)
/obj/structure/prop/hybrisa/furniture/tables/tablegambling
	name = "gambling table"
	desc = "A large table used for gambling."
	icon = 'icons/obj/structures/props/zenithtables.dmi'
	icon_state = "table_cards"
	density = TRUE
	bound_height = 32
	bound_width = 64
	climbable = TRUE
	breakable = TRUE
	debris = list(/obj/item/stack/sheet/wood)

// Chairs
/obj/structure/bed/hybrisa/chairs
    name = "expensive chair"
    desc = "A expensive looking chair"

/obj/structure/bed/hybrisa/chairs/black
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "comfychair_zenithblack"
/obj/structure/bed/hybrisa/chairs/red
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "comfychair_zenithred"
/obj/structure/bed/hybrisa/chairs/blue
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "comfychair_zenithblue"
/obj/structure/bed/hybrisa/chairs/brown
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "comfychair_zenithbrown"

// Beds

/obj/structure/bed/hybrisa
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "hybrisa"

/obj/structure/bed/hybrisa/prisonbed
	name = "bunk bed"
	desc = "A sorry looking bunk-bed."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "prisonbed"

/obj/structure/bed/hybrisa/bunkbed1
	name = "bunk bed"
	desc = "A comfy looking bunk-bed."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "zbunkbed"

/obj/structure/bed/hybrisa/bunkbed2
	name = "bunk bed"
	desc = "A comfy looking bunk-bed."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "zbunkbed2"

/obj/structure/bed/hybrisa/bunkbed3
	name = "bunk bed"
	desc = "A comfy looking bunk-bed."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "zbunkbed3"

/obj/structure/bed/hybrisa/bunkbed4
	name = "bunk bed"
	desc = "A comfy looking bunk-bed."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "zbunkbed4"

/obj/structure/bed/hybrisa/hospitalbeds
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "hospital"

/obj/structure/bed/hybrisa/hospitalbeds/hospitalbed1
	name = "hospital bed"
	desc = "A mattress seated on a rectangular metallic frame with wheels. This is used to support a lying person in a comfortable manner."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "bigrollerempty2_up"

/obj/structure/bed/hybrisa/hospitalbeds/hospitalbed2
	name = "hospital bed"
	desc = "A mattress seated on a rectangular metallic frame with wheels. This is used to support a lying person in a comfortable manner."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "bigrollerempty_up"

/obj/structure/bed/hybrisa/hospitalbeds/hospitalbed3
	name = "hospital bed"
	desc = "A mattress seated on a rectangular metallic frame with wheels. This is used to support a lying person in a comfortable manner."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "bigrollerempty3_up"

// Xenobiology

/obj/structure/prop/hybrisa/xenobiology
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocellemptyon"
	layer = ABOVE_MOB_LAYER


/obj/structure/prop/hybrisa/xenobiology/small/empty
	name = "specimen containment cell"
	desc = "It's empty."
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocellemptyon"
	density = TRUE
/obj/structure/prop/hybrisa/xenobiology/small/offempty
	name = "specimen containment cell"
	desc = "It's turned off and empty."
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocellemptyoff"
	density = TRUE
/obj/structure/prop/hybrisa/xenobiology/small/larva
	name = "specimen containment cell"
	desc = "There is something worm-like inside..."
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocelllarva"
	density = TRUE
/obj/structure/prop/hybrisa/xenobiology/small/egg
	name = "specimen containment cell"
	desc = "There is, what looks like some sort of egg inside..."
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocellegg"
	density = TRUE
/obj/structure/prop/hybrisa/xenobiology/small/hugger
	name = "specimen containment cell"
	desc = "There's something spider-like inside..."
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocellhugger"
	density = TRUE
/obj/structure/prop/hybrisa/xenobiology/small/cracked1
	name = "specimen containment cell"
	desc = "Looks like something broke it...from the inside."
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocellcrackedempty"
	density = TRUE
/obj/structure/prop/hybrisa/xenobiology/small/cracked2
	name = "specimen containment cell"
	desc = "Looks like something broke it...from the inside."
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocellcrackedempty2"
	density = TRUE
/obj/structure/prop/hybrisa/xenobiology/small/crackedegg
	name = "specimen containment cell"
	desc = "Looks like something broke it, there's a giant empty egg inside."
	icon = 'icons/obj/structures/props/zenithxenocryogenics.dmi'
	icon_state = "xenocellcrackedegg"
	density = TRUE
/obj/structure/prop/hybrisa/xenobiology/big
	name = "specimen containment cell"
	desc = "A giant tube with a hulking monstrosity inside, is this thing alive?"
	icon = 'icons/obj/structures/props/zenithxenocryogenics2.dmi'
	icon_state = "bigqueencryo1"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE

/obj/structure/prop/hybrisa/xenobiology/big/bigleft
	icon = 'icons/obj/structures/props/zenithxenocryogenics2.dmi'
	icon_state = "bigqueencryo1"
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/xenobiology/big/bigright
	icon = 'icons/obj/structures/props/zenithxenocryogenics2.dmi'
	icon_state = "bigqueencryo2"
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/xenobiology/big/bigbottomleft
	icon = 'icons/obj/structures/props/zenithxenocryogenics2.dmi'
	icon_state = "bigqueencryo3"
	density = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/xenobiology/big/bigbottomright
	icon = 'icons/obj/structures/props/zenithxenocryogenics2.dmi'
	icon_state = "bigqueencryo4"
	density = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/hybrisa/xenobiology/misc
	name = "strange egg"
	desc = "A strange ancient looking egg, it seems to be inert."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "inertegg"
	unslashable = TRUE
	indestructible = TRUE
	layer = 2

// Engineer

/obj/structure/prop/hybrisa/engineer
	icon = 'icons/obj/structures/props/engineerJockey.dmi'
	icon_state = "spacejockey"

/obj/structure/prop/hybrisa/engineer/spacejockey
	name = "Giant Pilot"
	desc = "temp."
	icon = 'icons/obj/structures/props/engineerJockey.dmi'
	icon_state = "spacejockey"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/hybrisa/engineer/giantpodbroken
	name = "Giant Pod"
	desc = "temp."
	icon = 'icons/obj/structures/props/engineerPod.dmi'
	icon_state = "pod_broken"
	bound_height = 96
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER
	density = TRUE
obj/structure/prop/hybrisa/engineer/giantpod
	name = "Giant Pod"
	desc = "temp."
	icon = 'icons/obj/structures/props/engineerPod.dmi'
	icon_state = "pod"
	bound_height = 96
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
	density = TRUE

/obj/structure/prop/hybrisa/engineer/engineerpillar
	icon = 'icons/obj/structures/props/zenithengineerpillarangled.dmi'
	icon_state = "engineerpillar_SW1fade"
	bound_height = 64
	bound_width = 128
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/hybrisa/engineer/engineerpillar/northwesttop
	name = "strange pillar"
	icon = 'icons/obj/structures/props/zenithengineerpillarangled.dmi'
	icon_state = "engineerpillar_NW1"
/obj/structure/prop/hybrisa/engineer/engineerpillar/northwestbottom
	name = "strange pillar"
	icon = 'icons/obj/structures/props/zenithengineerpillarangled.dmi'
	icon_state = "engineerpillar_NW2"
/obj/structure/prop/hybrisa/engineer/engineerpillar/southwesttop
	name = "strange pillar"
	icon = 'icons/obj/structures/props/zenithengineerpillarangled.dmi'
	icon_state = "engineerpillar_SW1"
/obj/structure/prop/hybrisa/engineer/engineerpillar/southwestbottom
	name = "strange pillar"
	icon = 'icons/obj/structures/props/zenithengineerpillarangled.dmi'
	icon_state = "engineerpillar_SW2"
/obj/structure/prop/hybrisa/engineer/engineerpillar/smallsouthwest1
	name = "strange pillar"
	icon = 'icons/obj/structures/props/zenithengineerpillarangled.dmi'
	icon_state = "engineerpillar_SW1fade"
/obj/structure/prop/hybrisa/engineer/engineerpillar/smallsouthwest2
	name = "strange pillar"
	icon = 'icons/obj/structures/props/zenithengineerpillarangled.dmi'
	icon_state = "engineerpillar_SW2fade"

/obj/structure/prop/hybrisa/engineer/blackgoocontainer
	name = "strange container"
	icon_state = "blackgoocontainer1"
	desc = "A strange alien container, who knows what's inside..."
	icon = 'icons/obj/structures/props/blackgoocontainers.dmi'

// Signs

/obj/structure/prop/hybrisa/signs
	name = "neon sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "jacksopen_on"
	bound_height = 64
	bound_width = 64
	unslashable = TRUE
	unacidable = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/hybrisa/signs/casniosign
	name = "casino sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "nightgoldcasinoopen_on"
/obj/structure/prop/hybrisa/signs/jackssign
	name = "jack's surplus sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "jacksopen_on"
/obj/structure/prop/hybrisa/signs/opensign
	name = "open sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "open_on"
/obj/structure/prop/hybrisa/signs/opensign2
	name = "open sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "open_on2"
/obj/structure/prop/hybrisa/signs/pizzasign
	name = "pizza sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "pizzaneon_on"
/obj/structure/prop/hybrisa/signs/weymartsign
	name = "weymart sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "weymartsign2"
/obj/structure/prop/hybrisa/signs/mechanicsign
	name = "mechanic sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "mechanicopen_on2"
/obj/structure/prop/hybrisa/signs/cuppajoessign
	name = "cuppa joe's sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "cuppajoes"
/obj/structure/prop/hybrisa/signs/barsign
	name = "bar sign"
	icon = 'icons/obj/structures/props/zenith64x64_signs.dmi'
	icon_state = "barsign_on"

// Airport

/obj/structure/prop/hybrisa/airport
	name = "nose cone"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dropshipfrontwhite1"
	unslashable = TRUE
	unacidable = TRUE

/obj/structure/prop/hybrisa/airport/dropshipnosecone
	name = "nose cone"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dropshipfrontwhite1"
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/airport/dropshipwingleft
	name = "wing"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dropshipwingtop1"
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/airport/dropshipwingright
	name = "wing"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dropshipwingtop2"
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/airport/dropshipvent1left
	name = "vent"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dropshipvent1"
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/airport/dropshipvent2right
	name = "vent"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dropshipvent2"
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/airport/dropshipventleft
	name = "vent"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dropshipvent3"
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER
/obj/structure/prop/hybrisa/airport/dropshipventright
	name = "vent"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dropshipvent4"
	indestructible = TRUE
	layer = ABOVE_MOB_LAYER

// Dropship damage

/obj/structure/prop/hybrisa/airport/dropshipenginedamage
	name = "dropship damage"
	desc = "the engine appears to have severe damage."
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "dropship_engine_damage"
	bound_height = 64
	bound_width = 96
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE

/obj/structure/prop/hybrisa/airport/dropshipenginedamagenofire
	name = "dropship damage"
	desc = "the engine appears to have severe damage."
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "dropship_engine_damage_nofire"
	bound_height = 64
	bound_width = 96
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE

/obj/structure/prop/hybrisa/airport/refuelinghose
	name = "refueling hose"
	desc = "A long refueling hose that connects to various types of dropships."
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "fuelline1"
	bound_height = 64
	bound_width = 96
	unslashable = TRUE
	unacidable = TRUE
/obj/structure/prop/hybrisa/airport/refuelinghose2
	name = "refueling hose"
	desc = "A long refueling hose that connects to various types of dropships."
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "fuelline2"
	bound_height = 64
	bound_width = 96
	unslashable = TRUE
	unacidable = TRUE

// Pilot body

/obj/structure/prop/hybrisa/airport/deadpilot1
	name = "decapitated Weyland-Yutani Pilot"
	desc = "What remains of a Weyland-Yutani Pilot. Their entire head is missing. Where'd it roll off to?..."
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "pilotbody_decap1"
	bound_height = 64
	bound_width = 96
	unslashable = TRUE
	unacidable = TRUE
/obj/structure/prop/hybrisa/airport/deadpilot2
	name = "decapitated Weyland-Yutani Pilot"
	desc = "What remains of a Weyland-Yutani Pilot. Their entire head is missing. Where'd it roll off to?..."
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "pilotbody_decap2"
	bound_height = 64
	bound_width = 96
	unslashable = TRUE
	unacidable = TRUE

// Misc

/obj/structure/prop/hybrisa/misc
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrier"

// Floor props

/obj/structure/prop/hybrisa/misc/floorprops
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "solidgrate1"

/obj/structure/prop/hybrisa/misc/floorprops/grate
	name = "solid metal grate"
	desc = "A metal grate."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "solidgrate1"

/obj/structure/prop/hybrisa/misc/floorprops/grate2
	name = "solid metal grate"
	desc = "A metal grate."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "solidgrate5"

/obj/structure/prop/hybrisa/misc/floorprops/grate3
	name = "solid metal grate"
	desc = "A metal grate."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "zhalfgrate1"

/obj/structure/prop/hybrisa/misc/floorprops/floorglass
	name = "reinforced glass floor"
	desc = "A heavily reinforced glass floor panel, this looks almost indestructible."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "solidgrate2"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
/obj/structure/prop/hybrisa/misc/floorprops/floorglass2
	name = "reinforced glass floor"
	desc = "A heavily reinforced glass floor panel, this looks almost indestructible."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "solidgrate3"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
	layer = 2.1
/obj/structure/prop/hybrisa/misc/floorprops/floorglass3
	name = "reinforced glass floor"
	desc = "A heavily reinforced glass floor panel, this looks almost indestructible."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "solidgrate4"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE

// Graffiti

/obj/structure/prop/hybrisa/misc/graffiti
	name = "graffiti"
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zgraffiti4"
	bound_height = 64
	bound_width = 96
	unslashable = TRUE
	unacidable = TRUE
	breakable = TRUE

/obj/structure/prop/hybrisa/misc/graffiti/graffiti1
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zgraffiti1"
/obj/structure/prop/hybrisa/misc/graffiti/graffiti2
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zgraffiti2"
/obj/structure/prop/hybrisa/misc/graffiti/graffiti3
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zgraffiti3"
/obj/structure/prop/hybrisa/misc/graffiti/graffiti4
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zgraffiti4"
/obj/structure/prop/hybrisa/misc/graffiti/graffiti5
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zgraffiti5"
/obj/structure/prop/hybrisa/misc/graffiti/graffiti6
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zgraffiti6"
/obj/structure/prop/hybrisa/misc/graffiti/graffiti7
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zgraffiti7"

// Wall Blood

/obj/structure/prop/hybrisa/misc/blood
	name = "blood"
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "wallblood_floorblood"
	unslashable = TRUE
	unacidable = TRUE
	breakable = TRUE

/obj/structure/prop/hybrisa/misc/blood/blood1
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "wallblood_floorblood"
/obj/structure/prop/hybrisa/misc/blood/blood2
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "wall_blood_1"
/obj/structure/prop/hybrisa/misc/blood/blood3
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "wall_blood_2"

// Fire

/obj/structure/prop/hybrisa/misc/fire/fire1
	name = "fire"
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zfire_smoke"
	layer = 5
	light_on = TRUE
	light_power = 2
	light_range = 3

/obj/structure/prop/hybrisa/misc/fire/fire2
	name = "fire"
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zfire_smoke2"
	layer = 5
	light_on = TRUE
	light_power = 2
	light_range = 3

/obj/structure/prop/hybrisa/misc/fire/firebarrel
	name = "barrel"
	icon = 'icons/obj/structures/props/64x96-zenithrandomprops.dmi'
	icon_state = "zbarrelfireon"
	layer = 5
	light_on = TRUE
	light_power = 2
	light_range = 3

// Misc

/obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear/dropshipside/ds2
	name = "\improper Normandy crew hatch"
	icon = 'icons/obj/structures/doors/dropship2_side2.dmi'

/obj/structure/machinery/colony_floodlight/street
	name = "Colony Streetlight"
	icon_state = "street_off"
	icon = 'void-marines/icons/big_floodlight.dmi'

/obj/structure/machinery/colony_floodlight/street/update_icon()
	if(damaged)
		icon_state = "street_dmg"
	else if(is_lit)
		icon_state = "street_on"
	else
		icon_state = "street_off"

/obj/structure/prop/hybrisa/misc/commandosuitemptyprop
	name = "Weyland-Yutani 'Ape-Suit' Showcase"
	desc = "A display model of the Weyland-Yutani 'Apesuit', shame it's only a model..."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "dogcatchersuitempty1"

/obj/structure/prop/hybrisa/misc/cabinet
	name = "cabinet"
	desc = "a small cabinet with drawers."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "sidecabinet"

/obj/structure/prop/hybrisa/misc/redmeter
	name = "meter"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "redmeter"

/obj/structure/prop/hybrisa/misc/firebarreloff
	name = "barrel"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "zfirebarreloff"

/obj/structure/prop/hybrisa/misc/trashbagfullprop
	name = "trash bag"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "ztrashbag"

/obj/structure/prop/hybrisa/misc/slotmachine
	name = "slot machine"
	desc = "A slot machine."
	icon = 'icons/obj/structures/props/64x64_zenithrandomprops.dmi'
	icon_state = "slotmachine"
	bound_width = 32
	bound_height = 32
	anchored = TRUE
	density = TRUE
	layer = 3.2
/obj/structure/prop/hybrisa/misc/slotmachine_broken
	name = "slot machine"
	desc = "A broken slot machine."
	icon = 'icons/obj/structures/props/64x64_zenithrandomprops.dmi'
	icon_state = "slotmachine_broken"
	bound_width = 32
	bound_height = 32
	anchored = TRUE
	density = TRUE
	layer = 3.2
/obj/structure/prop/hybrisa/misc/coffeestuff/coffeemachine1
	name = "coffee machine"
	desc = "A coffee machine."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "coffee"

/obj/structure/prop/hybrisa/misc/coffeestuff/coffeemachine2
	name = "coffee machine"
	desc = "A coffee machine."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "coffee_cup"

/obj/structure/prop/hybrisa/misc/machinery/computers
	name = "computer"
	icon_state = "mapping_comp"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerwhite/computer1
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "mapping_comp"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerwhite/computer2
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "mps"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerwhite/computer3
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "sensor_comp1"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerwhite/computer4
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "sensor_comp2"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerwhite/computer5
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "sensor_comp3"


/obj/structure/prop/hybrisa/misc/machinery/computers/computerblack/computer1
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "blackmapping_comp"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerblack/computer2
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "blackmps"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerblack/computer3
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "blacksensor_comp1"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerblack/computer4
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "blacksensor_comp2"

/obj/structure/prop/hybrisa/misc/machinery/computers/computerblack/computer5
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "blacksensor_comp3"


/obj/structure/prop/hybrisa/misc/machinery/screens
    name = "monitor"
/obj/structure/prop/hybrisa/misc/machinery/screens/frame
	icon_state = "frame"
/obj/structure/prop/hybrisa/misc/machinery/screens/security
	icon_state = "security"
/obj/structure/prop/hybrisa/misc/machinery/screens/evac
	icon_state = "evac"
/obj/structure/prop/hybrisa/misc/machinery/screens/redalert
	icon_state = "redalert"
/obj/structure/prop/hybrisa/misc/machinery/screens/redalertblank
	icon_state = "redalertblank"
/obj/structure/prop/hybrisa/misc/machinery/screens/entertainment
	icon_state = "entertainment"
/obj/structure/prop/hybrisa/misc/machinery/screens/telescreen
	icon_state = "telescreen"
/obj/structure/prop/hybrisa/misc/machinery/screens/telescreenbroke
	icon_state = "telescreenb"
/obj/structure/prop/hybrisa/misc/machinery/screens/telescreenbrokespark
	icon_state = "telescreenbspark"

// Multi-Monitor

//Green
/obj/structure/prop/hybrisa/misc/machinery/screens/multimonitorsmall_off
	icon_state = "multimonitorsmall_off"
/obj/structure/prop/hybrisa/misc/machinery/screens/multimonitorsmall_on
	icon_state = "multimonitorsmall_on"
/obj/structure/prop/hybrisa/misc/machinery/screens/multimonitormedium_off
	icon_state = "multimonitormedium_off"
/obj/structure/prop/hybrisa/misc/machinery/screens/multimonitormedium_on
	icon_state = "multimonitormedium_on"
/obj/structure/prop/hybrisa/misc/machinery/screens/multimonitorbig_off
	icon_state = "multimonitorbig_off"
/obj/structure/prop/hybrisa/misc/machinery/screens/multimonitorbig_on
	icon_state = "multimonitorbig_on"

// Blue

/obj/structure/prop/hybrisa/misc/machinery/screens/bluemultimonitorsmall_off
	icon_state = "bluemultimonitorsmall_off"
/obj/structure/prop/hybrisa/misc/machinery/screens/bluemultimonitorsmall_on
	icon_state = "bluemultimonitorsmall_on"
/obj/structure/prop/hybrisa/misc/machinery/screens/bluemultimonitormedium_off
	icon_state = "bluemultimonitormedium_off"
/obj/structure/prop/hybrisa/misc/machinery/screens/bluemultimonitormedium_on
	icon_state = "bluemultimonitormedium_on"
/obj/structure/prop/hybrisa/misc/machinery/screens/bluemultimonitorbig_off
	icon_state = "bluemultimonitorbig_off"
/obj/structure/prop/hybrisa/misc/machinery/screens/bluemultimonitorbig_on
	icon_state = "bluemultimonitorbig_on"

// Egg
/obj/structure/prop/hybrisa/misc/machinery/screens/wallegg_off
	icon_state = "wallegg_off"
/obj/structure/prop/hybrisa/misc/machinery/screens/wallegg_on
	icon_state = "wallegg_on"

/obj/structure/prop/hybrisa/misc/fake/pipes
    name = "disposal pipe"

/obj/structure/prop/hybrisa/misc/fake/pipes/pipe1
	layer = 2
	icon_state = "pipe-s"
/obj/structure/prop/hybrisa/misc/fake/pipes/pipe2
	layer = 2
	icon_state = "pipe-c"
/obj/structure/prop/hybrisa/misc/fake/pipes/pipe3
	layer = 2
	icon_state = "pipe-j1"
/obj/structure/prop/hybrisa/misc/fake/pipes/pipe4
	layer = 2
	icon_state = "pipe-y"
/obj/structure/prop/hybrisa/misc/fake/pipes/pipe5
	layer = 2
	icon_state = "pipe-b"

/obj/structure/prop/hybrisa/misc/fake/wire
    name = "power cable"

/obj/structure/prop/hybrisa/misc/fake/wire/red
	layer = 2
	icon_state = "intactred"
/obj/structure/prop/hybrisa/misc/fake/wire/yellow
	layer = 2
	icon_state = "intactyellow"
/obj/structure/prop/hybrisa/misc/fake/wire/blue
	layer = 2
	icon_state = "intactblue"


/obj/structure/prop/hybrisa/misc/fake/heavydutywire
    name = "heavy duty wire"

/obj/structure/prop/hybrisa/misc/fake/heavydutywire/heavy1
	layer = 2
	icon_state = "0-1"
/obj/structure/prop/hybrisa/misc/fake/heavydutywire/heavy2
	layer = 2
	icon_state = "1-2"
/obj/structure/prop/hybrisa/misc/fake/heavydutywire/heavy3
	layer = 2
	icon_state = "1-4"
/obj/structure/prop/hybrisa/misc/fake/heavydutywire/heavy4
	layer = 2
	icon_state = "1-2-4"
/obj/structure/prop/hybrisa/misc/fake/heavydutywire/heavy5
	layer = 2
	icon_state = "1-2-4-8"

/obj/structure/prop/hybrisa/misc/fake/lattice
    name = "structural lattice"

/obj/structure/prop/hybrisa/misc/fake/lattice/full
	icon_state = "latticefull"
	layer = 2

// Barriers

/obj/structure/prop/hybrisa/misc/road
	name = "road barrier"
	desc = "A plastic barrier for blocking entry."
	breakable = TRUE
	debris = list(/obj/item/stack/sheet/mineral/plastic)

/obj/structure/prop/hybrisa/misc/road/roadbarrierred
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrier"
/obj/structure/prop/hybrisa/misc/road/roadbarrierredlong
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrier4"
/obj/structure/prop/hybrisa/misc/road/roadbarrierblue
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrier2"
/obj/structure/prop/hybrisa/misc/road/roadbarrierbluelong
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrier5"
/obj/structure/prop/hybrisa/misc/road/roadbarrierwyblack
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrier3"
/obj/structure/prop/hybrisa/misc/road/roadbarrierwyblacklong
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrier6"
/obj/structure/prop/hybrisa/misc/road/roadbarrierwyblackjoined
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrierjoined3"
/obj/structure/prop/hybrisa/misc/road/roadbarrierjoined
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrierjoined"

/obj/structure/prop/hybrisa/misc/road/wood
	name = "road barrier"
	desc = "A wooden barrier for blocking entry."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrierwood"
	breakable = TRUE
	debris = list(/obj/item/stack/sheet/wood)

/obj/structure/prop/hybrisa/misc/road/wood/roadbarrierwoodorange
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrierwood"
/obj/structure/prop/hybrisa/misc/road/wood/roadbarrierwoodblue
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "roadbarrierpolice"

// Cargo Containers extended

/obj/structure/largecrate/random/barrel/white
	name = "white barrel"
	desc = "A white storage barrel."
	icon_state = "barrel_white"
	icon = 'void-marines/icons/crates.dmi'

/obj/structure/largecrate/random/barrel/medical
	name = "white barrel"
	desc = "A white storage barrel."
	icon_state = "barrel_medical"
	icon = 'void-marines/icons/crates.dmi'

/obj/structure/largecrate/random/barrel/black
	name = "black barrel"
	desc = "A black storage barrel."
	icon_state = "barrel_wy"
	icon = 'void-marines/icons/crates.dmi'

/obj/structure/largecrate/random/barrel/brown
	name = "brown barrel"
	desc = "A brown storage barrel."
	icon_state = "barrel_tan"
	icon = 'void-marines/icons/crates.dmi'

/obj/structure/largecrate/random/barrel/purewhite
	name = "white barrel"
	desc = "A white storage barrel."
	icon_state = "barrel_purewhite"
	icon = 'void-marines/icons/crates.dmi'

/obj/structure/prop/hybrisa/containersextended
	name = "cargo container"
	desc = "a cargo container."
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "blackwyleft"
	bound_width = 32
	bound_height = 32
	density = TRUE
	health = 200
	opacity = TRUE
	anchored = TRUE
	unslashable = TRUE
	unacidable = TRUE
	layer = 5

/obj/structure/prop/hybrisa/containersextended/blueleft
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "blueleft"
/obj/structure/prop/hybrisa/containersextended/blueright
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "blueright"
/obj/structure/prop/hybrisa/containersextended/greenleft
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "greenleft"
/obj/structure/prop/hybrisa/containersextended/greenright
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "greenright"
/obj/structure/prop/hybrisa/containersextended/tanleft
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "tanleft"
/obj/structure/prop/hybrisa/containersextended/tanright
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "tanright"
/obj/structure/prop/hybrisa/containersextended/redleft
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "redleft"
/obj/structure/prop/hybrisa/containersextended/redright
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "redright"
/obj/structure/prop/hybrisa/containersextended/greywyleft
	name = "Weyland-Yutani cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "greywyleft"
/obj/structure/prop/hybrisa/containersextended/greywyright
	name = "Weyland-Yutani cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "greywyright"
/obj/structure/prop/hybrisa/containersextended/lightgreywyleft
	name = "Weyland-Yutani cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "lightgreywyleft"
/obj/structure/prop/hybrisa/containersextended/lightgreywyright
	name = "Weyland-Yutani cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "lightgreywyright"
/obj/structure/prop/hybrisa/containersextended/blackwyleft
	name = "Weyland-Yutani cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "blackwyleft"
/obj/structure/prop/hybrisa/containersextended/blackwyright
	name = "Weyland-Yutani cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "blackwyright"
/obj/structure/prop/hybrisa/containersextended/whitewyleft
	name = "Weyland-Yutani cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "whitewyleft"
/obj/structure/prop/hybrisa/containersextended/whitewyright
	name = "Weyland-Yutani cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "whitewyright"

/obj/structure/prop/hybrisa/containersextended/tanwywingsleft
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "tanwywingsleft"
/obj/structure/prop/hybrisa/containersextended/tanwywingsright
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "tanwywingsright"
/obj/structure/prop/hybrisa/containersextended/greenwywingsleft
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "greenwywingsleft"
/obj/structure/prop/hybrisa/containersextended/greenwywingsright
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "greenwywingsright"
/obj/structure/prop/hybrisa/containersextended/bluewywingsleft
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "bluewywingsleft"
/obj/structure/prop/hybrisa/containersextended/bluewywingsright
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "bluewywingsright"
/obj/structure/prop/hybrisa/containersextended/redwywingsleft
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "redwywingsleft"
/obj/structure/prop/hybrisa/containersextended/redwywingsright
	name = "cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "redwywingsright"
/obj/structure/prop/hybrisa/containersextended/medicalleft
	name = "medical cargo containers"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "medicalleft"
/obj/structure/prop/hybrisa/containersextended/medicalright
	name = "medical cargo containers"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "medicalright"
/obj/structure/prop/hybrisa/containersextended/emptymedicalleft
	name = "medical cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "emptymedicalleft"
/obj/structure/prop/hybrisa/containersextended/emptymedicalright
	name = "medical cargo container"
	icon = 'icons/obj/structures/props/containersextended2.dmi'
	icon_state = "emptymedicalright"

/// Fake Platforms

/obj/structure/prop/hybrisa/fakeplatforms
    name = "platform"

/obj/structure/prop/hybrisa/fakeplatforms/platform1
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "engineer_platform"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
/obj/structure/prop/hybrisa/fakeplatforms/platform2
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "engineer_platform_platformcorners"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
/obj/structure/prop/hybrisa/fakeplatforms/platform3
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "platform"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE
/obj/structure/prop/hybrisa/fakeplatforms/platform4
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "zenithplatform3"
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE

/// Medical Details breakable

/obj/structure/prop/hybrisa/decal/medical
	name = "medical decal"
	icon = 'icons/effects/medical_decals.dmi'
	icon_state = "cryotop"
	layer = 1


// Grille

/obj/structure/prop/hybrisa/misc/highvoltagegrille
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "highvoltagegrille"

/obj/structure/prop/hybrisa/misc/buildinggreeblies
	name = "machinery"
	icon = 'icons/obj/structures/props/64x64_zenithrandomprops.dmi'
	icon_state = "buildingventbig1"
	bound_width = 64
	bound_height = 32
	density = TRUE
	health = 200
	anchored = TRUE
	layer = 5
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble1
	icon_state = "buildingventbig2"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble2
	icon_state = "buildingventbig3"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble3
	icon_state = "buildingventbig4"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble4
	icon_state = "buildingventbig5"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble5
	icon_state = "buildingventbig6"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble6
	icon_state = "buildingventbig7"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble7
	icon_state = "buildingventbig8"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble8
	icon_state = "buildingventbig9"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble9
	icon_state = "buildingventbig10"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble10
	density = FALSE
	icon_state = "buildingventbig11"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble11
	density = FALSE
	icon_state = "buildingventbig12"
/obj/structure/prop/hybrisa/misc/buildinggreeblies/greeble12
	density = FALSE
	icon_state = "buildingventbig13"

/obj/structure/prop/hybrisa/misc/buildinggreebliessmall
	name = "wall vent"
	name = "wall vent"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "smallwallvent1"
	density = FALSE
/obj/structure/prop/hybrisa/misc/buildinggreebliessmall2
	name = "wall vent"
	icon_state = "smallwallvent2"
/obj/structure/prop/hybrisa/misc/buildinggreebliessmall2
	name = "wall vent"
	icon_state = "smallwallvent2"

/obj/structure/prop/hybrisa/misc/buildinggreebliessmall/computer
	name = "machinery"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "zcomputermachine"
	density = TRUE

/obj/structure/prop/hybrisa/misc/metergreen
	name = "meter"
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "biggreenmeter1"

/obj/structure/prop/hybrisa/misc/stoneplanterseats
	name = "concrete seated planter"
	desc = "A decorative concrete planter with seating attached."
	icon = 'icons/obj/structures/props/64x64_zenithrandomprops.dmi'
	icon_state = "planterseats"
	bound_width = 32
	bound_height = 64
	density = TRUE
	health = 200
	anchored = TRUE

/obj/structure/prop/hybrisa/misc/stoneplanterseats/empty
	name = "concrete planter"
	desc = "A decorative concrete planter."
	icon_state = "planterempty"

/obj/structure/prop/hybrisa/misc/concretestatue
	name = "concrete statue"
	desc = "A decorative statue with the Weyland-Yutani 'Wings' adorned on it, A corporate brutalist piece of art."
	icon = 'icons/obj/structures/props/64x64_zenithrandomprops.dmi'
	icon_state = "concretesculpture"
	bound_width = 64
	bound_height = 64
	density = TRUE
	anchored = TRUE
	unslashable = TRUE
	unacidable = TRUE
	indestructible = TRUE

/obj/structure/prop/hybrisa/misc/detonator
	name = "inactive detonator"
	desc = "A detonator for explosives, this one appears to be missing a vital component."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "detonator"
	density = TRUE
	anchored = TRUE

/obj/structure/prop/hybrisa/misc/firehydrant
	name = "fire hydrant"
	desc = "A fire hydrant public water outlet, designed for quick access to water."
	icon = 'icons/obj/structures/props/zenithrandomprops.dmi'
	icon_state = "firehydrant"
	density = TRUE
	anchored = TRUE
/obj/structure/prop/hybrisa/misc/phonebox
	name = "phonebox"
	desc = "A phone-box, it doesn't seem to be working, the line must be down."
	icon = 'icons/obj/structures/props/64x64_zenithrandomprops.dmi'
	icon_state = "phonebox_closed"
	layer = ABOVE_MOB_LAYER
	bound_width = 32
	bound_height = 32
	density = TRUE
	anchored = TRUE
/obj/structure/prop/hybrisa/misc/phonebox/broken
	desc = "A phone-box, it doesn't seem to be working, the line must be down. The glass has been broken."
	icon_state = "phonebox_closed_broken"

/obj/structure/prop/hybrisa/misc/phonebox/lightup
	desc = "A phone-box, it doesn't seem to be working, the line must be down."
	icon_state = "phonebox_closed_light"

// Billboards, Signs and Posters

/obj/structure/prop/hybrisa/BillboardsandSigns/BigBillboards
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'icons/obj/structures/props/32x64_zenithbillboards.dmi'
	icon_state = "billboard_bigger"
	bound_width = 64
	bound_height = 32
	density = FALSE
	health = 200
	anchored = TRUE
/obj/structure/prop/hybrisa/BillboardsandSigns/Billboardsmedium/Billboard1
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'icons/obj/structures/props/32x64_zenithbillboards.dmi'
	icon_state = "billboard1"
/obj/structure/prop/hybrisa/BillboardsandSigns/Billboardsmedium/Billboard2
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'icons/obj/structures/props/32x64_zenithbillboards.dmi'
	icon_state = "billboard2"
/obj/structure/prop/hybrisa/BillboardsandSigns/Billboardsmedium/Billboard3
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'icons/obj/structures/props/32x64_zenithbillboards.dmi'
	icon_state = "billboard3"
/obj/structure/prop/hybrisa/BillboardsandSigns/Billboardsmedium/Billboard4
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'icons/obj/structures/props/32x64_zenithbillboards.dmi'
	icon_state = "billboard4"
// Car Factory

/obj/structure/prop/hybrisa/Factory
	icon = 'icons/obj/structures/props/64x64_zenithrandomprops.dmi'
	icon_state = "factory_roboticarm"

/obj/structure/prop/hybrisa/Factory/Robotic_arm
	name = "Robotic arm"
	desc = "A robotic arm used in the construction of 'Meridian' Automobiles."
	icon_state = "factory_roboticarm"
	bound_width = 64
	bound_height = 32
	anchored = TRUE
/obj/structure/prop/hybrisa/Factory/Robotic_arm/Flipped
	icon_state = "factory_roboticarm2"
/obj/structure/prop/hybrisa/Factory/Conveyor_belt
	name = "large conveyor belt"
	desc = "A large conveyor belt used in industrial factories."
	icon_state = "factory_conveyer"
	density = FALSE

/obj/structure/lz_sign/hybrisa_sign
	name = "Hybrisa Prospera welcome sign"
	desc = "A large sign that reads 'Welcome to Hybrisa Prospera', The Weyland Yutani 'Wings' and logo adorn the sign, as well as some information about the colony."
	icon = 'void-marines/icons/landing_signs.dmi'
	icon_state = "hybrisa_sign"

/obj/structure/lz_sign/hybrisa_sign/damaged
	name = "Hybrisa Prospera Welcome sign"
	desc = "A large sign that reads 'Welcome to Hybrisa Prospera', The Weyland Yutani corporate 'Wings' and logo adorn the sign, as well as some information about the colony."
	icon_state = "hybrisa_sign_d"

/obj/structure/lz_sign/hybrisa_sign/medical
	name = "Hybrisa Prospera - Emergency Medical Landing Zone one sign"
	desc = "A large sign that reads 'Emergency Medical - HBP - LZ - 01'."
	icon_state = "hybrisamedical_sign"

/obj/structure/lz_sign/hybrisa_sign/mining
	name = "Hybrisa Prospera - Weyland-Yutani Kelland Mining - Landing Zone two sign"
	desc = "A large sign that reads 'WY - KMCC Mining - HBP - LZ - 01' The Kelland Mining logo is adorns the sign."
	icon_state = "hybrisamining_sign"

/obj/structure/platform/hybrisa
	icon_state = "hybrisa"
	icon = 'void-marines/icons/platforms.dmi'

/obj/structure/platform_decoration/hybrisa
	icon_state = "hybrisa"
	icon = 'void-marines/icons/platforms.dmi'

/obj/structure/platform/hybrisa/engineer
	icon_state = "engineer_platform"
	name = "raised metal edge"
	desc =  "A raised level of metal, often used to elevate areas above others, or construct bridges. You could probably climb it."
	climb_delay = 10

/obj/structure/platform_decoration/hybrisa/engineer_corner
	name = "raised metal corner"
	desc = "The corner of what appears to be raised piece of metal, often used to imply the illusion of elevation in non-Euclidean 2d spaces. But you don't know that, you're just a spaceman with a rifle."
	icon_state = "engineer_platform_deco"

/obj/structure/platform_decoration/hybrisa/engineer_cornerbits
	name = "raised metal corner"
	desc = "The corner of what appears to be raised piece of metal, often used to imply the illusion of elevation in non-Euclidean 2d spaces. But you don't know that, you're just a spaceman with a rifle."
	icon_state = "engineer_platform_platformcorners"


/obj/structure/platform/hybrisa/rockdark
	icon_state = "kutjevo_rockdark"
	name = "raised rock edges"
	desc = "A collection of stones and rocks that provide ample grappling and vaulting opportunity. Indicates a change in elevation. You could probably climb it."

/obj/structure/platform_decoration/hybrisa/rockdark
	name = "raised rock corner"
	desc = "A collection of stones and rocks that cap the edge of some conveniently 1-meter-long lengths of perfectly climbable chest high walls."
	icon_state = "kutjevo_rock_decodark"


/obj/structure/platform/hybrisa/metalplatform1
	icon_state = "zenithstone"
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
/obj/structure/platform_decoration/hybrisa/metalplatformdeco1
	icon_state = "zenithstone_deco"
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. This is the corner."

/obj/structure/platform_decoration/hybrisa/metalplatformdeco2
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. This is the corner."
	icon_state = "strata_metalplatform_deco2"

/obj/structure/platform/hybrisa/metalplatform2
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
	icon_state = "strata_metalplatform2"

/obj/structure/platform_decoration/hybrisa/metalplatformdeco3
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. This is the corner."
	icon_state = "strata_metalplatform_deco3"

/obj/structure/platform/hybrisa/metalplatform3
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
	icon_state = "strata_metalplatform3"

/obj/structure/platform/hybrisa/metalplatform4
	icon_state = "zenithplatform"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform_decoration/hybrisa/metalplatformdeco4
	icon_state = "zenithplatform_deco"
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform/hybrisa/metalplatform5
	icon_state = "zenithplatform2"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform_decoration/hybrisa/metalplatformdeco5
	icon_state = "zenithplatform_deco2"
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform/hybrisa/metalplatform6
	icon_state = "zenithplatform3"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform/hybrisa/metalplatformstair1
	icon_state = "zenithplatform_stair"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform/hybrisa/metalplatformstair2
	icon_state = "zenithplatform_stair_alt"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform_decoration/hybrisa/metalplatformdeco6
	icon_state = "zenithplatform_deco3"
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/barricade/handrail/hybrisa
	icon = 'void-marines/icons/handrail.dmi'
	icon_state = "plasticroadbarrierred"

/obj/structure/barricade/handrail/hybrisa/road/plastic
	name = "plastic road barrier"
	icon_state = "plasticroadbarrierred"
	stack_type = /obj/item/stack/sheet/mineral/plastic
	debris = list(/obj/item/stack/sheet/mineral/plastic)
	barricade_hitsound = 'sound/effects/thud.ogg'

/obj/structure/barricade/handrail/hybrisa/road/plastic/red
	name = "plastic road barrier"
	icon_state = "plasticroadbarrierred"

/obj/structure/barricade/handrail/hybrisa/road/plastic/blue
	name = "plastic road barrier"
	icon_state = "plasticroadbarrierblue"

/obj/structure/barricade/handrail/hybrisa/road/plastic/black
	name = "plastic road barrier"
	icon_state = "plasticroadbarrierblack"

/obj/structure/barricade/handrail/hybrisa/road/wood
	name = "wood road barrier"
	icon_state = "roadbarrierwood"
	stack_type = /obj/item/stack/sheet/wood
	debris = list(/obj/item/stack/sheet/wood)
	stack_amount = 2
	destroyed_stack_amount = 1
	barricade_hitsound = 'sound/effects/woodhit.ogg'
/obj/structure/barricade/handrail/hybrisa/road/wood/orange
	name = "wood road barrier"
	icon_state = "roadbarrierwood"
/obj/structure/barricade/handrail/hybrisa/road/wood/blue
	name = "wood road barrier"
	icon_state = "roadbarrierpolice"

/obj/structure/barricade/handrail/hybrisa/road/metal
	name = "metal road barrier"
	icon_state = "centerroadbarrier"
	stack_type = /obj/item/stack/sheet/metal
	debris = list(/obj/item/stack/sheet/metal)
/obj/structure/barricade/handrail/hybrisa/road/metal/metaltan
	name = "metal road barrier"
	icon_state = "centerroadbarrier"
/obj/structure/barricade/handrail/hybrisa/road/metal/metaldark
	name = "metal road barrier"
	icon_state = "centerroadbarrier2"
/obj/structure/barricade/handrail/hybrisa/road/metal/metaldark2
	name = "metal road barrier"
	icon_state = "centerroadbarrier3"
/obj/structure/barricade/handrail/hybrisa/road/metal/double
	name = "metal road barrier"
	icon_state = "centerroadbarrierdouble"

/obj/structure/barricade/handrail/hybrisa/handrail
	name = "haindrail"
	icon_state = "handrail_hybrisa"

//TURFS

/turf/open/auto_turf/hybrisashale
	layer_name = list("wind blown dirt", "volcanic plate rock", "volcanic plate and rock", "this layer does not exist")
	icon = 'icons/turf/floors/auto_shaledesaturated.dmi'
	icon_prefix = "shale"

/turf/open/auto_turf/hybrisashale/get_dirt_type()
	return DIRT_TYPE_SHALE

/turf/open/auto_turf/hybrisashale/layer0
	icon_state = "shale_0"
	bleed_layer = 0

/turf/open/auto_turf/hybrisashale/layer0_puddle
	icon_state = "shale_0_puddle"
	bleed_layer = 0

/turf/open/auto_turf/hybrisashale/layer0_plate //for inner plate shenanigans
	icon_state = "shale_1_alt"
	bleed_layer = 0

/turf/open/auto_turf/hybrisashale/layer1
	icon_state = "shale_1"
	bleed_layer = 1

/turf/open/auto_turf/hybrisashale/layer2
	icon_state = "shale_2"
	bleed_layer = 2

/turf/closed/shuttle/dropship2/WY/HorizonRunner
	name = "\improper WY-LWI Horizon Runner HR-150"
	desc = "The WY-LWI Horizon Runner HR-150, a collaborative creation of Lunnar-Welsun Industries and Weyland-Yutani. This small dropship is designed for short-range commercial transport."
	icon = 'icons/turf/dropship4.dmi'

/turf/closed/shuttle/dropship2/WY/StarGlider
	name = "\improper WY-LWI StarGlider SG-200"
	desc = "The WY-LWI StarGlider SG-200, a product of the collaborative ingenuity between Weyland Yutani and Lunnar-Welsun Industries, This small dropship is designed for short-range commercial transport."
	icon = 'icons/turf/dropship4.dmi'

/turf/open/hybrisa
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "hybrisa"

/turf/open/floor/hybrisa
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "hybrisa"

/turf/open/hybrisa/street
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "cement1"
	baseturfs = /turf/open/asphalt

/turf/open/hybrisa/street/cement1
	icon_state = "cement1"
/turf/open/hybrisa/street/cement2
	icon_state = "cement2"
/turf/open/hybrisa/street/cement3
	icon_state = "cement3"
/turf/open/hybrisa/street/asphalt
	icon_state = "asphalt_old"
/turf/open/hybrisa/street/sidewalk
	icon_state = "sidewalk"
/turf/open/hybrisa/street/sidewalkfull
	icon_state = "sidewalkfull"
/turf/open/hybrisa/street/sidewalkcorner
	icon_state = "sidewalkcorner"
/turf/open/hybrisa/street/sidewalkcenter
	icon_state = "sidewalkcenter"
/turf/open/hybrisa/street/roadlines
	icon_state = "asphalt_old_roadlines"
/turf/open/hybrisa/street/roadlines2
	icon_state = "asphalt_old_roadlines2"
/turf/open/hybrisa/street/roadlines3
	icon_state = "asphalt_old_roadlines3"
/turf/open/hybrisa/street/roadlines4
	icon_state = "asphalt_old_roadlines4"

/turf/open/floor/hybrisa/carpet
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "carpetred"

/turf/open/floor/hybrisa/carpet/carpetfadedred
	icon_state = "carpetfadedred"
/turf/open/floor/hybrisa/carpet/carpetgreen
	icon_state = "carpetgreen"
/turf/open/floor/hybrisa/carpet/carpetbeige
	icon_state = "carpetbeige"
/turf/open/floor/hybrisa/carpet/carpetblack
	icon_state = "carpetblack"
/turf/open/floor/hybrisa/carpet/carpetred
	icon_state = "carpetred"
/turf/open/floor/hybrisa/carpet/carpetdarkerblue
	icon_state = "carpetdarkerblue"
/turf/open/floor/hybrisa/carpet/carpetorangered
	icon_state = "carpetorangered"
/turf/open/floor/hybrisa/carpet/carpetblue
	icon_state = "carpetblue"
/turf/open/floor/hybrisa/carpet/carpetpatternblue
	icon_state = "carpetpatternblue"
/turf/open/floor/hybrisa/carpet/carpetpatternbrown
	icon_state = "carpetpatternbrown"
/turf/open/floor/hybrisa/carpet/carpetreddeco
	icon_state = "carpetred_deco"
/turf/open/floor/hybrisa/carpet/carpetbluedeco
	icon_state = "carpetblue_deco"
/turf/open/floor/hybrisa/carpet/carpetblackdeco
	icon_state = "carpetblack_deco"
/turf/open/floor/hybrisa/carpet/carpetbeigedeco
	icon_state = "carpetbeige_deco"
/turf/open/floor/hybrisa/carpet/carpetgreendeco
	icon_state = "carpetgreen_deco"

/turf/open/floor/hybrisa/tile
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "supermartfloor1"

/turf/open/floor/hybrisa/tile/supermartfloor1
	icon_state = "supermartfloor1"
/turf/open/floor/hybrisa/tile/supermartfloor2
	icon_state = "supermartfloor2"
/turf/open/floor/hybrisa/tile/cuppajoesfloor
	icon_state = "cuppafloor"
/turf/open/floor/hybrisa/tile/tilered
	icon_state = "tilered"
/turf/open/floor/hybrisa/tile/tileblue
	icon_state = "tileblue"
/turf/open/floor/hybrisa/tile/tilegreen
	icon_state = "tilegreen"
/turf/open/floor/hybrisa/tile/tileblackcheckered
	icon_state = "tileblack"
/turf/open/floor/hybrisa/tile/tilewhitecheckered
	icon_state = "tilewhitecheck"
/turf/open/floor/hybrisa/tile/tilelightbeige
	icon_state = "tilelightbeige"
/turf/open/floor/hybrisa/tile/tilebeigecheckered
	icon_state = "tilebeigecheck"
/turf/open/floor/hybrisa/tile/tilebeige
	icon_state = "tilebeige"
/turf/open/floor/hybrisa/tile/tilewhite
	icon_state = "tilewhite"
/turf/open/floor/hybrisa/tile/tilegrey
	icon_state = "tilegrey"
/turf/open/floor/hybrisa/tile/tileblack
	icon_state = "tileblack2"
/turf/open/floor/hybrisa/tile/beigetileshiny
	icon_state = "beigetileshiny"
/turf/open/floor/hybrisa/tile/blacktileshiny
	icon_state = "blacktileshiny"
/turf/open/floor/hybrisa/tile/cementflat
	icon_state = "cementflat"
/turf/open/floor/hybrisa/tile/beige_bigtile
	icon_state = "beige_bigtile"
/turf/open/floor/hybrisa/tile/yellow_bigtile
	icon_state = "yellow_bigtile"
/turf/open/floor/hybrisa/tile/darkgrey_bigtile
	icon_state = "darkgrey_bigtile"
/turf/open/floor/hybrisa/tile/darkbrown_bigtile
	icon_state = "darkbrown_bigtile"
/turf/open/floor/hybrisa/tile/darkbrowncorner_bigtile
	icon_state = "darkbrowncorner_bigtile"
/turf/open/floor/hybrisa/tile/asteroidfloor_bigtile
	icon_state = "asteroidfloor_bigtile"
/turf/open/floor/hybrisa/tile/asteroidwarning_bigtile
	icon_state = "asteroidwarning_bigtile"
/turf/open/floor/hybrisa/tile/lightbeige_bigtile
	icon_state = "lightbeige_bigtile"
/turf/open/floor/hybrisa/tile/green_bigtile
	icon_state = "green_bigtile"
/turf/open/floor/hybrisa/tile/greencorner_bigtile
	icon_state = "greencorner_bigtile"
/turf/open/floor/hybrisa/tile/greenfull_bigtile
	icon_state = "greenfull_bigtile"

/turf/open/floor/hybrisa/wood
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "darkerwood"

/turf/open/floor/hybrisa/wood/greywood
	icon_state = "greywood"
/turf/open/floor/hybrisa/wood/blackwood
	icon_state = "blackwood"
/turf/open/floor/hybrisa/wood/darkerwood
	icon_state = "darkerwood"
/turf/open/floor/hybrisa/wood/redwood
	icon_state = "redwood"

/turf/open/floor/hybrisa/metal
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "bluemetal1"

/turf/open/floor/hybrisa/metal/bluemetal1
	icon_state = "bluemetal1"
/turf/open/floor/hybrisa/metal/bluemetalfull
	icon_state = "bluemetalfull"
/turf/open/floor/hybrisa/metal/bluemetalcorner
	icon_state = "bluemetalcorner"
/turf/open/floor/hybrisa/metal/orangelinecorner
	icon_state = "orangelinecorner"
/turf/open/floor/hybrisa/metal/orangeline
	icon_state = "orangeline"
/turf/open/floor/hybrisa/metal/darkblackmetal1
	icon_state = "darkblackmetal1"
/turf/open/floor/hybrisa/metal/darkblackmetal2
	icon_state = "darkblackmetal2"
/turf/open/floor/hybrisa/metal/darkredfull2
	icon_state = "darkredfull2"
/turf/open/floor/hybrisa/metal/redcorner
	icon_state = "zredcorner"
/turf/open/floor/hybrisa/metal/grated
	icon_state = "rampsmaller"
/turf/open/floor/hybrisa/metal/stripe_red
	icon_state = "stripe_red"
/turf/open/floor/hybrisa/metal/zbrownfloor1
	icon_state = "zbrownfloor1"
/turf/open/floor/hybrisa/metal/zbrownfloor_corner
	icon_state = "zbrownfloorcorner1"
/turf/open/floor/hybrisa/metal/zbrownfloor_full
	icon_state = "zbrownfloorfull1"
/turf/open/floor/hybrisa/metal/greenmetal1
	icon_state = "greenmetal1"
/turf/open/floor/hybrisa/metal/greenmetalfull
	icon_state = "greenmetalfull"
/turf/open/floor/hybrisa/metal/greenmetalcorner
	icon_state = "greenmetalcorner"
/turf/open/floor/hybrisa/metal/metalwhitefull
	icon_state = "metalwhitefull"

/turf/open/floor/hybrisa/misc
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "marshallsemblem"

/turf/open/floor/hybrisa/misc/marshallsemblem
    icon_state = "marshallsemblem"
/turf/open/floor/hybrisa/misc/wybiglogo
	name = "Weyland-Yutani corp. - bulding better worlds."
	icon_state = "big8x8wylogo"
/turf/open/floor/hybrisa/misc/wysmallleft
	icon_state = "weylandyutanismall1"
/turf/open/floor/hybrisa/misc/wysmallright
	icon_state = "weylandyutanismall2"
/turf/open/floor/hybrisa/misc/spaceport1
	icon_state = "spaceport1"
/turf/open/floor/hybrisa/misc/spaceport2
	icon_state = "spaceport2"

/turf/open/hybrisa/dropship
	name = "floor"
	icon = 'icons/turf/floors/hybrisafloors.dmi'
	icon_state = "dropshipfloor1"

/turf/open/hybrisa/dropship/dropship1
	icon_state = "dropshipfloor1"
/turf/open/hybrisa/dropship/dropship2
	icon_state = "dropshipfloor2"
/turf/open/hybrisa/dropship/dropship3
	icon_state = "dropshipfloor2"
/turf/open/hybrisa/dropship/dropship3
	icon_state = "dropshipfloor3"
/turf/open/hybrisa/dropship/dropship4
	icon_state = "dropshipfloor4"
/turf/open/hybrisa/dropship/dropshipfloorcorner1
	icon_state = "dropshipfloorcorner1"
/turf/open/hybrisa/dropship/dropshipfloorcorner2
	icon_state = "dropshipfloorcorner2"
/turf/open/hybrisa/dropship/dropshipfloorfull
	icon_state = "dropshipfloorfull"

/turf/open/engineership
	name = "floor"
	desc = "A strange metal floor, unlike any metal you've seen before."
	icon = 'icons/turf/floors/engineership.dmi'
	icon_state = "hybrisa"
	baseturfs = /turf/open/asphalt

/turf/open/engineership/engineer_floor1
	icon_state = "engineer_metalfloor_3"
/turf/open/engineership/engineer_floor2
	icon_state = "engineer_floor_4"
/turf/open/engineership/engineer_floor3
	icon_state = "engineer_metalfloor_2"
/turf/open/engineership/engineer_floor4
	icon_state = "engineer_metalfloor_1"
/turf/open/engineership/engineer_floor5
	icon_state = "engineerlight"
/turf/open/engineership/engineer_floor6
	icon_state = "engineer_floor_2"
/turf/open/engineership/engineer_floor7
	icon_state = "engineer_floor_1"
/turf/open/engineership/engineer_floor8
	icon_state = "engineer_floor_5"
/turf/open/engineership/engineer_floor9
	icon_state = "engineer_metalfloor_4"
/turf/open/engineership/engineer_floor10
	icon_state = "engineer_floor_corner1"
/turf/open/engineership/engineer_floor11
	icon_state = "engineer_floor_corner2"
/turf/open/engineership/engineer_floor12
	icon_state = "engineerwallfloor1"
/turf/open/engineership/engineer_floor13
	icon_state = "outerhull_dir"
/turf/open/engineership/engineer_floor14
	icon_state = "engineer_floor_corner3"

/turf/open/engineership/pillars
	name = "strange metal pillar"
	desc = "A strange metal pillar, unlike any metal you've seen before."
	icon_state = "eng_pillar1"

/turf/closed/wall/engineership
	name = "engineer wall"
	desc = "Nigh indestructible walls that make up the hull of an unknown ancient ship."
	icon = 'icons/turf/walls/engineership.dmi'
	icon_state = "metal"//DMI specific name
	walltype = WALL_HUNTERSHIP
	hull = 1

/turf/open/engineership/pillars/north/pillar1
	icon_state = "eng_pillar1"
/turf/open/engineership/pillars/north/pillar2
	icon_state = "eng_pillar2"
/turf/open/engineership/pillars/north/pillar3
	icon_state = "eng_pillar3"
/turf/open/engineership/pillars/north/pillar4
	icon_state = "eng_pillar4"
/turf/open/engineership/pillars/south/pillarsouth1
	icon_state = "eng_pillarsouth1"
/turf/open/engineership/pillars/south/pillarsouth2
	icon_state = "eng_pillarsouth2"
/turf/open/engineership/pillars/south/pillarsouth3
	icon_state = "eng_pillarsouth3"
/turf/open/engineership/pillars/south/pillarsouth4
	icon_state = "eng_pillarsouth4"
/turf/open/engineership/pillars/west/pillarwest1
	icon_state = "eng_pillarwest1"
/turf/open/engineership/pillars/west/pillarwest2
	icon_state = "eng_pillarwest2"
/turf/open/engineership/pillars/west/pillarwest3
	icon_state = "eng_pillarwest3"
/turf/open/engineership/pillars/west/pillarwest4
	icon_state = "eng_pillarwest4"
/turf/open/engineership/pillars/east/pillareast1
	icon_state = "eng_pillareast1"
/turf/open/engineership/pillars/east/pillareast2
	icon_state = "eng_pillareast2"
/turf/open/engineership/pillars/east/pillareast3
	icon_state = "eng_pillareast3"
/turf/open/engineership/pillars/east/pillareast4
	icon_state = "eng_pillareast4"

