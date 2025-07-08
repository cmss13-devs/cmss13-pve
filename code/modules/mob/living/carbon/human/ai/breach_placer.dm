/datum/human_ai_breach_placer
	var/client/holder
	var/static/list/charge_dict = list(
		/obj/item/explosive/plastic::name = /obj/item/explosive/plastic,
		/obj/item/explosive/plastic/breaching_charge::name = /obj/item/explosive/plastic/breaching_charge,
		/obj/item/explosive/plastic/breaching_charge/rubber::name = /obj/item/explosive/plastic/breaching_charge/rubber,
		/obj/item/explosive/plastic/breaching_charge/plasma::name = /obj/item/explosive/plastic/breaching_charge/plasma,
	)
	var/static/list/acceptable_place_types = list(
		/turf/closed/wall,
		/obj/effect,
		/obj/structure/machinery,
		/obj/structure/closet,
		/obj/structure/window,
	)
	var/static/list/direction_dict = list(
		"North" = NORTH,
		"East" = EAST,
		"South" = SOUTH,
		"West" = WEST,
	)
	var/obj/item/explosive/plastic/selected_charge_path = /obj/item/explosive/plastic
	var/selected_place_dir = NORTH

/datum/human_ai_breach_placer/Destroy(force, ...)
	holder.click_intercept = null
	holder = null
	return ..()

/datum/human_ai_breach_placer/proc/InterceptClickOn(mob/user, params, atom/object)
	var/list/modifiers = params2list(params)
	if(LAZYACCESS(modifiers, LEFT_CLICK))
		if(!is_type_in_list(object, acceptable_place_types))
			return

		// I hate this but i'm not refactoring c4 code rn
		var/obj/item/explosive/plastic/new_c4 = new selected_charge_path(get_turf(object))
		new_c4.plant_target = object
		new_c4.cause_data = create_cause_data(initial(new_c4.name), user)
		new_c4.icon_state = new_c4.overlay_image
		new_c4.layer = BELOW_MOB_LAYER
		new_c4.setDir(selected_place_dir)

		if(!istype(object, /obj/structure/window) && !istype(object, /turf/closed))
			object.contents += new_c4
			new_c4.overlay = image('icons/obj/items/assemblies.dmi', new_c4.overlay_image)
			new_c4.overlay.layer = ABOVE_XENO_LAYER
			object.overlays += new_c4.overlay

		new_c4.active = TRUE
		addtimer(CALLBACK(new_c4, TYPE_PROC_REF(/obj/item/explosive/plastic, prime)), new_c4.timer SECONDS) // Why does `timer` not just start out multiplied by 10???
		to_chat(user, SPAN_BOLDNOTICE("[selected_charge_path::name] planted, will explode in [new_c4.timer] seconds."))

	else if(LAZYACCESS(modifiers, MIDDLE_CLICK))
		var/chosen_charge = tgui_input_list(user, "Select explosive type.", "Select", charge_dict)
		if(!chosen_charge)
			return
		selected_charge_path = charge_dict[chosen_charge]
		var/chosen_dir = tgui_input_list(user, "Select placement direction.", "Select", direction_dict)
		if(!chosen_dir)
			return
		selected_place_dir = direction_dict[chosen_dir]
		to_chat(user, SPAN_BOLDNOTICE("Now placing [chosen_charge] at direction [chosen_dir]."))


/client/proc/place_plastic_explosives()
	set name = "Place Plastic Explosives"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	if(istype(click_intercept, /datum/human_ai_breach_placer))
		QDEL_NULL(click_intercept)
		to_chat(src, SPAN_BOLDNOTICE("Stopped placing explosives."))
		return

	var/datum/human_ai_breach_placer/placer_datum = new
	placer_datum.holder = src
	click_intercept = placer_datum
	to_chat(src, SPAN_BOLDNOTICE("Left click on a wall to place plastic explosives. Middle click to select the type of charge and the direction to place them."))
