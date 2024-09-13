/obj/item/clothing/suit/storage/marine/smartgunner
	name = "\improper M56 combat harness"
	desc = "Lightweight vest composed of ballistic micromesh and a ceramic composite chestplate for practical protection, as well as the computers, straps, and armature required for operating the M56 Smartgun itself."
	icon_state = "8"
	item_state = "armor"
	armor_laser = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	storage_slots = 2
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_inventory = BLOCKSHARPOBJ|SMARTGUN_HARNESS
	flags_atom = NO_NAME_OVERRIDE
	unacidable = TRUE
	allowed = list(
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/mine,
		/obj/item/attachable/bayonet,
		/obj/item/weapon/gun/smartgun,
		/obj/item/storage/backpack/general_belt,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
	)
	var/list/smartgun_back = list(
		/obj/item/storage/large_holster/machete,
	)

/obj/item/clothing/suit/storage/marine/smartgunner/Initialize()
	. = ..()
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD] && name == "\improper M56 combat harness" && !(flags_atom & NO_SNOW_TYPE))
		name = "M56 snow combat harness"
	else
		name = "M56 combat harness"
	//select_gamemode_skin(type)

/obj/item/clothing/suit/storage/marine/smartgunner/mob_can_equip(mob/equipping_mob, slot, disable_warning = FALSE)
	. = ..()

	if(equipping_mob.back && !(equipping_mob.back.flags_item & SMARTGUNNER_BACKPACK_OVERRIDE))
		if(!disable_warning)
			to_chat(equipping_mob, SPAN_WARNING("You can't equip [src] while wearing a backpack."))
		return FALSE

/obj/item/clothing/suit/storage/marine/smartgunner/equipped(mob/user, slot, silent)
	. = ..()

	if(slot == WEAR_JACKET)
		RegisterSignal(user, COMSIG_HUMAN_ATTEMPTING_EQUIP, PROC_REF(check_equipping))

/obj/item/clothing/suit/storage/marine/smartgunner/proc/check_equipping(mob/living/carbon/human/equipping_human, obj/item/equipping_item, slot)
	SIGNAL_HANDLER

	if(slot != WEAR_BACK)
		return

	if(equipping_item.flags_item & SMARTGUNNER_BACKPACK_OVERRIDE || is_type_in_list(equipping_item, smartgun_back))
		return

	. = COMPONENT_HUMAN_CANCEL_ATTEMPT_EQUIP

	if(equipping_item.flags_equip_slot == SLOT_BACK)
		to_chat(equipping_human, SPAN_WARNING("You can't equip [equipping_item] on your back while wearing [src]."))
		return

/obj/item/clothing/suit/storage/marine/smartgunner/unequipped(mob/user, slot)
	. = ..()

	UnregisterSignal(user, COMSIG_HUMAN_ATTEMPTING_EQUIP)

/obj/item/clothing/suit/storage/marine/smartgunner/standard
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/suit/storage/marine/smartgunner/black
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	icon_state = "8fancy"

/obj/item/clothing/suit/storage/marine/smartgunner/upp
	name = "\improper UH7-I heavy plated harness"
	desc = "An experimental set of heavy armor with additional harnesses designed to support QYJ-72-I smartmachinegun. Heavy plates along with harnesses make wearing backpacks extremely uncomfortable and borderline impossible."
	icon_state = "upp_armor_heavy"
	storage_slots = 1
	slowdown = SLOWDOWN_ARMOR_HEAVY
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	flags_inventory = BLOCKSHARPOBJ|SMARTGUN_HARNESS|BLOCK_KNOCKDOWN
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_HIGH
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS
	uniform_restricted = list(/obj/item/clothing/under/marine/veteran/UPP, /obj/item/clothing/under/marine/veteran/UPP/medic, /obj/item/clothing/under/marine/veteran/UPP/engi)
	allowed = list(
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine,
		/obj/item/explosive/mine,
		/obj/item/attachable/bayonet,
		/obj/item/weapon/gun/pkp,
		/obj/item/storage/backpack/general_belt,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
		/obj/item/storage/large_holster/machete,
		/obj/item/storage/belt/gun/type47,
	)

	smartgun_back = list(
		/obj/item/storage/large_holster/machete,
		/obj/item/ammo_box,
	)


/obj/item/clothing/suit/storage/marine/smartgunner/upp/Initialize()
	. = ..()
	pockets.bypass_w_limit = list(
		/obj/item/ammo_magazine/minigun,
		/obj/item/ammo_magazine/pkp,
		)
