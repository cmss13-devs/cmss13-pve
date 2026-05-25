var/list/flooring_types

// State values:
// [icon_base]: initial base icon_state without edges or corners.
// if has_base_range is set, append 0-has_base_range ie.
//   [icon_base][has_base_range]
// [icon_base]_broken: damaged overlay.
// if has_damage_range is set, append 0-damage_range for state ie.
//   [icon_base]_broken[has_damage_range]
// [icon_base]_edges: directional overlays for edges.
// [icon_base]_corners: directional overlays for non-edge corners.

/decl/flooring
	var/name = "floor"
	var/desc
	var/icon
	var/icon_base

	var/step_priority

	var/footstep = null
	var/barefootstep = null
	var/clawfootstep = null
	var/heavyfootstep = null

	var/hit_sound = null

	var/has_base_range
	var/has_damage_range
	var/has_burn_range = null
	var/damage_temperature
	var/apply_thermal_conductivity
	var/apply_heat_capacity

	var/build_type      // Unbuildable if not set. Must be /obj/item/stack.
	var/build_cost = 1  // Stack units.
	var/build_time = 0  // BYOND ticks.

	var/color = COLOR_WHITE

	var/descriptor = "tiles"
	var/flags = null
	var/can_paint

	var/is_plating = FALSE

	//Plating types, can be overridden
	var/plating_type = /decl/flooring/reinforced/plating

	//Flooring Icon vars
	var/smooth_nothing = TRUE //True/false only, optimisation
	//If true, all smoothing logic is entirely skipped

	//The rest of these x_smooth vars use one of the following options
	//SMOOTH_NONE: Ignore all of type
	//SMOOTH_ALL: Smooth with all of type
	//SMOOTH_WHITELIST: Ignore all except types on this list
	//SMOOTH_BLACKLIST: Smooth with all except types on this list
	//SMOOTH_GREYLIST: Objects only: Use both lists

	//How we smooth with other flooring
	var/list/flooring_whitelist = list() //Smooth with nothing except the contents of this list
	var/list/flooring_blacklist = list() //Smooth with everything except the contents of this list

	/*
	How we smooth with movable atoms
	These are checked after the above turf based smoothing has been handled
	SMOOTH_ALL or SMOOTH_NONE are treated the same here. Both of those will just ignore atoms
	Using the white/blacklists will override what the turfs concluded, to force or deny smoothing

	Movable atom lists are much more complex, to account for many possibilities
	Each entry in a list, is itself a list consisting of three items:
		Type: The typepath to allow/deny. This will be checked against istype, so all subtypes are included
		Priority: Used when items in two opposite lists conflict. The one with the highest priority wins out.
		Vars: An associative list of variables (varnames in text) and desired values
			Code will look for the desired vars on the target item and only call it a match if all desired values match
			This can be used, for example, to check that objects are dense and anchored
			there are no safety checks on this, it will probably throw runtimes if you make typos

	Common example:
	Don't smooth with dense anchored objects except airlocks

	smooth_movable_atom = SMOOTH_GREYLIST
	movable_atom_blacklist = list(
		list(/obj, list("density" = TRUE, "anchored" = TRUE), 1)
		)
	movable_atom_whitelist = list(
	list(/obj/machinery/door/airlock, list(), 2)
	)

	*/
	var/list/movable_atom_whitelist = list()
	var/list/movable_atom_blacklist = list()



/decl/flooring/concrete
	name = "concrete"
	descriptor = "concrete"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_base = "plating"
	name = "concrete"
	desc = "Stone-like artificial material."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_base = "concrete"
	can_paint = 1
	plating_type = /decl/flooring/reinforced/plating
	is_plating = TRUE
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	has_base_range = 18
	smooth_nothing = TRUE

/decl/flooring/reinforced/plating
	name = "plating"
	descriptor = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_base = "plating"
	can_paint = 1
	plating_type = /decl/flooring/reinforced/plating/under
	is_plating = TRUE
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	has_base_range = 18
	smooth_nothing = TRUE
	//floor_smooth = SMOOTH_BLACKLIST
	//flooring_blacklist = list(/decl/flooring/reinforced/plating/under,/decl/flooring/reinforced/plating/hull) //Smooth with everything except the contents of this list
	//smooth_movable_atom = SMOOTH_GREYLIST
	/*movable_atom_blacklist = list(
		list(/obj, list("density" = TRUE, "anchored" = TRUE), 1)
		)
	movable_atom_whitelist = list(list(/obj/machinery/door/airlock, list(), 2))
	*/

//==========UNDERPLATING==============

/decl/flooring/reinforced/plating/under
	name = "underplating"
	icon = 'icons/turf/flooring/plating.dmi'
	descriptor = "support beams"
	icon_base = "under"
	can_paint = 1
	plating_type = /decl/flooring/reinforced/plating/hull
	is_plating = TRUE
	has_base_range = 0
	footstep = FOOTSTEP_CATWALK
	smooth_nothing = FALSE

//============HULL PLATING=========

/decl/flooring/reinforced/plating/hull
	name = "hull"
	descriptor = "outer hull"
	icon = 'icons/turf/flooring/hull.dmi'
	icon_base = "hullcenter"
	has_base_range = 35
	//try_update_icon = 0
	plating_type = null
	is_plating = TRUE

/decl/flooring/grass
	name = "grass"
	desc = "Do they smoke grass out in space, Bowie? Or do they smoke AstroTurf?"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_base = "grass0"
	has_base_range = 3
	damage_temperature = T0C+80
	build_type = /obj/item/stack/tile/grass

/decl/flooring/asteroid
	name = "coarse sand"
	desc = "Gritty and unpleasant."
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_base = "asteroid"
	build_type = null
	step_priority = 2 //Soft surfaces have more distinctive sounds

/decl/flooring/asteroid_ds
	name = "soil"
	desc = "Dirt."
	flags = 0
	icon = 'icons/turf/floors_outside_ds13.dmi'
	icon_base = "wet_soft"
	build_type = null
	step_priority = 2 //Soft surfaces have more distinctive sounds

/decl/flooring/asteroid_ds/firm
    icon_base = "wet_firm"

/decl/flooring/asteroid_ds/muddy
    icon_base = "wet_muddy"

/decl/flooring/asteroid_ds/cracked
    icon_base = "wet_cracked"

/decl/flooring/asteroid_ds/dry_soft
    icon_base = "dry_soft"

/decl/flooring/asteroid_ds/dry_firm
    icon_base = "dry_firm"

/decl/flooring/asteroid_ds/dry_muddy
    icon_base = "dry_muddy"

/decl/flooring/asteroid_ds/dry_cracked
    icon_base = "dry_cracked"

/decl/flooring/carpet
	name = "brown carpet"
	desc = "Comfy and fancy carpeting."
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_base = "brown"
	build_type = /obj/item/stack/tile/carpet
	damage_temperature = T0C+200
	step_priority = 2 //Soft surfaces have more distinctive sounds
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_CARPET_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smooth_nothing = FALSE
	movable_atom_blacklist = list(
		list(/obj, list("density" = TRUE, "anchored" = TRUE), 1)
		)

/decl/flooring/carpet/blue
	name = "blue carpet"
	icon_base = "blue1"

/decl/flooring/carpet/blue2
	name = "pale blue carpet"
	icon_base = "blue2"

/decl/flooring/carpet/purple
	name = "purple carpet"
	icon_base = "purple"

/decl/flooring/carpet/orange
	name = "orange carpet"
	icon_base = "orange"

/decl/flooring/carpet/green
	name = "green carpet"
	icon_base = "green"

/decl/flooring/carpet/red
	name = "red carpet"
	icon_base = "red"

/decl/flooring/linoleum
	name = "linoleum"
	desc = "It's like the 2390's all over again."
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_base = "lino"
	can_paint = 1
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_CARPET_BAREFOOT
	clawfootstep = FOOTSTEP_CARPET_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/decl/flooring/tiling
	name = "floor"
	desc = "Scuffed from the passage of countless greyshirts."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "tiled"
	color = COLOR_DARK_GUNMETAL
	has_damage_range = 4
	damage_temperature = T0C+1400
	can_paint = 1
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/decl/flooring/tiling/mono
	icon_base = "monotile"

/decl/flooring/tiling/mono/dark
	color = COLOR_BLACK

/decl/flooring/tiling/mono/white
	icon_base = "monotile_light"
	color = COLOR_OFF_WHITE

/decl/flooring/tiling/white
	icon_base = "tiled_light"
	desc = "How sterile."
	color = COLOR_OFF_WHITE

/decl/flooring/tiling/dark
	desc = "How ominous."
	color = COLOR_DARK_GRAY

/decl/flooring/tiling/dark/mono
	icon_base = "monotile"

/decl/flooring/tiling/freezer
	desc = "Don't slip."
	icon_base = "freezer"
	color = null
	has_damage_range = null

/decl/flooring/tiling/tech
	icon = 'icons/turf/flooring/techfloor.dmi'
	icon_base = "techfloor_gray"
	color = null

/decl/flooring/tiling/tech/grid
	icon_base = "techfloor_grid"

/decl/flooring/tiling/new_tile
	icon_base = "tile_full"
	color = null

/decl/flooring/tiling/new_tile/cargo_one
	icon_base = "cargo_one_full"

/decl/flooring/tiling/new_tile/kafel
	icon_base = "kafel_full"

/decl/flooring/tiling/new_tile/techmaint
	icon_base = "techmaint"

/decl/flooring/tiling/new_tile/monofloor
	icon_base = "monofloor"
	color = COLOR_GUNMETAL

/decl/flooring/tiling/new_tile/steel_grid
	icon_base = "grid"
	color = COLOR_GUNMETAL

/decl/flooring/tiling/new_tile/steel_ridged
	icon_base = "ridged"
	color = COLOR_GUNMETAL

/decl/flooring/wood
	name = "wooden floor"
	desc = "Polished redwood planks."
	icon = 'icons/turf/flooring/wood.dmi'
	icon_base = "wood"
	has_damage_range = 6
	damage_temperature = T0C+200
	descriptor = "planks"
	build_type = /obj/item/stack/tile/wood

/decl/flooring/reinforced
	name = "reinforced floor"
	desc = "Heavily reinforced with steel plating."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "reinforced"
	build_cost = 1
	build_time = 30
	apply_thermal_conductivity = 0.025
	apply_heat_capacity = 325000
	can_paint = 1


/decl/flooring/reinforced/circuit
	name = "processing strata"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_base = "bcircuit"
	build_type = null
	can_paint = 1

/decl/flooring/reinforced/circuit/green
	icon_base = "gcircuit"

/decl/flooring/reinforced/circuit/red
	icon_base = "rcircuit"
	can_paint = 0

/decl/flooring/reinforced/shuttle
	name = "floor"
	icon = 'icons/turf/shuttle.dmi'
	build_type = null
	can_paint = 1

/decl/flooring/reinforced/shuttle/blue
	icon_base = "floor"

/decl/flooring/reinforced/shuttle/yellow
	icon_base = "floor2"

/decl/flooring/reinforced/shuttle/white
	icon_base = "floor3"

/decl/flooring/reinforced/shuttle/red
	icon_base = "floor4"

/decl/flooring/reinforced/shuttle/purple
	icon_base = "floor5"

/decl/flooring/reinforced/shuttle/darkred
	icon_base = "floor6"

/decl/flooring/reinforced/shuttle/black
	icon_base = "floor7"

/decl/flooring/water
	name = "shallow water"
	icon = 'icons/misc/beach.dmi'
	icon_base = "seashallow"
	flags = 0
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER
	smooth_nothing = TRUE
