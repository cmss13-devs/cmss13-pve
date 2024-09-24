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
	var/maximum_range = 9
	/// How many rounds to fire in 1 burst at most
	var/burst_amount_max = 8
	/// List of types that set the human AI to this appraisal type
	var/list/gun_types = list()
	/// If TRUE, this gun is disposable and isn't worth trying to reload
	var/disposable = FALSE

/// List of things we do before our next fire based on weapon type
/datum/firearm_appraisal/proc/before_fire(obj/item/weapon/gun/firearm, mob/living/carbon/user, datum/human_ai_brain/AI)
	SHOULD_CALL_PARENT(TRUE) // Every weapon can be twohanded
	AI.ensure_primary_hand(firearm)
	if((firearm.flags_item & TWOHANDED) && !(firearm.flags_item & WIELDED))
		firearm.wield(user)
		sleep(max(firearm.wield_delay, AI.short_action_delay * AI.action_delay_mult))

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

/datum/firearm_appraisal/smg
	burst_amount_max = 10
	minimum_range = 1
	optimal_range = 5
	gun_types = list(
		/obj/item/weapon/gun/smg,
	)

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
	gun_types = list(
		/obj/item/weapon/gun/boltaction,
	)

/datum/firearm_appraisal/boltaction/before_fire(obj/item/weapon/gun/boltaction/firearm, mob/living/carbon/user, datum/human_ai_brain/AI)
	. = ..()
	if(firearm.in_chamber)
		return
	firearm.unique_action(user)
	firearm.recent_cycle = world.time
	firearm.unique_action(user)
	firearm.recent_cycle = world.time

/datum/firearm_appraisal/flamer
	burst_amount_max = 1
	minimum_range = 5 // To not try and walk into our flames in tight spaces
	optimal_range = 5
	maximum_range = 5
	gun_types = list(
		/obj/item/weapon/gun/flamer,
	)

/datum/firearm_appraisal/flamer/before_fire(obj/item/weapon/gun/flamer/firearm, mob/living/carbon/user, datum/human_ai_brain/AI)
	. = ..()
	if(firearm.flags_gun_features & GUN_TRIGGER_SAFETY)
		firearm.flags_gun_features ^= GUN_TRIGGER_SAFETY
		firearm.gun_safety_handle(user)

/datum/firearm_appraisal/rpg
	minimum_range = 5
	optimal_range = 6
	gun_types = list(
		/obj/item/weapon/gun/launcher/rocket/anti_tank/disposable,
	)
	disposable = TRUE

/datum/firearm_appraisal/rpg/multi_use
	gun_types = list(
		/obj/item/weapon/gun/launcher/rocket
	)
	disposable = FALSE
