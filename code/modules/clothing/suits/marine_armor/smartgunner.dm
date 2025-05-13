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
		/obj/item/storage/large_holster/machete/smartgunner,
	)
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_SGPAINT, ACCESSORY_SLOT_PAINT, ACCESSORY_SLOT_PONCHO)

/obj/item/clothing/suit/storage/marine/smartgunner/Initialize()
	. = ..()
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD] && name == "\improper M56 combat harness" && !(flags_atom & NO_SNOW_TYPE))
		name = "M56 snow combat harness"
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

//Customizable Variant
/obj/item/clothing/suit/marine/smartgunner
	name = "\improper M56 combat harness"
	desc = "Lightweight vest composed of ballistic micromesh and a ceramic composite chestplate for practical protection, as well as the computers, straps, and armature required for operating the M56 Smartgun itself."
	icon_state = "8"
	item_state = "armor"
	armor_laser = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
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
		/obj/item/storage/large_holster/machete/smartgunner,
		/obj/item/weapon/gun/smartgun,
	)
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_SGPAINT, ACCESSORY_SLOT_M56UTILITY, ACCESSORY_SLOT_DECORSHIN, ACCESSORY_SLOT_PAINT, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_DECORKNEE)
	restricted_accessory_slots = list(ACCESSORY_SLOT_SGPAINT, ACCESSORY_SLOT_DECORBRACER, ACCESSORY_SLOT_M56UTILITY, ACCESSORY_SLOT_DECORSHIN, ACCESSORY_SLOT_PAINT, ACCESSORY_SLOT_DECORKNEE)

/obj/item/clothing/suit/marine/smartgunner/Initialize()
	. = ..()
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD] && name == "\improper M56 combat harness" && !(flags_atom & NO_SNOW_TYPE))
		name = "\improper M56 snow combat harness"
	//select_gamemode_skin(type)

/obj/item/clothing/suit/marine/smartgunner/mob_can_equip(mob/equipping_mob, slot, disable_warning = FALSE)
	. = ..()

	if(equipping_mob.back && !(equipping_mob.back.flags_item & SMARTGUNNER_BACKPACK_OVERRIDE))
		if(!disable_warning)
			to_chat(equipping_mob, SPAN_WARNING("You can't equip [src] while wearing a backpack."))
		return FALSE

/obj/item/clothing/suit/marine/smartgunner/equipped(mob/user, slot, silent)
	. = ..()

	if(slot == WEAR_JACKET)
		RegisterSignal(user, COMSIG_HUMAN_ATTEMPTING_EQUIP, PROC_REF(check_equipping))

/obj/item/clothing/suit/marine/smartgunner/proc/check_equipping(mob/living/carbon/human/equipping_human, obj/item/equipping_item, slot)
	SIGNAL_HANDLER

	if(slot != WEAR_BACK)
		return

	if(equipping_item.flags_item & SMARTGUNNER_BACKPACK_OVERRIDE || is_type_in_list(equipping_item, smartgun_back))
		return

	. = COMPONENT_HUMAN_CANCEL_ATTEMPT_EQUIP

	if(equipping_item.flags_equip_slot == SLOT_BACK)
		to_chat(equipping_human, SPAN_WARNING("You can't equip [equipping_item] on your back while wearing [src]."))
		return

/obj/item/clothing/suit/marine/smartgunner/unequipped(mob/user, slot)
	. = ..()

	UnregisterSignal(user, COMSIG_HUMAN_ATTEMPTING_EQUIP)

/obj/item/clothing/suit/marine/smartgunner/standard
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/suit/marine/smartgunner/black
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	icon_state = "8fancy"
