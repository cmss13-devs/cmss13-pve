/obj/item/reagent_container/blood
	var/bag_initial_reagents = null

/obj/item/reagent_container/blood/saline
	name = "saline solution pack"
	volume = 100
	bag_initial_reagents = 	list("saline" = 100)
	item_state = "bloodpack_saline"


/obj/item/reagent_container/blood/saline/Initialize()
	. = ..()
	desc = "A basic first aid solution of water, sodium chloride and glucose made to treat " + SPAN_HELPFUL("blood loss, the symptoms of minor poisoning and hyperthermia.") + "While it does not have any lasting negative effects when overdosed on, " + SPAN_WARNING("adminstering more than half a bag at a time causes temporary blurred vision and disorientation.")
	if(bag_initial_reagents)
		for(var/reagent in bag_initial_reagents)
			reagents.add_reagent(reagent, bag_initial_reagents[reagent])
		update_icon()
		return
