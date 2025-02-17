/obj/structure/closet/secure_closet/quartermaster
	name = "Logistics Chief locker"
	req_access = list(ACCESS_CIVILIAN_LOGISTICS)
	icon_state = "secureqm1"
	icon_closed = "secureqm"
	icon_locked = "secureqm1"
	icon_opened = "secureqmopen"
	icon_broken = "secureqmbroken"
	icon_off = "secureqmoff"

/obj/structure/closet/secure_closet/quartermaster/Initialize()
	. = ..()
	new /obj/item/tool/stamp/ro(src)
	new /obj/item/folder/yellow(src)
	new /obj/item/clipboard(src)
	return

/obj/structure/closet/secure_closet/quartermaster_uscm
	name = "Quartermaster's locker"
	req_access = list(ACCESS_MARINE_RO)
	icon_state = "secureqm1"
	icon_closed = "secureqm"
	icon_locked = "secureqm1"
	icon_opened = "secureqmopen"
	icon_broken = "secureqmbroken"
	icon_off = "secureqmoff"

/obj/structure/closet/secure_closet/quartermaster_uscm/Initialize()
	. = ..()
	new /obj/item/tool/stamp/ro(src)
	new /obj/item/folder/yellow(src)
	new /obj/item/clipboard(src)
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
	new /obj/item/clothing/under/colonist/boilersuit/cyan(src)
	new /obj/item/clothing/shoes/marine/civilian/brown(src)
	new /obj/item/clothing/suit/storage/apron/overalls(src)
	new /obj/item/device/analyzer(src)
	new /obj/item/device/flashlight/tnr(src)
	new /obj/item/clothing/glasses/meson(src)
