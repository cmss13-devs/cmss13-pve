GLOBAL_LIST_INIT_TYPED(firearm_appraisals, /datum/firearm_appraisal, build_firearm_appraisal_list())

/proc/build_firearm_appraisal_list()
	. = list()
	for(var/type in subtypesof(/datum/firearm_appraisal))
		. += new type


/datum/firearm_appraisal
	/// Minimum engagement range with weapon type
	var/minimum_range = 0
	/// Maximum engagement range
	var/maximum_range = 7
	/// How many rounds to fire in 1 burst at most
	var/burst_amount_max = 8
	/// List of types that set the human AI to this appraisal type
	var/list/gun_types = list()

/datum/firearm_appraisal/rifle
	burst_amount_max = 8
	gun_types = list(
		/obj/item/weapon/gun/rifle,
	)

/datum/firearm_appraisal/smg
	burst_amount_max = 10
	maximum_range = 6
	gun_types = list(
		/obj/item/weapon/gun/smg,
	)

/datum/firearm_appraisal/shotgun
	burst_amount_max = 2
	maximum_range = 3
	gun_types = list(
		/obj/item/weapon/gun/shotgun,
	)
