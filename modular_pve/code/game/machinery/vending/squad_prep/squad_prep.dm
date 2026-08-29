/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/uscm_ground
	name = "\improper ColMarTech Outpost Uniform Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard marine uniforms."
	icon_state = "uscm_gear"
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND | VEND_STOCK_DYNAMIC

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/uscm_ground/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/uscm_ground/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Marine Combat Boots", floor(scale * 15), /obj/item/clothing/shoes/marine/knife, VENDOR_ITEM_REGULAR),
		list("Marine Uniform, Jungle BDU", floor(scale * 15), /obj/item/clothing/under/marine/standard, VENDOR_ITEM_REGULAR),
		list("Marine Combat Gloves", floor(scale * 15), /obj/item/clothing/gloves/marine, VENDOR_ITEM_REGULAR),
		list("Copperheads Section Radio Headset", floor(scale * 15), /obj/item/device/radio/headset/almayer/marine/solardevils/uscm_ground/copperheads, VENDOR_ITEM_REGULAR),
		list("Rattlesnakes Section Radio Headset", floor(scale * 15), /obj/item/device/radio/headset/almayer/marine/solardevils/uscm_ground/rattlesnakes, VENDOR_ITEM_REGULAR),
		list("M5 Pattern Camera Headset", floor(scale * 15), /obj/item/device/overwatch_camera, VENDOR_ITEM_REGULAR),
		list("Utility Cap, Jungle", floor(scale * 15), /obj/item/clothing/head/cmcap, VENDOR_ITEM_REGULAR),
		list("Expedition Cap, Jungle", floor(scale * 15), /obj/item/clothing/head/cmcap/flap, VENDOR_ITEM_REGULAR),
		list("Boonie Hat, Jungle", floor(scale * 15), /obj/item/clothing/head/cmcap/boonie, VENDOR_ITEM_REGULAR),

		list("WEBBINGS", -1, null, null),
		list("M3 Pattern Webbing", 2, /obj/item/clothing/accessory/storage/webbing/m3, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Magazine Webbing", 2, /obj/item/clothing/accessory/storage/webbing/m3/mag, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Shotgun Shell Webbing", 2, /obj/item/clothing/accessory/storage/webbing/m3/shotgun, VENDOR_ITEM_REGULAR),
		list("M3 Pattern M40 Webbing", 0.75, /obj/item/clothing/accessory/storage/webbing/m3/m40, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Small Pouch Webbing", 2, /obj/item/clothing/accessory/storage/webbing/m3/small, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 4, /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Leg Pouch", 4, /obj/item/clothing/accessory/storage/smallpouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),

		list("ARMOR", -1, null, null),
		list("M10 Pattern Marine Helmet", floor(scale * 15), /obj/item/clothing/head/helmet/marine, VENDOR_ITEM_REGULAR),
		list("Standard M3 Pattern Armor Set", round(scale * 15), /obj/item/storage/box/guncase/m3armor, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Chestpiece", round(scale * 10), /obj/item/clothing/suit/marine, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Ridged Chestpiece", round(scale * 10), /obj/item/clothing/suit/marine/lines, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Smooth Chestpiece", round(scale * 10), /obj/item/clothing/suit/marine/smooth, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Pauldrons", round(scale * 10), /obj/item/clothing/accessory/pads, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Lap Panel", round(scale * 10), /obj/item/clothing/accessory/pads/groin, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Greaves", round(scale * 15), /obj/item/clothing/accessory/pads/greaves, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Kneepads", round(scale * 15), /obj/item/clothing/accessory/pads/kneepads, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Vambraces", round(scale * 10), /obj/item/clothing/accessory/pads/bracers, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Gorget", round(scale * 15), /obj/item/clothing/accessory/pads/neckguard, VENDOR_ITEM_REGULAR),

		list("BACKPACK", -1, null, null, null),
		list("Lightweight IMP Backpack", floor(scale * 15), /obj/item/storage/backpack/marine, VENDOR_ITEM_REGULAR),
		list("Technician Backpack", floor(scale * 15), /obj/item/storage/backpack/marine/tech, VENDOR_ITEM_REGULAR),
		list("USCM Satchel", floor(scale * 15), /obj/item/storage/backpack/marine/satchel, VENDOR_ITEM_REGULAR),
		list("USCM Technical Satchel", floor(scale * 15), /obj/item/storage/backpack/marine/satchel/tech, VENDOR_ITEM_REGULAR),

		list("RESTRICTED BACKPACKS", -1, null, null),
		list("Radio Telephone Backpack", 0.75, /obj/item/storage/backpack/marine/satchel/rto, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("M276 Pattern Ammo Load Rig", floor(scale * 15), /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M40 Grenade Rig", floor(scale * 10), /obj/item/storage/belt/grenade, VENDOR_ITEM_REGULAR),
		list("M276 Pattern General Pistol Holster Rig", floor(scale * 15), /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M276 Pattern General Revolver Holster Rig", floor(scale * 15), /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M82F Holster Rig", floor(scale * 5), /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", floor(scale * 15), /obj/item/storage/backpack/general_belt, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("First-Aid Pouch", floor(scale * 15), /obj/item/storage/pouch/firstaid, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", floor(scale * 15), /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Large Magazine Pouch", floor(scale * 15), /obj/item/storage/pouch/magazine/large, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", floor(scale * 15), /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", floor(scale * 15), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", floor(scale * 15), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),

		list("RESTRICTED POUCHES", -1, null, null, null),
		list("Explosive Pouch", 1.25, /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", 2.5, /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Tools Pouch", 1.25, /obj/item/storage/pouch/tools, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 1.25, /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),
		list("Incinerator Fuel Tank Pouch", 1.25, /obj/item/storage/pouch/flamertank, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 1.25, /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),
		list("Machete Pouch", 1.25, /obj/item/storage/pouch/machete/full,  VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("M5 Gas Mask", floor(scale * 15), /obj/item/clothing/mask/gas/military, VENDOR_ITEM_REGULAR),
		list("Tactical Wrap", floor(scale * 10), /obj/item/clothing/mask/rebreather/scarf/tacticalmask, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", floor(scale * 10), /obj/item/clothing/mask/rebreather/scarf, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles, VENDOR_ITEM_REGULAR),
		list("Ballistic goggles, sun-shaded", round(scale * 10), /obj/item/clothing/glasses/mgoggles/black, VENDOR_ITEM_REGULAR),
		list("Ballistic goggles, laser-shaded (brown)", round(scale * 10), /obj/item/clothing/glasses/mgoggles/orange, VENDOR_ITEM_REGULAR),
		list("Ballistic goggles, laser-shaded (green)", round(scale * 10), /obj/item/clothing/glasses/mgoggles/green, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Jungle Cover", round(scale * 10), /obj/item/prop/helmetgarb/camocover, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Snow Cover", round(scale * 10), /obj/item/prop/helmetgarb/camocover/snow, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Desert Cover", round(scale * 10), /obj/item/prop/helmetgarb/camocover/desert, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Netting", round(scale * 10), /obj/item/prop/helmetgarb/netting, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Rain Cover", round(scale * 10), /obj/item/prop/helmetgarb/raincover, VENDOR_ITEM_REGULAR),
		list("USCM Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch, VENDOR_ITEM_REGULAR),
		list("Firearm Lubricant", round(scale * 15), /obj/item/prop/helmetgarb/gunoil, VENDOR_ITEM_REGULAR),
		list("LRRP Bedroll", round(scale * 15), /obj/item/roller/bedroll, VENDOR_ITEM_REGULAR),
		list("Marine Issue Compass", round(scale * 15), /obj/item/prop/helmetgarb/compass, VENDOR_ITEM_REGULAR),
		)
