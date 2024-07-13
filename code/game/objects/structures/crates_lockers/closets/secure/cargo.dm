/obj/structure/closet/secure_closet/quartermaster
	name = "Quartermaster's Locker"
	req_access = list(ACCESS_CIVILIAN_PUBLIC)
	icon_state = "secureqm1"
	icon_closed = "secureqm"
	icon_locked = "secureqm1"
	icon_opened = "secureqmopen"
	icon_broken = "secureqmbroken"
	icon_off = "secureqmoff"

/obj/structure/closet/secure_closet/quartermaster/Initialize()
	. = ..()
	new /obj/item/clothing/under/boiler(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/gloves/black(src)
	return




//**********************Miner Lockers**************************/

/obj/structure/closet/secure_closet/miner
	name = "miner's equipment"
	icon_state = "miningsec1"
	icon_closed = "miningsec"
	icon_locked = "miningsec1"
	icon_opened = "miningsecopen"
	icon_broken = "miningsecbroken"
	icon_off = "miningsecoff"
	req_access = list(ACCESS_CIVILIAN_PUBLIC)

/obj/structure/closet/secure_closet/miner/Initialize()
	. = ..()
	if(prob(50))
		new /obj/item/storage/backpack/industrial(src)
	else
		new /obj/item/storage/backpack/satchel(src)
	new /obj/item/clothing/under/boiler/cyan(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/device/analyzer(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/device/flashlight/lantern(src)
	new /obj/item/tool/shovel(src)
	new /obj/item/tool/pickaxe(src)
