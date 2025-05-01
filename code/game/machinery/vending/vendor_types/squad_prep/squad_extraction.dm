GLOBAL_LIST_INIT(cm_vending_extraction, list(

		list("WEAPONS (CHOOSE 1)", 0, null, null, null),
		list("VP70 Handgun", 0, /obj/item/storage/box/guncase/vp70, MARINE_CAN_BUY_KIT, VENDOR_ITEM_RECOMMENDED),
		list("M4A3 Handgun", 0, /obj/item/storage/box/guncase/m4a3, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M1911 Handgun", 0, /obj/item/storage/box/guncase/m1911, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),

		list("ARMOR (CHOOSE 1)", 0, null, null, null),
		list("Ballistic Vest", 0, list(/obj/item/suit/armor/vest/ballistic), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Militia Vest & Militia Helmet", 0, list(/obj/item/suit/armor/miltia/vest, /obj/item/clothing/head/miltia/bucket), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_STANDARD),

		list("HEADSET (CHOOSE 1)", 0, null, null, null),
		list("M5 Camera Headset", 0, /obj/item/device/overwatch_camera, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_RECOMMENDED),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("Satchel", 0, /obj/item/storage/backpack/marine/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED)

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("First-Aid Pouch (Refillable Injectors)", 0, /obj/item/storage/pouch/firstaid/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", 0, /obj/item/storage/pouch/firstaid/full/alternate, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
	))

/obj/structure/machinery/cm_vending/gear/extraction
	name = "\improper ColMarTech Surplus Munitions Rack"
	desc = "An automated rack hooked up to an autofab of cheap, low-quality equipment."
	icon_state = "clothing"
	req_access = list()
	vendor_role = list()

/obj/structure/machinery/cm_vending/extraction/get_listed_products(mob/user)
	return GLOB.cm_vending_extraction