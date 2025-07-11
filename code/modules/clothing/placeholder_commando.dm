//Armor

/obj/item/clothing/suit/storage/marine/veteran/pmc/temp
	icon = 'icons/obj/items/clothing/pmc_commando_temp.dmi'
	contained_sprite = 1

/obj/item/clothing/suit/storage/marine/veteran/pmc/temp/armor_elite
	name = "\improper WY tactical armor"
	desc = "A contender for service with the Royal Marine Commandos, it is presently, exclusively, field tested by Weyland-Yutani mercenaries."
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	icon_state = "pmc_armor_elite"
	storage_slots = 2
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE|SMARTGUN_HARNESS
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
		/obj/item/storage/large_holster/m39,
		/obj/item/weapon/sword/machete,
		/obj/item/attachable/bayonet,
		/obj/item/device/motiondetector,
		/obj/item/tool/crew_monitor,
		/obj/item/storage/backpack/general_belt,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/flaregun,
		/obj/item/device/walkman,
		/obj/item/storage/belt/gun/m39,
		/obj/item/storage/belt/gun/xm51,
	)
	item_state_slots = list(WEAR_JACKET = "pmc_armor_elite")

/obj/item/clothing/suit/storage/marine/smartgunner/veteran/pmc/temp
	name = "\improper PMC gunner armor"
	desc = "A modification of the standard Armat Systems M3 armor. Hooked up with harnesses and straps allowing the user to carry an M56 Smartgun."
	icon = 'icons/obj/items/clothing/pmc_commando_temp.dmi'
	contained_sprite = 1
	icon_state = "pmc_armor_elite"
	flags_inventory = BLOCKSHARPOBJ|BLOCK_KNOCKDOWN|SMARTGUN_HARNESS
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	item_state_slots = list(WEAR_JACKET = "pmc_armor_elite")


/obj/item/clothing/suit/storage/marine/veteran/pmc/temp/armor_elite/one
	icon_state = "combat_android_jacket"
	item_state_slots = list(WEAR_JACKET = "combat_android_jacket")

/obj/item/clothing/suit/storage/marine/veteran/pmc/temp/armor_elite/two
	icon_state = "invis_android_jacket"
	item_state_slots = list(WEAR_JACKET = "invis_android_jacket")

/obj/item/clothing/suit/storage/marine/veteran/pmc/temp/armor_elite/three
	icon_state = "pmc_armor_elite_leader"
	item_state_slots = list(WEAR_JACKET = "pmc_armor_elite_leader")

/obj/item/clothing/suit/storage/marine/smartgunner/veteran/pmc/temptwo
	name = "\improper PMC gunner armor"
	desc = "A modification of the standard Armat Systems M3 armor. Hooked up with harnesses and straps allowing the user to carry an M56 Smartgun."
	icon = 'icons/obj/items/clothing/pmc_commando_temp.dmi'
	contained_sprite = 1
	icon_state = "pmc_armor_elite_leader"
	flags_inventory = BLOCKSHARPOBJ|BLOCK_KNOCKDOWN|SMARTGUN_HARNESS
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	item_state_slots = list(WEAR_JACKET = "pmc_armor_elite_leader")


//Helmets

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp
	name = "\improper tactical helmet"
	desc = "A contender for service with the Royal Marine Commandos, it is presently, exclusively, field tested by Weyland-Yutani mercenaries. This configuration lacks the iconic ballistic mask popularized by Soldier of Fortune magazine."
	icon = 'icons/obj/items/clothing/pmc_commando_temp.dmi'
	icon_state = "pmcc_helmet"
	contained_sprite = 1
	flags_armor_protection = BODY_FLAG_HEAD
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDETOPHAIR
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY|HELMET_GARB_OVERLAY

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/one
	icon_state = "combat_android_helmet_on"

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/two
	icon_state = "invis_android_helmet_on"

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/two
	icon_state = "pmc_helmet_elite"

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/three
	icon_state = "pmc_helmet_elite_sg"

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/three
	icon_state = "pmc_helmet_elite_leader"

//Backpacks
/obj/item/storage/backpack/pmc/temp
	name = "standard PMC backpack"
	desc = "A PMC standard-carry combat pack."
	icon = 'icons/obj/items/clothing/pmc_commando_temp.dmi'
	contained_sprite = 1
	storage_slots = null
	max_storage_space = 21 //backpack size
	icon_state = "pmc_backpack"
	worn_accessible = TRUE

/obj/item/storage/backpack/pmc/temp/one
	icon_state = "combat_android_powerpack"

/obj/item/storage/backpack/pmc/temp/two
	icon_state = "invis_android_powerpack"

/obj/item/storage/backpack/pmc/temp/three
	icon_state = "pmc_welderpack"

/obj/item/storage/backpack/pmc/temp/four
	icon_state = "commando_backpack"

/obj/item/storage/backpack/pmc/temp/five
	icon_state = "commando_leader_backpack"

//Under
/obj/item/clothing/under/marine/veteran/pmc/temp
	name = "\improper PMC fatigues"
	desc = "A white set of fatigues, designed for private security operators. The symbol of the Weyland-Yutani corporation is emblazed on the suit."
	icon = 'icons/obj/items/clothing/pmc_commando_temp.dmi'
	contained_sprite = 1
	icon_state = "combat_android_uniform"
	worn_state = "combat_android_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/pmc/temp/two
	icon_state = "invis_android_uniform"
	worn_state = "invis_android_uniform"
