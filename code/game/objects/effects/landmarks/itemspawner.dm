//Costume spawner landmarks
/obj/effect/landmark/costume/random/Initialize() //costume spawner, selects a random subclass and disappears
	. = ..()
	var/list/options = subtypesof(/obj/effect/landmark/costume) - /obj/effect/landmark/costume/random
	var/CHOICE = pick(options)
	new CHOICE(src.loc)
	return INITIALIZE_HINT_QDEL

//SUBCLASSES.  Spawn a bunch of items and disappear likewise
/obj/effect/landmark/costume/gladiator/Initialize()
	. = ..()
	new /obj/item/clothing/under/chainshirt/hunter(src.loc)
	new /obj/item/clothing/suit/armor/gladiator(src.loc)
	new /obj/item/clothing/head/helmet/gladiator(src.loc)
	return INITIALIZE_HINT_QDEL
