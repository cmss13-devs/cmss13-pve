/obj/item/clothing/suit/storage/jacket/marine //BASE ITEM
	name = "marine jacket"
	//This really should not be spawned
	desc = "What the hell is this doing here?"
	icon = 'icons/obj/items/clothing/cm_suits.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/suit_1.dmi'
	)
	sprite_sheets = list(SPECIES_MONKEY = 'icons/mob/humans/species/monkeys/onmob/suit_monkey_1.dmi')
	blood_overlay_type = "coat"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	armor_melee = CLOTHING_ARMOR_VERYLOW
	armor_bullet = CLOTHING_ARMOR_VERYLOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_LOW //marginally better against shrapnel.
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	allowed = list(
		/obj/item/weapon/gun/,
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
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
	)
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_DECOR, ACCESSORY_SLOT_MEDAL)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK)

	//Buttons
	var/has_buttons = FALSE
	var/buttoned = TRUE
	var/initial_icon_state

/obj/item/clothing/suit/storage/jacket/marine/proc/toggle()
	set name = "Toggle Buttons"
	set category = "Object"
	set src in usr

	if(usr.is_mob_incapacitated())
		return 0

	if(src.buttoned == TRUE)
		src.icon_state = "[initial_icon_state]_o"
		src.buttoned = FALSE
		to_chat(usr, SPAN_INFO("You unbutton \the [src]."))
	else
		src.icon_state = "[initial_icon_state]"
		src.buttoned = TRUE
		to_chat(usr, SPAN_INFO("You button \the [src]."))
	update_clothing_icon()

/obj/item/clothing/suit/storage/jacket/marine/Initialize()
	. = ..()
	if(!(flags_atom & NO_SNOW_TYPE))
		select_gamemode_skin(type)
		initial_icon_state = icon_state
	if(has_buttons)
		verbs += /obj/item/clothing/suit/storage/jacket/marine/proc/toggle

//Marine service & tanker jacket + MP themed variants
/obj/item/clothing/suit/storage/jacket/marine/service
	name = "marine service jacket"
	desc = "A USCMC service jacket, usually officer issue. While technically armored to frag/handgun ammunition, it's best if you don't try your luck."
	has_buttons = TRUE
	icon_state = "coat_officer"

/obj/item/clothing/suit/storage/jacket/marine/pilot
	name = "\improper M70B1 light flak jacket"
	desc = "M70 variant that reduces bulk and protective for ergonomics. Consider this to have the same amount of protection from flak as an officer's service jacket."
	icon_state = "pilot_alt"
	has_buttons = TRUE
	flags_atom = NO_SNOW_TYPE
	initial_icon_state = "pilot_alt"

/obj/item/clothing/suit/storage/jacket/marine/chef
	name = "mess technician jacket"
	desc = "Smells like vanilla. Signifies prestige and power, if a little flashy."
	icon_state = "chef_jacket"
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber
	name = "commanding officer bomber jacket"
	desc = "A bomber jacket resembling those worn by airmen of old. A classic, stylish choice for those in the higher ranks."
	has_buttons = TRUE
	icon_state = "co_bomber"
	initial_icon_state = "co_bomber"

/obj/item/clothing/suit/storage/jacket/marine/dress/officer/falcon
	name = "commanding officer falcon jacket"
	desc = "A refurbished jacket liner tailor made for a senior officer. This liner has become more of a proper piece of attire, with a new layer of fabric, wrist cuffs, front pockets, and a custom embroidered falcon on the back. This jacket will keep its wearer warm no matter the circumstance, from a cool Sunday drive to chilly autumn's eve."
	icon_state = "co_falcon"

/obj/item/clothing/suit/storage/jacket/marine/dress/bridge_coat
	name = "bridge coat"
	desc = "A heavy synthetic woolen coat issued to USCM Officers. Based on a classical design this coat is quite nice on cold nights in the Air conditioned CIC or a miserable cold night on a barren world. This one is a Dressy Blue for a Commanding officer."
	has_buttons = FALSE
	item_state = "bridge_coat"
	icon_state = "bridge_coat"
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_MEDAL)

/obj/item/clothing/suit/storage/jacket/marine/dress/bridge_coat_grey
	name = "bridge coat"
	desc = "A heavy synthetic woolen coat issued to USCM Officers. Based on a classical design this coat is quite nice on cold nights in the Air conditioned CIC or a miserable cold night on a barren world. This one is Black."
	has_buttons = FALSE
	item_state = "bridge_coat_grey"
	icon_state = "bridge_coat_grey"
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_MEDAL)

/obj/item/clothing/suit/storage/jacket/marine/service/aso
	name = "auxiliary support officer jacket"
	desc = "A comfortable vest for officers who are expected to work long hours staring at rows of numbers and inspecting equipment from knives to torpedos to entire dropships."
	icon_state = "aso_jacket"
	blood_overlay_type = "coat"
	flags_armor_protection = BODY_FLAG_CHEST
	has_buttons = FALSE

//=========================//DRESS BLUES\\================================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/jacket/marine/dress/blues
	name = "marine enlisted dress blues jacket"
	desc = "The jacket of the legendary Marine dress blues, virtually unchanged since the 19th century. You're wearing history, Marine. Don't let your ancestors down."
	icon = 'icons/mob/humans/onmob/suit-layer/suit_marine.dmi'
	icon_state = "coat_blues"
	item_state = "coat_blues"
	has_buttons = FALSE
	item_state_slots = null
	contained_sprite = TRUE

/obj/item/clothing/suit/storage/jacket/marine/dress/blues/nco
	name = "marine NCO dress blues jacket"
	desc = "The jacket of the legendary Marine dress blues, virtually unchanged since the 19th century. Features the adornments of a decorated non-commissioned officer. Heritage, embodied."
	icon_state = "nco_jacket"
	item_state = "nco_jacket"

/obj/item/clothing/suit/storage/jacket/marine/dress/blues/officer
	name = "marine officer dress blues jacket"
	desc = "The jacket of the legendary Marine dress blues, virtually unchanged since the 19th century. Features the sleek dark design of the uniform worn by a commissioned officer."
	icon_state = "coat_blues_officer"
	item_state = "coat_blues_officer"

//==================War Correspondent==================\\

/obj/item/clothing/suit/storage/jacket/marine/reporter
	name = "combat correspondent jacket"
	desc = "A jacket for the most fashionable war correspondents."
	icon = 'icons/mob/humans/onmob/contained/war_correspondent.dmi'
	icon_state = "wc_suit"
	item_state = "wc_suit"
	contained_sprite = TRUE
