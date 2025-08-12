//------------ CMB crisis intervention unit vendors ---------------

//------------UNIFORM VENDOR---------------

/obj/structure/machinery/cm_vending/sorted/uniform_supply/cmb_tac
	name = "CMB Crisis Intervention Unit Equipment Rack"
	desc = "Rack full of CMB tactical team equipment."
	req_access = list()
	req_one_access = list()
	listed_products = list()
	hackable = TRUE
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND | VEND_STOCK_DYNAMIC

/obj/structure/machinery/cm_vending/sorted/uniform_supply/cmb_tac/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/cmb_tac/populate_product_list(scale)
	listed_products = list(
		list("Standard Issue Equipment", -1, null, null, null),
		list("Duty Uniform", 0, /obj/item/clothing/under/cmb), VENDOR_ITEM_REGULAR),
		list("Deployment Area Map", 0, /obj/item/map/current_map, VENDOR_ITEM_REGULAR),

		list("Field Equipment", -1, null, null),
		list("Patrol Jacket", 10, /obj/item/clothing/suit/armor/patrolcoat, VENDOR_ITEM_REGULAR),
		list("GX-30 Combat Helmet", 10, /obj/item/clothing/head/helmet/generic_combat, VENDOR_ITEM_REGULAR),
		list("Radio Headset", 10, /obj/item/device/radio/headset/cmbtac, VENDOR_ITEM_REGULAR),
		list("Combat Gloves", 10, /obj/item/clothing/gloves/marine, VENDOR_ITEM_REGULAR),
		list("Combat Boots", 10, /obj/item/clothing/shoes/marine/knife, VENDOR_ITEM_REGULAR),

		list("Primary Load Bearing Equipment", -1, null, null),
		list("Rifle Magazine Configuration", 10, /obj/item/storage/backpack/cmb_daypack, VENDOR_ITEM_REGULAR),
		list("Submachine Gun Configuration", 10, /obj/item/storage/backpack/general_belt/cmb, VENDOR_ITEM_REGULAR),
		list("Mixed Munitions Configuration", 5, /obj/item/storage/belt/cmbtac/mixed, VENDOR_ITEM_REGULAR),
		list("Utility/Magazine Configuration", 5, /obj/item/storage/belt/cmbtac/utility, VENDOR_ITEM_REGULAR),

		list("Auxillary Load Bearing Equipment", -1, null, null),
		list("Pistol Pouch", 10, /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),
		list("Shotgun Sheath", 10, /obj/item/storage/pouch/pistol/shotgun, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 10, /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", 10, /obj/item/storage/pouch/magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 5, /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 10, /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch", 10, /obj/item/storage/pouch/firstaid, VENDOR_ITEM_REGULAR),
		list("Flare Pouch", 5, /obj/item/storage/pouch/flare, VENDOR_ITEM_RECOMMENDED),
		list("Sling Pouch", 5, /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),
		list("Grenade Pouch", 5, /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),

		list("Specialized Pouches", -1, null, null, null),
		list("Grenade Pouch", 5, /obj/item/storage/pouch/explosive/grenade, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", 5, /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", 5, /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", 5, /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Tools Pouch", 5, /obj/item/storage/pouch/tools, VENDOR_ITEM_REGULAR),

		list("Special Storage Equipment", -1, null, null),
		list("Drop Pouch", 10, /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 5, /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),
		list("Leg Pouch", 4, /obj/item/clothing/accessory/storage/smallpouch, VENDOR_ITEM_REGULAR),

		list("Auxillary Equipment", -1, null, null, null),
		list("Gas Mask", 10, /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),
		list("Tactical Wrap", 10, /obj/item/clothing/mask/rebreather/scarf/tacticalmask, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 10, /obj/item/clothing/mask/rebreather/scarf, VENDOR_ITEM_REGULAR),
		list("Ballistic goggles", 10, /obj/item/clothing/glasses/mgoggles, VENDOR_ITEM_REGULAR),
		list("Ballistic goggles, sun-shaded", 10, /obj/item/clothing/glasses/mgoggles/black, VENDOR_ITEM_REGULAR),
		list("Ballistic goggles, laser-shaded (brown)", 10, /obj/item/clothing/glasses/mgoggles/orange, VENDOR_ITEM_REGULAR),
		list("Ballistic goggles, laser-shaded (green)", 10, /obj/item/clothing/glasses/mgoggles/green, VENDOR_ITEM_REGULAR),
		list("Firearm Lubricant", 5, /obj/item/prop/helmetgarb/gunoil, VENDOR_ITEM_REGULAR),
		)

//------------ Gear Vendor ---------------

/obj/structure/machinery/cm_vending/sorted/gear_supply/cmb_tac
	name = "CMB Crisis Intervention Unit Arsenal Rack"
	desc = "Rack full of CMB tactical team weapons and tools."
	req_access = list()
	req_one_access = list()
	listed_products = list()
	hackable = TRUE
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND | VEND_STOCK_DYNAMIC

/obj/structure/machinery/cm_vending/sorted/uniform_supply/cmb_tac/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/cmb_tac/populate_product_list(scale)
	listed_products = list(
		list("Sidearms", -1, null, null),
		list("Harbin Barracuda", 5, /obj/item/weapon/gun/pistol/barracuda/unloaded, VENDOR_ITEM_REGULAR),
		list("Vanguard Autorevolver", 3, /obj/item/weapon/gun/pistol/m4a3/unloaded, VENDOR_ITEM_REGULAR),
		list("Compact Shotgun", 3, /obj/item/weapon/gun/shotgun/pump/super_short/unloaded, VENDOR_ITEM_REGULAR),

		list("Tools", -1, null, null),
		list("Screwdriver", round(scale * 5), /obj/item/tool/screwdriver, VENDOR_ITEM_REGULAR),
		list("Wirecutters", round(scale * 5), /obj/item/tool/wirecutters, VENDOR_ITEM_REGULAR),
		list("Crowbar", round(scale * 5), /obj/item/tool/crowbar, VENDOR_ITEM_REGULAR),
		list("Wrench", round(scale * 5), /obj/item/tool/wrench, VENDOR_ITEM_REGULAR),
		list("Multitool", round(scale * 1), /obj/item/device/multitool, VENDOR_ITEM_REGULAR),
		list("Welding Tool", round(scale * 1), /obj/item/tool/weldingtool, VENDOR_ITEM_REGULAR),
)

