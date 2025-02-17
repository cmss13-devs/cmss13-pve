/obj/structure/closet/secure_closet/guncabinet/blue
	name = "blue level gun cabinet"
	req_level = SEC_LEVEL_BLUE

//riot gear control cabinet adding vehicle clamp to it to...
// make more sense than in red alert cabinet.

/obj/structure/closet/secure_closet/guncabinet/blue/riot_control
	name = "riot control armor locker"
	storage_capacity = 55 //lots of stuff to fit in
	req_level = SEC_LEVEL_BLUE

/obj/structure/closet/secure_closet/guncabinet/blue/riot_control/Initialize()
	. = ..()
	new /obj/item/weapon/shield/riot(src)
	new /obj/item/weapon/shield/riot(src)
	new /obj/item/weapon/shield/riot(src)
	new /obj/item/clothing/mask/gas/military(src)
	new /obj/item/clothing/mask/gas/military(src)
	new /obj/item/clothing/mask/gas/military(src)
	new /obj/item/clothing/head/helmet/marine/MP(src)
	new /obj/item/clothing/head/helmet/marine/MP(src)
	new /obj/item/clothing/head/helmet/marine/MP(src)
	new /obj/item/clothing/suit/armor/riot/marine(src)
	new /obj/item/clothing/suit/armor/riot/marine(src)
	new /obj/item/clothing/suit/armor/riot/marine(src)
