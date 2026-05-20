
//Executive
GLOBAL_LIST_INIT(executive_shuttle_controllers, list())

/obj/structure/machinery/computer/shuttle_control/executive_master
	name = "Executive Shuttle Master Console"
	desc = "A master control console for the Executive shuttle, requires external authorisation to launch."
	var/requires_authorisation = TRUE //Does this console need external auth by the consoles? Admins can override this if they need to.
	var/list/slaved = list() //Slaved consoles.

/obj/structure/machinery/computer/shuttle_control/executive
	name = "Executive Shuttle Authorisation Console"
	desc = "A console used to provide authorisation for the Executive Shuttle to leave. All its sister consoles must authorise in unison before the shuttle can move."
	var/authorised = FALSE
	var/auth_timeout = 10 SECONDS //How long do you have to launch before this one's auth times out?

/obj/structure/machinery/computer/shuttle_control/executive/Initialize()
	.=..()
	GLOB.executive_shuttle_controllers += src

/obj/structure/machinery/computer/shuttle_control/executive/Destroy()
	//Remove it from the list to prevent hard deletion
	GLOB.executive_shuttle_controllers -= src
	.=..()

