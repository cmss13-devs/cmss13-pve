#define FIRE_SUPPORT_CLICK_INTERCEPT_ACTION "fire_support_click_intercept_action"

//Various ordnance selections
#define ORDNANCE_OPTIONS list("Banshee Missile", "CN-20 Missile", "Harpoon Missile", "Keeper Missile", "Napalm Missile", "Thermobaric Missile", "Widowmaker Missile", "Laser", "Minirocket", "Incendiary Minirocket",  "Sentry Drop", "GAU-21", "Heavy GAU-21", "High Explosive", "Incendiary", "Cluster", "High Explosive","Nerve Gas OB", "Incendiary", "Fragmentation", "Flare",  "Nerve Gas Mortar")
#define MISSILE_ORDNANCE list("Banshee Missile", "Harpoon Missile", "Keeper Missile", "Napalm Missile", "Thermobaric Missile", "Widowmaker Missile")
#define ORBITAL_ORDNANCE list("High Explosive OB", "Incendiary OB", "Cluster OB")
#define MORTAR_ORDNANCE list("High Explosive Shell", "Incendiary Shell", "Fragmentation Shell", "Flare Shell")
#define CHEMICAL_ORDNANCE list("CN-20 Missile", "Nerve Gas OB", "Nerve Gas Shell")
#define MISC_ORDNANCE list("Laser", "Minirocket", "Incendiary Minirocket",  "Sentry Drop", "GAU-21", "Heavy GAU-21")

/client/proc/toggle_fire_support_menu()
	set name = "Fire Support Menu"
	set category = "Game Master.Extras"
	if(!check_rights(R_ADMIN))
		return
	new /datum/fire_support_menu(mob)

///The actual menu datum
/datum/fire_support_menu
	var/fire_support_click_intercept = FALSE
	var/selected_ordnance = "Banshee Missile"
	var/sound_cooldown = FALSE
	///Mortar to fire the abstract shells.
	var/obj/structure/mortar/abstract_mortar = new()
	var/client/holder

/datum/fire_support_menu/New(user)
	if(isclient(user))
		holder = user
	else
		var/mob/mob = user
		holder = mob.client

	holder.click_intercept = src
	tgui_interact(holder.mob)

///Deletes the mortar when the menu is closed so we dont make a thousand of them.
/datum/fire_support_menu/Destroy(force, ...)
	QDEL_NULL(abstract_mortar)
	holder = null
	return ..()

/datum/fire_support_menu/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "GameMasterFireSupportMenu", "Fire Support Menu")
		ui.open()

///Input all the options for the ordnance panel. Only fires once, as the available ammo types shouldnt change. And if they do, something's very wrong
/datum/fire_support_menu/ui_static_data(mob/user)
	. = ..()
	var/list/data = list()

	data["ordnance_options"] = ORDNANCE_OPTIONS

	data["missile_ordnance_options"] = MISSILE_ORDNANCE
	data["orbital_ordnance_options"] = ORBITAL_ORDNANCE
	data["mortar_ordnance_options"] = MORTAR_ORDNANCE
	data["chemical_ordnance_options"] = CHEMICAL_ORDNANCE
	data["misc_ordnance_options"] = MISC_ORDNANCE

	return data

//Input all the dynamic data, the selected ordnance, and whether it's armed or not.
/datum/fire_support_menu/ui_data(mob/user)
	. = ..()
	var/list/data = list()

	data["selected_ordnance"] = selected_ordnance
	data["fire_support_click_intercept"] = fire_support_click_intercept

	return data

/datum/fire_support_menu/ui_act(action, params)
	. = ..()
	switch(action)
		if("toggle_click_fire_support")
			fire_support_click_intercept = !fire_support_click_intercept
			return
		if("set_selected_ordnance")
			selected_ordnance = params["ordnance"]
			return

/datum/fire_support_menu/ui_status(mob/user, datum/ui_state/state)
	return UI_INTERACTIVE

/datum/fire_support_menu/ui_close(mob/user)
	var/client/user_client = user.client
	if(user_client?.click_intercept == src)
		user_client.click_intercept = null

	fire_support_click_intercept = FALSE
	qdel(src)

///Handles firing logic whenever the mouse is clicked, and the fire_support_click_intercept var is TRUE
/datum/fire_support_menu/proc/InterceptClickOn(mob/user, params, atom/object)

	var/turf/target_turf = get_turf(object)
	if(fire_support_click_intercept)
		switch(selected_ordnance)
			//PREMADE ORDNANCE

			//DS missiles
			if("Banshee Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/banshee/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("CN-20 Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/banshee/nerve/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE


			if("Harpoon Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/harpoon/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Keeper Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/keeper/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Napalm Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/napalm/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Thermobaric Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/thermobaric/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Widowmaker Missile")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/rocket/widowmaker/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			//Misc DS ammo
			if("Laser")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/laser_battery/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Minirocket")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/minirocket/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Incendiary Minirocket")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/minirocket/incendiary/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Sentry Drop")
				if(istype(target_turf, /turf/closed))
					to_chat(user, SPAN_WARNING("The selected drop site is a sheer wall!"))
					return FALSE
				else
					var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
					var/obj/structure/ship_ammo/sentry/ammo = new()

					handle_dropship_ordnance(target_turf, ammo)

					QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
					return TRUE

			if("GAU-21")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/heavygun/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Heavy GAU-21")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/structure/ship_ammo/heavygun/antitank/ammo = new()

				handle_dropship_ordnance(target_turf, ammo)

				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			//Orbital Bombardments
			if("High Explosive OB")
				var/obj/structure/ob_ammo/warhead/explosive/ammo = new()

				handle_orbital_ordnance(target_turf, ammo)
				return TRUE

			if("Incendiary OB")
				var/obj/structure/ob_ammo/warhead/incendiary/ammo = new()

				handle_orbital_ordnance(target_turf, ammo)
				return TRUE

			if("Cluster OB")
				var/obj/structure/ob_ammo/warhead/cluster/ammo = new()

				handle_orbital_ordnance(target_turf, ammo)
				return TRUE

			if("Nerve Gas OB")
				var/obj/structure/ob_ammo/warhead/nerve/ammo  = new()
				handle_orbital_ordnance(target_turf, ammo)

				return TRUE

			//Mortar Shelling
			if("High Explosive Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/he/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings

			if("Incendiary Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/incendiary/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings

			if("Fragmentation Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/frag/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Nerve Gas Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/nerve/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			if("Flare Shell")
				var/obj/effect/overlay/temp/blinking_laser/target_lase = new(target_turf)
				var/obj/item/mortar_shell/flare/ammo = new()

				abstract_mortar.handle_shell(target_turf, ammo)
				QDEL_IN(target_lase, 5 SECONDS)  //to stop "unused var" warnings
				return TRUE

			else
				to_chat(user, SPAN_ANNOUNCEMENT_HEADER_ADMIN("Invalid ordnance selection! If this appears, yell at a coder!"))
				return TRUE

///Handles the dropship swooping sound effect, and makes sure it doesnt play 20 times a second.
/datum/fire_support_menu/proc/handle_dropship_sound(target_turf)
	if(!sound_cooldown)
		playsound(target_turf, 'sound/weapons/dropship_sonic_boom.ogg', 100, 1, 60)
		sound_cooldown = TRUE
		addtimer(VARSET_CALLBACK(src, sound_cooldown, FALSE), 10 SECONDS)

///Handles the noises and actual detonation of dropship ammo. Mainly it doesnt play the warning sound for ammo of the ship_ammo/heavygun/ type.
/datum/fire_support_menu/proc/handle_dropship_ordnance(turf/target_turf, obj/structure/ship_ammo/ammo)
	addtimer(CALLBACK(src, PROC_REF(handle_dropship_sound), target_turf), 0.5 SECONDS)
	if(!istype(ammo, /obj/structure/ship_ammo/heavygun/))
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), target_turf, ammo.warning_sound, ammo.warning_sound_volume, 1, 15), 1.5 SECONDS)
	addtimer(CALLBACK(ammo, TYPE_PROC_REF(/obj/structure/ship_ammo, detonate_on), target_turf), 2.5 SECONDS)
	QDEL_IN(ammo, 5 SECONDS)

/datum/fire_support_menu/proc/handle_orbital_ordnance(turf/target_turf, obj/structure/ob_ammo/warhead/ammo)
	ammo.warhead_impact(target_turf)

#undef ORDNANCE_OPTIONS
#undef ORBITAL_ORDNANCE
#undef MORTAR_ORDNANCE
#undef MISC_ORDNANCE
#undef CHEMICAL_ORDNANCE
#undef FIRE_SUPPORT_CLICK_INTERCEPT_ACTION
