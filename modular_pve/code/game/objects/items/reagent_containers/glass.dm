/obj/item/reagent_container/glass/beaker/vial/kilodermlipo
	name = "vial (temperature stablization)"
	desc = "Contains leporazine - used to stabilize body temperature, kelotane and dermaline - used to rapidly heal burns. Filled in a 1:2:3 ratio."

/obj/item/reagent_container/glass/beaker/vial/kilodermlipo/Initialize()
	. = ..()
	reagents.add_reagent("leporazine", 5)
	reagents.add_reagent("kelotane", 10)
	reagents.add_reagent("dermaline", 15)
	update_icon()

/obj/item/reagent_container/glass/bottle/imialk
	name = "\improper Imidazoline-Alkysine bottle"
	desc = "A small bottle of imidazoline and alkysine, used to heal brain and eye damage."
	icon = 'icons/obj/items/chemistry.dmi'
	icon_state = "bottle19"
	volume = 140
	amount_per_transfer_from_this = 140

/obj/item/reagent_container/glass/bottle/imialk/Initialize()
	. = ..()
	reagents.add_reagent("imidazoline", 70)
	reagents.add_reagent("alkysine", 70)

/obj/item/reagent_container/glass/bottle/merabica
	name = "\improper Meralyne-Bicaridine bottle"
	desc = "A small bottle of meralyne and bicaridine. Rapidly heals brute damage."
	icon = 'icons/obj/items/chemistry.dmi'
	icon_state = "bottle17"
	volume = 140
	amount_per_transfer_from_this = 140

/obj/item/reagent_container/glass/bottle/merabica
	name = "\improper Meralyne-Bicaridine bottle"
	desc = "A small bottle of meralyne and bicaridine. Rapidly heals brute damage."
	icon = 'icons/obj/items/chemistry.dmi'
	icon_state = "bottle17"
	volume = 140
	amount_per_transfer_from_this = 140

/obj/item/reagent_container/glass/bottle/merabica/Initialize()
	. = ..()
	reagents.add_reagent("bicaridine", 70)
	reagents.add_reagent("meralyne", 70)

/obj/item/reagent_container/glass/bottle/keloderm
	name = "\improper Kelotane-Dermaline bottle"
	desc = "A small bottle of kelotane & dermaline, a pair of burn regrowth drugs."
	icon = 'icons/obj/items/chemistry.dmi'
	icon_state = "bottle15"
	volume = 140
	amount_per_transfer_from_this = 140

/obj/item/reagent_container/glass/bottle/keloderm/Initialize()
	. = ..()
	reagents.add_reagent("kelotane", 70)
	reagents.add_reagent("dermaline", 70)

/obj/item/reagent_container/glass/bottle/dexalinplus
	name = "\improper Dexalin+ bottle"
	desc = "A small bottle filled with dexalin+. Hyper-condensed microcapsules quickly release oxygen into the bloodstream, immediately offsetting the effects of O2 deprivation."
	icon = 'icons/obj/items/chemistry.dmi'
	icon_state = "bottle10"
	volume = 140
	amount_per_transfer_from_this = 140

/obj/item/reagent_container/glass/bottle/dexalinplus/Initialize()
	. = ..()
	reagents.add_reagent("dexalinp", 140)
