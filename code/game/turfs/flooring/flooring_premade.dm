// simulated/floor is currently plating by default, but there really should be an explicit plating type.
/turf/simulated/floor/plating
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"

/turf/simulated/floor/concrete
	name = "concrete"
	desc = "Stone-like artificial material."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_state = "concrete"

/turf/simulated/floor/bluegrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "bcircuit"
	light_range = 2
	light_power = 1
	light_color = COLOR_BLUE

/turf/simulated/floor/bluegrid/airless

/turf/simulated/floor/greengrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "gcircuit"
	light_range = 2
	light_power = 1
	light_color = COLOR_GREEN

/turf/simulated/floor/blackgrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "rcircuit"
	light_range = 2
	light_power = 1
	light_color = COLOR_RED

/turf/simulated/floor/greengrid/airless

/turf/simulated/floor/wood
	name = "wooden floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "wood"

/turf/simulated/floor/grass
	name = "grass patch"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "grass0"

/turf/simulated/floor/carpet
	name = "brown carpet"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "brown"

/turf/simulated/floor/carpet/blue
	name = "blue carpet"
	icon_state = "blue1"

/turf/simulated/floor/carpet/blue2
	name = "pale blue carpet"
	icon_state = "blue2"

/turf/simulated/floor/carpet/purple
	name = "purple carpet"
	icon_state = "purple"

/turf/simulated/floor/carpet/orange
	name = "orange carpet"
	icon_state = "orange"

/turf/simulated/floor/carpet/green
	name = "green carpet"
	icon_state = "green"

/turf/simulated/floor/carpet/red
	name = "red carpet"
	icon_state = "red"

/turf/simulated/floor/reinforced
	name = "reinforced floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "reinforced"

/turf/simulated/floor/reinforced/airless

/turf/simulated/floor/reinforced/airmix

/turf/simulated/floor/reinforced/nitrogen

/turf/simulated/floor/reinforced/hydrogen

/turf/simulated/floor/reinforced/oxygen

/turf/simulated/floor/reinforced/phoron

/turf/simulated/floor/reinforced/nitrogen/engine
	name = "engine floor"

/turf/simulated/floor/reinforced/phoron/fuel

/turf/simulated/floor/reinforced/hydrogen/fuel

/turf/simulated/floor/reinforced/carbon_dioxide

/turf/simulated/floor/reinforced/n20



//Tiled floor + sub-types

/turf/simulated/floor/tiled
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"

/turf/simulated/floor/tiled/dark
	name = "dark floor"
	icon_state = "dark"

/turf/simulated/floor/tiled/dark/monotile
	name = "floor"
	icon_state = "monotiledark"

/turf/simulated/floor/tiled/dark/airless

/turf/simulated/floor/tiled/white
	name = "white floor"
	icon_state = "white"

/turf/simulated/floor/tiled/white/monotile
	name = "floor"
	icon_state = "monotile"

/turf/simulated/floor/tiled/monofloor
	name = "floor"
	icon_state = "steel_monofloor"

/turf/simulated/floor/tiled/white/airless
	name = "airless floor"

/turf/simulated/floor/tiled/freezer
	name = "tiles"
	icon_state = "freezer"

/turf/simulated/floor/tiled/techmaint
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "techmaint"

/turf/simulated/floor/tiled/monofloor
	name = "floor"
	icon_state = "monofloor"

/turf/simulated/floor/tiled/techfloor
	name = "floor"
	icon = 'icons/turf/flooring/techfloor.dmi'
	icon_state = "techfloor_gray"

/turf/simulated/floor/tiled/monotile
	name = "floor"
	icon_state = "steel_monotile"

/turf/simulated/floor/tiled/steel_grid
	name = "floor"
	icon_state = "steel_grid"

/turf/simulated/floor/tiled/steel_ridged
	name = "floor"
	icon_state = "steel_ridged"

/turf/simulated/floor/tiled/old_tile
	name = "floor"
	icon_state = "tile_full"

/turf/simulated/floor/tiled/old_cargo
	name = "floor"
	icon_state = "cargo_one_full"

/turf/simulated/floor/tiled/kafel_full
	name = "floor"
	icon_state = "kafel_full"

/turf/simulated/floor/tiled/techfloor/grid
	name = "floor"
	icon_state = "techfloor_grid"

/turf/simulated/floor/lino
	name = "lino"
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_state = "lino"

//ATMOS PREMADES
/turf/simulated/floor/reinforced/airless
	name = "vacuum floor"

/turf/simulated/floor/airless
	name = "airless plating"

/turf/simulated/floor/tiled/airless
	name = "airless floor"

/turf/simulated/floor/bluegrid/airless
	name = "airless floor"

/turf/simulated/floor/greengrid/airless
	name = "airless floor"

/turf/simulated/floor/greengrid/nitrogen

// Placeholders
/turf/simulated/floor/airless/lava
	name = "lava"
	icon = 'icons/turf/flooring/lava.dmi'
	icon_state = "lava"

/turf/simulated/floor/ice
	name = "ice"
	icon = 'icons/turf/snow.dmi'
	icon_state = "ice"

/turf/simulated/floor/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"

/turf/simulated/floor/snow/New()
	icon_state = pick("snow[rand(1,12)]","snow0")
	..()

/turf/simulated/floor/light
/turf/simulated/floor/airless/ceiling

/turf/simulated/floor/beach
	name = "beach"
	icon = 'icons/misc/beach.dmi'

/turf/simulated/floor/beach/sand
	name = "sand"
	icon_state = "sand"

/turf/simulated/floor/beach/sand/desert
	icon_state = "desert"

/turf/simulated/floor/beach/sand/desert/New()
	icon_state = "desert[rand(0,5)]"
	..()

/turf/simulated/floor/beach/coastline
	name = "coastline"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "sandwater"

/turf/simulated/floor/beach/water
	name = "water"
	icon_state = "water"

/turf/simulated/floor/beach/water/ocean
	icon_state = "seadeep"

/turf/simulated/floor/beach/water/New()
	..()
	overlays += image("icon"='icons/misc/beach.dmi',"icon_state"="water5","layer"=MOB_LAYER+0.1)

//ds13 floors
/turf/simulated/floor/dank
	name = "grim floor"
	icon = 'icons/turf/floors_ds13.dmi'
	icon_state = "dank_tile"

	desc = "The naked, ancient hull."

/turf/simulated/floor/dank/roller
	name = "roller floor"
	icon_state = "dank_roller"

/turf/simulated/floor/dank/heavy
	name = "grim heavy floor"
	icon_state = "dank_tile_heavy"

/turf/simulated/floor/dank/medical
	name = "grim medical floor"
	icon_state = "dank_tile_medical"

/turf/simulated/floor/dank/mono
	name = "grim floor"
	icon_state = "dank_tile_mono"

/turf/simulated/floor/dank/bathr
	name = "bathroom tiles"
	icon_state = "bathroom"

/turf/simulated/floor/dank/rivets
	name = "riveted plating"
	icon_state = "rivets"

/turf/simulated/floor/dank/slashed
	name = "slashed plating"
	icon_state = "slashed"

/turf/simulated/floor/dank/slashed/odd
	name = "slashed plating"
	icon_state = "slashed_odd"

/turf/simulated/floor/dank/tramcorner
	name = "tram floor"
	icon_state = "tramcorner"

/turf/simulated/floor/dank/trammiddle
	name = "tram floor"
	icon_state = "trammiddle"

/turf/simulated/floor/dank/tramwarning
	name = "tram floor"
	icon_state = "tramwarning"

/turf/simulated/floor/dank/tramgrating
	name = "railway"
	icon_state = "tramgrating"

// FLOOR UPDATE 2 : ELECTRIC BOOGALLOO
/turf/simulated/floor/dank/tech
	name = "tech plating"
	icon_state = "tech"

/turf/simulated/floor/dank/hardwood
	name = "hardwood"
	icon_state = "hardwood"

/turf/simulated/floor/dank/hardwood/alt
	icon_state = "hardwood_alt"

/turf/simulated/floor/dank/golf_gray
	name = "golf gray"
	icon_state = "golf_gray"

/turf/simulated/floor/dank/golf_brown
	name = "golf brown"
	icon_state = "golf_brown"

/turf/simulated/floor/dank/maint_left
	name = "maint left"
	icon_state = "maint_left"

/turf/simulated/floor/dank/maint
	name = "maint central"
	icon_state = "maint_center"

/turf/simulated/floor/dank/maint_right
	name = "maint right"
	icon_state = "maint_right"

/turf/simulated/floor/dank/ornate1
	name = "ornate 1"
	icon_state = "1_ornate"

/turf/simulated/floor/dank/ornate2
	name = "ornate 2"
	icon_state = "2_ornate"

/turf/simulated/floor/dank/ornate3
	name = "ornate 3"
	icon_state = "3_ornate"

/turf/simulated/floor/dank/ornate4
	name = "ornate 4"
	icon_state = "4_ornate"

/turf/simulated/floor/dank/ornate5
	name = "ornate 5"
	icon_state = "5_ornate"

/turf/simulated/floor/dank/ornate6
	name = "ornate 6"
	icon_state = "6_ornate"

/turf/simulated/floor/dank/ornate7
	name = "ornate 7"
	icon_state = "7_ornate"

/turf/simulated/floor/dank/ornate8
	name = "ornate 8"
	icon_state = "8_ornate"

/turf/simulated/floor/dank/rectangles
	name = "rectangles"
	icon_state = "rectangles"

/turf/simulated/floor/dank/slides
	name = "slides"
	icon_state = "slides"

/turf/simulated/floor/dank/slides_end
	name = "slides_end"
	icon_state = "slides_end"

/turf/simulated/floor/dank/grate
	name = "grate"
	icon_state = "grate"

/turf/simulated/floor/dank/grater
	name = "grater"
	icon_state = "grater"

/turf/simulated/floor/dank/cable
	name = "cable"
	icon_state = "cable"

/turf/simulated/floor/dank/cable/start
	name = "cable_start"
	icon_state = "cable_start"

/turf/simulated/floor/dank/cable/end
	name = "cable_end"
	icon_state = "cable_end"

/turf/simulated/floor/dank/grille_spare_1
	name = "grille-spare1"
	icon_state = "grille-spare1"

/turf/simulated/floor/dank/grille_spare_4
	name = "grille-spare4"
	icon_state = "grille-spare4"

/turf/simulated/floor/dank/grille_spare_3
	name = "grille-spare3"
	icon_state = "grille-spare3"

/turf/simulated/floor/dank/grille_spare_2
	name = "grille-spare2"
	icon_state = "grille-spare2"

/turf/simulated/wall
	name = "bulkhead"

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"
