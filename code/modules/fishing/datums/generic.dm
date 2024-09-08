GLOBAL_LIST_EMPTY(fishing_loot_tables)

/datum/fish_loot_table
	var/list/common_fishable_atoms = list(
		/obj/item/prop/scrap,
		/obj/item/trash/crushed_cup,
		/obj/item/trash/c_tube,
		/obj/item/trash/cigbutt/bcigbutt,
		/obj/item/trash/cigbutt/cigarbutt
	)
	var/list/uncommon_fishable_atoms = list(
		/obj/item/reagent_container/food/snacks/fishable/squid/whorl,
		/obj/item/reagent_container/food/snacks/fishable/crab
	)
	var/list/rare_fishable_atoms = list(
		/obj/item/reagent_container/food/snacks/microwavable/packaged_burrito,
		/obj/item/coin/silver
	)
	var/list/ultra_rare_fishable_atoms = list(
		/obj/item/reagent_container/food/snacks/fishable/quadtopus
	)

/datum/fish_loot_table/proc/return_caught_fish(common_weight, uncommon_weight, rare_weight, ultra_rare_weight)
	if(prob(common_weight))
		return pick(common_fishable_atoms)
	else if (prob(uncommon_weight))
		return pick(uncommon_fishable_atoms)
	else if (prob(rare_weight))
		return pick(rare_fishable_atoms)
	else if (prob(ultra_rare_weight))
		return pick(ultra_rare_fishable_atoms)
	return pick(common_fishable_atoms)
