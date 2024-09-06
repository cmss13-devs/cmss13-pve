/obj/item/weapon/sword/chainsword
	name = "Drusian Pattern Chainsword"
	desc = "A chainsword, likely belonging to an NCO or higher rank in the Astra Militarium. Under the golden eagle it reads 'For the Throne'"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "chainsword_on"
	item_state = "inqchainsword"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/wh40k/icons/lefthand.dmi',
		WEAR_R_HAND = 'void-marines/wh40k/icons/righthand.dmi'
		)
	force = MELEE_FORCE_STRONG
	flags_equip_slot = SLOT_WAIST|SLOT_BACK
	throwforce = MELEE_FORCE_WEAK
	sharp = IS_SHARP_ITEM_BIG
	edge = 1
	w_class = SIZE_LARGE
	hitsound = 'void-marines/wh40k/sounds/weapons/chainsword.ogg'
	attack_verb = list("attacked", "slashed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 5



/obj/item/weapon/sword/chainsword/astartes
	name = "Mars Pattern Chainsword"
	desc = "A beautifully crafted Chainsword encrusted in gold, made on Mars especially for Astartes. That's why it's the size of a man. "
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "Rchainsword_on"
	item_state = "pcsword"
	force = MELEE_FORCE_STRONG
	throwforce = MELEE_FORCE_NORMAL
	attack_speed = 3

/obj/item/weapon/sword/chainsword/astartes/pickup(mob/user, silent)
	. = ..()
	var/mob/living/carbon/human/human = user
	if(!human.species == SPECIES_ASTARTES)
		to_chat(user, SPAN_DANGER("It's too big and too heavy for me"))
		attack_speed = 8
	else
		attack_speed = 3

/obj/item/weapon/sword/powersword
	name = "Helios Pattern Power Sword"
	desc = "A adamantium sword with a void shield generator inside of it, the void shield will cut through almost anything that it touches when its on, so make sure you don't cut yourself."
	item_state = "commissword"
	icon_state = "powersword"
	force = MELEE_FORCE_STRONG
	hitsound = 'sound/weapons/wristblades_hit.ogg'
	var/activated = 0
	var/activated_force = MELEE_FORCE_VERY_STRONG
	attack_speed = 7

/obj/item/weapon/sword/powersword/attack_self(mob/user)
	. = ..()
	activation()

/obj/item/weapon/sword/powersword/proc/activation(mob/user)
	var/action = "activate"
	if(activated)
		force = activated_force
//		item_state += "_on"
		icon_state += "_on"
	if(!activated)
		action = "deactivate"
		force = initial(force)
//		item_state = initial(item_state)
		icon_state = initial(icon_state)
	visible_message(SPAN_DANGER("\The [user] [action] \his \the [src] "), max_distance = COMBAT_MESSAGE_RANGE)

/obj/item/weapon/sword/powersword/astartes
	name = "Ingelldina Pattern Power Sword"
	desc = "A adamantium sword with a voidshield generator inside of it, this one is very long and heavy, clearly having been made for one of the sons of the emperor."
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	force = MELEE_FORCE_STRONG
	activated_force = MELEE_FORCE_TIER_11

// Long Range

/obj/item/weapon/gun/bolter
	name = "Locke-pattern Bolter"
	desc = "The Locke Pattern Bolter, designed for Adeptus Arbites personnel when heavier firepower are required. Can also be found in hands of Astra Militarum officers, veterans and Commissar, Though relatively uncommon. It is a human-sized Bolter, Thus it's very popular among the troops and the lucky ones who get their hands on one of these bad boy."
	icon = 'void-marines/wh40k/icons/weapon/projectile.dmi'
	icon_state = "bolter"
	item_state = "bolter"
	force = MELEE_FORCE_NORMAL
	w_class = SIZE_HUGE
	flags_equip_slot = SLOT_BACK
	item_icons = list(
		WEAR_L_HAND = 'void-marines/wh40k/icons/lefthand_guns.dmi',
		WEAR_R_HAND = 'void-marines/wh40k/icons/righthand_guns.dmi'
		)

	flags_atom = FPRINT|NOBLOODY|CONDUCT

	current_mag = /obj/item/ammo_magazine/bolter
	caliber = ".75"

	fire_sound = 'void-marines/wh40k/sounds/weapons/loudbolt2.ogg'
	reload_sound = 'void-marines/wh40k/sounds/weapons/ltrifle_magin.ogg'
	unload_sound = 'void-marines/wh40k/sounds/weapons/ltrifle_magout.ogg'
	cocked_sound = 'void-marines/wh40k/sounds/weapons/ltrifle_cock.ogg'

	movement_onehanded_acc_penalty_mult = 10
	flags_gun_features = GUN_AMMO_COUNTER|GUN_ANTIQUE|GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_RIFLE

	start_semiauto = TRUE

/obj/item/weapon/gun/bolter/set_gun_config_values()
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_fire_delay(FIRE_DELAY_TIER_9)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	scatter_unwielded = SCATTER_AMOUNT_TIER_8
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_AMOUNT_TIER_4

/obj/item/ammo_magazine/bolter
	name = "\improper Bolter Magazine (.75)"
	caliber = ".75"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "bolterbigmag"
	default_ammo = /datum/ammo/bullet/rifle/bolter
	max_rounds = 24
	gun_type = /obj/item/weapon/gun/bolter

/datum/ammo/bullet/rifle/bolter
	name = ".75 bolt"
	damage = 55
	accurate_range = 24
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_9
	shell_speed = AMMO_SPEED_TIER_5
	effective_range_max = 12
	max_range = 30
	penetration = ARMOR_PENETRATION_TIER_3

/obj/item/weapon/gun/bolter/pistol
	name = "\improper Locke-pattern Boltpistol"
	icon_state = "gboltpistol"
	item_state = "bpistol"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	current_mag = /obj/item/ammo_magazine/bolter/pistol
	flags_gun_features = GUN_AMMO_COUNTER|GUN_ONE_HAND_WIELDED|GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_SMG

/obj/item/weapon/gun/bolter/pistol/set_gun_config_values()
	set_burst_amount(BURST_AMOUNT_TIER_2)
	set_fire_delay(FIRE_DELAY_TIER_10)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil = RECOIL_OFF

/obj/item/ammo_magazine/bolter/pistol
	name = "\improper Boltpistol Magazine (.75)"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "boltersmallmag"
	max_rounds = 8

/obj/item/weapon/gun/bolter/astartes
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter"
	icon_state = "ultrabolter"
	item_state = "bolter"
	start_automatic = TRUE

/obj/item/weapon/gun/bolter/astartes/set_gun_config_values()
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_fire_delay(FIRE_DELAY_TIER_7)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	scatter_unwielded = SCATTER_AMOUNT_TIER_7
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_AMOUNT_TIER_4

/obj/item/weapon/gun/bolter/heavy
	name = "Godwyn Mark Vb Pattern Heavy Bolter"
	desc = "\"Don't run, or you'll die fatigued\""
	caliber = ".998"
	icon_state = "hbolter"
	item_state = "hbolter"

	current_mag = /obj/item/ammo_magazine/bolter/heavy

	fire_sound = 'void-marines/wh40k/sounds/weapons/loudbolt.ogg'

	start_semiauto = FALSE
	start_automatic = TRUE

	flags_gun_features = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_ANTIQUE|GUN_CAN_POINTBLANK


/obj/item/weapon/gun/bolter/heavy/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_9)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_9
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	scatter_unwielded = SCATTER_AMOUNT_TIER_7
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil = RECOIL_AMOUNT_TIER_4
	recoil_unwielded = RECOIL_AMOUNT_TIER_2

/obj/item/ammo_magazine/bolter/heavy
	name = "\improper Heavy Bolter Magazine (.998)"
	caliber = ".998"
	icon = 'void-marines/wh40k/icons/weapon/ammo.dmi'
	icon_state = "bolty"
	default_ammo = /datum/ammo/bullet/rifle/bolter/heavy
	max_rounds = 60
	gun_type = /obj/item/weapon/gun/bolter/heavy

/datum/ammo/bullet/rifle/bolter/heavy
	name = ".998 bolt"
	damage = 75
	accurate_range = 30
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_9
	shell_speed = AMMO_SPEED_TIER_5
	effective_range_max = 24
	max_range = 45
	penetration = ARMOR_PENETRATION_TIER_5

/obj/item/storage/large_holster/warhammer
	name = "Sheath"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "sheath"
	flags_equip_slot = SLOT_BACK|SLOT_WAIST

/obj/item/storage/large_holster/warhammer/update_icon()
	if(length(contents))
		icon_state = "[base_icon]_full"
	else
		icon_state = base_icon

	item_state = icon_state
