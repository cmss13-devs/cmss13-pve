//=============================//Marine Raiders\\==================================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/marine/sof
	name = "\improper SOF Armor"
	desc = "A heavily customized suit of M3 armor. Used by Marine Raiders."
	icon_state = "marsoc"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_VERYHIGH
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	slowdown = SLOWDOWN_ARMOR_LIGHT
	unacidable = TRUE
	flags_atom = MOB_LOCK_ON_EQUIP|NO_CRYO_STORE|NO_SNOW_TYPE
	storage_slots = 4


//=============================//PMCs\\==================================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/marine/veteran
	flags_marine_armor = ARMOR_LAMP_OVERLAY
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make these keep their name and icon.

/obj/item/clothing/suit/storage/marine/veteran/pmc
	name = "\improper M4 pattern PMC armor"
	desc = "A modification of the standard Armat Systems M3 armor. Designed for high-profile security operators and corporate mercenaries in mind."
	icon_state = "pmc_armor"
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	storage_slots = 2
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine/,
		/obj/item/weapon/baton,
		/obj/item/restraint/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/tool/crowbar,
		/obj/item/storage/large_holster/katana,
		/obj/item/storage/large_holster/machete,
		/obj/item/weapon/sword/machete,
		/obj/item/attachable/bayonet,
		/obj/item/device/motiondetector,
		/obj/item/tool/crew_monitor,
		/obj/item/device/walkman,
	)
	item_state_slots = list(WEAR_JACKET = "pmc_armor")

/obj/item/clothing/suit/storage/marine/veteran/pmc/light
	name = "\improper M4 pattern light PMC armor"
	desc = "A modification of the standard Armat Systems M3 armor. Designed for high-profile security operators and corporate mercenaries in mind. Has some armor plating removed for extra mobility."
	icon_state = "pmc_sniper"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT
	item_state_slots = list(WEAR_JACKET = "pmc_sniper")

/obj/item/clothing/suit/storage/marine/veteran/pmc/light/corporate
	name = "\improper M1 pattern corporate security armor"
	desc = "A basic vest with a Weyland-Yutani badge on the right breast. This is commonly worn by low-level guards protecting Weyland-Yutani facilities."
	icon = 'icons/mob/humans/onmob/contained/wy_goons.dmi'
	icon_state = "armor"
	item_state = "armor"
	item_state_slots = null
	contained_sprite = TRUE
	slowdown = SLOWDOWN_ARMOR_LIGHT

	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST

/obj/item/clothing/suit/storage/marine/veteran/pmc/light/corporate/lead
	desc = "A basic vest with a Weyland-Yutani badge on the right breast. This variant is worn by low-level guards that have elevated in rank due to 'good conduct in the field', also known as corporate bootlicking."
	icon_state = "lead_armor"
	item_state = "lead_armor"

/obj/item/clothing/suit/storage/marine/veteran/pmc/leader
	name = "\improper M4 pattern PMC leader armor"
	desc = "A modification of the standard Armat Systems M3 armor. Designed for high-profile security operators and corporate mercenaries in mind. This particular suit looks like it belongs to a high-ranking officer."
	icon_state = "officer_armor"
	item_state_slots = list(WEAR_JACKET = "officer_armor")

/obj/item/clothing/suit/storage/marine/veteran/pmc/sniper
	name = "\improper M4 pattern PMC sniper armor"
	icon_state = "pmc_sniper"
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	flags_inv_hide = HIDELOWHAIR
	item_state_slots = list(WEAR_JACKET = "pmc_sniper")

/obj/item/clothing/suit/storage/marine/veteran/pmc/light/synth
	name = "\improper M4 Synthetic PMC armor"
	desc = "A serious modification of the standard Armat Systems M3 armor. This variant was designed for PMC Support Units in the field, with every armor insert removed. It's designed with the idea of a high speed lifesaver in mind."
	time_to_unequip = 0.5 SECONDS
	time_to_equip = 1 SECONDS
	armor_melee = CLOTHING_ARMOR_NONE
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	storage_slots = 3
	slowdown = SLOWDOWN_ARMOR_SUPER_LIGHT

/obj/item/clothing/suit/storage/marine/veteran/pmc/light/synth/Initialize()
	flags_atom |= NO_NAME_OVERRIDE
	flags_marine_armor |= SYNTH_ALLOWED
	return ..()

/obj/item/clothing/suit/storage/marine/smartgunner/veteran/pmc
	name = "\improper PMC gunner armor"
	desc = "A modification of the standard Armat Systems M3 armor. Hooked up with harnesses and straps allowing the user to carry an M56 Smartgun."
	icon_state = "heavy_armor"
	flags_inventory = BLOCKSHARPOBJ|BLOCK_KNOCKDOWN|SMARTGUN_HARNESS
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	item_state_slots = list(WEAR_JACKET = "heavy_armor")

/obj/item/clothing/suit/storage/marine/smartgunner/veteran/pmc/terminator
	name = "\improper M5Xg exoskeleton gunner armor"
	desc = "A complex system of overlapping plates intended to render the wearer all but impervious to small arms fire. A passive exoskeleton supports the weight of the armor, allowing a human to carry its massive bulk. This variant is designed to support a M56 Smartgun."
	icon_state = "commando_armor"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	movement_compensation = SLOWDOWN_ARMOR_VERY_HEAVY
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUM
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_VERYHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_FEET
	item_state_slots = list(WEAR_JACKET = "commando_armor")
	unacidable = TRUE

/obj/item/clothing/suit/storage/marine/veteran/pmc/commando
	name = "\improper M5X exoskeleton armor"
	desc = "A complex system of overlapping plates intended to render the wearer all but impervious to small arms fire. A passive exoskeleton supports the weight of the armor, allowing a human to carry its massive bulk."
	icon_state = "commando_armor"
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	movement_compensation = SLOWDOWN_ARMOR_VERY_HEAVY
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_VERYHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	flags_inventory = BLOCK_KNOCKDOWN
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_FEET
	item_state_slots = list(WEAR_JACKET = "commando_armor")
	unacidable = TRUE


//===========================//DISTRESS\\================================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/marine/veteran/bear
	name = "\improper H1 Iron Bears vest"
	desc = "A protective vest worn by Iron Bears mercenaries."
	icon_state = "bear_armor"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	storage_slots = 2
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT

/obj/item/clothing/suit/storage/marine/veteran/dutch
	name = "\improper D2 armored vest"
	desc = "A protective vest worn by some seriously experienced mercs."
	icon_state = "dutch_armor"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS //Makes no sense but they need leg/arm armor too.
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_HIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	storage_slots = 2
	light_range = 7
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT

/obj/item/clothing/suit/storage/marine/veteran/van_bandolier
	name = "safari jacket"
	desc = "A tailored hunting jacket, cunningly lined with segmented armor plates. Sometimes the game shoots back."
	icon_state = "van_bandolier"
	item_state = "van_bandolier_jacket"
	blood_overlay_type = "coat"
	flags_marine_armor = NO_FLAGS //No shoulder light.
	actions_types = list()
	slowdown = SLOWDOWN_ARMOR_LIGHT
	storage_slots = 2
	movement_compensation = SLOWDOWN_ARMOR_LIGHT
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/storage/bible,
		/obj/item/attachable/bayonet,
		/obj/item/storage/backpack/general_belt,
		/obj/item/storage/large_holster/machete,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/smartpistol,
		/obj/item/storage/belt/gun/flaregun,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
		/obj/item/storage/belt/shotgun/van_bandolier,
	)

//===========================//U.P.P\\================================\\
//=====================================================================\\

/obj/item/clothing/suit/storage/marine/faction
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	min_cold_protection_temperature = HELMET_MIN_COLD_PROT
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROT
	blood_overlay_type = "armor"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	movement_compensation = SLOWDOWN_ARMOR_LIGHT

/obj/item/clothing/suit/storage/marine/faction/UPP
	name = "\improper 6B90 pattern UPP armor"
	desc = "Union frontline issue body armor. Part of protective complex Kuija-M, 6B90 is capable of rifle threats with new ultralight alloy plates over the vitals, while ballistic mesh inserts provide torso protection from shrapnel or ricochets. A small transmitter on the lower back supports low resolution video/audio and biotelemetry feeds for the TOC. While designed to be one size fits all, the support system proves difficult to comfortably adjust."
	icon_state = "upp_armor"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	slowdown = SLOWDOWN_ARMOR_MEDIUM
	flags_inventory = BLOCKSHARPOBJ
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_HIGH
	storage_slots = 3
	flags_inventory = BLOCKSHARPOBJ

/obj/item/clothing/suit/storage/marine/faction/UPP/heavy
	name = "\improper 6B91 pattern UPP armor"
	desc = "Union heavy armor system. Part of protective complex Kuija-M, 6B91 is an add-on kit that extends rifle grade protection along the arms, and AP protection along the chest. Because of drastically higher stamina requirements, the armor proves unpopular with most infantry, and is mostly seen in assault units or internal security forces."
	icon_state = "upp_armor_heavy"
	storage_slots = 3
	flags_inventory = BLOCKSHARPOBJ
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS

/obj/item/clothing/suit/storage/marine/faction/UPP/heavy/Initialize()
	. = ..()
	pockets.bypass_w_limit = list(
		/obj/item/ammo_magazine/minigun,
		/obj/item/ammo_magazine/pkp,
		)

/obj/item/clothing/suit/storage/marine/faction/UPP/light
	name = "\improper 6B72-03 pattern UPP armor"
	desc = "Vintage UPP armor system Vadasz. Provides basic ballistic/shrapnel protection for armor crew or rear line forces with wraparound soft armor and ceramic composite chestplate. Lightweight, but lacking protection class and coverage. Still issued to the Territorial Guard and People's Armed Police tactical teams, and utilized by some spetznaz."
	icon_state = "upp_armor_light"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	slowdown = SLOWDOWN_ARMOR_LIGHT
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	time_to_unequip = 10
	time_to_equip = 10
	storage_slots = 2
	flags_inventory = null

/obj/item/clothing/suit/storage/marine/faction/UPP/light/pap
	name = "\improper 6B72-03 pattern UPP armor"
	desc = "Vintage UPP armor system Vadasz. Provides basic ballistic/shrapnel protection for armor crew or rear line forces with wraparound soft armor and ceramic composite chestplate. Lightweight, but lacking protection class and coverage. Still issued to the Territorial Guard and People's Armed Police tactical teams, and utilized by some spetznaz. This set lacks additional leg guards."
	icon_state = "upp_armor_pap"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/suit/storage/marine/faction/UPP/jacket
	name = "\improper UH4 camouflaged jacket"
	icon_state = "upp_coat"
	desc = "Military jacket featuring small dispersed para-aramid inserts providing the barest of defensive functionality, and a Personal Light Unit rig."
	blood_overlay_type = "coat"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	slowdown = SLOWDOWN_ARMOR_LIGHT
	armor_melee = CLOTHING_ARMOR_VERYLOW
	armor_bullet = CLOTHING_ARMOR_VERYLOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	storage_slots = 2
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_DECOR, ACCESSORY_SLOT_MEDAL)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND)
	time_to_unequip = 5
	time_to_equip = 5

/obj/item/clothing/suit/storage/marine/faction/UPP/jacket/mp
	name = "\improper UH4-P camouflaged jacket"
	desc = "A UPP Military Police jacket featuring small dispersed para-aramid inserts providing the barest of defensive functionality, and a Personal Light Unit rig."
	icon_state = "upp_coat_mp"

/obj/item/clothing/suit/storage/marine/faction/UPP/jacket/pap
	name = "\improper PaP uniform jacket"
	desc = "A People's Armed Police service jacket featuring small dispersed para-aramid inserts providing the barest of defensive functionality, and a Personal Light Unit rig."
	icon_state = "upp_coat_pap"


//===========================//FREELANCER\\================================\\
//=====================================================================\\

/obj/item/clothing/suit/storage/marine/faction/freelancer
	name = "freelancer cuirass"
	desc = "An armored protective chestplate scrapped together from various plates. It keeps up remarkably well, as the craftsmanship is solid, and the design mirrors such armors in the UPP and the USCM. The many skilled craftsmen in the freelancers ranks produce these vests at a rate about one a month."
	icon_state = "freelancer_armor"
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	storage_slots = 2

//this one is for CLF
/obj/item/clothing/suit/storage/militia
	name = "colonial militia hauberk"
	desc = "The hauberk of a colonist militia member, created from boiled leather and some modern armored plates. While not the most powerful form of armor, and primitive compared to most modern suits of armor, it gives the wearer almost perfect mobility, which suits the needs of the local colonists. It is also quick to don, easy to hide, and cheap to produce in large workshops."
	icon = 'icons/obj/items/clothing/cm_suits.dmi'
	icon_state = "rebel_armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/suit_1.dmi'
	)
	sprite_sheets = list(SPECIES_MONKEY = 'icons/mob/humans/species/monkeys/onmob/suit_monkey_1.dmi')
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	movement_compensation = SLOWDOWN_ARMOR_MEDIUM
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	storage_slots = 2
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/grenade,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/backpack/general_belt,
		/obj/item/storage/large_holster/machete,
		/obj/item/weapon/baseballbat,
		/obj/item/weapon/baseballbat/metal,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
	)
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROT
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL)

/obj/item/clothing/suit/storage/militia/Initialize()
	. = ..()
	pockets.max_w_class = SIZE_SMALL //Can contain small items AND rifle magazines.
	pockets.bypass_w_limit = list(
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/smg,
		/obj/item/ammo_magazine/sniper,
	)
	pockets.max_storage_space = 8

/obj/item/clothing/suit/storage/militia/vest
	name = "colonial militia vest"
	desc = "The hauberk of a colonist militia member, created from boiled leather and some modern armored plates. While not the most powerful form of armor, and primitive compared to most modern suits of armor, it gives the wearer almost perfect mobility, which suits the needs of the local colonists. It is also quick to don, easy to hide, and cheap to produce in large workshops. This extremely light variant protects only the chest and abdomen."
	icon_state = "clf_2"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	slowdown = 0.2
	movement_compensation = SLOWDOWN_ARMOR_MEDIUM

/obj/item/clothing/suit/storage/militia/brace
	name = "colonial militia brace"
	desc = "The hauberk of a colonist militia member, created from boiled leather and some modern armored plates. While not the most powerful form of armor, and primitive compared to most modern suits of armor, it gives the wearer almost perfect mobility, which suits the needs of the local colonists. It is also quick to don, easy to hide, and cheap to produce in large workshops. This extremely light variant has some of the chest pieces removed."
	icon_state = "clf_3"
	flags_armor_protection = BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	slowdown = 0.2
	movement_compensation = SLOWDOWN_ARMOR_MEDIUM

/obj/item/clothing/suit/storage/militia/partial
	name = "colonial militia partial hauberk"
	desc = "The hauberk of a colonist militia member, created from boiled leather and some modern armored plates. While not the most powerful form of armor, and primitive compared to most modern suits of armor, it gives the wearer almost perfect mobility, which suits the needs of the local colonists. It is also quick to don, easy to hide, and cheap to produce in large workshops. This even lighter variant has some of the arm pieces removed."
	icon_state = "clf_4"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	slowdown = 0.2

/obj/item/clothing/suit/storage/militia/smartgun
	name = "colonial militia harness"
	desc = "The hauberk of a colonist militia member, created from boiled leather and some modern armored plates. While not the most powerful form of armor, and primitive compared to most modern suits of armor, it gives the wearer almost perfect mobility, which suits the needs of the local colonists. It is also quick to don, easy to hide, and cheap to produce in large workshops. This one has straps interweaved with the plates, that allow the user to fire a captured smartgun, if a bit uncomfortably."
	flags_inventory = BLOCKSHARPOBJ|SMARTGUN_HARNESS

/obj/item/clothing/suit/storage/CMB
	name = "\improper CMB Deputy jacket"
	desc = "A polyster blue bomber jacket enforced with light ballistic weaving. It has a Marshal's Deputy badge pinned to it. The back is enscribed with the word 'DEPUTY'."
	icon_state = "CMB_jacket"
	item_state = "CMB_jacket"
	blood_overlay_type = "coat"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/weapon/baton,
		/obj/item/restraint/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/crew_monitor,
		/obj/item/tool/pen,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,
		/obj/item/storage/large_holster/machete,
		/obj/item/storage/large_holster/katana,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
	)
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_DECOR)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND)

/obj/item/clothing/suit/storage/CMB/Initialize()
	. = ..()
	pockets.max_w_class = SIZE_SMALL //Can contain small items AND rifle magazines.
	pockets.bypass_w_limit = list(
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/smg,
		/obj/item/ammo_magazine/sniper,
	)
	pockets.max_storage_space = 8

/obj/item/clothing/suit/storage/CMB/marshal
	name = "\improper CMB Marshal jacket"
	desc = "A thick and stylish black leather jacket with a Marshal's badge pinned to it. The back is enscribed with the powerful letters of 'MARSHAL' representing justice, authority, and protection in the outer rim. The laws of the Earth stretch beyond the Sol."
	icon_state = "CMB_jacket_marshal"
	item_state = "CMB_jacket_marshal"

//===========================//HELGHAST - MERCENARY\\================================\\
//=====================================================================\\

/obj/item/clothing/suit/storage/marine/veteran/mercenary
	name = "\improper K12 ceramic plated armor"
	desc = "A set of grey, heavy ceramic armor with dark blue highlights. It is the standard uniform of an unknown mercenary group working in the sector."
	icon_state = "mercenary_heavy_armor"
	flags_inventory = BLOCKSHARPOBJ|BLOCK_KNOCKDOWN
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_HIGHPLUS
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS
	storage_slots = 2
	slowdown = SLOWDOWN_ARMOR_LIGHT
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine/,
		/obj/item/weapon/baton,
		/obj/item/restraint/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/sword/machete,
		/obj/item/attachable/bayonet,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
	)
	item_state_slots = list(WEAR_JACKET = "mercenary_heavy_armor")

/obj/item/clothing/suit/storage/marine/veteran/mercenary/heavy
	name = "\improper Modified K12 ceramic plated armor"
	desc = "A set of grey, heavy ceramic armor with dark blue highlights. It has been modified with extra ceramic plates placed in its storage pouch, and seems intended to support an extremely heavy weapon."
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGHPLUS
	armor_bio = CLOTHING_ARMOR_HIGHPLUS
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_VERYHIGHPLUS
	storage_slots = 1

/obj/item/clothing/suit/storage/marine/veteran/mercenary/miner
	name = "\improper Y8 armored miner vest"
	desc = "A set of beige, light armor built for protection while mining. It is a specialized uniform of an unknown mercenary group working in the sector."
	icon_state = "mercenary_miner_armor"
	storage_slots = 3
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine/,
		/obj/item/weapon/baton,
		/obj/item/restraint/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/sword/machete,
		/obj/item/attachable/bayonet,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
	)
	item_state_slots = list(WEAR_JACKET = "mercenary_miner_armor")

/obj/item/clothing/suit/storage/marine/veteran/mercenary/support
	name = "\improper Z7 armored vest"
	desc = "A set of blue armor with yellow highlights built for protection while building or carrying out medical treatment in highly dangerous environments. It is a specialized uniform of an unknown mercenary group working in the sector."
	icon_state = "mercenary_engineer_armor"
	item_state_slots = list(WEAR_JACKET = "mercenary_engineer_armor")

/obj/item/clothing/suit/storage/marine/M3G/hefa
	name = "\improper HEFA Knight armor"
	desc = "A thick piece of armor adorning a HEFA. Usually seen on a HEFA knight."
	specialty = "HEFA Knight"
	icon_state = "hefadier"
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_item = NO_CRYO_STORE
	flags_marine_armor = ARMOR_LAMP_OVERLAY
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_GIGAHIGH


//=========================//PROVOST\\================================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/marine/MP/provost
	name = "\improper M3 pattern Provost armor"
	desc = "A standard Provost M3 Pattern Chestplate. Protects the chest from ballistic rounds, bladed objects and accidents. It has a small leather pouch strapped to it for limited storage."
	icon_state = "pvmedium"
	item_state_slots = list(WEAR_JACKET = "pvmedium")
	slowdown = SLOWDOWN_ARMOR_LIGHT
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	storage_slots = 3

/obj/item/clothing/suit/storage/marine/MP/provost/tml
	name = "\improper M3 pattern Senior Provost armor"
	desc = "A more refined Provost M3 Pattern Chestplate for senior officers. Protects the chest from ballistic rounds, bladed objects and accidents. It has a small leather pouch strapped to it for limited storage."
	icon_state = "pvleader"
	item_state_slots = list(WEAR_JACKET = "pvleader")

/obj/item/clothing/suit/storage/marine/MP/provost/marshal
	name = "\improper M5 pattern Provost Marshal armor"
	desc = "A custom fit luxury armor suit for Provost Marshals. Useful for letting your men know who is in charge when taking to the field."
	icon_state = "pvmarshal"
	item_state_slots = list(WEAR_JACKET = "pvmarshal")
	w_class = SIZE_MEDIUM
	storage_slots = 4

/obj/item/clothing/suit/storage/marine/MP/provost/light
	name = "\improper M3 pattern Provost light armor"
	desc = "A lighter Provost M3 Pattern Chestplate. Protects the chest from ballistic rounds, bladed objects and accidents. It has a small leather pouch strapped to it for limited storage."
	icon_state = "pvlight"
	item_state_slots = list(WEAR_JACKET = "pvlight")
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT

/obj/item/clothing/suit/storage/marine/MP/provost/light/flexi
	name = "\improper M3 pattern Provost flexi-armor"
	desc = "A flexible and easy to store M3 Pattern Chestplate. Protects the chest from ballistic rounds, bladed objects and accidents. It has a small leather pouch strapped to it for limited storage."
	w_class = SIZE_MEDIUM
	icon_state = "pvlight_2"
	item_state_slots = list(WEAR_JACKET = "pvlight_2")
	storage_slots = 2

//================//UNITED AMERICAS ALLIED COMMAND\\=====================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/marine/uaac/tis/sa
	name = "\improper M3 pattern UAAC-TIS Special Agent Armor"
	desc = "A modified luxury armor, originally meant for a USCM Provost Marshall, modified to use the colors and insignia of the TIS. The Three Eyes is technically able to requisition any equipment or personnel to fulfill its mission and often uses this privilege to outfit their agents with high-quality gear from other UA military forces."
	icon_state = "tis"
	item_state_slots = list(WEAR_JACKET = "tis")
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	storage_slots = 2
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine/,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/weapon/baton,
		/obj/item/restraint/handcuffs,
		/obj/item/explosive/grenade,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/backpack/general_belt,
		/obj/item/device/hailer,
		/obj/item/storage/belt/gun,
		/obj/item/weapon/sword/ceremonial,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
	)

//================//UNITED AMERICAS RIOT CONTROL\\=====================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/marine/veteran/ua_riot
	name = "\improper UA-M1 body armor"
	desc = "Based on the M-3 pattern employed by the USCM, the UA-M1 body armor is employed by UA security, riot control and union-busting teams. While robust against melee and bullet attacks, it critically lacks coverage of the legs and arms."
	icon_state = "ua_riot"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT  // it's lighter
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/suit/storage/marine/veteran/ua_riot/synth
	name = "\improper UA-M1S Synthetic body armor"
	desc = "Based on the M-3 pattern employed by the USCM, the UA-M1 body armor is employed by UA security, riot control and union-busting teams. The UA-1MS modification is Synthetic programming compliant, sacrificing protection for speed and carrying capacity."
	armor_melee = CLOTHING_ARMOR_NONE
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	slowdown = SLOWDOWN_ARMOR_SUPER_LIGHT
	storage_slots = 3
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	flags_marine_armor = ARMOR_SQUAD_OVERLAY|ARMOR_LAMP_OVERLAY|SYNTH_ALLOWED

//================//=ROYAL MARINES=\\====================================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/marine/veteran/royal_marine
	name = "kestrel armoured vest"
	desc = "A customizable personal armor system used by the Three World Empire's Royal Marines Commandos. Designers from a Weyland Yutani subsidary, Lindenthal-Ehrenfeld Militärindustrie, iterated on the USCMC's M3 pattern personal armor in their Tokonigara lab to create an armor systemed to suit the unique needs of the Three World Empire's smaller but better equipped Royal Marines."
	icon_state = "rmc_light"
	item_state = "rmc_light"
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine/,
		/obj/item/weapon/baton,
		/obj/item/restraint/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/sword/machete,
		/obj/item/attachable/bayonet,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
	)

/obj/item/clothing/suit/storage/marine/veteran/royal_marine/light //RMC Rifleman Armor
	icon_state = "rmc_light"
	item_state = "rmc_light"
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	slowdown = SLOWDOWN_ARMOR_LIGHT

/obj/item/clothing/suit/storage/marine/veteran/royal_marine/light/team_leader //RMC TL & LT Armor
	name = "kestrel armoured carry vest"
	icon_state = "rmc_light_padded"
	item_state = "rmc_light_padded"
	storage_slots = 7

/obj/item/clothing/suit/storage/marine/veteran/royal_marine/smartgun //Smartgun Spec Armor
	name = "kestrel armoured smartgun harness"
	icon_state = "rmc_smartgun"
	item_state = "rmc_smartgun"
	flags_inventory = BLOCKSHARPOBJ|BLOCK_KNOCKDOWN|SMARTGUN_HARNESS

/obj/item/clothing/suit/storage/marine/veteran/royal_marine/pointman //Pointman Spec Armor
	name = "kestrel pointman armour"
	desc = "A heavier version of the armor system used by the Three World Empire's Royal Marines Commandos. Designers from a Weyland Yutani subsidary, Lindenthal-Ehrenfeld Militärindustrie, iterated on the USCMC's M3 pattern personal armor in their Tokonigara lab to create an armor systemed to suit the unique needs of the Three World Empire's smaller but better equipped Royal Marines."
	icon_state = "rmc_pointman"
	item_state = "rmc_pointman"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGHPLUS
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	storage_slots = 7
	slowdown = SLOWDOWN_ARMOR_LOWHEAVY
	movement_compensation = SLOWDOWN_ARMOR_MEDIUM

/atom/movable/marine_light
	light_system = DIRECTIONAL_LIGHT

//CBRN
/obj/item/clothing/suit/storage/marine/cbrn
	name = "\improper M3-M armor"
	desc = "While lacking the appearance of the M3 pattern armor worn in regular service, this armor piece is still a derivative of it. It has been heavily modified to fit over the MOPP suit with additional padding and Venlar composite layers removed, so as not to restrict the wearer’s movement. However, with the reduction of composite layers, the personal protection offered is less than desired with complaints having been lodged since 2165."
	icon_state = "cbrn"
	item_state = "cbrn"
	slowdown = SLOWDOWN_ARMOR_HEAVY
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad =CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_marine_armor = NO_FLAGS
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_inventory = BLOCKSHARPOBJ
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/suit/storage/marine/cbrn/advanced
	slowdown = SLOWDOWN_ARMOR_LOWHEAVY
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_rad = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS
