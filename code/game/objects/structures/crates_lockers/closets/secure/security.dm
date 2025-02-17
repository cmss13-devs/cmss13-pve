/obj/structure/closet/secure_closet/personal/marshal
	name = "Colonial Marshal's Bureau locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)

/obj/structure/closet/secure_closet/personal/marshal/Initialize()
	. = ..()
	new /obj/item/clothing/suit/storage/CMB(src)
	new /obj/item/storage/belt/security/MP/CMB(src)

/obj/structure/closet/secure_closet/security
	name = "Security Officer's locker"
	req_one_access = list(ACCESS_CIVILIAN_COMMAND, ACCESS_WY_SECURITY)

/obj/structure/closet/secure_closet/security/Initialize()
	. = ..()
	new /obj/item/storage/belt/security/MP/colonist(src)
	new /obj/item/weapon/classic_baton(src)

/obj/structure/closet/secure_closet/security_empty
	name = "Security Officer's locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	opened = 1
	locked = 0
	density = FALSE

/obj/structure/closet/secure_closet/detective
	name = "Detective's cabinet"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	icon_state = "cabinetdetective_locked"
	icon_closed = "cabinetdetective"
	icon_locked = "cabinetdetective_locked"
	icon_opened = "cabinetdetective_open"
	icon_broken = "cabinetdetective_broken"
	icon_off = "cabinetdetective_broken"

/obj/structure/closet/secure_closet/detective/Initialize()
	. = ..()
	new /obj/item/storage/box/evidence(src)
	new /obj/item/clothing/accessory/storage/holster/armpit(src)

/obj/structure/closet/secure_closet/detective/update_icon()
	if(broken)
		icon_state = icon_broken
	else
		if(!opened)
			if(locked)
				icon_state = icon_locked
			else
				icon_state = icon_closed
		else
			icon_state = icon_opened

/obj/structure/closet/secure_closet/injection
	name = "lethal injection locker"
	req_access = list(ACCESS_MARINE_SENIOR)

/obj/structure/closet/secure_closet/injection/Initialize()
	. = ..()
	new /obj/item/reagent_container/ld50_syringe/choral(src)
	new /obj/item/reagent_container/ld50_syringe/choral(src)

/obj/structure/closet/secure_closet/brig
	name = "Brig locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	anchored = TRUE
	locked = TRUE
	var/id = null

/obj/structure/closet/secure_closet/brig/prisoner

/obj/structure/closet/secure_closet/brig/prisoner/Initialize()
	. = ..()
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/shoes/white(src)

/obj/structure/closet/secure_closet/brig/prison_uni
	name = "prison uniform locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	anchored = TRUE
	locked = TRUE


/obj/structure/closet/secure_closet/brig/prison_uni/Initialize()
	. = ..()
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/under/color/orange(src)

/obj/structure/closet/secure_closet/brig/restraints
	name = "restraints locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	anchored = TRUE
	locked = TRUE

/obj/structure/closet/secure_closet/brig/restraints/Initialize()
	. = ..()
	new /obj/item/clothing/suit/straight_jacket(src)
	new /obj/item/clothing/suit/straight_jacket(src)
	new /obj/item/clothing/suit/straight_jacket(src)
	new /obj/item/clothing/suit/straight_jacket(src)
	new /obj/item/clothing/suit/straight_jacket(src)
	new /obj/item/clothing/glasses/sunglasses/blindfold(src)
	new /obj/item/clothing/glasses/sunglasses/blindfold(src)
	new /obj/item/clothing/glasses/sunglasses/blindfold(src)
	new /obj/item/clothing/glasses/sunglasses/blindfold(src)
	new /obj/item/clothing/glasses/sunglasses/blindfold(src)

/obj/structure/closet/secure_closet/brig/Initialize()
	. = ..()
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/shoes/orange(src)
	new /obj/item/device/radio/headset(src)
	update_icon()
	GLOB.brig_locker_list += src

/obj/structure/closet/secure_closet/brig/Destroy()
	GLOB.brig_locker_list -= src
	return ..()

/obj/structure/closet/secure_closet/wall
	name = "security wall locker"
	req_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	icon_state = "security_wall_locked"
	density = TRUE
	icon_closed = "security_wall_closed"
	icon_locked = "security_wall_locked"
	icon_opened = "security_wall_open"
	icon_broken = "security_wall_spark"
	icon_off = "security_wall_off"

	//too small to put a man in
	large = 0

/obj/structure/closet/secure_closet/wall/update_icon()
	if(broken)
		icon_state = icon_broken
	else
		if(!opened)
			if(locked)
				icon_state = icon_locked
			else
				icon_state = icon_closed
		else
			icon_state = icon_opened
