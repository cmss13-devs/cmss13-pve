/obj/item/reagent_container/syringe/leporazine_dermaline
	name = "syringe (temperature stablization)"
	desc = "Contains leporazine - used to stabilize body temperature, and dermaline - used to rapidly heal burns"

/obj/item/reagent_container/syringe/leporazine_dermaline/Initialize()
	. = ..()
	reagents.add_reagent("leporazine", 5)
	reagents.add_reagent("dermaline", 10)
	mode = SYRINGE_INJECT
	update_icon()
