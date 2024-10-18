/datum/ongoing_action/order/sniper_nest
	name = "Sniper Nest"
	should_display = FALSE
	var/turf/home_turf
	var/turf/aiming_turf
	var/list/overwatch_turfs = list()
	var/datum/human_ai_brain/sniper_brain

/datum/ongoing_action/order/sniper_nest/New(list/arguments)
	. = ..()
	home_turf = arguments[2]
	aiming_turf = arguments[3]

/datum/ongoing_action/order/sniper_nest/Destroy(force, ...)
	home_turf = null
	aiming_turf = null
	clear_overwatch()
	sniper_brain.can_assign_squad = TRUE
	sniper_brain.requires_vision = TRUE
	sniper_brain.grenading_allowed = TRUE
	sniper_brain.allowed_return_fire = TRUE
	sniper_brain.allowed_approach_retreat = TRUE
	sniper_brain = null
	return ..()

/datum/ongoing_action/order/sniper_nest/trigger_action(datum/human_ai_brain/brain)
	if(!sniper_brain)
		sniper_brain = brain
		brain.can_assign_squad = FALSE
		brain.requires_vision = FALSE
		brain.grenading_allowed = FALSE
		brain.allowed_return_fire = FALSE
		brain.allowed_approach_retreat = FALSE

	if(QDELETED(home_turf))
		return ONGOING_ACTION_COMPLETED

	if(get_dist(home_turf, brain.tied_human) > 0)
		if(!brain.move_to_next_turf(home_turf))
			return ONGOING_ACTION_COMPLETED

		if(get_dist(home_turf, brain.tied_human) > 0)
			return ONGOING_ACTION_UNFINISHED

	if((brain.tied_human.get_active_hand() != brain.primary_weapon) && (brain.tied_human.get_inactive_hand() != brain.primary_weapon))
		brain.unholster_primary()

	if(!(brain.primary_weapon.flags_item & WIELDED))
		brain.primary_weapon.wield(brain.tied_human)

	if(!length(overwatch_turfs))
		establish_overwatch(aiming_turf) // finish me tomorrow, make sure AI always has gun in hands and wielded etc

	return ONGOING_ACTION_COMPLETED

/datum/ongoing_action/order/sniper_nest/proc/establish_overwatch(turf/turf_to_overwatch)
	if(!turf_to_overwatch)
		return

#ifdef TESTING
	to_chat(world, "[sniper_brain.tied_human.real_name] has established new sniper overwatch at [turf_to_overwatch.x], [turf_to_overwatch.y], [turf_to_overwatch.z].")
#endif
	if(length(overwatch_turfs))
		return

	for(var/turf/open/floor in range(3, turf_to_overwatch)) // everything within 3 tiles of the center gets marked
		RegisterSignal(floor, COMSIG_TURF_ENTERED, PROC_REF(on_overwatch_turf_enter))
		overwatch_turfs += floor
#ifdef TESTING
		floor.color = "#aca43a"
#endif

/datum/ongoing_action/order/sniper_nest/proc/clear_overwatch()
	for(var/turf/open/floor as anything in overwatch_turfs)
		UnregisterSignal(floor, COMSIG_TURF_ENTERED)
#ifdef TESTING
		floor.color = null
#endif

#ifdef TESTING
	if(length(overwatch_turfs))
		to_chat(world, "[sniper_brain.tied_human.real_name] has cleared existing sniper overwatch.")
#endif
	overwatch_turfs.Cut()

/datum/ongoing_action/order/sniper_nest/proc/on_overwatch_turf_enter(datum/source, atom/movable/entering)
	SIGNAL_HANDLER

	if(sniper_brain.current_target || !sniper_brain.can_target(entering))
		return

	sniper_brain.current_target = entering
	sniper_brain.RegisterSignal(entering, COMSIG_PARENT_QDELETING, TYPE_PROC_REF(/datum/human_ai_brain, on_target_delete), TRUE)
	sniper_brain.attack_target()


/datum/admins/proc/create_human_ai_sniper()
	set name = "Create Human AI Sniper"
	set category = "Game Master.HumanAI"

	var/static/list/sniper_equipment_presets = list(
		/datum/equipment_preset/clf/sniper::name = /datum/equipment_preset/clf/sniper
	)

	if(!check_rights(R_DEBUG))
		return

	if(tgui_input_list(usr, "Press Enter to select the home turf of the sniper.", "Home Turf", list("Enter", "Cancel")) != "Enter")
		return

	var/turf/home_turf = get_turf(usr)
	var/turf/target_turf

	while(TRUE)
		if(tgui_input_list(usr, "Press Enter to select the center of the sniper's overwatch. This must be within 30 tiles and not be blocked.", "Target Turf", list("Enter", "Cancel")) == "Enter")
			var/turf/maybe_target_turf = get_turf(usr)
			if(get_dist(home_turf, maybe_target_turf) > 30)
				to_chat(usr, SPAN_WARNING("This turf is too far away. Max range 30, attempted range [get_dist(home_turf, target_turf)]."))
				continue

			if(locate(/turf/closed) in get_line(home_turf, maybe_target_turf))
				to_chat(usr, SPAN_WARNING("A wall is located between the home and target turf."))
				continue
			target_turf = maybe_target_turf
		break

	if(!home_turf || !target_turf)
		return

	var/mob/living/carbon/human/ai_human = new()
	var/datum/component/human_ai/ai_comp = ai_human.AddComponent(/datum/component/human_ai)
	var/chosen_equipment_name = tgui_input_list(usr, "Select sniper equipment.", "Sniper Equipment", sniper_equipment_presets)
	if(!chosen_equipment_name)
		qdel(ai_human)
		return
	arm_equipment(ai_human, sniper_equipment_presets[chosen_equipment_name], TRUE)
	ai_human.forceMove(home_turf)
	ai_comp.ai_brain.set_ongoing_order(new /datum/ongoing_action/order/sniper_nest(list(ai_comp.ai_brain, home_turf, target_turf)))

	to_chat(usr, SPAN_NOTICE("Sniper has been created."))

