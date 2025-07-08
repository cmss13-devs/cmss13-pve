#define AREASELECT_CORNERA "corner A"
#define AREASELECT_CORNERB "corner B"

/datum/human_ai_quick_order
	var/client/holder
	var/list/preview = list()
	var/turf/cornerA
	var/turf/cornerB
	var/list/ai_humans_selected = list()

/datum/human_ai_quick_order/Destroy(force, ...)
	holder.click_intercept = null
	cornerA = null
	cornerB = null
	holder.images -= preview
	holder = null
	preview.Cut()
	return ..()

/datum/human_ai_quick_order/proc/deselect_region()
	set waitfor = FALSE

	cornerA = null
	cornerB = null

	sleep(0.5 SECONDS)
	holder.images -= preview
	preview.Cut()

/datum/human_ai_quick_order/proc/InterceptClickOn(mob/user, params, atom/object)
	var/list/modifiers = params2list(params)
	if(LAZYACCESS(modifiers, ALT_CLICK) || LAZYACCESS(modifiers, MIDDLE_CLICK))
		if(!length(ai_humans_selected))
			to_chat(holder, SPAN_BOLDNOTICE("You need to have an area selected first."))
			return

		do_order(user, params, object)

		deselect_region()

	else if(LAZYACCESS(modifiers, LEFT_CLICK))
		if(!cornerA)
			cornerA = select_tile(get_turf(object), AREASELECT_CORNERA)
			return
		if(!cornerB)
			cornerB = select_tile(get_turf(object), AREASELECT_CORNERB)
			handle_selected_area(params)
			deselect_region()
			return
	else
		to_chat(holder, SPAN_NOTICE("Region selection canceled!"))
		deselect_region()
		ai_humans_selected.Cut()

/datum/human_ai_quick_order/proc/select_tile(turf/T, corner_to_select)
	var/overlaystate
	holder.images -= preview
	switch(corner_to_select)
		if(AREASELECT_CORNERA)
			overlaystate = "greenOverlay"
		if(AREASELECT_CORNERB)
			overlaystate = "blueOverlay"

	var/image/I = image('icons/turf/overlays.dmi', T, overlaystate)
	I.plane = ABOVE_LIGHTING_PLANE
	preview += I
	holder.images += preview
	return T

/datum/human_ai_quick_order/proc/handle_selected_area(params)
	if(!cornerA || !cornerB)
		return

	ai_humans_selected.Cut()
	for(var/turf/block_turf as anything in block(cornerA.x, cornerA.y, cornerA.z, cornerB.x, cornerB.y, cornerB.z))
		for(var/mob/living/carbon/human/maybe_ai in block_turf.contents)
			var/datum/human_ai_brain/brain = maybe_ai.get_ai_brain()
			if(brain)
				ai_humans_selected += brain

	to_chat(holder, SPAN_BOLDNOTICE("[length(ai_humans_selected)] AI selected in region."))

/datum/human_ai_quick_order/proc/do_order(mob/user, params, atom/object)
	return


/datum/human_ai_quick_order/approach

/datum/human_ai_quick_order/approach/do_order(mob/user, params, atom/object)
	var/list/modifiers = params2list(params)
	for(var/datum/human_ai_brain/brain as anything in ai_humans_selected)
		brain.hold_position = FALSE
		if(LAZYACCESS(modifiers, ALT_CLICK))
			brain.quick_approach = get_turf(object)
		else
			brain.quick_approach = null
			brain.target_turf = get_turf(object)

	to_chat(holder, SPAN_BOLDNOTICE("Order sent."))

/client/proc/quick_order_ai_approach()
	set name = "Quick Order: Approach"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	if(istype(click_intercept, /datum/human_ai_quick_order))
		QDEL_NULL(click_intercept)
		to_chat(src, SPAN_BOLDNOTICE("Current order stopped."))
		return

	var/datum/human_ai_quick_order/approach/order_datum = new
	order_datum.holder = src
	click_intercept = order_datum
	to_chat(src, SPAN_BOLDNOTICE("Left click two corners to select all AI in the area. Then, alt-click on where you would like them to go. Additionally, you can use middle-click to make AI approach carefully. To stop quick ordering, press the verb again. Will not function if GM panel is open."))

/datum/human_ai_quick_order/hold_position

/datum/human_ai_quick_order/hold_position/do_order(mob/user, params, atom/object)
	var/list/modifiers = params2list(params)
	for(var/datum/human_ai_brain/brain as anything in ai_humans_selected)
		if(LAZYACCESS(modifiers, ALT_CLICK))
			brain.hold_position = TRUE
		else
			brain.hold_position = FALSE

	if(LAZYACCESS(modifiers, ALT_CLICK))
		to_chat(holder, SPAN_BOLDNOTICE("Selected AI now holding position."))
	else
		to_chat(holder, SPAN_BOLDNOTICE("Selected AI now no longer holding position."))

/client/proc/quick_order_ai_hold_position()
	set name = "Quick Order: Hold Position"
	set category = "Game Master.HumanAI"

	if(!check_rights(R_DEBUG))
		return

	if(istype(click_intercept, /datum/human_ai_quick_order))
		QDEL_NULL(click_intercept)
		to_chat(src, SPAN_BOLDNOTICE("Current order stopped."))
		return

	var/datum/human_ai_quick_order/hold_position/order_datum = new
	order_datum.holder = src
	click_intercept = order_datum
	to_chat(src, SPAN_BOLDNOTICE("Left click two corners to select all AI in the area. Alt-clicking will cause them to hold position. Middle-clicking will stop them from holding position. To stop quick ordering, press the verb again. Will not function if GM panel is open."))


#undef AREASELECT_CORNERA
#undef AREASELECT_CORNERB
