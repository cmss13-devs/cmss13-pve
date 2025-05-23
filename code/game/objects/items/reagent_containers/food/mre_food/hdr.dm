//USCM

/obj/item/mre_food_packet/hdr
	icon = 'icons/obj/items/food/mre_food/hdr.dmi'

///ENTREE

/obj/item/mre_food_packet/entree/hdr
	name = "\improper HDR main dish"
	desc = "One of two HDR entree components. Best mixed with the other entree."
	icon = 'icons/obj/items/food/mre_food/hdr.dmi'
	icon_state = "entree"
	food_list = list(
		/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/beanstomato,
		/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/splitpea,
	)

/obj/item/mre_food_packet/entree/hdr/two
	food_list = list(
		/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/yellowrice,
		/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/herbrice,
	)

/obj/item/reagent_container/food/snacks/mre_food/hdr
	icon = 'icons/obj/items/food/mre_food/hdr.dmi'

/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/beanstomato
	name = "beans in tomato sauce"
	icon_state = "beans tomato sauce"
	desc = "Red beans in thick tomato sauce. Food gift from the people of United Americas!"

/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/beanstomato/Initialize()
	. = ..()
	reagents.add_reagent("vegetable", 20)
	reagents.add_reagent("tomatojuice", 5)
	reagents.add_reagent("sodiumchloride", 2)

/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/splitpea
	name = "split pea soup"
	icon_state = "split pea soup"
	desc = "While not the most pleasant looking dish, it is quite tasty and filling. Food gift from the people of United Americas!"

/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/splitpea/Initialize()
	. = ..()
	reagents.add_reagent("vegetable", 25)
	reagents.add_reagent("sodiumchloride", 2)

/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/yellowrice
	name = "yellow rice"
	icon_state = "yellow rice"
	desc = "Plain rice with some saffron added for flavoring. Food gift from the people of United Americas!"

/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/yellowrice/Initialize()
	. = ..()
	reagents.add_reagent("rice", 25)
	reagents.add_reagent("sodiumchloride", 2)

/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/herbrice
	name = "herb rice"
	icon_state = "herb rice"
	desc = "Plain rice with some herbs added for flavoring. Food gift from the people of United Americas!"

/obj/item/reagent_container/food/snacks/mre_food/hdr/entree/herbrice/Initialize()
	. = ..()
	reagents.add_reagent("rice", 20)
	reagents.add_reagent("vegetable", 5)
	reagents.add_reagent("sodiumchloride", 2)

/obj/item/mre_food_packet/hdr/side
	name = "\improper HDR side dish"
	desc = "An HDR side component. Contains a side, to be eaten alongside the main."
	icon_state = "side"
	food_list = list(
		/obj/item/reagent_container/food/snacks/mre_food/hdr/side/shortbread,
		/obj/item/reagent_container/food/snacks/mre_food/hdr/side/vegetablecrackers,
	)

/obj/item/reagent_container/food/snacks/mre_food/hdr/side/shortbread
	name = "shortbread"
	icon_state = "shortbread"
	desc = "Plain shortbread. You could clack two together for some nice rythm. Food gift from the people of United Americas!"

/obj/item/reagent_container/food/snacks/mre_food/hdr/side/shortbread/Initialize()
	. = ..()
	reagents.add_reagent("bread", 8)
	reagents.add_reagent("sodiumchloride", 2)

/obj/item/reagent_container/food/snacks/mre_food/hdr/side/vegetablecrackers
	name = "vegetable crackers"
	icon_state = "vegetable crackers"
	desc = "Thin baked bread squares with dried vegetables sprinkled on top. Food gift from the people of United Americas!"

/obj/item/reagent_container/food/snacks/mre_food/hdr/side/vegetablecrackers/Initialize()
	. = ..()
	reagents.add_reagent("bread", 6)
	reagents.add_reagent("vegetable", 2)
	reagents.add_reagent("sodiumchloride", 2)

/obj/item/mre_food_packet/hdr/dessert
	name = "\improper HDR dessert"
	desc = "An HDR side component. Contains a sweet dessert, to be eaten after the main (or before, if you're rebellious)."
	icon_state = "dessert"
	food_list = list(
		/obj/item/reagent_container/food/snacks/mre_food/uscm/dessert/spicedapples,
		/obj/item/reagent_container/food/snacks/mre_food/hdr/dessert/figbar,
	)

/obj/item/reagent_container/food/snacks/mre_food/hdr/dessert/figbar
	name = "fig bar"
	icon_state = "figbar"
	desc = "Pastry with some fig paste stuffed inside."

/obj/item/reagent_container/food/snacks/mre_food/hdr/dessert/figbar/Initialize()
	. = ..()
	reagents.add_reagent("bread", 2)
	reagents.add_reagent("coco", 2)
	reagents.add_reagent("sprinkles", 1)


/obj/item/reagent_container/food/drinks/cans/spread/sunflowerbutter
	name = "spread packet (sunflower butter)"
	icon = 'icons/obj/items/food/mre_food/hdr.dmi'
	icon_state = "spread_hdr"
	desc = "A creamy and nutty spread, made out of a processed sunflower seeds. Hypoallergenic!"
	flavor = "sunflower butter"

/obj/item/reagent_container/food/drinks/cans/spread/sunflowerbutter/Initialize()
	. = ..()
	reagents.add_reagent("nutriment", 4) //gigaprocessed!
	reagents.add_reagent("sugar", 2)

/obj/item/reagent_container/food/drinks/cans/spread/strawberryjam
	name = "spread packet (strawberry jam)"
	icon = 'icons/obj/items/food/mre_food/hdr.dmi'
	icon_state = "spread_hdr"
	desc = "Sweet strawberry jam with some seeds in it. Safe for small children!"
	flavor = "strawberry jam"

/obj/item/reagent_container/food/drinks/cans/spread/strawberryjam/Initialize()
	. = ..()
	reagents.add_reagent("strawberryjam", 4)
	reagents.add_reagent("sugar", 2)
