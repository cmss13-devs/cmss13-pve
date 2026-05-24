
///Mostly non-functional, I don't have time to debug lots of machinery stuff

/obj/machinery/computer/tram_controls
	name = "tram controls"
	desc = "An interface for the tram that lets you tell the tram where to go and hopefully it makes it there. I'm here to describe the controls to you, not to inspire confidence. Unfortunately for you, it seems to be non-functional."
	icon_state = "tramterminal"


/obj/machinery/media/jukebox/old
	name = "space jukebox"
	desc = "A battered and hard-loved jukebox in some forgotten style, it doesn't seem to be working anymore sadly."
	icon = 'icons/obj/jukebox.dmi'
	icon_state = "jukebox2-nopower"
	pixel_x = 0

/obj/machinery/marker
	name = "Marker"
	desc = "<span class='minorwarning'>It fills you with fear and paranoia...</span>"
	icon = 'icons/obj/marker_giant.dmi'
	icon_state = "marker_giant_dormant"
	pixel_x = -32
	density = TRUE
	anchored = TRUE
	light_on = FALSE
	light_range = 12
	light_power = 1
	light_color = COLOR_MARKER_RED

/obj/machinery/fusion_fuel_compressor
	name = "fuel compressor"
	icon = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "fuel_compressor1"
	density = 1
	anchored = 1
	layer = 4

/obj/machinery/fusion_fuel_injector
	name = "fuel injector"
	icon = 'icons/obj/machines/power/fusion.dmi'
	icon_state = "injector0"
	density = 1
	anchored = 0

/obj/machinery/fusion_fuel_injector/mapped
	anchored = 1

/obj/machinery/power/fusion_core
	name = "\improper R-UST Mk. 8 Tokamak core"
	desc = "An enormous solenoid for generating extremely high power electromagnetic fields. It includes a kinetic energy harvester."
	icon = 'icons/obj/machines/power/fusion_core.dmi'
	icon_state = "core0"
	layer = 3.1
	density = 1

/obj/machinery/power/fusion_core/mapped
	anchored = 1

/obj/machinery/power/emitter/gyrotron
	name = "gyrotron"
	icon = 'icons/obj/machines/power/fusion.dmi'
	desc = "It is a heavy duty industrial gyrotron suited for powering fusion reactors."
	icon_state = "emitter-off"

/obj/machinery/power/emitter/gyrotron/anchored
	anchored = 1

/obj/structure/machinery/computer/gyrotron_control
	name = "gyrotron control console"
	light_color = COLOR_BLUE

/obj/machinery/store
	name = "Store Kiosk"
	desc = "Series of vending-like machines located throughout EarthGov installations, ships, and colonies. It seems to be malfunctioning..."
	icon = 'icons/obj/machines/store.dmi'
	icon_state = "kiosk_on"

	layer = 3.06
	anchored = TRUE

	// Power

	light_range = 4
	light_power = 0.8
	light_color = COLOR_DEEP_SKY_BLUE
	light_on = FALSE

/obj/machinery/papershredder
	name = "paper shredder"
	desc = "For those documents you don't want seen."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "papershredder0"
	density = 1
	anchored = 1

	// Mining machines

/obj/machinery/mineral/stacking_machine
	name = "stacking machine"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "stacker"
	density = 1
	anchored = 1.0

/obj/machinery/mineral/stacking_unit_console
	name = "stacking machine console"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"
	density = FALSE
	anchored = 1
	can_block_movement = FALSE

/obj/machinery/mineral/processing_unit
	name = "material processor" //This isn't actually a goddamn furnace, we're in space and it's processing platinum and flammable phoron...
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "furnace"
	density = 1
	anchored = 1
	light_range = 3

/obj/machinery/mineral/unloading_machine
	name = "unloading machine"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "unloader"
	density = 1
	anchored = 1.0

/obj/machinery/mineral/processing_unit_console
	name = "processing unit console"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"
	density = FALSE
	anchored = 1

/obj/structure/asteroidcannon
	name = "Asteroid Defense System"
	desc = "A huge machine that shoots down oncoming asteroids."
	icon = 'icons/obj/asteroidcannon_centred.dmi'
	icon_state = "asteroidgun"
	bound_height = 128
	bound_width = 128
	density = TRUE
	anchored = TRUE
	dir = EAST //Ship faces east, so does big mega gun.
	light_color="#ff0000" //Glows red when it's out of commission...
	health = 200
	layer = 3.06

//A workbench for upgrading things
/obj/structure/workbench
	name = "Nanocircuit Repair Bench"
	desc = "For repairing and upgrading devices and tools. You aren't sure how to use it."
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "deadspace_workbench"
	density = TRUE
	anchored = TRUE
