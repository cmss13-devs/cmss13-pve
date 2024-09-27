// Holographic Items!
var/global/list/datum/map_template/holoscene_templates = list()
/turf/open/floor/holofloor/attackby(obj/item/W as obj, mob/user as mob)
	return

/turf/open/floor/holofloor/cult
	icon_state = "cult"

/turf/open/floor/holofloor/cult/south
	dir = SOUTH

/turf/open/floor/holofloor/grass
	name = "lush grass"
	icon_state = "grass1"

/turf/open/floor/holofloor/grass/Initialize(mapload, ...)
	. = ..()
	icon_state = "grass[pick("1","2","3","4")]"
	update_icon()
	for(var/direction in GLOB.cardinals)
		if(istype(get_step(src, direction), /turf/open/floor))
			var/turf/open/floor/FF = get_step(src,direction)
			FF.update_icon() //so siding get updated properly

/turf/open/floor/holofloor/grass/update_icon()
	. = ..()
	if(!broken && !burnt)
		if(!(icon_state in list("grass1", "grass2", "grass3", "grass4")))
			icon_state = "grass[pick("1", "2", "3", "4")]"

/turf/open/floor/holofloor/grass/make_plating()
	return

/obj/structure/surface/table/holotable
	name = "table"
	desc = "A square piece of metal standing on four metal legs. It can not move."
	icon_state = "table"
	density = TRUE
	anchored = TRUE
	throwpass = 1 //You can throw objects over this, despite it's density.

/obj/structure/surface/table/holotable/attack_animal(mob/living/user as mob) //Removed code for larva since it doesn't work. Previous code is now a larva ability. /N
	return attack_hand(user)

/obj/structure/surface/table/holotable/attack_hand(mob/user as mob)
	return // HOLOTABLE DOES NOT GIVE A FUCK


/obj/structure/surface/table/holotable/attackby(obj/item/W, mob/user)
	if (istype(W, /obj/item/grab) && get_dist(src,user)<=1)
		var/obj/item/grab/G = W
		if(ismob(G.grabbed_thing))
			var/mob/M = G.grabbed_thing
			if(user.grab_level < GRAB_AGGRESSIVE)
				to_chat(user, SPAN_WARNING("You need a better grip to do that!"))
				return
			M.forceMove(loc)
			M.apply_effect(5, WEAKEN)
			user.visible_message(SPAN_DANGER("[user] puts [M] on the table."))
		return

	if (HAS_TRAIT(W, TRAIT_TOOL_WRENCH))
		to_chat(user, "It's a holotable!  There are no bolts!")
		return

	..()

/obj/structure/surface/table/holotable/wood
	name = "table"
	desc = "A square piece of wood standing on four wooden legs. It can not move."
	icon_state = "woodtable"
	table_prefix = "wood"

/obj/structure/holostool
	name = "stool"
	desc = "Apply butt."
	icon = 'icons/obj/objects.dmi'
	icon_state = "stool"
	anchored = TRUE
	unslashable = TRUE
	flags_atom = FPRINT


/obj/item/clothing/gloves/boxing/hologlove
	name = "boxing gloves"
	desc = "Because you really needed another excuse to punch your crewmates."
	icon_state = "boxing"
	item_state = "boxing"

/obj/structure/holowindow
	name = "reinforced window"
	icon = 'icons/turf/walls/windows.dmi'
	icon_state = "rwindow"
	desc = "A window."
	density = TRUE
	layer = WINDOW_LAYER
	anchored = TRUE
	unslashable = TRUE
	flags_atom = ON_BORDER

/obj/structure/holowindow/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_all = PASS_GLASS

//BASKETBALL OBJECTS

/obj/item/toy/beach_ball/holoball
	name = "basketball"
	icon_state = "basketball"
	item_state = "basketball"
	desc = "Here's your chance, do your dance at the Space Jam."
	w_class = SIZE_LARGE //Stops people from hiding it in their bags/pockets

/obj/structure/holohoop
	name = "basketball hoop"
	desc = "Boom, Shakalaka!"
	icon = 'icons/obj/structures/props/misc.dmi'
	icon_state = "hoop"
	anchored = TRUE
	density = TRUE
	unslashable = TRUE
	throwpass = 1
	var/side = ""
	var/id = ""

/obj/structure/holohoop/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/grab) && get_dist(src,user)<=1)
		var/obj/item/grab/G = W
		if(ismob(G.grabbed_thing))
			var/mob/M = G.grabbed_thing
			if(user.grab_level < GRAB_AGGRESSIVE)
				to_chat(user, SPAN_WARNING("You need a better grip to do that!"))
				return
			M.forceMove(loc)
			M.apply_effect(5, WEAKEN)
			for(var/obj/structure/machinery/scoreboard/X in GLOB.machines)
				if(X.id == id)
					X.score(side, 3)// 3 points for dunking a mob
					// no break, to update multiple scoreboards
			visible_message(SPAN_DANGER("[user] dunks [M] into [src]!"))
		return
	else if (istype(W, /obj/item) && get_dist(src,user)<2)
		user.drop_inv_item_to_loc(W, loc)
		for(var/obj/structure/machinery/scoreboard/X in GLOB.machines)
			if(X.id == id)
				X.score(side)
				// no break, to update multiple scoreboards
		visible_message(SPAN_NOTICE("[user] dunks [W] into [src]!"))
		return

/obj/structure/holohoop/BlockedPassDirs(atom/movable/mover, target_dir)
	if(istype(mover,/obj/item) && mover.throwing)
		var/obj/item/I = mover
		if(istype(I, /obj/projectile))
			return BLOCKED_MOVEMENT
		if(prob(50))
			I.forceMove(src.loc)
			for(var/obj/structure/machinery/scoreboard/X in GLOB.machines)
				if(X.id == id)
					X.score(side)
					// no break, to update multiple scoreboards
			visible_message(SPAN_NOTICE("Swish! \the [I] lands in \the [src]."), null, null, 3)
		else
			visible_message(SPAN_DANGER("\the [I] bounces off of \the [src]'s rim!"), null, null, 3)
		return NO_BLOCKED_MOVEMENT

	return ..()


/obj/structure/machinery/readybutton
	name = "Ready Declaration Device"
	desc = "This device is used to declare ready. If all devices in an area are ready, the event will begin!"
	icon = 'icons/obj/structures/machinery/monitors.dmi'
	icon_state = "auth_off"
	var/ready = 0
	var/area/currentarea = null
	var/eventstarted = 0

	anchored = TRUE
	use_power = USE_POWER_IDLE
	idle_power_usage = 2
	active_power_usage = 6
	power_channel = POWER_CHANNEL_ENVIRON

/obj/structure/machinery/readybutton/attack_remote(mob/user as mob)
	to_chat(user, "The station AI is not to interact with these devices!")
	return

/obj/structure/machinery/readybutton/attackby(obj/item/W as obj, mob/user as mob)
	to_chat(user, "The device is a solid button, there's nothing you can do with it!")

/obj/structure/machinery/readybutton/attack_hand(mob/user as mob)
	if(user.stat || inoperable())
		to_chat(user, "This device is not powered.")
		return

	currentarea = get_area(src.loc)
	if(!currentarea)
		qdel(src)

	if(eventstarted)
		to_chat(usr, "The event has already begun!")
		return

	ready = !ready

	update_icon()

	var/numbuttons = 0
	var/numready = 0
	for(var/obj/structure/machinery/readybutton/button in currentarea)
		numbuttons++
		if (button.ready)
			numready++

	if(numbuttons == numready)
		begin_event()

/obj/structure/machinery/readybutton/update_icon()
	if(ready)
		icon_state = "auth_on"
	else
		icon_state = "auth_off"

/obj/structure/machinery/readybutton/proc/begin_event()

	eventstarted = 1

	for(var/obj/structure/holowindow/W in currentarea)
		currentarea -= W
		qdel(W)

	for(var/mob/M in currentarea)
		to_chat(M, "FIGHT!")

//Holorack

/obj/structure/surface/rack/holorack
	name = "rack"
	desc = "Different from the Middle Ages version."
	icon = 'icons/obj/objects.dmi'
	icon_state = "rack"

/obj/structure/surface/rack/holorack/attack_hand(mob/user as mob)
	return

/obj/structure/surface/rack/holorack/attackby(obj/item/W as obj, mob/user as mob)
	if (HAS_TRAIT(W, TRAIT_TOOL_WRENCH))
		to_chat(user, "It's a holorack!  You can't unwrench it!")
		return

/obj/structure/machinery/computer/HolodeckControl
	name = "holodeck control console"
	desc = "A computer used to control a nearby holodeck."
	icon_state = "gravitycomp"

	var/area/linkedholodeck = null
	var/area/target = null
	var/active = 0
	var/list/holographic_objs = list()
	var/list/holographic_mobs = list()
	var/damaged = 0
	var/safety_disabled = 0
	var/mob/last_to_emag = null
	var/last_change = 0
	var/last_gravity_change = 0
	var/turf/open/spawn_point = null
	var/datum/map_template/holoscene/current_scene = null
	var/list/supported_programs = list( \
	"emptycourt", \
	"beach",	\
	"boxingcourt",	\
	"basketball",	\
	)
	var/list/restricted_programs = list("Wildlife Simulation" = "wildlifecarp")// "Atmospheric Burn Simulation" = "burntest", - no, Dave

/obj/structure/machinery/computer/HolodeckControl/attack_hand(mob/user)
	linkedholodeck = locate(/area/almayer/holodeck)
	var/id_to_load = tgui_input_list(usr,"Select ID:", "IDs", supported_programs)
	if(!id_to_load)
		return
	if(holoscene_templates.Find(id_to_load))
		loadIdProgram(id_to_load)

//	interact(user)
/*
/obj/structure/machinery/computer/HolodeckControl/ui_interact(mob/user)
	var/dat

	dat += ""
	dat += "<HR>Current Loaded Programs:<BR>"
	for(var/prog in supported_programs)
		if(prog == "Empty")
			continue
		dat += "<A href='?src=\ref[src];program=[supported_programs[prog]]'>([prog])</A><BR>"

	dat += "<BR>"
	dat += "<A href='?src=\ref[src];program=turnoff'>(Turn Off)</A><BR>"

	dat += "<BR>"
	dat += "Please ensure that only holographic weapons are used in the holodeck if a combat simulation has been loaded.<BR>"

	if(linkedholodeck.has_gravity)
		dat += "Gravity is <A class='green' href='?src=\ref[src];gravity=1'>ON</A><BR>"
	else
		dat += "Gravity is <A class='blue' href='?src=\ref[src];gravity=1'>OFF</A><BR>"

	var/datum/browser/popup = new(user, "computer", "Holodeck Control System", 400, 500)
	popup.set_content(dat)
	popup.open()


/obj/structure/machinery/computer/HolodeckControl/Topic(href, href_list)
	. = ..()
	if(!.)
		return

	if(href_list["program"])
		var/prog = href_list["program"]
		if(holoscene_templates.Find(prog))
			loadIdProgram(prog)

	else if(href_list["gravity"])
		toggleGravity(linkedholodeck)

	updateUsrDialog()
*/
/obj/structure/machinery/computer/HolodeckControl/LateInitialize()
	linkedholodeck = locate(/area/almayer/holodeck)

//This could all be done better, but it works for now.
/obj/structure/machinery/computer/HolodeckControl/Destroy()
	emergencyShutdown()
	return ..()

/obj/structure/machinery/computer/HolodeckControl/emp_act(severity)
	emergencyShutdown()
	..()


/obj/structure/machinery/computer/HolodeckControl/ex_act(severity)
	emergencyShutdown()
	..()


/obj/structure/machinery/computer/HolodeckControl/process()
	for(var/item in holographic_objs) // do this first, to make sure people don't take items out when power is down.
		if(!(get_turf(item) in linkedholodeck))
			derez(item, 0)

	if(!..())
		return

/obj/structure/machinery/computer/HolodeckControl/proc/derez(obj/obj , silent = 1)
	holographic_objs.Remove(obj)

	if(obj == null)
		return

	if(isobj(obj))
		var/mob/M = obj.loc
		if(ismob(M))
			M.update_icons()	//so their overlays update

	if(!silent)
		var/obj/oldobj = obj
		visible_message("The [oldobj.name] fades away!")
	qdel(obj)

/obj/structure/machinery/computer/HolodeckControl/proc/loadIdProgram(id = "turnoff")
	if(id == "turnoff" && ((current_scene && id == current_scene.holoscene_id) || !current_scene))
		return
	if(id in restricted_programs && !safety_disabled) return
	current_scene = holoscene_templates[id]
	loadProgram()

/obj/structure/machinery/computer/HolodeckControl/proc/loadProgram()
	set waitfor = FALSE
	if(world.time < (last_change + 25))
		audible_message("<b>ERROR. Recalibrating projection apparatus.</b>")
		return

	last_change = world.time
	active = 1

	for(var/item in holographic_objs)
		derez(item)

	for(var/obj/effect/decal/cleanable/blood/B in linkedholodeck)
		qdel(B)

	if(!spawn_point)
		var/obj/effect/landmark/L = locate()
		if(!L)
			return

		if(L.name == "Holodeck Base")
			spawn_point = get_turf(L)
		else
			return

	holographic_objs = current_scene.load(spawn_point, FALSE, TRUE)
	linkedholodeck = spawn_point.loc

	for(var/obj/holo_obj in holographic_objs)
		holo_obj.alpha *= 0.8 //give holodeck objs a slight transparency

/obj/structure/machinery/computer/HolodeckControl/proc/toggleGravity(area/A)
	if(world.time < (last_gravity_change + 25))
		audible_message("<b>ERROR. Recalibrating gravity field.</b>")
		return

	last_gravity_change = world.time
	active = 1

	if(A.has_gravity)
		A.gravitychange(FALSE)
	else
		A.gravitychange(TRUE)

/obj/structure/machinery/computer/HolodeckControl/proc/emergencyShutdown()
	//Get rid of any items
	for(var/item in holographic_objs)
		derez(item)
	//Turn it back to the regular non-holographic room
	loadIdProgram()

	if(!linkedholodeck.has_gravity)
		linkedholodeck.gravitychange(TRUE)

	active = 0
	current_scene = null

/obj/structure/machinery/computer/HolodeckControl/horizontal
	supported_programs = list( \
	"Empty Court" = "emptycourt", \
	"Beach" = "beach",	\
	"Desert" = "desert",	\
	"Space" = "space",	\
	"Snow Field" = "snowfield",	\
	"Meeting Hall" = "meetinghall",	\
	"Theatre" = "theatre", \
	)
