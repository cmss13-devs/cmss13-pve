
/obj/item/clothing/under/gimmick
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_LOW
	has_sensor = UNIFORM_NO_SENSORS
	displays_id = 0

//JASON
/obj/item/clothing/under/gimmick/jason
	name = "dirty work attire"
	desc = "Perfect thing to wear when digging graves."
	icon_state = "jason_suit"

/obj/item/clothing/mask/gimmick/jason
	name = "hockey mask"
	desc = "It smells like teenage spirit."
	icon_state = "jason_mask"
	anti_hug = 100

/obj/item/clothing/suit/gimmick/jason
	name = "musty jacket"
	desc = "A killer fashion statement."
	icon_state = "jason_jacket"
	item_state = "jason_jacket"

//DUTCH
/obj/item/clothing/under/gimmick/dutch
	name = "combat fatigues"
	desc = "Just another pair of military fatigues for a grueling tour in a jungle."
	icon_state = "dutch_suit"
	flags_armor_protection = BODY_FLAG_LEGS|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_LEGS|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_LEGS|BODY_FLAG_GROIN

/obj/item/clothing/suit/armor/gimmick/dutch
	name = "armored jacket"
	desc = "It's hot in the jungle. Sometimes it's hot and heavy, and sometimes it's hell on earth."
	icon_state = "dutch_armor"
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine/,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/backpack/general_belt,
		/obj/item/storage/large_holster/machete,
	)
