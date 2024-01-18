
/// Created by /datum/game_master when middle clicking on a /obj/structure/tunnel
/datum/game_master_submenu/ambush/tunnels
	tgui_menu_title = "Tunnel Control"

/datum/game_master_submenu/ambush/tunnels/shake_spawner()
	var/obj/structure/tunnel/referenced_tunnel = referenced_atom
	if(!istype(referenced_tunnel))
		log_debug("Tunnel game master submenu has reference atom that is not a tunnel. Referenced atom: [referenced_atom]")
		return

	referenced_tunnel.animate_crawl()

	return CALLBACK(referenced_tunnel, TYPE_PROC_REF(/obj/structure/tunnel, animate_crawl_reset))
