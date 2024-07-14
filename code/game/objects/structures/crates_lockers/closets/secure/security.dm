/obj/structure/closet/secure_closet/warden
	name = "Warden's Locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	icon_state = "secure_locked_warden"
	icon_closed = "secure_unlocked_warden"
	icon_locked = "secure_locked_warden"
	icon_opened = "secure_open_warden"
	icon_broken = "secure_broken_warden"
	icon_off = "secure_closed_warden"
/obj/structure/closet/secure_closet/warden/Initialize()
	. = ..()
	new /obj/item/reagent_container/spray/pepper(src)
	new /obj/item/weapon/baton/loaded(src)

/obj/structure/closet/secure_closet/marshal
	name = "CMB Marshal's Locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	icon_state = "secure_locked_warrant"
	icon_closed = "secure_unlocked_warrant"
	icon_locked = "secure_locked_warrant"
	icon_opened = "secure_open_warrant"
	icon_broken = "secure_locked_warrant"
	icon_off = "secure_closed_warrant"


/obj/structure/closet/secure_closet/marshal/Initialize()
	. = ..()
	new /obj/item/clothing/suit/storage/CMB(src)
	new /obj/item/clothing/under/cmb(src)
	new /obj/item/storage/belt/security/MP/CMB(src)
	new /obj/item/clothing/shoes/laceup(src)

/obj/structure/closet/secure_closet/security/standard
	name = "Security Officer's Locker"
	req_one_access = list(ACCESS_CIVILIAN_COMMAND, ACCESS_CIVILIAN_BRIG)
	icon_state = "secure_locked_police"
	icon_closed = "secure_closed_police"
	icon_locked = "secure_locked_police"
	icon_opened = "secure_open_police"
	icon_broken = "secure_broken_police"
	icon_off = "secure_closed_police"

/obj/structure/closet/secure_closet/security/standard/Initialize()
	. = ..()
	new /obj/item/storage/backpack/satchel/black(src)
	new /obj/item/storage/belt/security(src)
	new /obj/item/reagent_container/spray/pepper(src)
	new /obj/item/weapon/baton/loaded(src)

/obj/structure/closet/secure_closet/security/soro
	name = "People's Police Officer Locker"
	req_one_access = list(ACCESS_CIVILIAN_COMMAND, ACCESS_CIVILIAN_BRIG)
	icon_state = "secure_locked_police"
	icon_closed = "secure_closed_police"
	icon_locked = "secure_locked_police"
	icon_opened = "secure_open_police"
	icon_broken = "secure_broken_police"
	icon_off = "secure_closed_police"

/obj/structure/closet/secure_closet/security/soro/Initialize()
	. = ..()

	new /obj/item/storage/belt/security/MP/CMB(src)
	new /obj/item/reagent_container/spray/pepper(src)
	new /obj/item/weapon/baton/loaded(src)
	new /obj/item/clothing/suit/storage/snow_suit/soviet(src)
	new /obj/item/clothing/head/ushanka(src)
	new /obj/item/clothing/under/businesswear/black(src)
	new /obj/item/clothing/accessory/black(src)
	new /obj/item/clothing/accessory/patch/upp(src)
	new /obj/item/storage/belt/gun/type47/t73(src)



/obj/structure/closet/secure_closet/security/cargo/Initialize()
	. = ..()
	new /obj/item/clothing/accessory/armband/cargo(src)

/obj/structure/closet/secure_closet/security/engine/Initialize()
	. = ..()
	new /obj/item/clothing/accessory/armband/engine(src)
	new /obj/item/device/encryptionkey/engi(src)

/obj/structure/closet/secure_closet/security/science/Initialize()
	. = ..()
	new /obj/item/clothing/accessory/armband/science(src)

/obj/structure/closet/secure_closet/security/med/Initialize()
	. = ..()
	new /obj/item/clothing/accessory/armband/medgreen(src)
	new /obj/item/device/encryptionkey/med(src)

/obj/structure/closet/secure_closet/security_empty
	name = "Security Officer's Locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	icon_state = "secure_open_police"
	icon_closed = "secure_closed_police"
	icon_locked = "secure_locked_police"
	icon_opened = "secure_open_police"
	icon_broken = "secure_broken_police"
	icon_off = "secoff"

	opened = 1
	locked = 0
	density = FALSE

/obj/structure/closet/secure_closet/detective
	name = "Detective's Cabinet"
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
	new /obj/item/clothing/suit/armor/det_suit(src)
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
	name = "Lethal Injections"
	req_access = list(ACCESS_MARINE_SENIOR)

/obj/structure/closet/secure_closet/injection/Initialize()
	. = ..()
	new /obj/item/reagent_container/ld50_syringe/choral(src)
	new /obj/item/reagent_container/ld50_syringe/choral(src)

/obj/structure/closet/secure_closet/brig
	name = "Brig Locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)
	anchored = TRUE
	locked = TRUE
	var/id = null

/obj/structure/closet/secure_closet/brig/Initialize()
	. = ..()
	new /obj/item/clothing/under/boiler/prison(src)
	new /obj/item/clothing/shoes/white(src)
	update_icon()
	GLOB.brig_locker_list += src

/obj/structure/closet/secure_closet/brig/Destroy()
	GLOB.brig_locker_list -= src
	return ..()
/obj/structure/closet/secure_closet/courtroom
	name = "Courtroom Locker"
	req_one_access = list(ACCESS_MARINE_BRIG, ACCESS_CIVILIAN_BRIG)

/obj/structure/closet/secure_closet/courtroom/Initialize()
	. = ..()
	new /obj/item/clothing/shoes/brown(src)
	new /obj/item/paper/Court (src)
	new /obj/item/paper/Court (src)
	new /obj/item/paper/Court (src)
	new /obj/item/tool/pen (src)
	new /obj/item/clothing/suit/judgerobe (src)
	new /obj/item/clothing/head/powdered_wig (src)
	new /obj/item/storage/briefcase(src)

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
