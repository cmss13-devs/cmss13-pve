/obj/item/weapon/gun/souto
	name = "\improper Souto Slinger Supremo"
	desc = "This appears to be a T-shirt cannon modified to fire cans of Souto at speeds fast enough to get them up into the top stands of a stadium. This can't be safe. Cobbled together in Havana."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/event.dmi'
	icon_state = "supremo_w"
	item_state = "supremo_w"
	w_class = SIZE_SMALL
	fire_sound = 'sound/items/syringeproj.ogg'
	attachable_allowed = list()
	has_empty_icon = 0
	ammo = /datum/ammo/souto
	var/range = 6 // This var is used as range for the weapon/toy.
	flags_gun_features = GUN_UNUSUAL_DESIGN|GUN_INTERNAL_MAG|GUN_AMMO_COUNTER
	var/obj/item/storage/backpack/souto/soutopack
	current_mag = null
	auto_retrieval_slot = WEAR_IN_BACK
	start_automatic = TRUE
	autofire_slow_mult = 0.8 //Fires FASTER when in Full Auto, that is the power of Souta

/obj/item/weapon/gun/souto/set_gun_config_values()
	. = ..()
	accuracy_mult = BASE_ACCURACY_MULT + 2*HIT_ACCURACY_MULT_TIER_10
	scatter = SCATTER_AMOUNT_TIER_10
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10

/obj/item/weapon/gun/souto/Fire(atom/target, mob/living/user, params, reflex = 0, dual_wield)
	if(!soutopack)
		if(!link_soutopack(user))
			to_chat(user, "You must equip the specialized Backpack Souto Vending Machine to use the Souto Slinger Supremo!")
			click_empty(user)
			unlink_soutopack()
			return NONE
	if(soutopack)
		if(!current_mag)
			current_mag = soutopack.internal_mag
		// Check we're actually firing the right fuel tank
		if(current_mag != soutopack.internal_mag)
			current_mag = soutopack.internal_mag
		return ..()

/obj/item/weapon/gun/souto/reload(mob/user, obj/item/ammo_magazine/magazine)
	to_chat(user, SPAN_WARNING("[src]'s feed system cannot be reloaded manually."))
	return

/obj/item/weapon/gun/souto/unload(mob/user, reload_override = 0, drop_override = 0, loc_override = 0)
	to_chat(user, SPAN_WARNING("You cannot unload [src]."))
	return

/obj/item/weapon/gun/souto/able_to_fire(mob/user)
	. = ..()
	if(.)
		if(!current_mag || !current_mag.current_rounds)
			return
		if(!skillcheck(user, SKILL_SPEC_WEAPONS,  SKILL_SPEC_ALL))
			to_chat(user, SPAN_WARNING("You don't seem to know how to use [src]..."))
			return FALSE

		var/mob/living/carbon/human/H = user
		if(!istype(H))
			return FALSE
		if(!istype(H.back, /obj/item/storage/backpack/souto))
			click_empty(H)
			return FALSE
		if(current_mag)
			var/datum/ammo/souto/S = ammo
			S.can_type = new S.shrapnel_type
			if(!in_chamber)
				load_into_chamber()
			in_chamber.icon_state = S.can_type.icon_state
			S.can_type.forceMove(in_chamber)
			S.can_type.sharp = 1

/obj/item/weapon/gun/souto/proc/link_soutopack(mob/user)
	if(user.back)
		if(istype(user.back, /obj/item/storage/backpack/souto))
			soutopack = user.back
			return TRUE
	return FALSE

/obj/item/weapon/gun/souto/proc/unlink_soutopack()
	soutopack = null

/obj/item/weapon/gun/souto/retrieval_check(mob/living/carbon/human/user, retrieval_slot)
	if(retrieval_slot == WEAR_IN_BACK)
		if(istype(user.back, /obj/item/storage/backpack/souto))
			return TRUE
		return FALSE
	return ..()

/obj/item/ammo_magazine/internal/souto
	name = "\improper Souto Slinger Supremo internal magazine"
	caliber = "Cans"
	max_rounds = 100
	default_ammo = /datum/ammo/souto
	gun_type = /obj/item/weapon/gun/souto


/obj/item/weapon/gun/rifle/nsg23/no_lock/pve
	current_mag = /obj/item/ammo_magazine/rifle/nsg23/extended

/obj/item/weapon/gun/rifle/nsg23/no_lock/pve/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_10)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_10)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_10
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_10
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_5
	recoil_unwielded = RECOIL_AMOUNT_TIER_2
	damage_falloff_mult = 0
	fa_max_scatter = SCATTER_AMOUNT_TIER_7


/obj/item/weapon/gun/rifle/nsg23/no_lock/pve/heap
	current_mag = /obj/item/ammo_magazine/rifle/nsg23/heap

//

//Armor

/obj/item/clothing/suit/storage/marine/veteran/pmc/temp
	icon = 'icons/obj/items/clothing/pmc_commando_temp.dmi'
	contained_sprite = 1
	icon_state = "pmc_armor_elite"
	item_state_slots = list(WEAR_JACKET = "pmc_armor_elite")

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

/obj/item/clothing/suit/storage/marine/veteran/pmc/temp/armor_elite/four
	icon_state = "pmc_engineer_armor"
	item_state_slots = list(WEAR_JACKET = "pmc_engineer_armor")

/obj/item/clothing/suit/storage/marine/veteran/pmc/temp/armor_elite/five
	icon_state = "guard_armor_spec"
	item_state_slots = list(WEAR_JACKET = "guard_armor_spec")

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

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/three
	icon_state = "pmc_helmet_elite"

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/four
	icon_state = "pmc_helmet_elite_sg"

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/five
	icon_state = "pmc_helmet_elite_leader"

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/six
	icon_state = "pmc_engineer_helmet"

/obj/item/clothing/head/helmet/marine/veteran/pmc/temp/seven
	icon_state = "guard_heavy_helmet"

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

/obj/item/clothing/under/marine/veteran/pmc/temp/three
	icon_state = "commando_leader"
	worn_state = "commando_leader"

/obj/item/clothing/under/marine/veteran/pmc/temp/four
	icon_state = "engineer_jumpsuit"
	worn_state = "engineer_jumpsuit"
