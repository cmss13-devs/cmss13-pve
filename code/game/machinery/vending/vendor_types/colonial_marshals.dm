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
		list("Radio Headset", 10, /obj/item/device/radio/headset/almayer/marine/solardevils, VENDOR_ITEM_REGULAR),
		list("Gas Mask", 5, /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),
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

		list("Special Storage Equipment", -1, null, null),
		list("Drop Pouch", 10, /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 5, /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),
		list("Leg Pouch", 4, /obj/item/clothing/accessory/storage/smallpouch, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("First-Aid Pouch", floor(scale * 15), /obj/item/storage/pouch/firstaid, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", floor(scale * 15), /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", floor(scale * 15), /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", floor(scale * 15), /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", floor(scale * 15), /obj/item/storage/pouch/magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", floor(scale * 15), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),

		list("RESTRICTED POUCHES", -1, null, null, null),
		list("Construction Pouch", 1.25, /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", 1.25, /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", 2.5, /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", floor(scale * 2), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Tools Pouch", 1.25, /obj/item/storage/pouch/tools, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 1.25, /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),
		list("Incinerator Fuel Tank Pouch", 1.25, /obj/item/storage/pouch/flamertank, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 1.25, /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),

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
		list("Solar Devils Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch/devils, VENDOR_ITEM_REGULAR),
		list("USCM Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch, VENDOR_ITEM_REGULAR),
		list("Firearm Lubricant", round(scale * 15), /obj/item/prop/helmetgarb/gunoil, VENDOR_ITEM_REGULAR),
		list("LRRP Bedroll", round(scale * 15), /obj/item/roller/bedroll, VENDOR_ITEM_REGULAR),
		list("Marine Issue Compass", round(scale * 15), /obj/item/prop/helmetgarb/compass, VENDOR_ITEM_REGULAR),
		)

//------------ Gear Vendor ---------------
/obj/structure/machinery/cm_vending/cmb_tac/gear

GLOBAL_LIST_INIT(cm_vending_clothing_marshaltac, list(
		list("Standard Issue Equipment", -1, null, null, null),
		list("Duty Uniform", 0, /obj/item/clothing/under/cmb), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Deployment Area Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("Patrol Jacket", 10, /obj/item/clothing/suit/armor/patrolcoat, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),

		list("Backpacks", 0, null, null, null),
		list("Combat Daypack", 10, /obj/item/storage/backpack/marine, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Satchel", 10, /obj/item/storage/backpack/marine/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Breacherpack", 5, /obj/item/storage/backpack/satchel/cmb_breacherpack, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("Primary Load Bearing Equipment", 0, null, null, null),
		list("Rifle Magazine Configuration", 10, /obj/item/storage/backpack/cmb_daypack, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("Submachine Gun Configuration", 10, /obj/item/storage/backpack/general_belt/cmb, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("Mixed Munitions Configuration", 5, /obj/item/storage/belt/cmbtac/mixed, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("Utility/Magazine Configuration", 5, /obj/item/storage/belt/cmbtac/utility, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("Auxillary Load Bearing Equipment", 0, null, null, null),
		list("Pistol Pouch", 10, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Sheath", 10, /obj/item/storage/pouch/pistol/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 10, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", 10, /obj/item/storage/pouch/magazine/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 5, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 10, /obj/item/storage/pouch/general/medium, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch", 10, /obj/item/storage/pouch/firstaid, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Flare Pouch", 5, /obj/item/storage/pouch/flare, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Sling Pouch", 5, /obj/item/storage/pouch/sling, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Rebreather", 0, /obj/item/clothing/mask/rebreather, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("ENGINEERING SUPPLIES", 0, null, null, null),
		list("E-Tool", 5, /obj/item/tool/shovel/etool/folded, null, VENDOR_ITEM_REGULAR),
		list("Sandbags", 20, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_REGULAR),
		list("ES-11 Mobile Fuel Canister", 5, /obj/item/tool/weldpack/minitank, null, VENDOR_ITEM_REGULAR),
		list("ME3 Hand Welder", 5, /obj/item/tool/weldingtool/simple, null, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("VP78 Pistol", 15, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 15, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),
		list("M79 Grenade Launcher", 30, /obj/item/storage/box/guncase/m79, null, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", 0, null, null, null),
		list("M40 HEDP High Explosive Packet (x3 grenades)", 20, /obj/item/storage/box/packet/high_explosive, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Packet (x3 grenades)", 20, /obj/item/storage/box/packet/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M40 WPDP White Phosphorus Packet (x3 grenades)", 20, /obj/item/storage/box/packet/phosphorus, null, VENDOR_ITEM_REGULAR),
		list("M40 HSDP Smoke Packet (x3 grenades)", 10, /obj/item/storage/box/packet/smoke, null, VENDOR_ITEM_REGULAR),
		list("M20 Mine Box (x5 mines)", 20, /obj/item/storage/box/explosive_mines, null, VENDOR_ITEM_REGULAR),

		list("PRIMARY AMMUNITION", 0, null, null, null),
		list("M49A AP Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/m49a/ap, null, VENDOR_ITEM_REGULAR),
		list("M39 AP Magazine (10x20mm)", 10, /obj/item/ammo_magazine/smg/m39/ap , null, VENDOR_ITEM_REGULAR),
		list("M39 Extended Magazine (10x20mm)", 10, /obj/item/ammo_magazine/smg/m39/extended , null, VENDOR_ITEM_REGULAR),
		list("M41A AP Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/ap , null, VENDOR_ITEM_REGULAR),
		list("M41A Extended Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/extended , null, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", 0, null, null, null),
		list("M44 Heavy Speed Loader (.44)", 10, /obj/item/ammo_magazine/revolver/heavy, null, VENDOR_ITEM_REGULAR),
		list("M44 Marksman Speed Loader (.44)", 10, /obj/item/ammo_magazine/revolver/marksman, null, VENDOR_ITEM_REGULAR),
		list("M4A3 HP Magazine", 5, /obj/item/ammo_magazine/pistol/hp, null, VENDOR_ITEM_REGULAR),
		list("M4A3 AP Magazine", 5, /obj/item/ammo_magazine/pistol/ap, null, VENDOR_ITEM_REGULAR),
		list("VP78 Magazine", 5, /obj/item/ammo_magazine/pistol/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smartpistol Magazine (.45)", 10, /obj/item/ammo_magazine/pistol/smart, null, VENDOR_ITEM_REGULAR),

		list("ARMORS", 0, null, null, null),
		list("M3 B12 Pattern Marine Armor", 30, /obj/item/clothing/suit/storage/marine/medium/leader, null, VENDOR_ITEM_REGULAR),
		list("M4 Pattern Armor", 20, /obj/item/clothing/suit/storage/marine/medium/rto, null, VENDOR_ITEM_REGULAR),

		list("CLOTHING ITEMS", 0, null, null, null),
		list("Webbing", 10, /obj/item/clothing/accessory/storage/webbing, null, VENDOR_ITEM_REGULAR),
		list("Brown Webbing Vest", 15, /obj/item/clothing/accessory/storage/black_vest/brown_vest, null, VENDOR_ITEM_REGULAR),
		list("Black Webbing Vest", 15, /obj/item/clothing/accessory/storage/black_vest, null, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 10, /obj/item/clothing/accessory/storage/droppouch, null, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 15, /obj/item/clothing/accessory/storage/holster, null, VENDOR_ITEM_REGULAR),
		list("Machete Scabbard (Full)", 15, /obj/item/storage/large_holster/machete/full, null, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", 15, /obj/item/storage/pouch/machete/full, null, VENDOR_ITEM_REGULAR),
		list("USCM Radio Telephone Pack", 15, /obj/item/storage/backpack/marine/satchel/rto, null, VENDOR_ITEM_REGULAR),
		list("Fuel Tank Strap Pouch", 5, /obj/item/storage/pouch/flamertank, null, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", 5, /obj/item/clothing/glasses/welding, null, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 15, /obj/item/storage/pouch/sling, null, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 15, /obj/item/storage/pouch/general/large, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Roller Bed", 5, /obj/item/roller, null, VENDOR_ITEM_REGULAR),
		list("Fulton Device Stack", 5, /obj/item/stack/fulton, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 5, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Motion Detector", 15, /obj/item/device/motiondetector, null, VENDOR_ITEM_REGULAR),
		list("Data Detector", 15, /obj/item/device/motiondetector/intel, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 5, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),

		list("BINOCULARS", 0, null, null, null),
		list("Binoculars", 5, /obj/item/device/binoculars, null, VENDOR_ITEM_REGULAR),
		list("Range Finder", 10, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 15, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),

		list("HELMET OPTICS", 0, null, null, null),
		list("Medical Helmet Optic", 15, /obj/item/device/helmet_visor/medical, null, VENDOR_ITEM_REGULAR),
		list("Welding Visor", 5, /obj/item/device/helmet_visor/welding_visor, null, VENDOR_ITEM_REGULAR),

		list("PAMPHLETS", 0, null, null, null),
		list("JTAC Pamphlet", 15, /obj/item/pamphlet/skill/jtac, null, VENDOR_ITEM_REGULAR),
		list("Engineering Pamphlet", 15, /obj/item/pamphlet/skill/engineer, null, VENDOR_ITEM_REGULAR),

		list("RADIO KEYS", 0, null, null, null),
		list("Engineering Radio Encryption Key", 5, /obj/item/device/encryptionkey/engi, null, VENDOR_ITEM_REGULAR),
		list("Intel Radio Encryption Key", 5, /obj/item/device/encryptionkey/intel, null, VENDOR_ITEM_REGULAR),
		list("JTAC Radio Encryption Key", 5, /obj/item/device/encryptionkey/jtac, null, VENDOR_ITEM_REGULAR),
		list("Supply Radio Encryption Key", 5, /obj/item/device/encryptionkey/req, null, VENDOR_ITEM_REGULAR),
	))

/obj/structure/machinery/cm_vending/clothing/marine
	name = "\improper ColMarTech Automated Marine Equipment Rack"
	desc = "An automated rack hooked up to a colossal storage of Marine Rifleman standard-issue equipment."
	icon_state = "mar_rack"
	show_points = TRUE
	vendor_theme = VENDOR_THEME_USCM

	vendor_role = list(JOB_SQUAD_MARINE)

/obj/structure/machinery/cm_vending/clothing/marine/get_listed_products(mob/user)
	return GLOB.cm_vending_clothing_marine

/obj/structure/machinery/cm_vending/clothing/marine/alpha
	squad_tag = SQUAD_MARINE_1
	req_access = list(ACCESS_MARINE_ALPHA)
	headset_type = /obj/item/device/radio/headset/almayer/marine/alpha

/obj/structure/machinery/cm_vending/clothing/marine/bravo
	squad_tag = SQUAD_MARINE_2
	req_access = list(ACCESS_MARINE_BRAVO)
	headset_type = /obj/item/device/radio/headset/almayer/marine/bravo

/obj/structure/machinery/cm_vending/clothing/marine/charlie
	squad_tag = SQUAD_MARINE_3
	req_access = list(ACCESS_MARINE_CHARLIE)
	headset_type = /obj/item/device/radio/headset/almayer/marine/charlie

/obj/structure/machinery/cm_vending/clothing/marine/delta
	squad_tag = SQUAD_MARINE_4
	req_access = list(ACCESS_MARINE_DELTA)
	headset_type = /obj/item/device/radio/headset/almayer/marine/delta
