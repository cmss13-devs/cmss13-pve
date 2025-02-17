/obj/structure/closet/secure_closet/scientist
	name = "Scientist's locker"
	req_access = list(ACCESS_MARINE_RESEARCH)
	icon_state = "secureres1"
	icon_closed = "secureres"
	icon_locked = "secureres1"
	icon_opened = "secureresopen"
	icon_broken = "secureresbroken"
	icon_off = "secureresoff"

/obj/structure/closet/secure_closet/scientist/Initialize()
	. = ..()
	new /obj/item/clothing/suit/storage/labcoat(src)

/obj/structure/closet/secure_closet/RD
	name = "Research Director's locker"
	req_access = list(ACCESS_CIVILIAN_LOGISTICS)
	icon_state = "rdsecure1"
	icon_closed = "rdsecure"
	icon_locked = "rdsecure1"
	icon_opened = "rdsecureopen"
	icon_broken = "rdsecurebroken"
	icon_off = "rdsecureoff"

/obj/structure/closet/secure_closet/RD/Initialize()
	. = ..()
	new /obj/item/clothing/suit/storage/labcoat(src)
