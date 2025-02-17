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

/obj/structure/closet/secure_closet/personal/RD
	name = "Research Director's locker"
	req_access = list(ACCESS_MARINE_RESEARCH)
	icon_state = "secureres1"
	icon_closed = "secureres"
	icon_locked = "secureres1"
	icon_opened = "secureresopen"
	icon_broken = "secureresbroken"
	icon_off = "secureresoff"

/obj/structure/closet/secure_closet/personal/RD/Initialize()
	. = ..()
	new /obj/item/clothing/suit/storage/labcoat(src)
