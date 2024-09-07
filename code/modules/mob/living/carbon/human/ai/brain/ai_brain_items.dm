/datum/human_ai_brain
	var/list/equipped_items_original_loc = list()

	/// list("object_type" = list(object_ref = "slot")
	var/list/equipment_map = list(
		HUMAN_AI_HEALTHITEMS = list(),
		HUMAN_AI_AMMUNITION = list(),
	)

	var/list/container_refs = list(
		"belt" = null,
		"backpack" = null,
		"left_pocket" = null,
		"right_pocket" = null,
	)

	var/static/list/important_storage_slots = list(
		WEAR_BACK,
		WEAR_WAIST,
		WEAR_L_STORE,
		WEAR_R_STORE,
	)

/datum/human_ai_brain/proc/get_object_from_loc(object_loc)
	RETURN_TYPE(/obj/item/storage)

	var/obj/item/storage/storage_object
	switch(object_loc)
		if("belt")
			storage_object = tied_human.belt
		if("backpack")
			storage_object = tied_human.back
		if("left_pocket")
			storage_object = tied_human.l_store
		if("right_pocket")
			storage_object = tied_human.r_store
	return storage_object

/datum/human_ai_brain/proc/equip_item_from_equipment_map(object_type, obj/item/object_ref)
	if(!object_type || !object_ref)
		return

	var/object_loc = equipment_map[object_type][object_ref]
	var/obj/item/storage/storage_object = get_object_from_loc(object_loc)

	storage_object.remove_from_storage(object_ref, tied_human)
	equipped_items_original_loc[object_ref] = object_loc
	RegisterSignal(object_ref, COMSIG_ITEM_DROPPED, PROC_REF(on_equipment_dropped))

/datum/human_ai_brain/proc/store_item(obj/item/object_ref, object_loc)
	if(object_ref.loc != tied_human)
		return

	if(object_ref in equipped_items_original_loc)
		var/obj/item/storage/storage_object = get_object_from_loc(equipped_items_original_loc[object_ref])
		equipped_items_original_loc -= object_ref
		storage_object.attempt_item_insertion(object_ref, FALSE, tied_human)
	else if(object_loc) // we assume that we've already checked if something will fit or not
		var/obj/item/storage/storage_item = container_refs[object_loc]
		storage_item.attempt_item_insertion(object_ref, FALSE, tied_human)


/// Whenever an item is deleted, purge it from anywhere it may be stored in here
/datum/human_ai_brain/proc/on_item_delete(obj/item/source, force)
	SIGNAL_HANDLER
	for(var/name in container_refs)
		if(source == container_refs[name])
			container_refs[name] = null
			return

	for(var/id in equipment_map)
		for(var/obj/item/item_ref as anything in equipment_map[id])
			if(source == item_ref)
				equipment_map[id] -= item_ref
				return

/datum/human_ai_brain/proc/on_item_equip(datum/source, obj/item/equipment, slot)
	SIGNAL_HANDLER

	if((slot in important_storage_slots) && istype(equipment, /obj/item/storage))
		recalculate_containers()
		appraise_inventory(slot == WEAR_WAIST, slot == WEAR_BACK, slot == WEAR_L_STORE, slot == WEAR_R_STORE)

	if(!primary_weapon && isgun(equipment))
		set_primary_weapon(equipment)

/datum/human_ai_brain/proc/on_item_unequip(datum/source, obj/item/equipment, slot)
	SIGNAL_HANDLER

	if((slot in important_storage_slots) && istype(equipment, /obj/item/storage))
		recalculate_containers()
		appraise_inventory(slot == WEAR_WAIST, slot == WEAR_BACK, slot == WEAR_L_STORE, slot == WEAR_R_STORE)

	if(isgun(equipment))
		appraise_inventory(FALSE, FALSE, FALSE, FALSE)

/datum/human_ai_brain/proc/recalculate_containers()
	container_refs = list(
		"belt" = tied_human.belt,
		"backpack" = tied_human.back,
		"left_pocket" = tied_human.l_store,
		"right_pocket" = tied_human.r_store,
	)

/// Currently doesn't support recursive storage
/datum/human_ai_brain/proc/appraise_inventory(belt = TRUE, back = TRUE, pocket_l = TRUE, pocket_r = TRUE)
	tried_reload = FALSE // We don't really need to do this in a smart way
	if(belt)
		if(!istype(tied_human.belt, /obj/item/storage/belt))
			return

		for(var/id in equipment_map)
			for(var/obj/item/item as anything in equipment_map[id])
				if(equipment_map[id][item] != "belt")
					continue

				equipment_map[id] -= item

		RegisterSignal(tied_human.belt, COMSIG_PARENT_QDELETING, PROC_REF(on_item_delete), TRUE)
		for(var/obj/item/inv_item as anything in tied_human.belt)
			RegisterSignal(inv_item, COMSIG_PARENT_QDELETING, PROC_REF(on_item_delete), TRUE)
			if(inv_item.flags_item & HEALING_ITEM)
				// only trauma kits and similar for now for ease of development
				equipment_map[HUMAN_AI_HEALTHITEMS][inv_item] = "belt"
			else if(inv_item.flags_item & AMMUNITION_ITEM)
				equipment_map[HUMAN_AI_AMMUNITION][inv_item] = "belt"

	if(back)
		if(!istype(tied_human.back, /obj/item/storage/backpack))
			return

		for(var/id in equipment_map)
			for(var/obj/item/item as anything in equipment_map[id])
				if(equipment_map[id][item] != "backpack")
					continue

				equipment_map[id] -= item

		RegisterSignal(tied_human.back, COMSIG_PARENT_QDELETING, PROC_REF(on_item_delete), TRUE)
		for(var/obj/item/inv_item as anything in tied_human.back)
			RegisterSignal(inv_item, COMSIG_PARENT_QDELETING, PROC_REF(on_item_delete), TRUE)
			if(inv_item.flags_item & HEALING_ITEM)
				// only trauma kits and similar for now for ease of development
				equipment_map[HUMAN_AI_HEALTHITEMS][inv_item] = "backpack"
			else if(inv_item.flags_item & AMMUNITION_ITEM)
				equipment_map[HUMAN_AI_AMMUNITION][inv_item] = "backpack"

	if(pocket_l)
		if(!istype(tied_human.l_store, /obj/item/storage/pouch))
			return

		for(var/id in equipment_map)
			for(var/obj/item/item as anything in equipment_map[id])
				if(equipment_map[id][item] != "left_pocket")
					continue

				equipment_map[id] -= item

		RegisterSignal(tied_human.l_store, COMSIG_PARENT_QDELETING, PROC_REF(on_item_delete), TRUE)
		for(var/obj/item/inv_item as anything in tied_human.l_store)
			RegisterSignal(inv_item, COMSIG_PARENT_QDELETING, PROC_REF(on_item_delete), TRUE)
			if(inv_item.flags_item & HEALING_ITEM)
				// only trauma kits and similar for now for ease of development
				equipment_map[HUMAN_AI_HEALTHITEMS][inv_item] = "left_pocket"
			else if(inv_item.flags_item & AMMUNITION_ITEM)
				equipment_map[HUMAN_AI_AMMUNITION][inv_item] = "left_pocket"

	if(pocket_r)
		if(!istype(tied_human.r_store, /obj/item/storage/pouch))
			return

		for(var/id in equipment_map)
			for(var/obj/item/item as anything in equipment_map[id])
				if(equipment_map[id][item] != "right_pocket")
					continue

				equipment_map[id] -= item

		RegisterSignal(tied_human.r_store, COMSIG_PARENT_QDELETING, PROC_REF(on_item_delete), TRUE)
		for(var/obj/item/inv_item as anything in tied_human.r_store)
			RegisterSignal(inv_item, COMSIG_PARENT_QDELETING, PROC_REF(on_item_delete), TRUE)
			if(inv_item.flags_item & HEALING_ITEM)
				// only trauma kits and similar for now for ease of development
				equipment_map[HUMAN_AI_HEALTHITEMS][inv_item] = "right_pocket"
			else if(inv_item.flags_item & AMMUNITION_ITEM)
				equipment_map[HUMAN_AI_AMMUNITION][inv_item] = "right_pocket"

/datum/human_ai_brain/proc/clear_main_hand()
	var/obj/item/active_hand = tied_human.get_active_hand()
	if(!active_hand)
		return

	if(primary_weapon == active_hand)
		holster_primary()
		return

	var/storage_id = storage_has_room(active_hand)
	if(!storage_id)
		tied_human.drop_held_item(active_hand)
		return

	store_item(active_hand, storage_id)

/datum/human_ai_brain/proc/storage_has_room(obj/item/inserting)
	for(var/container_id in container_refs)
		var/obj/item/storage/container = container_refs[container_id]
		if(container?.can_be_inserted(inserting, tied_human, TRUE))
			return container_id

/datum/human_ai_brain/proc/on_equipment_dropped(obj/item/source, mob/dropper)
	SIGNAL_HANDLER

	if(isturf(source.loc))
		equipped_items_original_loc -= source
		UnregisterSignal(source, COMSIG_ITEM_DROPPED)

/datum/human_ai_brain/proc/on_item_pickup(datum/source, obj/item/picked_up)
	SIGNAL_HANDLER

	if(!primary_weapon && isgun(picked_up))
		set_primary_weapon(picked_up)

/datum/human_ai_brain/proc/on_item_drop(datum/source, obj/item/dropped)
	SIGNAL_HANDLER

	if(dropped == primary_weapon)
		set_primary_weapon(null)
		ADD_ONGOING_ACTION(src, /datum/ongoing_action/item_pickup, dropped)
	for(var/slot in container_refs)
		if(container_refs[slot] == dropped)
			appraise_inventory(slot == "belt", slot == "backpack", slot == "left_pocket", slot == "right_pocket")
			break

/datum/human_ai_brain/proc/set_primary_weapon(obj/item/weapon/gun/new_gun)
	if(primary_weapon)
		UnregisterSignal(primary_weapon, COMSIG_PARENT_QDELETING)
	primary_weapon = new_gun
	appraise_primary()
	if(primary_weapon)
		RegisterSignal(primary_weapon, COMSIG_PARENT_QDELETING, PROC_REF(on_primary_delete))

/datum/human_ai_brain/proc/on_primary_delete(datum/source, force)
	SIGNAL_HANDLER

	set_primary_weapon(null)

/datum/human_ai_brain/proc/appraise_primary()
	if(!primary_weapon)
		return
	var/static/datum/firearm_appraisal/default = new()
	for(var/datum/firearm_appraisal/appraisal as anything in GLOB.firearm_appraisals)
		if(is_type_in_list(primary_weapon, appraisal.gun_types))
			gun_data = appraisal
			break
			
	if(!gun_data)
		gun_data = default

/datum/human_ai_brain/proc/item_search(list/things_around)
	for(var/obj/item/thing in things_around)
		if(!isturf(thing.loc))
			continue

		if(!primary_weapon && isgun(thing))
			ADD_ONGOING_ACTION(src, /datum/ongoing_action/item_pickup, thing)
			break

		if(istype(thing, /obj/item/storage/belt) && !container_refs["belt"])
			ADD_ONGOING_ACTION(src, /datum/ongoing_action/item_pickup, thing)
			break

		if(istype(thing, /obj/item/storage/backpack) && !container_refs["backpack"])
			ADD_ONGOING_ACTION(src, /datum/ongoing_action/item_pickup, thing)
			break

		if(istype(thing, /obj/item/storage/pouch) && (!container_refs["left_pocket"] || !container_refs["right_pocket"]))
			ADD_ONGOING_ACTION(src, /datum/ongoing_action/item_pickup, thing)
			break

		var/storage_spot = storage_has_room(thing)
		if(!storage_spot || !thing.ai_can_use(tied_human))
			continue

		if(is_type_in_list(thing, all_medical_items))
			ADD_ONGOING_ACTION(src, /datum/ongoing_action/item_pickup, thing)
			break

		else if(primary_weapon && istype(thing, /obj/item/ammo_magazine))
			var/obj/item/ammo_magazine/mag = thing
			if(istype(primary_weapon, mag.gun_type))
				ADD_ONGOING_ACTION(src, /datum/ongoing_action/item_pickup, thing)
				break

