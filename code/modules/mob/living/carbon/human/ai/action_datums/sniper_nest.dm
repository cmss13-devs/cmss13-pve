/datum/human_ai_brain
	var/turf/sniper_home
	var/sniper_dir = SOUTH

/datum/ai_action/sniper_nest
	name = "Sniper Nest"
	action_flags = ACTION_USING_LEGS
	var/initial_view
	var/initial_reload_line_chance

/datum/ai_action/sniper_nest/get_weight(datum/human_ai_brain/brain)
	if(!brain.sniper_home)
		return 0

	if(brain.tried_reload)
		return 0

	if(brain.current_cover)
		return 0

	if(!brain.primary_weapon)
		return 0

	if(brain.healing_someone)
		return 0

	return 12

/datum/ai_action/sniper_nest/Added()
	initial_view = brain.view_distance
	initial_reload_line_chance = brain.reload_line_chance
	brain.reload_line_chance = 0

/datum/ai_action/sniper_nest/Destroy(force, ...)
	brain.view_distance = initial_view
	brain.reload_line_chance = initial_reload_line_chance
	return ..()

/datum/ai_action/sniper_nest/trigger_action()
	. = ..()

	if(brain.tried_reload || brain.current_cover || brain.healing_someone)
		return ONGOING_ACTION_COMPLETED

	var/obj/item/weapon/gun/primary_weapon = brain.primary_weapon
	if(!primary_weapon)
		return ONGOING_ACTION_COMPLETED

	var/turf/sniper_home = brain.sniper_home
	if(QDELETED(sniper_home))
		return ONGOING_ACTION_COMPLETED

	var/mob/living/carbon/tied_human = brain.tied_human
	if(get_dist(tied_human, sniper_home) > 0)
		if(!brain.move_to_next_turf(sniper_home))
			return ONGOING_ACTION_COMPLETED

	if(!get_dist(tied_human, sniper_home))
		brain.view_distance = 30
		brain.tied_human.face_dir(brain.sniper_dir)

	if(!brain.should_reload())
		brain.unholster_primary()
		brain.ensure_primary_hand(primary_weapon)
		brain.wield_primary()

	return ONGOING_ACTION_UNFINISHED


/datum/admins/proc/create_human_ai_sniper()
	set name = "Create Human AI Sniper"
	set category = "Game Master.HumanAI"

	var/static/list/sniper_equipment_presets = list(
		/datum/equipment_preset/clf/sniper::name = /datum/equipment_preset/clf/sniper,
		/datum/equipment_preset/clf/sniper/svd::name = /datum/equipment_preset/clf/sniper/svd,
		/datum/equipment_preset/pmc/pmc_sniper::name = /datum/equipment_preset/pmc/pmc_sniper,
		/datum/equipment_preset/upp/sniper::name = /datum/equipment_preset/upp/sniper,
		/datum/equipment_preset/uscm/specialist_equipped/sniper::name = /datum/equipment_preset/uscm/specialist_equipped/sniper,
		/datum/equipment_preset/other/freelancer/marksman::name = /datum/equipment_preset/other/freelancer/marksman,
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
	ai_comp.ai_brain.sniper_home = home_turf
	ai_comp.ai_brain.sniper_dir = get_cardinal_dir(home_turf, target_turf)

	to_chat(usr, SPAN_NOTICE("Sniper has been created."))

