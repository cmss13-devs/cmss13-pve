/obj/item/reagent_container/food/snacks/mre_pack/meal7
	name = "\improper mechanically prepared meal (macaroni and cheese)"
	desc = "An autochef prepared meal of concerningly viscous macaroni and cheese. On the side is sautee'd broccoli with some freezer burn, a tube of cherry-and-vitamin flavor jelly, and a packet of mixed nuts trail mix."
	icon = 'modular_pve/icons/obj/items/food_canteen.dmi'
	icon_state = "mar_tray_menu7"

/obj/item/reagent_container/food/snacks/mre_pack/meal7/Initialize()
	. = ..()
	reagents.add_reagent("nutriment", 9)
	bitesize = 3

/obj/item/reagent_container/food/snacks/protein_pack2
	name = "strawberry Preemptive Action nutrition bar"
	desc = "A flaky, crunchy military nutrition bar. It's an American armed forces classic, for better or worse. The strawberry coating is definitely oversweetened."
	//TODO: ACTUAL SPRITES
	icon_state = "yummers2"
	filling_color = "#ff00cc"
	w_class = SIZE_TINY

/obj/item/reagent_container/food/snacks/protein_pack2/Initialize()
	. = ..()
	reagents.add_reagent("nutriment", 8)
	reagents.add_reagent("strawberrypowder", 8)
	bitesize = 4

/obj/item/reagent_container/food/snacks/protein_pack3
	name = "vanilla Preemptive Action nutrition bar"
	desc = "A flaky, crunchy military nutrition bar. It's an American armed forces classic, for better or worse. The vanilla is overpoweringly strong, but there's not enough sweetener to cover the bitter aftertaste of the filling."
	//TODO: ACTUAL SPRITES
	icon_state = "yummers3"
	filling_color = "#e6e6e6"
	w_class = SIZE_TINY

/obj/item/reagent_container/food/snacks/protein_pack3/Initialize()
	. = ..()
	reagents.add_reagent("nutriment", 8)
	reagents.add_reagent("vanilla", 8)
	bitesize = 4
