//VENDORS

GLOBAL_LIST_INIT(cm_vending_clothing_pmc_medic, list(
		list("MEDICAL SET (MANDATORY)", 0, null, null, null),
		list("Essential Medical Set", 0, /obj/effect/essentials_set/medic, MARINE_CAN_BUY_ESSENTIALS, VENDOR_ITEM_MANDATORY),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine/standard, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3/standard, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Lifesaver Bag (Full)", 0, /obj/item/storage/belt/medical/lifesaver/standard/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 Medical Storage Rig (Full)", 0, /obj/item/storage/belt/medical/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Autoinjector Pouch", 0, /obj/item/storage/pouch/autoinjector, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Refillable Injectors)", 0, /obj/item/storage/pouch/firstaid/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", 0, /obj/item/storage/pouch/firstaid/full/alternate, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", 0, /obj/item/storage/pouch/first_responder, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medical Pouch", 0, /obj/item/storage/pouch/medical, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Medical Kit Pouch", 0, /obj/item/storage/pouch/medkit, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Pressurized Reagent Canister Pouch (Bicaridine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/bicaridine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Pressurized Reagent Canister Pouch (Kelotane)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/kelotane, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Pressurized Reagent Canister Pouch (Tricordrazine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/tricordrazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Pressurized Reagent Canister Pouch (EMPTY)", 0, /obj/item/storage/pouch/pressurized_reagent_canister, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Vial Pouch (Full)", 0, /obj/item/storage/pouch/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ACCESSORIES (CHOOSE 1)", 0, null, null, null),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Webbing", 0, /obj/item/clothing/accessory/storage/webbing, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
	))

/obj/structure/machinery/cm_vending/clothing/medic/pmc
	name = "\improper PMC Medical Gear Rack"
	icon_state = "pmc_gear"

/obj/structure/machinery/cm_vending/clothing/medic/pmc/get_listed_products(mob/user)
	return GLOB.cm_vending_clothing_pmc_medic

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/pmc
	name = "\improper PMC Uniform Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard PMC uniforms."
	icon_state = "pmc_gear"
	req_access = list(ACCESS_WY_GENERAL)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/pmc/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("PMC Mask", round(scale * 10), /obj/item/clothing/mask/gas/pmc, VENDOR_ITEM_REGULAR),
		list("Combat Boots", round(scale * 15), /obj/item/clothing/shoes/marine/corporate, VENDOR_ITEM_REGULAR),
		list("PMC Uniform", round(scale * 15), /obj/item/clothing/under/marine/veteran/pmc, VENDOR_ITEM_REGULAR),
		list("Combat Gloves", round(scale * 15), /obj/item/clothing/gloves/marine/veteran/pmc, VENDOR_ITEM_REGULAR),
		list("M11-PMC Helmet", round(scale * 15), /obj/item/clothing/head/helmet/marine/veteran/pmc/pve, VENDOR_ITEM_REGULAR),
		list("PMC Radio Headset", round(scale * 15), /obj/item/device/radio/headset/distress/pmc/platoon, VENDOR_ITEM_REGULAR),

		list("WEBBINGS", -1, null, null),
		list("Black Webbing Vest", round(scale * 4), /obj/item/clothing/accessory/storage/black_vest, VENDOR_ITEM_REGULAR),
		list("Webbing", round(scale * 2), /obj/item/clothing/accessory/storage/webbing, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),

		list("ARMOR", -1, null, null),
		list("M4 Personal Armor", round(scale * 15), /obj/item/clothing/suit/storage/marine/veteran/pmc, VENDOR_ITEM_REGULAR),
		list("M4-L Personal Light Armor", round(scale * 10), /obj/item/clothing/suit/storage/marine/veteran/pmc/light, VENDOR_ITEM_REGULAR),

		list("BACKPACK", -1, null, null, null),
		list("Lightweight Combat Pack", round(scale * 15), /obj/item/storage/backpack/lightpack, VENDOR_ITEM_REGULAR),

		list("RESTRICTED BACKPACKS", -1, null, null),
		list("Radio Telephone Backpack", round(max(1,(scale * 0.5))), /obj/item/storage/backpack/marine/satchel/rto, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("M276 Pattern Ammo Load Rig", round(scale * 15), /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M40 Grenade Rig", round(scale * 10), /obj/item/storage/belt/grenade, VENDOR_ITEM_REGULAR),
		list("M276 Pattern General Pistol Holster Rig", round(scale * 15), /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M44 Holster Rig", round(scale * 15), /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M82F Holster Rig", round(scale * 5), /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", round(scale * 15), /obj/item/storage/backpack/general_belt, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", round(scale * 15), /obj/item/storage/pouch/firstaid/full/alternate, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Pill Packets)", round(scale * 15), /obj/item/storage/pouch/firstaid/full/pills, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Injectors)", round(scale * 15), /obj/item/storage/pouch/firstaid/full, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", round(scale * 15), /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", round(scale * 15), /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", round(scale * 15), /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", round(scale * 15), /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", round(scale * 15), /obj/item/storage/pouch/magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", round(scale * 15), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),
		list("RESTRICTED POUCHES", -1, null, null, null),
		list("Construction Pouch", round(scale * 1.25), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(scale * 1.25), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch (Empty)", round(scale * 2.5), /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", round(scale * 2), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Tools Pouch", round(scale * 1.25), /obj/item/storage/pouch/tools, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", round(scale * 1.25), /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("Gas Mask", round(scale * 15), /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),
		list("Respirator", round(scale * 15), /obj/item/clothing/mask/breath, VENDOR_ITEM_REGULAR),
		list("Rebreather", round(scale * 10), /obj/item/clothing/mask/rebreather, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles, VENDOR_ITEM_REGULAR),
		list("M1A1 Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles/v2, VENDOR_ITEM_REGULAR),
		list("Prescription ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles/prescription, VENDOR_ITEM_REGULAR),
		list("Prescription glasses", round(scale * 10), /obj/item/clothing/glasses/regular, VENDOR_ITEM_REGULAR),
		list("Firearm Lubricant", round(scale * 15), /obj/item/prop/helmetgarb/gunoil, VENDOR_ITEM_REGULAR),
		list("PMC Cap", round(scale * 15), /obj/item/clothing/head/helmet/marine/veteran/pmc, VENDOR_ITEM_REGULAR),
		)

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/fl
	name = "\improper ColMarTech Freelancer Uniform Vendor"

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/fl/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Combat Boots", round(scale * 15), /obj/item/clothing/shoes/marine/knife, VENDOR_ITEM_REGULAR),
		list("Freelancer Uniform", round(scale * 15), /obj/item/clothing/under/marine/veteran/freelancer, VENDOR_ITEM_REGULAR),
		list("Combat Gloves", round(scale * 15), /obj/item/clothing/gloves/marine, VENDOR_ITEM_REGULAR),
		list("RC6 Helmet", round(scale * 15), /obj/item/clothing/head/helmet/marine/veteran/ua_riot, VENDOR_ITEM_REGULAR),
		list("Freelancer Radio Headset", round(scale * 15), /obj/item/device/radio/headset/distress/fl, VENDOR_ITEM_REGULAR),

		list("WEBBINGS", -1, null, null),
		list("Brown Webbing Vest", round(scale * 1.25), /obj/item/clothing/accessory/storage/black_vest/brown_vest, VENDOR_ITEM_REGULAR),
		list("Black Webbing Vest", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/black_vest, VENDOR_ITEM_REGULAR),
		list("Webbing", round(scale * 2), /obj/item/clothing/accessory/storage/webbing, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),

		list("BACKPACK", -1, null, null, null),
		list("Lightweight IMP Backpack", round(scale * 15), /obj/item/storage/backpack/marine, VENDOR_ITEM_REGULAR),
		list("USCM Satchel", round(scale * 15), /obj/item/storage/backpack/marine/satchel, VENDOR_ITEM_REGULAR),

		list("RESTRICTED BACKPACKS", -1, null, null),
		list("Radio Telephone Backpack", round(max(1,(scale * 0.5))), /obj/item/storage/backpack/marine/satchel/rto, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("M276 Pattern Ammo Load Rig", round(scale * 15), /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M40 Grenade Rig", round(scale * 10), /obj/item/storage/belt/grenade, VENDOR_ITEM_REGULAR),
		list("M276 Pattern General Pistol Holster Rig", round(scale * 15), /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M44 Holster Rig", round(scale * 15), /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M82F Holster Rig", round(scale * 5), /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", round(scale * 15), /obj/item/storage/backpack/general_belt, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", round(scale * 15), /obj/item/storage/pouch/firstaid/full/alternate, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Pill Packets)", round(scale * 15), /obj/item/storage/pouch/firstaid/full/pills, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Injectors)", round(scale * 15), /obj/item/storage/pouch/firstaid/full, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", round(scale * 15), /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", round(scale * 15), /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", round(scale * 15), /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", round(scale * 15), /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", round(scale * 15), /obj/item/storage/pouch/magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", round(scale * 15), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),

		list("RESTRICTED POUCHES", -1, null, null, null),
		list("Construction Pouch", round(scale * 1.25), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(scale * 1.25), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch (Empty)", round(scale * 2.5), /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", round(scale * 2), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Tools Pouch", round(scale * 1.25), /obj/item/storage/pouch/tools, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", round(scale * 1.25), /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("Gas Mask", round(scale * 15), /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", round(scale * 10), /obj/item/clothing/mask/rebreather/scarf, VENDOR_ITEM_REGULAR),
		list("Rebreather", round(scale * 10), /obj/item/clothing/mask/rebreather, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("RC6 Riot Shield", round(scale * 10), /obj/item/prop/helmetgarb/riot_shield, VENDOR_ITEM_REGULAR),
		list("Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles, VENDOR_ITEM_REGULAR),
		list("M1A1 Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles/v2, VENDOR_ITEM_REGULAR),
		list("Prescription ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles/prescription, VENDOR_ITEM_REGULAR),
		list("Marine RPG glasses", round(scale * 10), /obj/item/clothing/glasses/regular, VENDOR_ITEM_REGULAR),
		list("M5 Integrated Gas Mask", round(scale * 10), /obj/item/prop/helmetgarb/helmet_gasmask, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Netting", round(scale * 10), /obj/item/prop/helmetgarb/netting, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Rain Cover", round(scale * 10), /obj/item/prop/helmetgarb/raincover, VENDOR_ITEM_REGULAR),
		list("Firearm Lubricant", round(scale * 15), /obj/item/prop/helmetgarb/gunoil, VENDOR_ITEM_REGULAR),
		list("USCM Flair", round(scale * 15), /obj/item/prop/helmetgarb/flair_uscm, VENDOR_ITEM_REGULAR),
		list("Solar Devils Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch/devils, VENDOR_ITEM_REGULAR),
		list("USCM Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch, VENDOR_ITEM_REGULAR),
		list("UPP Naval Infantry Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch/upp/platoon, VENDOR_ITEM_REGULAR),
		list("UPPA Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch/upp, VENDOR_ITEM_REGULAR),
		list("FORECON Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch/forecon, VENDOR_ITEM_REGULAR),
		list("Falling Falcons Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch/falcon, VENDOR_ITEM_REGULAR),
		list("UPP Airborne Recon Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch/upp/airborne, VENDOR_ITEM_REGULAR),
		list("Royal Marines Shoulder Patch", round(scale * 15), /obj/item/clothing/accessory/patch/royal_marines, VENDOR_ITEM_REGULAR),
		)

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad/fl/populate_product_list(scale)
	listed_products = list(
		list("FOOD", -1, null, null),
		list("MRE", round(scale * 15), /obj/item/reagent_container/food/snacks/upp, VENDOR_ITEM_REGULAR),

		list("TOOLS", -1, null, null),
		list("Entrenching Tool (ET)", round(scale * 2), /obj/item/tool/shovel/etool/folded, VENDOR_ITEM_REGULAR),
		list("Screwdriver", round(scale * 5), /obj/item/tool/screwdriver, VENDOR_ITEM_REGULAR),
		list("Wirecutters", round(scale * 5), /obj/item/tool/wirecutters, VENDOR_ITEM_REGULAR),
		list("Crowbar", round(scale * 5), /obj/item/tool/crowbar, VENDOR_ITEM_REGULAR),
		list("Wrench", round(scale * 5), /obj/item/tool/wrench, VENDOR_ITEM_REGULAR),
		list("Multitool", round(scale * 1), /obj/item/device/multitool, VENDOR_ITEM_REGULAR),
		list("Welding Tool", round(scale * 1), /obj/item/tool/weldingtool, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", -1, null, null),
		list("Plastic Explosives", round(scale * 2), /obj/item/explosive/plastic, VENDOR_ITEM_REGULAR),
		list("Breaching Charge", round(scale * 2), /obj/item/explosive/plastic/breaching_charge, VENDOR_ITEM_REGULAR),

		list("FLARE AND LIGHT", -1, null, null),
		list("Combat Flashlight", round(scale * 5), /obj/item/device/flashlight/combat, VENDOR_ITEM_REGULAR),
		list("Box of Flashlight", round(scale * 1), /obj/item/ammo_box/magazine/misc/flashlight, VENDOR_ITEM_REGULAR),
		list("Box of Flares", round(scale * 1), /obj/item/ammo_box/magazine/misc/flares, VENDOR_ITEM_REGULAR),
		list("M94 Marking Flare Pack", round(scale * 10), /obj/item/storage/box/m94, VENDOR_ITEM_REGULAR),
		list("M89-S Signal Flare Pack", round(scale * 1), /obj/item/storage/box/m94/signal, VENDOR_ITEM_REGULAR),

		list("SIDEARMS", -1, null, null),
		list("NP92 Standard Pistol", round(scale * 2), /obj/item/weapon/gun/pistol/np92, VENDOR_ITEM_REGULAR),
		list("ZHNK-72 Combat Revolver", round(scale * 2), /obj/item/weapon/gun/revolver/upp, VENDOR_ITEM_REGULAR),
		list("Type 73 Service Pistol", round(scale * 2), /obj/item/weapon/gun/pistol/t73, VENDOR_ITEM_REGULAR),
		list("M1911 Service Pistol", round(scale * 5), /obj/item/weapon/gun/pistol/m1911, VENDOR_ITEM_REGULAR),
		list("88 Mod 4 Combat Pistol", round(scale * 5), /obj/item/weapon/gun/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("M44 Combat Revolver", round(scale * 5), /obj/item/weapon/gun/revolver/m44, VENDOR_ITEM_REGULAR),
		list("M4A3 Service Pistol", round(scale * 5), /obj/item/weapon/gun/pistol/m4a3, VENDOR_ITEM_REGULAR),
		list("M82F Flare Gun", round(scale * 1), /obj/item/weapon/gun/flare, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", -1, null, null),
		list("NP92 Magazine (9x18mm Makarov)", round(scale * 20), /obj/item/ammo_magazine/pistol/np92, VENDOR_ITEM_REGULAR),
		list("ZHNK-72 Speedloader (7.62x38mmR)", round(scale * 20), /obj/item/ammo_magazine/revolver/upp, VENDOR_ITEM_REGULAR),
		list("Type 73 Magazine (7.62x25mm Tokarev)", round(scale * 20), /obj/item/ammo_magazine/pistol/t73, VENDOR_ITEM_REGULAR),
		list("M1911 Magazine (.45)", round(scale * 20), /obj/item/ammo_magazine/pistol/m1911, VENDOR_ITEM_REGULAR),
		list("88M4 AP Magazine (9mm)", round(scale * 20), /obj/item/ammo_magazine/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("M44 Speedloader (.44)", round(scale * 20), /obj/item/ammo_magazine/revolver, VENDOR_ITEM_REGULAR),
		list("M4A3 Magazine (9mm)", round(scale * 20), /obj/item/ammo_magazine/pistol, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null),
		list("Extinguisher", round(scale * 5), /obj/item/tool/extinguisher, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", round(scale * 1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),
		list("Roller Bed", round(scale * 2), /obj/item/roller, VENDOR_ITEM_REGULAR),
		list("Machete Scabbard (Full)", round(scale * 5), /obj/item/storage/large_holster/machete/full, VENDOR_ITEM_REGULAR),
		list("Binoculars", round(scale * 1), /obj/item/device/binoculars, VENDOR_ITEM_REGULAR),
		list("Spare PDT/L Battle Buddy Kit", round(scale * 3), /obj/item/storage/box/pdt_kit, VENDOR_ITEM_REGULAR),
		list("Rail Flashlight", round(scale * 5), /obj/item/attachable/flashlight, VENDOR_ITEM_REGULAR),

		list("CLOTHING", -1, null, null),
		list("UPP Cap", round(scale * 5), /obj/item/clothing/head/uppcap, VENDOR_ITEM_REGULAR),
		list("UPP Cap (tan)", round(scale * 5), /obj/item/clothing/head/uppcap/civi, VENDOR_ITEM_REGULAR),
		list("Ushanka", round(scale * 5), /obj/item/clothing/head/uppcap/ushanka, VENDOR_ITEM_REGULAR),
		list("Ushanka (tan)", round(scale * 5), /obj/item/clothing/head/uppcap/ushanka/civi, VENDOR_ITEM_REGULAR),
		list("UPP Beret", round(scale * 5), /obj/item/clothing/head/uppcap/beret, VENDOR_ITEM_REGULAR),
		list("Balaclava", round(scale * 5), /obj/item/clothing/mask/rebreather/scarf/tan, VENDOR_ITEM_REGULAR),
		list("Scarf", round(scale * 5), /obj/item/clothing/mask/rebreather/scarf/tacticalmask/tan, VENDOR_ITEM_REGULAR),
		list("Neck warmer", round(scale * 5), /obj/item/clothing/mask/tornscarf/green, VENDOR_ITEM_REGULAR),
		)

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad/pmc
	name = "\improper PMC Automated Utilities Squad Vendor"
	desc = "An automated supply rack hooked up to a small storage of various utilities and tools. Can be accessed by any PMC Operator."
	req_access = list(ACCESS_WY_GENERAL)
	req_one_access = list()

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad/pmc/populate_product_list(scale)
	listed_products = list(
		list("FOOD", -1, null, null),
		list("MRD", round(scale * 15), /obj/item/reagent_container/food/drinks/cans/soylent, VENDOR_ITEM_REGULAR),

		list("TOOLS", -1, null, null),
		list("Entrenching Tool (ET)", round(scale * 2), /obj/item/tool/shovel/etool/folded, VENDOR_ITEM_REGULAR),
		list("Screwdriver", round(scale * 5), /obj/item/tool/screwdriver, VENDOR_ITEM_REGULAR),
		list("Wirecutters", round(scale * 5), /obj/item/tool/wirecutters, VENDOR_ITEM_REGULAR),
		list("Crowbar", round(scale * 5), /obj/item/tool/crowbar, VENDOR_ITEM_REGULAR),
		list("Wrench", round(scale * 5), /obj/item/tool/wrench, VENDOR_ITEM_REGULAR),
		list("Multitool", round(scale * 1), /obj/item/device/multitool, VENDOR_ITEM_REGULAR),
		list("Welding Tool", round(scale * 1), /obj/item/tool/weldingtool, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", -1, null, null),
		list("Plastic Explosives", round(scale * 2), /obj/item/explosive/plastic, VENDOR_ITEM_REGULAR),
		list("Breaching Charge", round(scale * 2), /obj/item/explosive/plastic/breaching_charge, VENDOR_ITEM_REGULAR),

		list("FLARE AND LIGHT", -1, null, null),
		list("Combat Flashlight", round(scale * 5), /obj/item/device/flashlight/combat, VENDOR_ITEM_REGULAR),
		list("Box of Flashlight", round(scale * 1), /obj/item/ammo_box/magazine/misc/flashlight, VENDOR_ITEM_REGULAR),
		list("Box of Flares", round(scale * 1), /obj/item/ammo_box/magazine/misc/flares, VENDOR_ITEM_REGULAR),
		list("M94 Marking Flare Pack", round(scale * 10), /obj/item/storage/box/m94, VENDOR_ITEM_REGULAR),
		list("M89-S Signal Flare Pack", round(scale * 1), /obj/item/storage/box/m94/signal, VENDOR_ITEM_REGULAR),

		list("SIDEARMS", -1, null, null), //forecon loves their pistols
		list("88 Mod 4 Combat Pistol", round(scale * 5), /obj/item/weapon/gun/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("VP78 pistol", round(scale * 5), /obj/item/weapon/gun/pistol/vp78, VENDOR_ITEM_REGULAR),
		list("ES4 electrostatic pistol", round(scale * 3), /obj/item/weapon/gun/pistol/es4, VENDOR_ITEM_REGULAR),
		list("M82F Flare Gun", round(scale * 3), /obj/item/weapon/gun/flare, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", -1, null, null),
		list("88M4 AP Magazine (9mm)", round(scale * 20), /obj/item/ammo_magazine/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("VP78 magazine (9mm)", round(scale * 20), /obj/item/ammo_magazine/pistol/vp78, VENDOR_ITEM_REGULAR),
		list("ES4 Stun Magazine (9mm)", round(scale * 10), /obj/item/ammo_magazine/pistol/es4, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null),
		list("Extinguisher", round(scale * 5), /obj/item/tool/extinguisher, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", round(scale * 1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),
		list("Roller Bed", round(scale * 2), /obj/item/roller, VENDOR_ITEM_REGULAR),
		list("Machete Scabbard (Full)", round(scale * 5), /obj/item/storage/large_holster/machete/full, VENDOR_ITEM_REGULAR),
		list("Binoculars", round(scale * 1), /obj/item/device/binoculars, VENDOR_ITEM_REGULAR),
		list("Spare PDT/L Battle Buddy Kit", round(scale * 3), /obj/item/storage/box/pdt_kit, VENDOR_ITEM_REGULAR),
		list("Rail Flashlight", round(scale * 5), /obj/item/attachable/flashlight, VENDOR_ITEM_REGULAR),
		)

//OTHER

/datum/ammo/bullet/smg/pve
	name = "squash-head submachinegun duplex bullet"
	shell_speed = AMMO_SPEED_TIER_4 //high velocitisn't
	bonus_projectiles_type = /datum/ammo/bullet/smg/duplex
	bonus_projectiles_amount = EXTRA_PROJECTILES_TIER_1 //1 extra

/datum/ammo/bullet/smg/duplex
	name = "squash-head submachinegun duplex bullet"
	shell_speed = AMMO_SPEED_TIER_3 //high velocitisn't - lags behind first

/datum/ammo/bullet/turret/wy
	damage = 25
	bonus_projectiles_amount = 1
	penetration = -ARMOR_PENETRATION_TIER_1
	accuracy_var_low = PROJECTILE_VARIANCE_TIER_2
	accuracy_var_high = PROJECTILE_VARIANCE_TIER_2

/datum/ammo/flamethrower/pve/drop_flame(turf/T, datum/cause_data/cause_data)
	if(!istype(T)) return
	var/datum/reagent/R = new flamer_reagent_type()
	new /obj/flamer_fire(T, cause_data, R, 1)

/datum/ammo/rocket/wp/quad/weak
	name = "thermobaric rocket"
	flags_ammo_behavior = AMMO_ROCKET|AMMO_STRIKES_SURFACE

	damage = 100
	max_range = 32
	shell_speed = AMMO_SPEED_TIER_3

/datum/ammo/rocket/wp/quad/weak/drop_flame(turf/turf, datum/cause_data/cause_data)
	. = ..()
	playsound(turf, 'sound/weapons/gun_flamethrower3.ogg', 75, 1, 7)
	if(!istype(turf)) return
	smoke.set_up(1, turf)
	smoke.start()
	var/datum/reagent/napalm/ut/reagent = new()
	new /obj/flamer_fire(turf, cause_data, reagent, 2,)

/datum/paygrade/pmc/oplead
	paygrade = "PMC-OL"
	name = "Operations Leader"
	prefix = "OPL."
	pay_multiplier = 3.5

/datum/paygrade/pmc/overwatch
	paygrade = "PMC-OW"
	name = "Overwatch"
	prefix = "OW."
	pay_multiplier = 10

/obj/structure/machinery/door/airlock/hatch/cockpit/pmc
	icon = 'icons/obj/structures/doors/dropshippmc_pilot.dmi'

/obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear/dropshipside/pmc
	name = "\improper Orphan Stomper crew hatch"
	icon = 'icons/obj/structures/doors/dropshippmc_side2.dmi'

/obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear/pmc
	name = "\improper Orphan Stomper cargo door"
	icon = 'icons/obj/structures/doors/dropshippmc_cargo.dmi'

/obj/item/device/radio/headset/distress/pmc/platoon
	desc = "A special headset used by corporate PMCs.  Channels are as follows: #p - general, #y - WY."
	initial_keys = list(/obj/item/device/encryptionkey/pmc)
	locate_setting = TRACKER_SL
	inbuilt_tracking_options = list(
		"Platoon Commander" = TRACKER_PLTCO,
		"Platoon Sergeant" = TRACKER_SL,
		"Squad Sergeant" = TRACKER_FTL,
		"Landing Zone" = TRACKER_LZ
	)

/obj/item/device/radio/headset/distress/pmc/platoon/cmd
	name = "overwatch headset"
	desc = "A special headset used by PMC Overwatch.  Channels are as follows: #p - general, #y - WY,  #z - command, #f - medical, #e - engineering, #o - JTAC."
	initial_keys = list(/obj/item/device/encryptionkey/pmc/command)

/obj/item/device/radio/headset/distress/fl
	name = "freelancer headset"
	desc = "A standard headset used by colonists and truckers"
	frequency = MERC_FREQ

/obj/item/reagent_container/food/drinks/cans/soylent
	name = "\improper Weyland-Yutani Meal Ready-to-Drink"
	desc = "Plastic bottle full of gooey goodness, choco flavor. One bottle has enough calories for a day - don't drink it all in one sitting, better not risk getting diarrhea."
	desc_lore = "Initially designed in 2173 as meal replacement for high-intensity workers, MRD was recalled from the market multiple times due to reports of gastrointestinal illness, including nausea, vomiting, and diarrhea. Improved formula was created, but the brand name was already stained (quite literally), so now Meal Ready-to-Drink remains as emergency food supply for internal Company use."
	icon_state = "wy_soylent"
	center_of_mass = "x=15;y=8"
	volume = 30

/obj/item/reagent_container/food/drinks/cans/soylent/Initialize()
	. = ..()
	reagents.add_reagent("nutriment", 20)
	reagents.add_reagent("coco", 10)

/obj/structure/largecrate/supply/ammo/m41a/extended
	name = "\improper M41A ext. magazine case (x20)"
	desc = "An ammunition case containing 20 extended M41A magazines."
	supplies = list(/obj/item/ammo_magazine/rifle/extended = 20)

/turf/closed/shuttle/pmc
	name = "\improper Orphan Stomper"
	icon = 'icons/turf/dropship_wy.dmi'
	icon_state = "1"

/turf/closed/shuttle/pmc/transparent
	opacity = FALSE

//OVERRIDE
/obj/item/clothing/head/helmet/marine/veteran/pmc
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY|HELMET_GARB_OVERLAY
//OVERRIDE

/obj/item/clothing/head/helmet/marine/veteran/pmc/pve
	name = "\improper M11-PMC helmet"
	icon_state = "pmc_helmet"
	desc = "An aftermarket helmet worn by PMC groups. A more comfortable M11, covered by a sterilized white antibacterial layer. It's a shockingly useful feature after a firefight."

/obj/item/defenses/handheld/sentry/wy
	name = "handheld WY 202-GMA1 smart sentry"
	desc = "A compact version of the Weyland-Yutani defenses. Designed for deployment in the field."
	icon = 'icons/obj/structures/machinery/defenses/wy_defenses.dmi'
	icon_state = "WY uac_sentry_handheld"
	defense_type = /obj/structure/machinery/defenses/sentry/wy

/obj/structure/machinery/defenses/sentry/wy
	name = "\improper WY 202-GMA1 Smart Sentry"
	desc = "A deployable, fully-automated turret with AI targeting capabilities used by the PMC. Armed by expansive bullets"
	icon = 'icons/obj/structures/machinery/defenses/wy_defenses.dmi'
	icon_state = "wy_defense_base"
	icon_on = "wy_defense_base"
	icon_off = "wy_defense_base_off"
	fire_delay = 1
	health = 100
	health_max = 100
	damage_mult = 1.5
	hack_time = 25 SECONDS
	sentry_range = 6
	omni_directional = TRUE
	defense_type = "WY"
	handheld_type = /obj/item/defenses/handheld/sentry/wy
	ammo = new /obj/item/ammo_magazine/sentry/wy
	choice_categories = list(
		SENTRY_CATEGORY_IFF = list(FACTION_PMC, FACTION_HUMAN),
	)
	selected_categories = list(
		SENTRY_CATEGORY_IFF = FACTION_PMC,
	)

/mob/living/simple_animal/lizard/lexi
	name = "Lexi"
	desc = "The Apostay's pet, and a reminder of W-Y's wealth. A tiny lizard that, a few years ago, had one leg replaced with a delicate-looking prosthetic after an illness. If they can splurge this hard on your company pet, what can they give you? Will probably outlive your natural lifespan."
	icon_state = "lexi"
	icon_living = "lexi"

/obj/item/weapon/gun/flamer/deathsquad/pve
	name = "\improper M240-R2 incinerator unit"
	desc = "A next-generation incinerator unit, the M240-R2 is much lighter and dextrous than its predecessors thanks to the ceramic alloy construction. It can be slinged over a belt and usually comes equipped with EX-type fuel. This one is configured to fire globs of fire to preserve fuel."
	start_automatic = FALSE
	starting_attachment_types = list(/obj/item/attachable/attached_gun/extinguisher/pyro)
	var/fuel_usage = 10

/obj/item/weapon/gun/flamer/deathsquad/pve/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_6 * 5)

/obj/item/weapon/gun/flamer/deathsquad/pve/unleash_flame(atom/target, mob/living/user)
	if(!length(current_mag.reagents.reagent_list))
		to_chat(user, SPAN_WARNING("\The [src] doesn't have enough fuel to launch a projectile!"))
		return

	var/datum/reagent/flamer_reagent = current_mag.reagents.reagent_list[1]
	if(flamer_reagent.volume < FLAME_REAGENT_USE_AMOUNT * fuel_usage)
		to_chat(user, SPAN_WARNING("\The [src] doesn't have enough fuel to launch a projectile!"))
		return

	last_fired = world.time
	current_mag.reagents.remove_reagent(flamer_reagent.id, FLAME_REAGENT_USE_AMOUNT * fuel_usage)

	var/obj/projectile/P = new(src, create_cause_data(initial(name), user, src))
	var/datum/ammo/flamethrower/ammo_datum = new /datum/ammo/flamethrower/pve
	ammo_datum.flamer_reagent_type = flamer_reagent.type
	P.generate_bullet(ammo_datum)
	P.icon_state = "naptha_ball"
	P.color = flamer_reagent.color
	P.hit_effect_color = flamer_reagent.burncolor
	P.fire_at(target, user, user, max_range, AMMO_SPEED_TIER_2, null)
	var/turf/user_turf = get_turf(user)
	playsound(user_turf, get_fire_sound(), 50, TRUE)

//Lancer minigun
/obj/item/weapon/gun/minigun/lancer
	name = "\improper Minigun"
	desc = "An enormous multi-barreled rotating gatling gun. This thing looks like its straight out of an action movie. Sporting immaculate grips and triggers this bad bitch has been customized solely by order for the user and costing more than you can dream. It also contains space age anti scratch and anti jam technology, along with magnets to auto attach to armor. Only thing this gun lacks is IFF tech. aint the future great?"
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/event.dmi'
	icon_state = "painless"
	item_state = "painless"

	fire_sound = 'sound/weapons/gun_minigun.ogg'
	cocked_sound = 'sound/weapons/gun_minigun_cocked.ogg'
	current_mag = /obj/item/ammo_magazine/minigun
	w_class = SIZE_HUGE
	force = 20
	flags_gun_features = GUN_AUTO_EJECTOR|GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_RECOIL_BUILDUP|GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_HEAVY
	start_semiauto = FALSE
	start_automatic = TRUE

/obj/item/weapon/gun/minigun/lancer/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/minigun/lancer/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_12)

	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3

	scatter = SCATTER_AMOUNT_TIER_9 // Most of the scatter should come from the recoil

	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5
	recoil_buildup_limit = RECOIL_AMOUNT_TIER_3 / RECOIL_BUILDUP_VIEWPUNCH_MULTIPLIER

/obj/item/weapon/gun/minigun/lancer/handle_starting_attachment()
	..()
	//invisible mag harness
	var/obj/item/attachable/magnetic_harness/Integrated = new(src)
	Integrated.hidden = TRUE
	Integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	Integrated.Attach(src)
	update_attachable(Integrated.slot)

/obj/item/weapon/gun/rifle/m41a/elite/platoon
	current_mag = /obj/item/ammo_magazine/rifle/extended
	random_spawn_chance = 100
	starting_attachment_types = list()
	random_spawn_rail = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
	)
	random_spawn_under = list(
		/obj/item/attachable/angledgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight/grip,
	)
	random_spawn_muzzle = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/extended_barrel,
	)
	random_spawn_stock = list(
		/obj/item/attachable/stock/rifle,
		/obj/item/attachable/stock/rifle/collapsible,
	)

//PVE 177, for lancers, updated with better desc no attachies on spawn and other stuff :)
/obj/item/weapon/gun/rifle/xm177/repro
	name = "\improper XM177E2 carbine"
	desc = "An old design reproduced by Weston Reproductions, essentially a shortened M16A1 with a collapsable stock. It is chambered in 5.56x45mm. The short length inhibits the attachment of most underbarrel attachments, and the barrel moderator prohibits the attachment of all muzzle devices."
	desc_lore = "A carbine similar to the M16A1, with a collapsible stock and a distinct flash suppressor. A stamp on the receiver reads: 'COLT AR-15 - XM177E2 - CAL 5.56MM - REPRO' \nA design originating from the Vietnam War, the XM177, also known as the Colt Commando or GAU-5/A, was an improvement on the CAR-15 Model 607, fixing multiple issues found with the limited service of the Model 607 with Special Forces. The XM177 saw primary use with Army Special Forces and Navy Seals operating as commandos. \nThis one was produced by Weston Reproductions."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
	icon_state = "xm177"
	item_state = "m16"
	current_mag = /obj/item/ammo_magazine/rifle/m16/ext

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_ANTIQUE

	fire_sound = 'sound/weapons/gun_m16.ogg'
	reload_sound = 'sound/weapons/handling/gun_m16_reload.ogg'
	unload_sound = 'sound/weapons/handling/gun_m16_unload.ogg'
	accepted_ammo = list(
		/obj/item/ammo_magazine/rifle/m16,
		/obj/item/ammo_magazine/rifle/m16/ap,
		/obj/item/ammo_magazine/rifle/m16/ext,
	)

	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/stock/m16/xm177,
	)

/obj/item/weapon/gun/rifle/xm177/repro/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 18,"rail_x" = 9, "rail_y" = 20, "under_x" = 19, "under_y" = 13, "stock_x" = 15, "stock_y" = 14)

/obj/item/weapon/gun/rifle/xm177/repro/handle_starting_attachment()
	..()
	var/obj/item/attachable/stock/m16/xm177/integrated = new(src)
	integrated.hidden = FALSE
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)

/obj/item/weapon/gun/rifle/xm177/repro/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_SMG)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_SMG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_6
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_3
	scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_TIER_9
	scatter_unwielded = SCATTER_AMOUNT_TIER_4
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_6
	recoil_unwielded = RECOIL_AMOUNT_TIER_2
	start_automatic = TRUE

//PVE M16 Grenadier, EAT 40 XENO SCUM
/obj/item/weapon/gun/rifle/m16/grenadier/repro
	name = "\improper M16 grenadier rifle"
	desc = "An old, reliable design first adopted by the U.S. military in the 1960s and reproduced by Weston Reproductions. It is chambered in 5.56x45mm. This one has an irremovable M203 grenade launcher attached to it, holds one propriatary 40mm shell, it lacks IFF systems and will impact the first target it hits; introduce your little friend."
	icon_state = "m16g"
	item_state = "m16"
	fire_sound = 'sound/weapons/gun_m16.ogg'
	reload_sound = 'sound/weapons/handling/gun_m16_reload.ogg'
	unload_sound = 'sound/weapons/handling/gun_m16_unload.ogg'
	current_mag = /obj/item/ammo_magazine/rifle/m16/ext
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/attached_gun/grenade/m203,
	)

/obj/item/weapon/gun/rifle/m16/grenadier/repro/handle_starting_attachment()
	..()
	var/obj/item/attachable/attached_gun/grenade/m203/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.hidden = FALSE
	integrated.Attach(src)
	update_attachable(integrated.slot)

/obj/item/weapon/gun/rifle/m16/grenadier/repro/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_11)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_11)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_7
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_10
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_6
	recoil_unwielded = RECOIL_AMOUNT_TIER_2
	start_automatic = TRUE

//L42A Battle Rifle FAL ripoff edition

/obj/item/weapon/gun/rifle/l42a/L42B
	name = "\improper L42B battle rifle"
	desc = "The L42B Battle Rifle, found commonly around the frontiers of the Galaxy. It's commonly used by colonists for self defense, as well as many colonial militias, whomever they serve due to it's rugged reliability and ease of use without much training. This rifle is the B variant, equipped with 10x26mm and full auto functionality."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/uscm.dmi'
	icon_state = "l42mk1"
	item_state = "l42mk1"
	reload_sound = 'sound/weapons/handling/l42_reload.ogg'
	unload_sound = 'sound/weapons/handling/l42_unload.ogg'
	fire_sound = 'sound/weapons/gun_hpr.ogg'
	current_mag = /obj/item/ammo_magazine/rifle/l42a/l42B
	accepted_ammo = list(
		/obj/item/ammo_magazine/rifle/l42a/l42B,
		/obj/item/ammo_magazine/rifle/l42a/L42Bext,
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/upp,
		/obj/item/attachable/bayonet/co2,
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/stock/carbine,
		/obj/item/attachable/stock/carbine/wood,
		/obj/item/attachable/bipod,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/mini_iff,
		/obj/item/attachable/flashlight/grip,
	)

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	wield_delay = WIELD_DELAY_VERY_FAST
	aim_slowdown = SLOWDOWN_ADS_QUICK
	starting_attachment_types = list(/obj/item/attachable/stock/carbine)
	map_specific_decoration = TRUE

/obj/item/weapon/gun/rifle/l42a/l42B/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 19,"rail_x" = 12, "rail_y" = 20, "under_x" = 18, "under_y" = 15, "stock_x" = 22, "stock_y" = 10)

/obj/item/weapon/gun/rifle/l42a/l42B/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_9)
	set_burst_amount(0)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_4
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_6
	recoil_unwielded = RECOIL_AMOUNT_TIER_4
	damage_falloff_mult = 0
	scatter = SCATTER_AMOUNT_TIER_8
	start_automatic = TRUE

/obj/item/weapon/gun/smg/m39/elite/pve //duplex round
	name = "\improper M39-R2 submachinegun"
	desc = "An experimental M-39 capable of firing squash-head duplex rounds. A bit bulkier and more unwieldy than the average M39, with a thicker reciever and slower projectile. Still produced in small quantities."
	desc_lore = "The Company recieved a rather unexpected windfall of revenue from the VP78. Squash-head small-arms rounds were rather popular among their clientelle. Initial testing with rifle-caliber HESH rounds presented a few problems. The least of which was that the required additional powder drove the chamber pressure up to dangerous levels, causing premature detonations and inaccurate fire. <BR> <BR> Caseless HV SMG ammo was, essentially, already an overpressurized pistol round. It was simple for Weyland Yutani to iterate upon the problem by taking a step back. How do you fix rifle rounds being too pressurized? Make it a pistol round. How do you remedy its firepower? Nake it a duplex."
	current_mag = /obj/item/ammo_magazine/smg/m39/pve
	random_spawn_chance = 0

	//Type-19 lancer

/obj/item/weapon/gun/smg/pps43/lancer
	name = "\improper Type-19 Submachinegun" //placeholder
	desc = "An outdated, but reliable and powerful, submachinegun originating in the Union of Progressive Peoples, it is still in limited service in the UPP but is most often used by paramilitary groups or corporate security forces. It is usually used with a 35 round stick magazine, or a 71 round drum."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/upp.dmi'
	icon_state = "insasu"
	item_state = "insasu"

	fire_sound = 'sound/weapons/smg_heavy.ogg'
	current_mag = /obj/item/ammo_magazine/smg/pps43
	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/flashlight/grip,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/magnetic_harness,
	)

/obj/item/weapon/gun/smg/pps43/lancer/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 20,"rail_x" = 20, "rail_y" = 24, "under_x" = 25, "under_y" = 17, "stock_x" = 26, "stock_y" = 15)

/obj/item/weapon/gun/smg/pps43lancer/set_gun_config_values()
	..()
	fire_delay = FIRE_DELAY_TIER_SMG
	burst_delay = FIRE_DELAY_TIER_SMG
	burst_amount = BURST_AMOUNT_TIER_3
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_5
	scatter = SCATTER_AMOUNT_TIER_9
	burst_scatter_mult = SCATTER_AMOUNT_TIER_4
	scatter_unwielded = SCATTER_AMOUNT_TIER_4
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil_unwielded = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/smg/bizon/lancer
	name = "\improper Type 64 Submachinegun"
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/upp.dmi'
	icon_state = "type64"
	item_state = "type64"

/obj/item/weapon/gun/smg/bizon/lancer/set_gun_config_values()
	..()
	fire_delay = FIRE_DELAY_TIER_SMG
	burst_delay = FIRE_DELAY_TIER_SMG
	burst_amount = BURST_AMOUNT_TIER_4
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	scatter = SCATTER_AMOUNT_TIER_9
	burst_scatter_mult = SCATTER_AMOUNT_TIER_8
	scatter_unwielded = SCATTER_AMOUNT_TIER_4
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_3
	recoil_unwielded = RECOIL_AMOUNT_TIER_5

//MEAN GREEN FF MACHINE

/obj/item/ammo_magazine/rocket/quadcucked
	name = "\improper 84mm thermobaric rocket array"
	desc = "A thermobaric rocket tube for an XM57-A4 quad launcher with 4 warheads."
	caliber = "rocket array"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/event.dmi'
	icon_state = "quad_rocket"

	max_rounds = 4
	default_ammo = /datum/ammo/rocket/wp/quad
	gun_type = /obj/item/weapon/gun/launcher/rocket/m57a4cucked
	reload_delay = 200

/obj/item/ammo_magazine/rocket/m57a4cucked/update_icon()
	..()
	if(current_rounds <= 0)
		name = "\improper 84mm spent rocket array"
		desc = "A spent rocket tube assembly for the XM57-A4 quad launcher. Activate in hand to disassemble for metal."
		icon_state = "quad_rocket_e"

/obj/item/weapon/gun/launcher/rocket/m57a4cucked
	name = "\improper XM57-A4 'Lightning Bolt' quad thermobaric launcher"
	desc = "The XM57-A4 'Lightning Bolt' is possibly the most destructive man-portable weapon ever made, or atleast thats what the company making it says. It is a 4-barreled missile launcher capable of burst-firing 4 thermobaric missiles. If those 4 missiles hit you or the enemy, thats up to you"
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/event.dmi'
	icon_state = "m57a4"
	item_state = "m57a4"
	skill_locked = FALSE

	current_mag = /obj/item/ammo_magazine/rocket/quadcucked
	aim_slowdown = SLOWDOWN_ADS_SUPERWEAPON
	flags_gun_features = GUN_WIELDED_FIRING_ONLY

	accepted_ammo = list(
		/obj/item/ammo_magazine/rocket/quadcucked,
	)
/obj/item/weapon/gun/launcher/rocket/quadcucked/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	set_burst_delay(FIRE_DELAY_TIER_7)
	set_burst_amount(BURST_AMOUNT_TIER_4)
	accuracy_mult = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_3

/obj/item/ammo_magazine/rifle/m16/ext
	name = "\improper M16 Extended magazine (5.56x45mm)"
	desc = "An extended 5.56x45mm magazine for the M16 assault rifle."
	caliber = "5.56x45mm"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 50
	gun_type = /obj/item/weapon/gun/rifle/m16
	w_class = SIZE_MEDIUM
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/colony.dmi'
	icon_state = "m16_ext"

/obj/item/ammo_magazine/rifle/l42a/l42B
	name = "\improper L42B magazine (10x26mm)"
	desc = "An L42B magazine loaded with 10x26mm caseless"
	caliber = "10x26mm"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 20
	icon_state = "l42mk1"

/obj/item/ammo_magazine/rifle/l42a/L42Bext
	name = "\improper L42B extended magazine (10x26mm)"
	desc = "An extended L42B magazine loaded with 10x26mm caseless"
	caliber = "10x26mm"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 40
	icon_state = "l42mk1_extended"

/obj/item/ammo_magazine/sentry/wy
	name = "H20 ammo drum (10x42mm Caseless)"
	desc = "An ammo drum of 400 10x42mm caseless rounds for the WY 202-GMA1 Smart Sentry with duplex technology. Just feed it into the sentry gun's ammo port when its ammo is depleted."
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/wy.dmi'
	icon_state = "wy22e5"
	max_rounds = 400
	default_ammo = /datum/ammo/bullet/turret/wy

/obj/item/ammo_magazine/smg/m39/pve
	name = "\improper M39 duplex magazine (10x20mm)"
	desc = "A 10x20mm caseless submachinegun magazine containing special light explosive HESH rounds, designed to increase your overall firepower per pull. Reduced bullet velocity due to two slugs per bullet."
	max_rounds = 54
	default_ammo = /datum/ammo/bullet/smg/pve
	ammo_band_color = AMMO_BAND_COLOR_LIGHT_EXPLOSIVE


