// --- Krieg -- \\

/obj/item/tool/shovel/krieg
	name = "entrenching tool"
	desc = "Used to dig holes and bash heads in. Folds in to fit in small spaces."
	icon  = 'void-marines/wh40k/icons/weapon/misc.dmi'
	icon_state = "entrenching_tool"
	item_state = "etool"
	force = MELEE_FORCE_STRONG
	throwforce = 2
	w_class = SIZE_MEDIUM

	dirt_overlay = "etool_overlay"
	dirt_amt_per_dig = 5
	shovelspeed = 50

/obj/item/clothing/under/rank/krieg_uniform
	name = "Krieg Battle Uniform"
	desc = "These durable Battle Uniform are used to represent the resilent Krieg Regiment, Though it smells like shit."
	icon = 'void-marines/wh40k/icons/krieg/icons/uniforms.dmi'
	icon_state = "krieg"
	item_state = "krieg_s"
	worn_state = "krieg_s"
	item_icons = list(
		WEAR_BODY = 'void-marines/wh40k/icons/krieg/uniform.dmi'
	)


/obj/item/clothing/suit/armor/storage/krieger
	name = "Krieg Overcoat"
	desc = "Produced out of thick, durable synthetic fabric, Though at the cost of protection, the Greatcoat is waterproof and resistant to most chemical & biological attacks.. It also stinks."
	icon = 'void-marines/wh40k/icons/krieg/icons/suits.dmi'
	icon_state = "kriegcoat"
	item_state = "kriegcoat"
	item_icons = list(
		WEAR_JACKET = 'void-marines/wh40k/icons/krieg/suit.dmi'
	)

	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/suit/armor/storage/krieger/grenadier
	name = "Krieg Grenadier Overcoat"
	desc = "Produced out of thick, durable synthetic fabric, Though at the cost of protection, the Greatcoat is waterproof and resistant to most chemical & biological attacks.. It also stinks. This one has been plated with Carapace platings, making it extremely protective at the cost of mobility."
	icon_state = "grencoat"
	item_state = "grencoat"

/obj/item/storage/backpack/satchel/krieger
	desc = "Field ready kit, tried and tested through countless encounters."
	icon = 'void-marines/wh40k/icons/krieg/icons/storage.dmi'
	icon_state = "kriegpack"
	item_state = "kriegpack"
	item_icons = list(
		WEAR_BACK = 'void-marines/wh40k/icons/krieg/back.dmi'
	)

/obj/item/storage/backpack/satchel/krieger/grenadier
	desc = "An assembled kit for air filtration, weapon power supply, and basic storage. Perfect to bring with you into no man's land."
	icon_state = "grenpack"
	item_state = "grenpack"

/obj/item/clothing/gloves/combat/krieg
	name = "Krieg Pattern Combat Gloves"
	desc = "The Krieg Guardsman's distinct gloves designed to be resistant against all common chemical and biological attacks, It's also works well as a alternative to hauling corpses due to it distinct smell."
	icon = 'void-marines/wh40k/icons/krieg/icons/gloves.dmi'
	icon_state = "krieggloves"
	item_state = "krieggloves"
	item_icons = list(
		WEAR_HANDS = 'void-marines/wh40k/icons/krieg/hands.dmi'
	)

	flags_armor_protection = BODY_FLAG_HANDS
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/shoes/jackboots/krieg
	name = "Krieg Pattern Combat Boots"
	desc = "The Krieg Regiment, unlike most of the Astra Militarum, prefer their less protective but more mobile boots over the standard Mars Pattern used by the Munitorium."
	icon_state = "kriegboots"
	item_state = "kriegboots"
	icon = 'void-marines/wh40k/icons/krieg/icons/shoes.dmi'
	item_icons = list(
		WEAR_FEET = 'void-marines/wh40k/icons/krieg/feet.dmi'
	)

	flags_armor_protection = BODY_FLAG_FEET
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/shoes/jackboots/krieg/grenadier
	name = "Krieg Grenadier Pattern Combat Boots"
	desc = "The Krieg Regiment, unlike most of the Astra Militarum, prefer their less protective but more mobile boots over the standard Mars Pattern used by the Munitorium. Though, in this particular case they have lamented to armoring their own."
	icon_state = "grenboots"
	item_state = "grenboots"

/obj/item/clothing/head/helmet/krieghelmet
	name = "Krieg Mark IX Helmet"
	desc = "Unlike the more common Cadian-pattern, the Mark IX is made out of durable plasteel, giving it higher defensive capabilities though at the cost of weight and production."
	icon_state = "krieghelm"
	item_state = "krieghelm"
	icon = 'void-marines/wh40k/icons/krieg/icons/hats.dmi'
	item_icons = list(
		WEAR_HEAD = 'void-marines/wh40k/icons/krieg/head.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM



/obj/item/clothing/head/helmet/krieghelmet/sgt
	name = "Krieg Watchmaster Helmet"
	desc = "Unlike the more common Cadian-pattern, the Mark IX is made out of durable plasteel, giving it higher defensive capabilities though at the cost of weight and production."
	icon_state = "WatchHelm"
	item_state = "WatchHelm"

/obj/item/clothing/mask/gas/krieg
	name = "Mark IXb Gas Mask"
	desc = "Designed specifically to fit in with the Mark IX Helmet issued to Krieg Guardsman."
	icon_state = "kriegmask"
	item_state = "kriegmask"
	icon = 'void-marines/wh40k/icons/krieg/icons/masks.dmi'
	item_icons = list(
		WEAR_FACE = 'void-marines/wh40k/icons/krieg/mask.dmi'
	)


/obj/item/clothing/mask/gas/krieg/grenadier
	name = "Mark IXc Gas Mask"
	desc = "Designed specifically to fit in with the Mark IX Helmet issued to Krieg Grenadier, with additional slight armor protection."
	icon_state = "grenmask"
	item_state = "grenmask"

// Commissar

/obj/item/clothing/under/commissar
	name = "Commissar's formal uniform"
	desc = "A male Commissar's formal-wear, for special occasions."
	icon_state = "hos_formal_male"
	item_state = "r_suit"
	worn_state = "r_suit"

/obj/item/clothing/head/helmet/commissar
	name = "Commissar's Peaked Cap"
	desc = "The fearsome and charismatic peaked cap of a Imperial Guard Commissar, Striking dreads to the lowly Guardsmen and the ever-watching heretics."
	icon_state = "Commissar4Hat"
	item_state = "Commissar4Hat"
	icon = 'void-marines/wh40k/icons/krieg/icons/hats.dmi'
	item_icons = list(
		WEAR_HEAD = 'void-marines/wh40k/icons/krieg/head.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM


/obj/item/clothing/suit/armor/storage/commissar
	name = "Commissar's Trenchcoat"
	desc = "The Commissar's magnificent, charismatic that strikes dreads and fears into the mind of lowly Imperial Guardsmen and heretics alike. Plated in Caraspace, giving it much more protection than average Guardsman."
	icon_state = "Commissar4"
	item_state = "Commissar4"
	icon ='void-marines/wh40k/icons/krieg/icons/suits.dmi'
	item_icons = list(
		WEAR_JACKET = 'void-marines/wh40k/icons/krieg/suit.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM


/obj/item/clothing/suit/armor/storage/commissar/krieg
	name = "Commissar's Breastplate"
	desc = "The Commissar's iconic coat, this out tailored to match more of the uniform theme of the Officers of Krieg. Though the Krieg Guardsmen don't fear you, the others certainly will."
	icon_state = "Kriegissarplate"
	item_state = "Kriegissarplate"

/obj/item/clothing/mask/gas/krieg/commissar
	name = "Mark IXb/C Gas Mask"
	desc = "Krieg Regiment Commissar are issued with the same pattern of Gas mask like the others, However this one have slight different hue."
	icon_state = "commask"
	item_state = "commask"

/obj/item/clothing/head/helmet/commissar/krieg
	name = "Commissar's Peaked Cap"
	desc = "The fearsome and charismatic peaked cap of a Imperial Guard Commissar, Striking dreads to the lowly Guardsmen and the ever-watching heretics."
	icon_state = "KriegissarHat"
	item_state = "KriegissarHat"

/obj/item/clothing/under/rank/krieg_uniform/commissar
	name = "Commissar's Dress Uniform"
	desc = "More standard uniform of the Commissars of the Officio Prefectus, just with some Krieg emblems on them in an attempt to similate."
	icon_state = "kriegissar"
	item_state = "kriegissar_s"
	worn_state = "kriegissar_s"

// --- LUCIUS --- \\
