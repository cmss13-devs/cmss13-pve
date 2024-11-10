GLOBAL_LIST_INIT_TYPED(firearm_appraisals, /datum/firearm_appraisal, build_firearm_appraisal_list())

/proc/build_firearm_appraisal_list()
	. = list()
	for(var/type in subtypesof(/datum/firearm_appraisal))
		. += new type


/datum/firearm_appraisal
	/// Minimum engagement range with weapon type
	var/minimum_range = 2
	/// Optimal engagement range, try to stay at this distance
	var/optimal_range = 6
	/// Maximum engagement range, stop firing at this distance
	var/maximum_range = 16
	/// How many rounds to fire in 1 burst at most
	var/burst_amount_max = 8
	/// List of types that set the human AI to this appraisal type
	var/list/gun_types = list()
	/// If TRUE, this gun is disposable and isn't worth trying to reload
	var/disposable = FALSE

/// List of things we do before beginning to spray bullets based off weapon type
/datum/firearm_appraisal/proc/before_fire(obj/item/weapon/gun/firearm, mob/living/carbon/user, datum/human_ai_brain/AI)
	SHOULD_CALL_PARENT(TRUE) // Every weapon may be twohanded or have safety
	set waitfor = FALSE

	AI.ensure_primary_hand(firearm)
	if((firearm.flags_item & TWOHANDED) && !(firearm.flags_item & WIELDED))
		AI.wield_primary_sleep()

	if(firearm.flags_gun_features & GUN_TRIGGER_SAFETY)
		firearm.flags_gun_features ^= GUN_TRIGGER_SAFETY
		firearm.gun_safety_handle(user)

/// Reload sequence per weapon type, override as needed
/datum/firearm_appraisal/proc/do_reload(obj/item/weapon/gun/firearm, obj/item/ammo_magazine/mag, mob/living/carbon/user, datum/human_ai_brain/AI)
	AI.unholster_primary()
	AI.ensure_primary_hand(firearm)
	firearm.unwield(user)
	sleep(AI.short_action_delay * AI.action_delay_mult)
	if(!(firearm?.flags_gun_features & GUN_INTERNAL_MAG) && firearm?.current_mag)
		firearm?.unload(user, FALSE, TRUE, FALSE)
	user.swap_hand()
	sleep(AI.micro_action_delay * AI.action_delay_mult)
	AI.equip_item_from_equipment_map(HUMAN_AI_AMMUNITION, mag)
	sleep(AI.short_action_delay * AI.action_delay_mult)
	if(istype(mag, /obj/item/ammo_magazine/handful))
		for(var/i in 1 to mag.current_rounds)
			firearm?.attackby(mag, user)
			sleep(AI.micro_action_delay * AI.action_delay_mult)
		if(!QDELETED(mag) && (mag.current_rounds > 0))
			var/storage_slot = AI.storage_has_room(mag)
			if(storage_slot)
				AI.store_item(mag, storage_slot, HUMAN_AI_AMMUNITION)
			else
				user.drop_held_item(mag)
	else
		firearm?.attackby(mag, user)
	sleep(AI.short_action_delay * AI.action_delay_mult)
	user.swap_hand()
	AI.wield_primary_sleep()

/datum/firearm_appraisal/sniper
	optimal_range = 7
	maximum_range = 30
	burst_amount_max = 1
	gun_types = list(
		/obj/item/weapon/gun/rifle/sniper,
	)

/datum/firearm_appraisal/rifle
	burst_amount_max = 8
	gun_types = list(
		/obj/item/weapon/gun/rifle,
	)

/datum/firearm_appraisal/smartgun
	burst_amount_max = 18
	gun_types = list(
		/obj/item/weapon/gun/smartgun,
	)

/datum/firearm_appraisal/smartgun/do_reload(obj/item/weapon/gun/firearm, obj/item/ammo_magazine/mag, mob/living/carbon/user, datum/human_ai_brain/AI)
	AI.unholster_primary()
	AI.ensure_primary_hand(firearm)
	firearm.unwield(user)
	user.swap_hand()
	firearm.clicked(user, list("alt" = TRUE))
	sleep(AI.short_action_delay * AI.action_delay_mult)
	user.swap_hand()
	if(!(firearm?.flags_gun_features & GUN_INTERNAL_MAG) && firearm?.current_mag)
		firearm?.unload(user, FALSE, TRUE, FALSE)
	user.swap_hand()
	sleep(AI.micro_action_delay * AI.action_delay_mult)
	AI.equip_item_from_equipment_map(HUMAN_AI_AMMUNITION, mag)
	sleep(AI.short_action_delay * AI.action_delay_mult)
	firearm?.attackby(mag, user)
	sleep(AI.short_action_delay * AI.action_delay_mult)
	firearm.clicked(user, list("alt" = TRUE))
	sleep(AI.short_action_delay * AI.action_delay_mult)
	user.swap_hand()
	AI.wield_primary_sleep()

/datum/firearm_appraisal/smg
	burst_amount_max = 10
	minimum_range = 1
	optimal_range = 5
	maximum_range = 10
	gun_types = list(
		/obj/item/weapon/gun/smg,
	)

/datum/firearm_appraisal/shotgun_db
	burst_amount_max = 2
	minimum_range = 1
	optimal_range = 1
	maximum_range = 3
	gun_types = list(
		/obj/item/weapon/gun/shotgun/double,
	)

/datum/firearm_appraisal/shotgun_db/do_reload(obj/item/weapon/gun/firearm, obj/item/ammo_magazine/mag, mob/living/carbon/user, datum/human_ai_brain/AI)
	AI.unholster_primary()
	AI.ensure_primary_hand(firearm)
	firearm.unwield(user)
	firearm.unique_action()
	user.swap_hand()
	sleep(AI.short_action_delay * AI.action_delay_mult)
	AI.equip_item_from_equipment_map(HUMAN_AI_AMMUNITION, mag)
	sleep(AI.short_action_delay * AI.action_delay_mult)
	firearm.attackby(mag, user)
	sleep(AI.micro_action_delay * AI.action_delay_mult)
	firearm.attackby(mag, user)
	if(!QDELETED(mag))
		var/storage_spot = AI.storage_has_room(mag)
		if(storage_spot)
			sleep(AI.micro_action_delay * AI.action_delay_mult)
			AI.store_item(mag, storage_spot, HUMAN_AI_AMMUNITION)
	sleep(AI.short_action_delay * AI.action_delay_mult)
	user.swap_hand()
	firearm.unique_action()
	AI.wield_primary_sleep()

/datum/firearm_appraisal/shotgun
	burst_amount_max = 2
	minimum_range = 1
	optimal_range = 1 // point-blank our beloved
	maximum_range = 3
	gun_types = list(
		/obj/item/weapon/gun/shotgun,
	)

/datum/firearm_appraisal/shotgun/before_fire(obj/item/weapon/gun/shotgun/firearm, mob/living/carbon/user, datum/human_ai_brain/AI)
	. = ..()
	if(firearm.in_chamber)
		return
	firearm.unique_action(user)

/datum/firearm_appraisal/boltaction
	optimal_range = 7
	maximum_range = 30
	burst_amount_max = 1
	gun_types = list(
		/obj/item/weapon/gun/boltaction,
	)

/datum/firearm_appraisal/boltaction/before_fire(obj/item/weapon/gun/boltaction/firearm, mob/living/carbon/user, datum/human_ai_brain/AI)
	. = ..()
	if(firearm.in_chamber)
		return
	firearm.unique_action(user)
	firearm.recent_cycle = world.time - firearm.bolt_delay
	firearm.unique_action(user)
	firearm.recent_cycle = world.time - firearm.bolt_delay

/datum/firearm_appraisal/flamer
	burst_amount_max = 1
	minimum_range = 5 // To not try and walk into our flames in tight spaces
	optimal_range = 5
	maximum_range = 5
	gun_types = list(
		/obj/item/weapon/gun/flamer,
	)

/datum/firearm_appraisal/rpg
	minimum_range = 5
	optimal_range = 6
	gun_types = list(
		/obj/item/weapon/gun/launcher/rocket/anti_tank/disposable,
	)
	disposable = TRUE

/datum/firearm_appraisal/rpg/multi_use
	gun_types = list(
		/obj/item/weapon/gun/launcher/rocket,
	)
	disposable = FALSE
