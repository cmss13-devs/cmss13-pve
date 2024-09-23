// --- ARMOUR --- \\

/obj/item/clothing/suit/armor/astartes
	name = "Astartes Mark VII Power Armour"
	icon = 'void-marines/wh40k/icons/astartes/suits.dmi'
	item_icons = list(WEAR_JACKET = 'void-marines/wh40k/icons/astartes/suits.dmi')
	icon_state = "ultrasuit"
	item_state = "ultrasuit"
// 	canremove = 0
	unacidable = 1
	fire_intensity_resistance = BURN_LEVEL_TIER_1
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROT
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of the XIIIth Chapter, Ultramarines."
	allowed = list(/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/cell, /obj/item/weapon/gun, /obj/item/storage/backpack/general_belt)// ,/obj/item/gun/energy/las/lasgun)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_inv_hide = HIDEJUMPSUIT|HIDEGLOVES
// 	species_restricted = list(SPECIES_ASTARTES)
	flags_inventory = CANTSTRIP|NOPRESSUREDMAGE
	siemens_coefficient = 0
	permeability_coefficient = 0.05

// 	STATS
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_ULTRAHIGH
	armor_energy = CLOTHING_ARMOR_ULTRAHIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_ULTRAHIGH

/obj/item/clothing/head/helmet/astartes
	name = "Astartes Mark VII Helmet"
	desc = "The daunting helmet of the Emperor's chosen, This one bears the symbol of the XIIIth Chapter, Ultramarines"
	icon = 'void-marines/wh40k/icons/astartes/hats.dmi'
	item_icons = list(
		WEAR_HEAD = 'void-marines/wh40k/icons/astartes/hats.dmi'
		)
	icon_state = "ultrahelm"
	item_state = "ultrahelm"
	unacidable = 1
	fire_intensity_resistance = BURN_LEVEL_TIER_1
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROT
	flags_inventory = CANTSTRIP|ALLOWREBREATH|BLOCKGASEFFECT|NOPRESSUREDMAGE
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	flags_inv_hide = HIDEMASK|HIDEEYES|HIDEFACE|HIDEEARS
//	species_restricted = list(SPECIES_ASTARTES)

// 	STATS
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_ULTRAHIGH
	armor_energy = CLOTHING_ARMOR_ULTRAHIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_ULTRAHIGH

/obj/item/clothing/shoes/astartes
	name = "Astartes Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in the colour scheme of the XIIIth chapter, the Ultramarines."
	icon = 'void-marines/wh40k/icons/astartes/shoes.dmi'
	item_icons = null //It should not do any icon :(
	icon_state = "um_lib"
	item_state = "um_lib"
	unacidable = 1
	flags_inventory = NOSLIPPING|CANTSTRIP
	fire_intensity_resistance = BURN_LEVEL_TIER_1
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROT
//	species_restricted = list(SPECIES_ASTARTES)
	flags_armor_protection = BODY_FLAG_FEET

	// 	STATS
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_ULTRAHIGH
	armor_energy = CLOTHING_ARMOR_ULTRAHIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_ULTRAHIGH
	armor_rad = CLOTHING_ARMOR_ULTRAHIGH

/obj/item/storage/backpack/astartes
	name = "Astartes Mark VII Powerpack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This one bears the marking of the XIIIth Chapter, Ultramarines."
	icon = 'void-marines/wh40k/icons/astartes/storage_icon.dmi'
	worn_accessible = TRUE
	item_icons = list(
		WEAR_BACK = 'void-marines/wh40k/icons/astartes/storage.dmi'
		)
	icon_state = "ultrapack"
	item_state = "ultrapack"
	max_storage_space = 20

/obj/item/storage/backpack/astartes/ravenguard
	name = "Astartes Mark VII Powerpack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This one bears the marking of the XIXth Chapter, Raven Guards."
	icon_state = "ravpack"
	item_state = "ravpack"

/obj/item/storage/backpack/astartes/bloodraven
	name = "Astartes Mark VII Powerpack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This one bears the marking of the IXth Chapter, Blood Angels."
	icon_state = "bravpack"
	item_state = "bravpack"

/obj/item/storage/backpack/astartes/salamander
	name = "Astartes Mark VII Powerpack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This one bears the marking of the XVIIIth Chapter, Salamanders."
	icon_state = "salpack"
	item_state = "salpack"

/obj/item/storage/backpack/astartes/apothecary
	name = "Astartes Mark VII Medipack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This Powerpack has been upgraded with additional spotlight and surgical arms to serve medical purposes."
	icon_state = "apothpack"
	item_state = "apothpack"

/obj/item/storage/backpack/astartes/techmarine
	name = "Astartes Mark VII Servo-Harness"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This Powerpack has been equipped with additional Servo-Arms to serve engineering purposes."
	icon_state = "techpack"
	item_state = "techpack"

// --- EXTRA --- \\

/obj/item/clothing/under/astartes/bodysuit
    name = "Astartes Bodysuit"
    desc = "The bodysuit worn by Astartes underneath their Power Armour."
    icon_state = "swatunder"
    worn_state = "swatunder"
    siemens_coefficient = 0.9

// --- Chapters --- \\

// -- BLOOD RAVENS --- \\

/obj/item/clothing/suit/armor/astartes/bloodraven
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of Blood Raven."
	icon_state = "bangsuit"
	item_state = "bangsuit"

/obj/item/clothing/head/helmet/astartes/bloodraven
	name = "Astartes Mark VII Helmet"
	desc = "The daunting helmet of the Emperor's chosen, This one bears the symbol of the Blood Ravens."
	icon_state = "banghelm"
	item_state = "banghelm"

/obj/item/clothing/shoes/astartes/bloodraven
	name = "Astartes Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in the colour scheme of the Blood Ravens."
	icon_state = "ba_boots"
	item_state = "ba_boots"

/obj/item/storage/backpack/satchel/astartes/bloodraven
	name = "Astartes Mark VII Powerpack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This one bears the marking of the Blood Raven."
	icon_state = "bravpack"
	item_state = "bravpack"


// -- RAVEN GUARD -- \\

/obj/item/clothing/suit/armor/astartes/ravenguard
	name = "Astartes Mark VI Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of the XIXth Chapter, Raven Guards."
	icon_state = "ravsuit"
	item_state = "ravsuit"

/obj/item/clothing/head/helmet/astartes/ravenguard
	name = "Astartes Mark VI Helmet"
	desc = "The daunting helmet of the Emperor's black birds, This one bears the symbol of the XIXth Chapter, Raven Guards."
	icon_state = "ravhelm"
	item_state = "ravhelm"

/obj/item/clothing/shoes/astartes/ravenguard
	name = "Astartes Mark VI Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in the colour scheme of the XIXh chapter, the Raven Guard."
	icon_state = "rg_lib"
	item_state = "rg_lib"

/obj/item/storage/backpack/satchel/astartes/ravenguard
	name = "Astartes Mark VII Powerpack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This one bears the marking of the XIXth Chapter, Raven Guards."
	icon_state = "ravpack"
	item_state = "ravpack"


// -- SALAMANDERS -- \\

/obj/item/clothing/suit/armor/astartes/salamander
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Tactical Marine of the XVIIIth Chapter, Salamanders."
	icon_state = "salsuit"
	item_state = "salsuit"

/obj/item/clothing/head/helmet/astartes/salamander
	name = "Astartes Mark VII Helmet"
	desc = "The daunting helmet of the Emperor's dragon warriors, This one bears the symbol of the XVIIIth Chapter, Salamanders."
	icon_state = "salhelm"
	item_state = "salhelm"

/obj/item/clothing/shoes/astartes/salamander
	name = "Astartes Mark VII Combat Boots"
	desc = "Boots of the Emperor's Space Marine, This one is painted in the colour scheme of the XVIIIh chapter, the Salamanders."
	icon_state = "sl_boots"
	item_state = "sl_boots"

/obj/item/storage/backpack/satchel/astartes/salamander
	name = "Astartes Mark VII Powerpack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This one bears the marking of the XVIIIth Chapter, Salamanders."
	icon_state = "salpack"
	item_state = "salpack"

// --- SERGEANT --- \\

/obj/item/clothing/suit/armor/astartes/sergeant
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one is trimmed in golden lining and bears the symbol of his position, Sergeant of the XIIIth Chapter, Ultramarines."
	icon_state = "ultracap"
	item_state = "ultracap"

/obj/item/clothing/head/helmet/astartes/sergeant
	name = "Astartes Mark VII Helmet"
	desc = "The daunting helmet of the Emperor's chosen, This one bears the symbol of the XIIIth Chapter, Ultramarines. It's decorated with an Iron Halo, Representing his seniority in the art of administration."
	icon_state = "ultracap"
	item_state = "ultracap"


/obj/item/clothing/suit/armor/astartes/sergeant/ravenguard
	name = "Astartes Mark VI Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one is trimmed in golden lining and bears the symbol of his position, Sergeant of the XIXth Chapter, Raven Guards."
	icon_state = "ravcap"
	item_state = "ravcap"

/obj/item/clothing/head/helmet/astartes/sergeant/ravenguard
	name = "Astartes Mark VI Helmet"
	desc = "The daunting helmet of the Emperor's black birds, This one bears the symbol of the XIXth Chapter, Raven Guards. It's decorated with an Iron Halo, Representing his seniority in the art of deepstrike."
	icon_state = "ravcap"
	item_state = "ravcap"

/obj/item/clothing/suit/armor/astartes/sergeant/salamander
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one is trimmed in golden lining and bears the symbol of his position, Sergeant of the XVIIIth Chapter, Salamanders."
	icon_state = "salcap"
	item_state = "salcap"

/obj/item/clothing/head/helmet/astartes/sergeant/salamander
	name = "Astartes Mark VII Helmet"
	desc = "The daunting helmet of the Emperor's dragon warriors, This one bears the symbol of the XVIIIth Chapter, Salamanders. It's decorated with an Iron Halo, Representing his seniority in the art of flame."
	icon_state = "salcap"
	item_state = "salcap"

// --- Apothecary --- \\

/obj/item/clothing/suit/armor/astartes/apothecary
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosens."
	icon_state = "ultrapoth"
	item_state = "ultrapoth"

/obj/item/storage/backpack/satchel/astartes/apothecary
	name = "Astartes Mark VII Medipack"
	desc = "Standard powerpack, issued to Adeptus Astartes to store their belongings. This Powerpack has been upgraded with additional spotlight and surgical arms to serve medical purposes."
	icon_state = "salpack"
	item_state = "salpack"

/obj/item/clothing/suit/armor/astartes/apothecary/bloodraven
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Apothecary of the Blood Ravens."
	icon_state = "bangapoth"
	item_state = "bangapoth"

/obj/item/clothing/suit/armor/astartes/apothecary/salamander
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Apothecary of the XVIIIth Chapter, Salamanders."
	icon_state = "salapoth"
	item_state = "salapoth"

/obj/item/clothing/suit/armor/astartes/apothecary/ravenguard
	name = "Astartes Mark VI Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Apothecary of the XIXth Chapter, Raven Guards."
	icon_state = "ravapoth"
	item_state = "ravapoth"

/obj/item/clothing/head/helmet/astartes/apothecary
	name = "Astartes Mark VII Helmet"
	desc = "The vigilant helmet of the Astartes Apothecary, Painted in white and upgraded with genescanner and integrated scanner."
	icon_state = "apohelm"
	item_state = "apohelm"

/obj/item/clothing/head/helmet/astartes/apothecary/ravenguard
	name = "Astartes Mark VI Helmet"
	desc = "The vigilant helmet of the Astartes Apothecary, Painted in white and upgraded with genescanner and integrated scanner, This one bears the symbol of the XIXth Chapter, Raven Guards."
	icon_state = "ravapo"
	item_state = "ravapo"

// --- Tech Marine --- \\

/obj/item/clothing/suit/armor/astartes/techmarine
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Techmarine of the XIIIth Chapter, Ultramarines."
	icon_state = "ultratech"
	item_state = "ultratech"

/obj/item/clothing/suit/armor/astartes/techmarine/bloodraven
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Techmarine of the Blood Ravens."
	icon_state = "bangtech"
	item_state = "bangtech"

/obj/item/clothing/suit/armor/astartes/techmarine/ravenguard
	name = "Astartes Mark VI Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Techmarine of the XIXth Chapter, Raven Guards."
	icon_state = "ravtech"
	item_state = "ravtech"

/obj/item/clothing/suit/armor/astartes/techmarine/salamander
	name = "Astartes Mark VII Power Armour"
	desc = "The Holy armour of the Emperor's chosen, This one bears the symbol of his position, Techmarine of the XVIIIth Chapter, Salamanders."
	icon_state = "saltech"
	item_state = "saltech"


/obj/item/clothing/head/helmet/astartes/techmarine
	name = "Astartes Mark VII Helmet"
	desc = "The advanced helmet of the Astartes Techmarine, Comes with the distinct red colour and advanced scanning system to detect, locate and repair inconsistency in machinery and Astartes holy armour."
	icon_state = "techhelm"
	item_state = "techhelm"
