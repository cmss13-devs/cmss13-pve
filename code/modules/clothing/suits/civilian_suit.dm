
// Basic colony armor types

/obj/item/clothing/suit/armor
	flags_inventory = BLOCKSHARPOBJ
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	min_cold_protection_temperature = HELMET_MIN_COLD_PROT
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROT
	siemens_coefficient = 0.6
	w_class = SIZE_HUGE
	allowed = list(/obj/item/weapon/gun, /obj/item/storage/backpack/general_belt)//Guns only.
	uniform_restricted = list(/obj/item/clothing/under)
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L, ACCESSORY_SLOT_ARMOR_S, ACCESSORY_SLOT_ARMOR_M)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L, ACCESSORY_SLOT_ARMOR_S)
	slowdown = SLOWDOWN_ARMOR_LIGHT

	pickup_sound = "armorequip"
	drop_sound = "armorequip"

/obj/item/clothing/suit/armor/mob_can_equip(mob/living/carbon/human/M, slot, disable_warning = 0)
	. = ..()
	if (.)
		if(issynth(M) && M.allow_gun_usage == FALSE)
			M.visible_message(SPAN_DANGER("Your programming prevents you from wearing this!"))
			return 0

/obj/item/clothing/suit/armor/vest
	name = "armored vest"
	desc = "Generic venlar bulletproof vest found in the hands of various private sector security types."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/weapon/baton,
		/obj/item/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
	)

/obj/item/clothing/suit/armor/bulletproof
	name = "bulletproof vest"
	desc = "A vest that excels in protecting the wearer against high-velocity solid projectiles."
	icon_state = "bulletproof"
	item_state = "armor"
	blood_overlay_type = "armor"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM

// Unarmored vests and jackets, ect


/obj/item/clothing/suit/storage/vest

	name = "casual vest"
	desc = "A brown vest."
	icon_state = "vest_brown"
	item_state = "vest_brown"
	blood_overlay_type = "coat"
	flags_armor_protection = BODY_FLAG_CHEST
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/weapon/baton,
		/obj/item/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
	)

/obj/item/clothing/suit/storage/vest/tan
	desc = "A tan vest."
	icon_state = "vest_tan"
	item_state = "vest_tan"

/obj/item/clothing/suit/storage/vest/grey
	desc = "A casual grey vest."
	icon_state = "vest_grey"
	item_state = "vest_grey"

/obj/item/clothing/suit/storage/jacket
	name = "suit jacket"
	desc = "A khaki suit jacket."
	icon_state = "corporate_ivy"
	item_state = "corporate_ivy"
	blood_overlay_type = "coat"
	flags_armor_protection = BODY_FLAG_CHEST| BODY_FLAG_ARMS
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/weapon/baton,
		/obj/item/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
	)

/obj/item/clothing/suit/storage/jacket/ivory
	name = "suit jacket"
	desc = "An ivory suit jacket."
	icon_state = "corporate_formal"
	item_state = "corporate_formal"

/obj/item/clothing/suit/storage/jacket/black
	desc = "A black suit jacket."
	icon_state = "corporate_black"
	item_state = "corporate_black"

/obj/item/clothing/suit/storage/jacket/brown
	desc = "A brown suit jacket."
	icon_state = "corporate_brown"
	item_state = "corporate_brown"

/obj/item/clothing/suit/storage/jacket/blue
	desc = "A blue suit jacket."
	icon_state = "corporate_blue"
	item_state = "corporate_blue"

/obj/item/clothing/suit/storage/jacket/bomber
	name = "bomber jacket"
	desc = "A khaki bomber jacket popular among stationeers and blue-collar workers everywhere."
	icon_state = "jacket_khaki"
	item_state = "jacket_khaki"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/suit/storage/jacket/bomber/red
	desc = "A reddish-brown bomber jacket popular among stationeers and blue-collar workers everywhere."
	icon_state = "jacket_red"
	item_state = "jacket_red"

/obj/item/clothing/suit/storage/jacket/bomber/grey
	desc = "A blue-grey bomber jacket popular among stationeers and blue-collar workers everywhere."
	icon_state = "jacket_grey"
	item_state = "jacket_grey"

/obj/item/clothing/suit/storage/apron/overalls
	name = "coveralls"
	desc = "A pair of denim overalls. With a large pocket in the front these overalls are popular with workers of all kinds."
	icon_state = "overalls"
	item_state = "overalls"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/weapon/baton,
		/obj/item/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
	)

/obj/item/clothing/suit/storage/apron/overalls/tan
	desc = "A pair of tan overalls. With a large pocket in the front these overalls are popular with workers of all kinds."
	icon_state = "overalls_tan"
	item_state = "overalls_tan"

/obj/item/clothing/suit/storage/apron/overalls/red
	desc = "A pair of reddish-brown overalls. With a large pocket in the front these overalls are popular with workers of all kinds."
	icon_state = "overalls_red"
	item_state = "overalls_red"


/obj/item/clothing/suit/apron
	name = "apron"
	desc = "A basic blue apron."
	icon_state = "apron"
	item_state = "apron"
	blood_overlay_type = "armor"
	flags_armor_protection = 0
	allowed = list (
		/obj/item/reagent_container/spray/plantbgone,
		/obj/item/device/analyzer/plant_analyzer,
		/obj/item/seeds,/obj/item/reagent_container/glass/fertilizer,
		/obj/item/tool/minihoe,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/pen,
	)

/obj/item/clothing/suit/chef/classic
	name = "A classic chef's apron."
	desc = "A basic, dull, white chef's apron."
	icon_state = "apronchef"
	item_state = "apronchef"
	blood_overlay_type = "armor"
	flags_armor_protection = 0
	allowed = list (
		/obj/item/tool/kitchen/knife,
		/obj/item/tool/kitchen/knife/butcher,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/pen,
	)

// Hazard Vest
/obj/item/clothing/suit/storage/hazardvest
	name = "orange hazard vest"
	desc = "An orange high-visibility vest used in work zones."
	icon_state = "hazard"
	item_state = "hazard"
	blood_overlay_type = "armor"
	allowed = list (
		/obj/item/device/analyzer,
		/obj/item/device/multitool,
		/obj/item/device/pipe_painter,
		/obj/item/device/radio,
		/obj/item/device/t_scanner,
		/obj/item/tool/crowbar,
		/obj/item/tool/screwdriver,
		/obj/item/tool/weldingtool,
		/obj/item/tool/wirecutters,
		/obj/item/tool/wrench,
		/obj/item/clothing/mask/gas,

		/obj/item/weapon/gun,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/weapon/baton,
		/obj/item/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/crew_monitor,
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
		/obj/item/storage/large_holster/katana,
		/obj/item/device/motiondetector,
	)
	flags_armor_protection = BODY_FLAG_CHEST
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL)

/obj/item/clothing/suit/storage/hazardvest/blue
	name = "blue hazard vest"
	desc = "A blue high-visibility vest used in work zones."
	icon_state = "hazard_blue"
	item_state = "hazard_blue"

/obj/item/clothing/suit/storage/hazardvest/weymart
	name = "\improper WeyMart vest"
	desc = "A WeyMart employee vest."
	icon_state = "hazard_weymart"
	item_state = "hazard_weymart"

/obj/item/clothing/suit/storage/hazardvest/black
	name = "black hazard vest"
	desc = "A niche-market, black, allegedly high-visibility vest supposedly used in work zones. Features extra-reflective tapes. The etiquette on the vest insists that it's fully compliant with all the United American workplace safety standards."
	icon_state = "hazard_black"
	item_state = "hazard_black"

// Windbreakers

/obj/item/clothing/suit/storage/windbreaker
	name = "windbreaker parent object"
	desc = "This shouldn't be here..."
	blood_overlay_type = "armor"
	allowed = list(
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/weapon/baton,
		/obj/item/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,

		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,
		/obj/item/weapon/gun,

		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/crew_monitor,
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
		/obj/item/storage/large_holster/katana,
		/obj/item/device/motiondetector,
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_DECOR, ACCESSORY_SLOT_MEDAL)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND)
	var/zip_unzip = FALSE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/storage/windbreaker/attack_self(mob/user) //Adds UI button
	..()

	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	if(H.wear_suit != src)
		return

	playsound(user, "sound/items/zip.ogg", 10, TRUE)
	zip_unzip(user)

/obj/item/clothing/suit/storage/windbreaker/proc/zip_unzip(mob/user)

	if(zip_unzip)
		icon_state = initial(icon_state)
		to_chat(user, SPAN_NOTICE("You zip \the [src]."))

	else
		icon_state = "[initial(icon_state)]_o"
		to_chat(user, SPAN_NOTICE("You unzip \the [src]."))
	zip_unzip = !zip_unzip

	update_clothing_icon()

/obj/item/clothing/suit/storage/windbreaker/brown
	desc = "A brown windbreaker."
	icon_state = "windbreaker_brown"

/obj/item/clothing/suit/storage/windbreaker/blue
	desc = "A blue windbreaker."
	icon_state = "windbreaker_blue"

/obj/item/clothing/suit/storage/windbreaker/green
	desc = "A green windbreaker."
	icon_state = "windbreaker_green"

/obj/item/clothing/suit/storage/windbreaker/yellow
	desc = "A yellow windbreaker."
	icon_state = "windbreaker_yellow"

