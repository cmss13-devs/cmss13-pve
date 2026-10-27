/obj/item/reagent_container/food/condiment/juice
	name = "Juice Packet"
	desc = "A small packet of dehydrated fruit-juice powder. Mix with water for a 'tasty' beverage. This one appears to be missing the label indicating what flavor it is however."
	w_class = SIZE_TINY
	icon = 'modular_pve/icons/obj/items/food.dmi'
	icon_state = "bjpowder"
	amount_per_transfer_from_this = 1
	volume = 6

/obj/item/reagent_container/food/condiment/juice/orange
	name = "Orange Juice Packet"
	desc = "A small packet of orange flavored drink mix, sweetened with sugar alcohols. For best results, mix with water instead of consuming standalone."
	icon_state = "ojpowder"

/obj/item/reagent_container/food/condiment/juice/orange/Initialize()
	. = ..()
	reagents.add_reagent("dehydrated_orange_juice", 6)

/obj/item/reagent_container/food/condiment/juice/apple
	name = "Apple Juice Packet"
	desc = "A small packet of apple flavored drink mix, sweetened with sugar alcohols. For best results, mix with water instead of consuming standalone."
	icon_state = "ajpowder"

/obj/item/reagent_container/food/condiment/juice/apple/Initialize()
	. = ..()
	reagents.add_reagent("dehydrated_apple_juice", 6)

/obj/item/reagent_container/food/condiment/juice/watermelon
	name = "Watermelon Juice Packet"
	desc = "A small packet of watermelon flavored drink mix, sweetened with sugar alcohols. For best results, mix with water instead of consuming standalone."
	icon_state = "wjpowder"

/obj/item/reagent_container/food/condiment/juice/watermelon/Initialize()
	. = ..()
	reagents.add_reagent("dehydrated_watermelon_juice", 6)

/obj/item/reagent_container/food/condiment/juice/grape
	name = "Grape Juice Packet"
	desc = "A small packet of grape flavored drink mix, sweetened with sugar alcohols. For best results, mix with water instead of consuming standalone."
	icon_state = "gjpowder"

/obj/item/reagent_container/food/condiment/juice/grape/Initialize()
	. = ..()
	reagents.add_reagent("dehydrated_grape_juice", 6)

/obj/item/reagent_container/food/condiment/juice/pineapple
	name = "Pineapple Juice Packet"
	desc = "A small packet of pineapple flavored drink mix, sweetened with sugar alcohols. For best results, mix with water instead of consuming standalone."
	icon_state = "pjpowder"

/obj/item/reagent_container/food/condiment/juice/pineapple/Initialize()
	. = ..()
	reagents.add_reagent("dehydrated_pineapple_juice", 6)

/obj/item/reagent_container/food/condiment/juice/egg
	name = "Powdered Egg Packet"
	desc = "A small packet of dehydrated egg-whites and egg-yolk powder. Mix with water for a passable alternative to the real deal."
	icon_state = "eggpowder"
	volume = 12
	w_class = SIZE_SMALL

/obj/item/reagent_container/food/condiment/juice/egg/Initialize()
	. = ..()
	reagents.add_reagent("dehydrated_egg_powder", 12)

/obj/item/reagent_container/food/condiment/juice/milk
	name = "Dehydrated Milk Packet"
	desc = "A small packet of dehydrated milk powder. Mix with water for a passable alternative to actual milk."
	icon_state = "milkpowder"
	amount_per_transfer_from_this = 1
	volume = 12
	w_class = SIZE_SMALL

/obj/item/reagent_container/food/condiment/juice/milk/Initialize()
	. = ..()
	reagents.add_reagent("dehydrated_milk_powder", 12)
