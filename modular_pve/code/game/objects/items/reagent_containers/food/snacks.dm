/obj/item/reagent_container/food/snacks/cheesewedge/mature/kraft
	name = "packaged cheese-product slice"
	desc = "A slice what legally has to be called 'cheese-product'. Not the nicest thing to eat, but can work in recipes in place of proper cheese. Ensure wrapper removal before consumption."
	icon_state = "kruft_single"
	bitesize = 2
	package = TRUE

/obj/item/reagent_container/food/snacks/cheesewedge/mature/kraft/Initialize()
	. = ..()
	reagents.add_reagent("cheese", 5)
	reagents.add_reagent("sodiumchloride", 1)
	reagents.add_reagent("plasticide", 2)

/obj/item/reagent_container/food/snacks/cheesewedge/mature/kraft/attack_self(mob/user)
	..()

	if(package)
		playsound(src.loc,'sound/effects/pageturn2.ogg', 15, 1)
		to_chat(user, SPAN_NOTICE("You pull the wrapping off of the 'cheese' slice!"))
		reagents.remove_reagent("plasticide", 2)
		package = FALSE
		icon_state = "kruft_single-o"

/obj/item/reagent_container/food/snacks/cracker/tachyon
	name = "Cracker"
	desc = "It's a salted cracker that looks to have gone through a tachyon shunt. It looks fine...right?"
	icon = 'modular_pve/icons/obj/items/food/mre_food/uscm.dmi'
	icon_state = "tachyon_cracker"
	filling_color = "#728942"

/obj/item/reagent_container/food/snacks/cracker/tachyon/Initialize()
	. = ..()
	reagents.add_reagent("carpotoxin", 1)
