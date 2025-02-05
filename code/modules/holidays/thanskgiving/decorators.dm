/datum/game_decorator/thanksgiving

/datum/game_decorator/thanksgiving/is_active_decor()
	return (text2num(time2text(world.timeofday, "MM")) == 11) && (text2num(time2text(world.timeofday, "DD")) == 23)

/datum/game_decorator/thanksgiving/turkey_meals

/datum/game_decorator/thanksgiving/turkey_meals/decorate()
	. = ..()

	for(var/obj/structure/machinery/cm_vending/sorted/marine_food/cycled_food_vendor in world)
		cycled_food_vendor.listed_products = list(
			list("MECHANICALLY PREPARED MEALS", -1, null, null),
			list("Autumn Holiday Menu 1: Turkey and Potatoes", 10, /obj/item/reagent_container/food/snacks/mre_pack/thanksgiving, VENDOR_ITEM_REGULAR),
			list("Autumn Holiday Menu 2: Steak and Potatoes", 10, /obj/item/reagent_container/food/snacks/mre_pack/thanksgiving2, VENDOR_ITEM_REGULAR),
			list("Autumn Holiday Menu 3: Shrimp and Rice", 10, /obj/item/reagent_container/food/snacks/mre_pack/thanksgiving3, VENDOR_ITEM_REGULAR),
			// these spaces are purely for readability. Preemptive Action is an unsubtle reference to First Strike Bars.
			list("PREEMPTIVE ACTION BARS", -1, null, null),
			list("Chocolate Flavor", 50, /obj/item/reagent_container/food/snacks/protein_pack, VENDOR_ITEM_REGULAR),
			list("Strawberry Flavor", 50, /obj/item/reagent_container/food/snacks/protein_pack2, VENDOR_ITEM_REGULAR),
			list("Vanilla Flavor", 50, /obj/item/reagent_container/food/snacks/protein_pack3, VENDOR_ITEM_REGULAR),
			// I kind of wish there was just a generic sweet mix.
			list("DRINK MIXES", -1, null, null),
			list("Orange Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/orange, VENDOR_ITEM_REGULAR),
			list("Apple Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/apple, VENDOR_ITEM_REGULAR),
			list("Watermelon Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/watermelon, VENDOR_ITEM_REGULAR),
			list("Grape Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/grape, VENDOR_ITEM_REGULAR),
			list("Pineapple Drink Packet", 15, /obj/item/reagent_container/food/condiment/juice/pineapple, VENDOR_ITEM_REGULAR),
			//hopefully this dont screw up nothing.
			list("FLASKS", -1, null, null),
			list("Canteen", 10, /obj/item/reagent_container/food/drinks/flask/canteen, VENDOR_ITEM_REGULAR),
			list("Metal Flask", 10, /obj/item/reagent_container/food/drinks/flask, VENDOR_ITEM_REGULAR),
			list("USCM Flask", 5, /obj/item/reagent_container/food/drinks/flask/marine, VENDOR_ITEM_REGULAR),
			list("W-Y Flask", 5, /obj/item/reagent_container/food/drinks/flask/weylandyutani, VENDOR_ITEM_REGULAR)
		)
