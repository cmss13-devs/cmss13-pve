// define decorator type
/datum/decorator/christmas
	priority = DECORATOR_DAY_SPECIFIC


// define when you wanna decorate
/datum/decorator/christmas/is_active_decor()
	return is_month(12) && (is_day(21) || is_day(22) || is_day(23) || is_day(24) || is_day(25) || is_day(26))

/// Replaces marine food dispensers contents with more festive MREs
/datum/decorator/christmas/food

/datum/decorator/christmas/food/get_decor_types()
	return list(/obj/structure/machinery/cm_vending/sorted/marine_food)

/datum/decorator/christmas/food/decorate(obj/structure/machinery/cm_vending/sorted/marine_food/dispenser)
	// This happens during atom init before vending init, so we can hotswap the list before it gets processed
	dispenser.listed_products = list(
		list("CHRISTMAS MEALS", -1, null, null), //Jummy Christmas Food
		list("Xmas Prepared Meal (Fruitcake)", 25, /obj/item/reagent_container/food/snacks/mre_pack/xmas3, VENDOR_ITEM_REGULAR),
		list("Xmas Prepared Meal (Gingerbread Cookies)", 25, /obj/item/reagent_container/food/snacks/mre_pack/xmas2, VENDOR_ITEM_REGULAR),
		list("Xmas Prepared Meal (Sugar Cookies)", 25, /obj/item/reagent_container/food/snacks/mre_pack/xmas1, VENDOR_ITEM_REGULAR),

		list("FLASKS", -1, null, null),
		list("Canteen", 10, /obj/item/reagent_container/food/drinks/flask/canteen, VENDOR_ITEM_REGULAR),
		list("Metal Flask", 10, /obj/item/reagent_container/food/drinks/flask, VENDOR_ITEM_REGULAR),
		list("USCM Flask", 5, /obj/item/reagent_container/food/drinks/flask/marine, VENDOR_ITEM_REGULAR),
		list("W-Y Flask", 5, /obj/item/reagent_container/food/drinks/flask/weylandyutani, VENDOR_ITEM_REGULAR),
	)

/datum/decorator/christmas/builder_list/get_decor_types()
	return typesof(/mob/living/carbon/xenomorph)

/datum/decorator/christmas/builder_list/decorate(mob/living/carbon/xenomorph/Xeno)
	if(!istype(Xeno))
		return
	LAZYDISTINCTADD(Xeno.resin_build_order, /datum/resin_construction/resin_obj/festivizer)
