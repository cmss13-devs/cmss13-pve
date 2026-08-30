/obj/item/storage/box/spec/B18/outpost
	name = "\improper B18 Experimental Warrior case"
	desc = "A large case containing experimental weaponry and the B18 armor platform, designed to minimize battlefield injury. The B18 system is unlikely to leave field testing due to budget cuts even though it is reported to be highly effective. \nDrag this sprite onto yourself to open it up! NOTE: You cannot put items back inside this case."
	kit_overlay = "b18"

/obj/item/storage/box/spec/B18/outpost/fill_preset_inventory()
	. = ..()
	new /obj/item/storage/pouch/machete/full(src)
	new /obj/item/storage/belt/shotgun/full/mou53(src)
	new /obj/item/weapon/gun/shotgun/double/mou53/outpost(src)
	new /obj/item/attachable/angledgrip(src)
	new /obj/item/attachable/stock/mou53(src)
