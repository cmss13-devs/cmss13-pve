/obj/structure/closet/secure_closet/engineering_electrical
	name = "electrical supplies"
	req_one_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_CIVILIAN_ENGINEERING)
	icon_state = "secureengelec1"
	icon_closed = "secureengelec"
	icon_locked = "secureengelec1"
	icon_opened = "toolclosetopen"
	icon_broken = "secureengelecbroken"
	icon_off = "secureengelecoff"

/obj/structure/closet/secure_closet/engineering_electrical/Initialize()
	. = ..()
	new /obj/item/clothing/gloves/yellow(src)
	new /obj/item/clothing/gloves/yellow(src)
	new /obj/item/clothing/gloves/yellow(src)
	new /obj/item/clothing/gloves/yellow(src)
	new /obj/item/storage/toolbox/electrical(src)
	new /obj/item/storage/toolbox/electrical(src)
	new /obj/item/storage/toolbox/electrical(src)
	new /obj/item/circuitboard/apc(src)
	new /obj/item/circuitboard/apc(src)
	new /obj/item/circuitboard/apc(src)
	new /obj/item/device/multitool(src)
	new /obj/item/device/multitool(src)
	new /obj/item/device/multitool(src)

/obj/structure/closet/secure_closet/engineering_welding
	name = "welding supplies"
	req_one_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_CIVILIAN_ENGINEERING)
	icon_state = "secureengweld1"
	icon_closed = "secureengweld"
	icon_locked = "secureengweld1"
	icon_opened = "toolclosetopen"
	icon_broken = "secureengweldbroken"
	icon_off = "secureengweldoff"

/obj/structure/closet/secure_closet/engineering_welding/Initialize()
	. = ..()
	new /obj/item/clothing/head/welding(src)
	new /obj/item/clothing/head/welding(src)
	new /obj/item/clothing/head/welding(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/weldpack(src)
	new /obj/item/tool/weldpack(src)
	new /obj/item/tool/weldpack(src)

/obj/structure/closet/secure_closet/engineering_materials
	name = "workshop materials"
	req_one_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_CIVILIAN_ENGINEERING)
	icon_state = "secureenggen1"
	icon_closed = "secureenggen"
	icon_locked = "secureenggen1"
	icon_opened = "toolclosetopen"
	icon_broken = "secureenggenbroken"
	icon_off = "secureenggenoff"

/obj/structure/closet/secure_closet/engineering_materials/Initialize()
	. = ..()
	new /obj/item/reagent_container/glass/canister/pacid(src)
	new /obj/item/reagent_container/glass/canister/methane(src)
	new /obj/item/reagent_container/glass/canister/ammonia(src)
	new /obj/item/reagent_container/glass/canister/oxygen(src)
	new /obj/item/reagent_container/glass/beaker/large/phosphorus(src)
	new /obj/item/reagent_container/glass/beaker/large/phosphorus(src)
	new /obj/item/reagent_container/glass/beaker/large/phosphorus(src)
	new /obj/item/reagent_container/glass/beaker/large/phosphorus(src)
	new /obj/item/reagent_container/glass/beaker/ethanol(src)
	new /obj/item/reagent_container/glass/beaker/large/lithium(src)
	new /obj/item/reagent_container/glass/beaker/large/sodiumchloride(src)
	new /obj/item/reagent_container/glass/beaker/large/potassiumchloride(src)

/obj/structure/closet/secure_closet/engineering_personal
	name = "engineer's locker"
	req_one_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_CIVILIAN_ENGINEERING)
	icon_state = "secureeng1"
	icon_closed = "secureeng"
	icon_locked = "secureeng1"
	icon_opened = "secureengopen"
	icon_broken = "secureengbroken"
	icon_off = "secureengoff"

/obj/structure/closet/secure_closet/engineering_personal/Initialize()
	. = ..()
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/clothing/suit/storage/hazardvest(src)
	new /obj/item/storage/pouch/general(src)
	new /obj/item/storage/pouch/electronics(src)
	new /obj/item/device/flashlight/tnr(src)

/obj/structure/closet/secure_closet/atmos_personal
	name = "technician's locker"
	req_one_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_CIVILIAN_ENGINEERING)
	icon_state = "secureatm1"
	icon_closed = "secureatm"
	icon_locked = "secureatm1"
	icon_opened = "secureatmopen"
	icon_broken = "secureatmbroken"
	icon_off = "secureatmoff"

/obj/structure/closet/secure_closet/atmos_personal/Initialize()
	. = ..()
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/device/flashlight/tnr(src)
	new /obj/item/clothing/suit/storage/hazardvest(src)
