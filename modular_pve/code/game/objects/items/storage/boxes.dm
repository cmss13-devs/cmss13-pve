/obj/item/storage/box/powderedmilk
	name = "box of powdered milk packets"
	desc = "It has a weird stain on it."

/obj/item/storage/box/powderedmilk/fill_preset_inventory()
	new /obj/item/reagent_container/food/condiment/juice/milk(src)
	new /obj/item/reagent_container/food/condiment/juice/milk(src)
	new /obj/item/reagent_container/food/condiment/juice/milk(src)
	new /obj/item/reagent_container/food/condiment/juice/milk(src)
	new /obj/item/reagent_container/food/condiment/juice/milk(src)

/obj/item/storage/box/cheeseslices
	name = "box of 'cheese-product' slices"
	desc = "Smells like plastic."
	icon = 'modular_pve/icons/obj/items/storage/boxes.dmi'
	icon_state = "cheese_kit"

/obj/item/storage/box/cheeseslices/fill_preset_inventory()
	for(var/i in 1 to 7)
		new /obj/item/reagent_container/food/snacks/cheesewedge/mature/kraft(src)
