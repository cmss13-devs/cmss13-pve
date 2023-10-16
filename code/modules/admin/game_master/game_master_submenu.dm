

/// Called by /datum/game_master and handles various submenus and unique interactions with atoms
/datum/game_master_submenu

	/// The atom this submenu is interacting with
	var/atom/referenced_atom

	/// The name of the menu we are opening, referencing the actual code
	var/tgui_menu_name

	/// The name of the window we are opening, *not* the actual code reference
	var/tgui_menu_title

/datum/game_master_submenu/New(mob/user, atom/object)
	. = ..()

	referenced_atom = object
	RegisterSignal(referenced_atom, COMSIG_PARENT_QDELETING, PROC_REF(referenced_atom_destroyed))

	if(user)
		tgui_interact(user)

/datum/game_master_submenu/Destroy(force, ...)
	. = ..()
	referenced_atom = null

/// Callback for when the referenced atom is destroyed so we want to destroy this datum which will close the window attached
/datum/game_master_submenu/proc/referenced_atom_destroyed()
	SIGNAL_HANDLER

	qdel(src)

/datum/game_master_submenu/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE

/datum/game_master_submenu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui && tgui_menu_name && tgui_menu_title)
		ui = new(user, src, tgui_menu_name, tgui_menu_title)
		ui.open()
