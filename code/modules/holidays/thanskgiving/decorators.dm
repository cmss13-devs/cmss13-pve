/datum/game_decorator/thanksgiving

/datum/game_decorator/thanksgiving/is_active_decor()
	return (text2num(time2text(world.timeofday, "MM")) == 11) && (text2num(time2text(world.timeofday, "DD")) == 23)

/datum/game_decorator/thanksgiving/turkey_meals

/datum/game_decorator/thanksgiving/turkey_meals/decorate()
	. = ..()

	for(var/obj/structure/machinery/cm_vending/sorted/marine_food/cycled_food_vendor in world)
		cycled_food_vendor.listed_products = list(
			list("PREPARED MEALS", -1, null, null),
			list("USCM Prepared Meal (Turkey)", 15, /obj/item/reagent_container/food/snacks/mre_pack/thanksgiving, VENDOR_ITEM_REGULAR),
			list("USCM Protein Bar", 50, /obj/item/reagent_container/food/snacks/protein_pack, VENDOR_ITEM_REGULAR),
			list("FLASKS", -1, null, null),
			list("Canteen", 10, /obj/item/reagent_container/food/drinks/flask/canteen, VENDOR_ITEM_REGULAR),
			list("Metal Flask", 10, /obj/item/reagent_container/food/drinks/flask, VENDOR_ITEM_REGULAR),
			list("USCM Flask", 5, /obj/item/reagent_container/food/drinks/flask/marine, VENDOR_ITEM_REGULAR),
			list("W-Y Flask", 5, /obj/item/reagent_container/food/drinks/flask/weylandyutani, VENDOR_ITEM_REGULAR)
		)
