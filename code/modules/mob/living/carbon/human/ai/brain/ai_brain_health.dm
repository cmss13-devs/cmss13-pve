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

	/// Populated in New()
	var/static/list/all_medical_items = list()

	/// At what percentage of max HP to start searching for medical treatment
	var/healing_start_threshold = 0.7
	/// Requires this much damage of one type to consider it a problem
	var/damage_problem_threshold = 5
	/// Pain percentage (out of 100) for the AI to consider using painkillers
	var/pain_percentage_threshold = 1

	/// Cooldown on using pills to avoid OD. This isn't the best solution as it prevents the AI from using more than 1 pill of any kind every 10s, but it'll work for now
	COOLDOWN_DECLARE(pill_use_cooldown)

/datum/human_ai_brain/proc/healing_start_check()
	return ((tied_human.health / tied_human.maxHealth) <= healing_start_threshold) || tied_human.is_bleeding() || tied_human.has_broken_limbs()

/datum/human_ai_brain/proc/start_healing()
	set waitfor = FALSE

	currently_busy = TRUE
	// Prioritize brute, then bleed, then broken bones, then burn, then pain, then tox, then oxy.
	if(tied_human.getBruteLoss() > damage_problem_threshold)
		var/obj/item/brute_heal
		for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
			if(is_type_in_list(heal_item, brute_heal_items) && heal_item.ai_can_use(tied_human))
				brute_heal = heal_item
				break

		if(!brute_heal)
			goto bleed

		end_gun_fire()
		holster_primary()
		equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, brute_heal)
		sleep(short_action_delay)
		brute_heal.ai_use(tied_human)
		sleep(short_action_delay)
		if(!QDELETED(brute_heal))
			store_item(brute_heal)
#ifdef TESTING
		to_chat(world, "[tied_human.name] healed brute damage using [brute_heal].")
#endif

	bleed:
		if(tied_human.is_bleeding())
			var/obj/item/bleed_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, bleed_heal_items) && heal_item.ai_can_use(tied_human))
					bleed_heal = heal_item
					break

			if(!bleed_heal)
				goto bone

			holster_primary()
			equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, bleed_heal)
			sleep(short_action_delay)
			bleed_heal.ai_use(tied_human)
			sleep(short_action_delay)
			if(!QDELETED(bleed_heal))
				store_item(bleed_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] fixed bleeding using [bleed_heal].")
#endif

	// Doesn't support bone-healing chems
	bone:
		if(tied_human.has_broken_limbs())
			var/obj/item/bone_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, bonebreak_heal_items) && heal_item.ai_can_use(tied_human))
					bone_heal = heal_item
					break

			if(!bone_heal)
				goto fire

			holster_primary()
			equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, bone_heal)
			sleep(short_action_delay)
			bone_heal.ai_use(tied_human)
			sleep(short_action_delay)
			if(!QDELETED(bone_heal))
				store_item(bone_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] splinted a fracture using [bone_heal].")
#endif

	fire:
		if(tied_human.getFireLoss() > damage_problem_threshold)
			var/obj/item/burn_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, burn_heal_items) && heal_item.ai_can_use(tied_human))
					burn_heal = heal_item
					break

			if(!burn_heal)
				goto pain

			holster_primary()
			equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, burn_heal)
			sleep(short_action_delay)
			burn_heal.ai_use(tied_human)
			sleep(short_action_delay)
			if(!QDELETED(burn_heal))
				store_item(burn_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] healed burn damage using [burn_heal].")
#endif

	pain:
		// This has the issue of the AI taking multiple painkillers if high on pain, despite them not stacking. Not worth fixing atm
		if(tied_human.pain.get_pain_percentage() > pain_percentage_threshold)
			var/obj/item/painkiller
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, painkiller_items) && heal_item.ai_can_use(tied_human))
					painkiller = heal_item
					break

			if(!painkiller)
				goto tox

			holster_primary()
			equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, painkiller)
			sleep(short_action_delay)
			painkiller.ai_use(tied_human)
			sleep(short_action_delay)
			if(!QDELETED(painkiller))
				store_item(painkiller)
#ifdef TESTING
			to_chat(world, "[tied_human.name] healed pain using [painkiller].")
#endif

	tox:
		if(tied_human.getToxLoss() > damage_problem_threshold)
			var/obj/item/tox_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, tox_heal_items) && heal_item.ai_can_use(tied_human))
					tox_heal = heal_item
					break

			if(!tox_heal)
				goto oxy

			holster_primary()
			equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, tox_heal)
			sleep(short_action_delay)
			tox_heal.ai_use(tied_human)
			sleep(short_action_delay)
			if(!QDELETED(tox_heal))
				store_item(tox_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] healed tox damage using [tox_heal].")
#endif

	oxy:
		if(tied_human.getOxyLoss() > damage_problem_threshold)
			var/obj/item/oxy_heal
			for(var/obj/item/heal_item as anything in equipment_map[HUMAN_AI_HEALTHITEMS])
				if(is_type_in_list(heal_item, oxy_heal_items) && heal_item.ai_can_use(tied_human))
					oxy_heal = heal_item

			if(!oxy_heal)
				return

			holster_primary()
			equip_item_from_equipment_map(HUMAN_AI_HEALTHITEMS, oxy_heal)
			sleep(short_action_delay)
			oxy_heal.ai_use(tied_human)
			sleep(short_action_delay)
			if(!QDELETED(oxy_heal))
				store_item(oxy_heal)
#ifdef TESTING
			to_chat(world, "[tied_human.name] healed oxygen damage using [oxy_heal].")
#endif
	currently_busy = FALSE
