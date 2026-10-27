/obj/item/reagent_container/hypospray/autoinjector/iron
	name = "iron autoinjector"
	chemname = "iron"
	desc = "An autoinjector loaded with 3 uses of iron, to restore blood volume."
	amount_per_transfer_from_this = REAGENTS_OVERDOSE * INJECTOR_PERCENTAGE_OF_OD
	volume = (REAGENTS_OVERDOSE * INJECTOR_PERCENTAGE_OF_OD) * INJECTOR_USES
	display_maptext = TRUE
	maptext_label = "Fe"

/obj/item/reagent_container/hypospray/autoinjector/iron/skillless
	name = "iron EZ autoinjector"
	desc = "An EZ autoinjector loaded with 3 uses of iron, to restore blood volume. Doesn't require any training to use."
	icon_state = "emptyskill"
	item_state = "emptyskill"

/obj/item/reagent_container/hypospray/autoinjector/adrenaline_concentrated
	name = "concentrated adrenaline autoinjector"
	chemname = "adrenaline_concentrated"
	desc = "An autoinjector loaded with 3 uses of Concentrated Adrenaline, a stimulant that prevents unconsciousness but causes serious cardiovascular strain. <B>WARNING: Do not inject an individual more than twice!</B>"
	amount_per_transfer_from_this = LOWM_REAGENTS_OVERDOSE * INJECTOR_PERCENTAGE_OF_OD
	volume = (LOWM_REAGENTS_OVERDOSE * INJECTOR_PERCENTAGE_OF_OD) * INJECTOR_USES
	display_maptext = TRUE
	maptext_label = "Ad"

