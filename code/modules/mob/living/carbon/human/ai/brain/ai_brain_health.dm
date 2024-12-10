/datum/human_ai_brain
	var/static/list/brute_heal_items = list(
		/obj/item/stack/medical/advanced/bruise_pack,
		/obj/item/reagent_container/hypospray/autoinjector/bicaridine,
		/obj/item/reagent_container/hypospray/autoinjector/tricord,
		/obj/item/storage/pill_bottle/bicaridine,
		/obj/item/storage/pill_bottle/merabica,
		/obj/item/storage/pill_bottle/tricord,
	)

	var/static/list/burn_heal_items = list(
		/obj/item/stack/medical/advanced/ointment,
		/obj/item/reagent_container/hypospray/autoinjector/kelotane,
		/obj/item/reagent_container/hypospray/autoinjector/tricord,
		/obj/item/storage/pill_bottle/kelotane,
		/obj/item/storage/pill_bottle/keloderm,
		/obj/item/storage/pill_bottle/tricord,
	)

	var/static/list/tox_heal_items = list(
		/obj/item/reagent_container/hypospray/autoinjector/dylovene,
		/obj/item/reagent_container/hypospray/autoinjector/tricord,
		/obj/item/storage/pill_bottle/antitox,
		/obj/item/storage/pill_bottle/tricord,
	)

	var/static/list/oxy_heal_items = list(
		/obj/item/reagent_container/hypospray/autoinjector/dexalinp,
		/obj/item/reagent_container/hypospray/autoinjector/tricord,
		/obj/item/storage/pill_bottle/dexalin,
		/obj/item/storage/pill_bottle/dexalinplus,
		/obj/item/storage/pill_bottle/tricord,
	)

	var/static/list/bleed_heal_items = list(
		/obj/item/stack/medical/advanced/bruise_pack,
		/obj/item/stack/medical/bruise_pack,
	)

	var/static/list/bonebreak_heal_items = list(
		/obj/item/stack/medical/splint,
	)

	var/static/list/painkiller_items = list(
		/obj/item/reagent_container/hypospray/autoinjector/tramadol,
		/obj/item/reagent_container/hypospray/autoinjector/oxycodone,
		/obj/item/storage/pill_bottle/tramadol,
	)

	/// At what percentage of max HP to start searching for medical treatment
	var/healing_start_threshold = 0.7
	/// Requires this much damage of one type to consider it a problem
	var/damage_problem_threshold = 5
	/// Pain percentage (out of 100) for the AI to consider using painkillers
	var/pain_percentage_threshold = 1

	/// Are we currently treating someone?
	var/healing_someone

	/// Should we try and treat injured friends
	var/treat_allies = TRUE

	/// Reference for found injured ally
	var/mob/living/carbon/human/found_injured_ally

	/// Cooldown on using pills to avoid OD. This isn't the best solution as it prevents the AI from using more than 1 pill of any kind every 20s, but it'll work for now
	COOLDOWN_DECLARE(pill_use_cooldown)

/datum/human_ai_brain/proc/set_injured_ally(mob/living/new_target)
	if(!new_target)
		return

	RegisterSignal(new_target, COMSIG_PARENT_QDELETING, PROC_REF(lose_injured_ally), TRUE)
	RegisterSignal(new_target, COMSIG_MOB_DEATH, PROC_REF(lose_injured_ally), TRUE)
	found_injured_ally = new_target

/datum/human_ai_brain/proc/lose_injured_ally()
	if(found_injured_ally)
		UnregisterSignal(found_injured_ally, COMSIG_PARENT_QDELETING)
		UnregisterSignal(found_injured_ally, COMSIG_MOB_DEATH)
	found_injured_ally = null

/datum/human_ai_brain/proc/get_injured_ally()
	var/list/viable_targets = list()
	var/atom/movable/closest_target
	var/smallest_distance = INFINITY

	for(var/mob/living/carbon/human/possible_buddy as anything in GLOB.alive_human_list)
		if(possible_buddy == tied_human)
			continue

		if(tied_human.z != possible_buddy.z)
			continue

		if(!faction_check(possible_buddy))
			continue

		if(!(tied_human in viewers(view_distance, possible_buddy)))
			continue

		var/distance = get_dist(tied_human, possible_buddy)
		if(distance > view_distance)
			continue

		if(!healing_start_check(possible_buddy))
			continue

		viable_targets += possible_buddy

		if(smallest_distance <= distance)
			continue

		closest_target = possible_buddy
		smallest_distance = distance

	if(length(viable_targets) > 1)
		return pick(viable_targets)

	return closest_target

/datum/human_ai_brain/proc/healing_start_check(mob/living/carbon/human/target)
	return ((target.health / target.maxHealth) <= healing_start_threshold) || target.is_bleeding() || target.has_broken_limbs()

/datum/human_ai_brain/proc/start_healing(mob/living/carbon/human/target)
	set waitfor = FALSE

	healing_someone = TRUE

	// Prioritize brute, then bleed, then broken bones, then burn, then pain, then tox, then oxy.
	if(target.getBruteLoss() > damage_problem_threshold)
		var/obj/item/brute_heal
		for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
			if(is_type_in_list(heal_item, brute_heal_items) && heal_item.ai_can_use(tied_human, src, target))
				brute_heal = heal_item
				break

		if(!brute_heal)
			goto bleed

		if(!equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, brute_heal))
			healing_someone = FALSE
			return

		clear_main_hand()
		healing_someone = TRUE
		sleep(short_action_delay * action_delay_mult)
		brute_heal.ai_use(tied_human, src, target)
		if(QDELETED(brute_heal))
			goto bleed

		var/storage_slot = storage_has_room(brute_heal)
		if(storage_slot)
			store_item(brute_heal, storage_slot, HUMAN_AI_HEALTHITEMS)
		else
			tied_human.drop_held_item(brute_heal)
#ifdef TESTING
		to_chat(world, "[tied_human.name] healed brute damage of [target.name] using [brute_heal].")
#endif

	bleed:
		if(target.is_bleeding())
			var/obj/item/bleed_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, bleed_heal_items) && heal_item.ai_can_use(tied_human, src, target))
					bleed_heal = heal_item
					break

			if(!bleed_heal)
				goto bone

			if(!equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, bleed_heal))
				healing_someone = FALSE
				return

			clear_main_hand()
			healing_someone = TRUE
			sleep(short_action_delay * action_delay_mult)
			bleed_heal.ai_use(tied_human, src, target)
			if(QDELETED(bleed_heal))
				goto bone

			var/storage_slot = storage_has_room(bleed_heal)
			if(storage_slot)
				store_item(bleed_heal, storage_slot, HUMAN_AI_HEALTHITEMS)
			else
				tied_human.drop_held_item(bleed_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] fixed bleeding of [target.name] using [bleed_heal].")
#endif

	// Doesn't support bone-healing chems
	bone:
		if(target.has_broken_limbs())
			var/obj/item/bone_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, bonebreak_heal_items) && heal_item.ai_can_use(tied_human, src, target))
					bone_heal = heal_item
					break

			if(!bone_heal)
				goto fire

			if(!equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, bone_heal))
				healing_someone = FALSE
				return

			clear_main_hand()
			healing_someone = TRUE
			sleep(short_action_delay * action_delay_mult)
			bone_heal.ai_use(tied_human, src, target)
			if(QDELETED(bone_heal))
				goto fire

			var/storage_slot = storage_has_room(bone_heal)
			if(storage_slot)
				store_item(bone_heal, storage_slot, HUMAN_AI_HEALTHITEMS)
			else
				tied_human.drop_held_item(bone_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] splinted a fracture of [target.name] using [bone_heal].")
#endif

	fire:
		if(target.getFireLoss() > damage_problem_threshold)
			var/obj/item/burn_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, burn_heal_items) && heal_item.ai_can_use(tied_human, src, target))
					burn_heal = heal_item
					break

			if(!burn_heal)
				goto pain

			if(!equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, burn_heal))
				healing_someone = FALSE
				return

			clear_main_hand()
			healing_someone = TRUE
			sleep(short_action_delay * action_delay_mult)
			burn_heal.ai_use(tied_human, src, target)
			if(QDELETED(burn_heal))
				goto pain

			var/storage_slot = storage_has_room(burn_heal)
			if(storage_slot)
				store_item(burn_heal, storage_slot, HUMAN_AI_HEALTHITEMS)
			else
				tied_human.drop_held_item(burn_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] healed burn damage of [target.name] using [burn_heal].")
#endif

	pain:
		// This has the issue of the AI taking multiple painkillers if high on pain, despite them not stacking. Not worth fixing atm
		if(target.pain.get_pain_percentage() > pain_percentage_threshold)
			var/obj/item/painkiller
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, painkiller_items) && heal_item.ai_can_use(tied_human, src, target))
					painkiller = heal_item
					break

			if(!painkiller)
				goto tox

			if(!equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, painkiller))
				healing_someone = FALSE
				return

			clear_main_hand()
			healing_someone = TRUE
			sleep(short_action_delay * action_delay_mult)
			painkiller.ai_use(tied_human, src, target)
			if(QDELETED(painkiller))
				goto tox

			var/storage_slot = storage_has_room(painkiller)
			if(storage_slot)
				store_item(painkiller, storage_slot, HUMAN_AI_HEALTHITEMS)
			else
				tied_human.drop_held_item(painkiller)
#ifdef TESTING
			to_chat(world, "[tied_human.name] healed pain of [target.name] using [painkiller].")
#endif

	tox:
		if(target.getToxLoss() > damage_problem_threshold)
			var/obj/item/tox_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, tox_heal_items) && heal_item.ai_can_use(tied_human, src, target))
					tox_heal = heal_item
					break

			if(!tox_heal)
				goto oxy

			if(!equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, tox_heal))
				healing_someone = FALSE
				return

			clear_main_hand()
			healing_someone = TRUE
			sleep(short_action_delay * action_delay_mult)
			tox_heal.ai_use(tied_human, src, target)
			if(QDELETED(tox_heal))
				goto oxy

			var/storage_slot = storage_has_room(tox_heal)
			if(storage_slot)
				store_item(tox_heal, storage_slot, HUMAN_AI_HEALTHITEMS)
			else
				tied_human.drop_held_item(tox_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] healed tox damage of [target.name] using [tox_heal].")
#endif

	oxy:
		if(target.getOxyLoss() > damage_problem_threshold)
			var/obj/item/oxy_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, oxy_heal_items) && heal_item.ai_can_use(tied_human, src, target))
					oxy_heal = heal_item

			if(!oxy_heal)
				healing_someone = FALSE
				return

			if(!equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, oxy_heal))
				healing_someone = FALSE
				return

			clear_main_hand()
			healing_someone = TRUE
			sleep(short_action_delay * action_delay_mult)
			oxy_heal.ai_use(tied_human, src, target)
			if(QDELETED(oxy_heal))
				healing_someone = FALSE
				return

			var/storage_slot = storage_has_room(oxy_heal)
			if(storage_slot)
				store_item(oxy_heal, storage_slot, HUMAN_AI_HEALTHITEMS)
			else
				tied_human.drop_held_item(oxy_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] healed oxygen damage of [target.name] using [oxy_heal].")
#endif
	healing_someone = FALSE
