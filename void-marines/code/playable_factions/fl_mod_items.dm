//SPECIAL UNIFORM

/obj/item/clothing/suit/storage/marine/veteran/ua_riot/pve
	uniform_restricted = list(/obj/item/clothing/under/marine/ua_riot, /obj/item/clothing/under/marine/veteran/freelancer)

/obj/item/clothing/under/marine/fluff/medicae_jumpsuit/pve
	name = "Dust Rangers Sergeant Uniform"
	desc = "Uniform used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/under/marine/fluff/commissar/pve
	name = "Dust Rangers High Officer Uniform"
	desc = "Uniform used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/under/marine/fluff/standard_jumpsuit/pve
	name = "Dust Rangers Standart Uniform"
	desc = "Uniform used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/under/marine/fluff/steelpoint/pve
	name = "Dust Rangers Elite Uniform"
	desc = "Uniform used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/under/marine/fluff/sas_elite/pve
	name = "Black Fatigues"
	desc = "Black camo fatigues usually used by Elite Task Force."

/obj/item/clothing/under/marine/fluff/nickiskool/pve
	name = "white dusty shirt"
	desc = "Designed to show off your manly muscles for all the ladies."

//ARMOR AND HELMETS

/obj/item/clothing/head/helmet/marine/veteran/mercenary/pve
	built_in_visors = list(new /obj/item/device/helmet_visor/night_vision)

/obj/item/clothing/head/helmet/marine/veteran/mercenary/miner/pve
	built_in_visors = list(new /obj/item/device/helmet_visor/night_vision)

/obj/item/clothing/head/helmet/marine/veteran/mercenary/support/pve
	built_in_visors = list(new /obj/item/device/helmet_visor/night_vision)

/obj/item/clothing/suit/storage/marine/fluff/sas_elite/pve
	name = "Black Combat Armor"
	desc = "An dark combat armor used by Elite Task Force."

/obj/item/clothing/mask/fluff/sas_elite/pve
	name = "Compact Gas Mask"
	desc = "A compact Gas Mask with a pure red lenses, used by Elite Task Force."

/obj/item/clothing/head/helmet/marine/fluff/sas_elite/pve
	name = "Black Combat Helmet"
	desc = "An dark combat helmet, bearing the scars of many battles. Used by Elite Task Force."

/obj/item/clothing/suit/storage/marine/fluff/sas_juggernaut/pve
	name = "Black Juggernaut Armor"
	desc = "Heavy ETF armor, used in breach operations."

	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_HIGHPLUS
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	slowdown = SLOWDOWN_ARMOR_LOWHEAVY
	movement_compensation = SLOWDOWN_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/marine/fluff/sas_juggernaut/pve
	name = "Black Juggernaut Helmet"
	desc = "Heavy ETF helmet, used in breach operations."
	anti_hug = 6

	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_HIGH
	armor_rad = CLOTHING_ARMOR_HIGH
	armor_internaldamage = CLOTHING_ARMOR_HIGH

/obj/item/clothing/head/helmet/marine/fluff/nickiskool/pve
	name = "Cool Mask"
	desc = "Just in case someone might recognize you..."
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEMASK|HIDEEYES

/obj/item/clothing/suit/storage/marine/fluff/nickiskool/pve
	name = "Red-Blooded Jacket"
	desc = "Stylish red jacket for all your mercenary needs."

/obj/item/clothing/suit/storage/marine/fluff/medicae_armor/pve
	name = "Dust Rangers Sergeant Armor"
	desc = "Equipment used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/head/helmet/marine/fluff/medicae_helmet/pve
	name = "Dust Rangers Sergeant Mask"
	desc = "Equipment used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/suit/storage/marine/fluff/commissar/pve
	name = "Dust Rangers High Officer Armor"
	desc = "Equipment used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/head/helmet/marine/fluff/commissar/pve
	name = "Dust Rangers High Officer Mask"
	desc = "Equipment used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/suit/storage/marine/fluff/standard_armor/pve
	name = "Dust Rangers Standart Armor"
	desc = "Equipment used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/head/helmet/marine/fluff/standard_helmet/pve
	name = "Dust Rangers Standart Mask"
	desc = "Equipment used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/suit/storage/marine/fluff/steelpoint/pve
	name = "Dust Rangers Elite Armor"
	desc = "Equipment used by old mercenary group, known for it's extremely dangerous work environment."

/obj/item/clothing/head/helmet/marine/fluff/steelpoint/pve
	name = "Dust Rangers Elite Helmet"
	desc = "Equipment used by old mercenary group, known for it's extremely dangerous work environment."

//WEAPONS AND ETC

/obj/item/weapon/gun/smg/bizon/lancer
	name = "\improper Type 64 Submachinegun"
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/upp.dmi'
	icon_state = "type64"
	item_state = "type64"

/obj/item/weapon/gun/smg/bizon/lancer/set_gun_config_values()
	..()
	fire_delay = FIRE_DELAY_TIER_SMG
	burst_delay = FIRE_DELAY_TIER_SMG
	burst_amount = BURST_AMOUNT_TIER_4
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	scatter = SCATTER_AMOUNT_TIER_9
	burst_scatter_mult = SCATTER_AMOUNT_TIER_8
	scatter_unwielded = SCATTER_AMOUNT_TIER_4
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_3
	recoil_unwielded = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/smg/pps43/lancer
	name = "\improper Type-19 Submachinegun" //placeholder
	desc = "An outdated, but reliable and powerful, submachinegun originating in the Union of Progressive Peoples, it is still in limited service in the UPP but is most often used by paramilitary groups or corporate security forces. It is usually used with a 35 round stick magazine, or a 71 round drum."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/upp.dmi'
	icon_state = "insasu"
	item_state = "insasu"

	fire_sound = 'sound/weapons/smg_heavy.ogg'
	current_mag = /obj/item/ammo_magazine/smg/pps43
	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/flashlight/grip,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/magnetic_harness,
	)

/obj/item/weapon/gun/smg/pps43/lancer/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 20,"rail_x" = 20, "rail_y" = 24, "under_x" = 25, "under_y" = 17, "stock_x" = 26, "stock_y" = 15)

/obj/item/weapon/gun/smg/pps43/lancer/set_gun_config_values()
	..()
	fire_delay = FIRE_DELAY_TIER_SMG
	burst_delay = FIRE_DELAY_TIER_SMG
	burst_amount = BURST_AMOUNT_TIER_3
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_5
	scatter = SCATTER_AMOUNT_TIER_9
	burst_scatter_mult = SCATTER_AMOUNT_TIER_4
	scatter_unwielded = SCATTER_AMOUNT_TIER_4
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil_unwielded = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/rifle/l42a/l42B
	name = "\improper L42B battle rifle"
	desc = "The L42B Battle Rifle, found commonly around the frontiers of the Galaxy. It's commonly used by colonists for self defense, as well as many colonial militias, whomever they serve due to it's rugged reliability and ease of use without much training. This rifle is the B variant, equipped with 10x26mm and full auto functionality."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/uscm.dmi'
	icon_state = "l42mk1"
	item_state = "l42mk1"
	reload_sound = 'sound/weapons/handling/l42_reload.ogg'
	unload_sound = 'sound/weapons/handling/l42_unload.ogg'
	fire_sound = 'sound/weapons/gun_hpr.ogg'
	current_mag = /obj/item/ammo_magazine/rifle/l42a/l42B
	accepted_ammo = list(
		/obj/item/ammo_magazine/rifle/l42a/l42B,
		/obj/item/ammo_magazine/rifle/l42a/l42Bext,
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/upp,
		/obj/item/attachable/bayonet/co2,
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/stock/carbine,
		/obj/item/attachable/stock/carbine/wood,
		/obj/item/attachable/bipod,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/scope,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/mini_iff,
		/obj/item/attachable/flashlight/grip,
	)

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	wield_delay = WIELD_DELAY_VERY_FAST
	aim_slowdown = SLOWDOWN_ADS_QUICK
	starting_attachment_types = list(/obj/item/attachable/stock/carbine)
	map_specific_decoration = TRUE

/obj/item/weapon/gun/rifle/l42a/l42B/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 19,"rail_x" = 12, "rail_y" = 20, "under_x" = 18, "under_y" = 15, "stock_x" = 22, "stock_y" = 10)

/obj/item/weapon/gun/rifle/l42a/l42B/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_9)
	set_burst_amount(0)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_4
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_6
	recoil_unwielded = RECOIL_AMOUNT_TIER_4
	damage_falloff_mult = 0
	scatter = SCATTER_AMOUNT_TIER_8
	start_automatic = TRUE

/obj/item/weapon/gun/rifle/xm177/repro
	name = "\improper XM177E2 carbine"
	desc = "An old design reproduced by Weston Reproductions, essentially a shortened M16A1 with a collapsable stock. It is chambered in 5.56x45mm. The short length inhibits the attachment of most underbarrel attachments, and the barrel moderator prohibits the attachment of all muzzle devices."
	desc_lore = "A carbine similar to the M16A1, with a collapsible stock and a distinct flash suppressor. A stamp on the receiver reads: 'COLT AR-15 - XM177E2 - CAL 5.56MM - REPRO' \nA design originating from the Vietnam War, the XM177, also known as the Colt Commando or GAU-5/A, was an improvement on the CAR-15 Model 607, fixing multiple issues found with the limited service of the Model 607 with Special Forces. The XM177 saw primary use with Army Special Forces and Navy Seals operating as commandos. \nThis one was produced by Weston Reproductions."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
	icon_state = "xm177"
	item_state = "m16"
	current_mag = /obj/item/ammo_magazine/rifle/m16/ext

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_ANTIQUE

	fire_sound = 'sound/weapons/gun_m16.ogg'
	reload_sound = 'sound/weapons/handling/gun_m16_reload.ogg'
	unload_sound = 'sound/weapons/handling/gun_m16_unload.ogg'
	accepted_ammo = list(
		/obj/item/ammo_magazine/rifle/m16,
		/obj/item/ammo_magazine/rifle/m16/ap,
		/obj/item/ammo_magazine/rifle/m16/ext,
	)

	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/stock/m16/xm177,
	)

/obj/item/weapon/gun/rifle/xm177/repro/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 30, "muzzle_y" = 18,"rail_x" = 9, "rail_y" = 20, "under_x" = 19, "under_y" = 13, "stock_x" = 15, "stock_y" = 14)

/obj/item/weapon/gun/rifle/xm177/repro/handle_starting_attachment()
	..()
	var/obj/item/attachable/stock/m16/xm177/integrated = new(src)
	integrated.hidden = FALSE
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.Attach(src)
	update_attachable(integrated.slot)

/obj/item/weapon/gun/rifle/xm177/repro/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_SMG)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_SMG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_6
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_3
	scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_TIER_9
	scatter_unwielded = SCATTER_AMOUNT_TIER_4
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_6
	recoil_unwielded = RECOIL_AMOUNT_TIER_2
	start_automatic = TRUE

/obj/item/weapon/gun/rifle/m16/grenadier/repro
	name = "\improper M16 grenadier rifle"
	desc = "An old, reliable design first adopted by the U.S. military in the 1960s and reproduced by Weston Reproductions. It is chambered in 5.56x45mm. This one has an irremovable M203 grenade launcher attached to it, holds one propriatary 40mm shell, it lacks IFF systems and will impact the first target it hits; introduce your little friend."
	icon_state = "m16g"
	item_state = "m16"
	fire_sound = 'sound/weapons/gun_m16.ogg'
	reload_sound = 'sound/weapons/handling/gun_m16_reload.ogg'
	unload_sound = 'sound/weapons/handling/gun_m16_unload.ogg'
	current_mag = /obj/item/ammo_magazine/rifle/m16/ext
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/compensator,
		/obj/item/attachable/attached_gun/grenade/m203,
	)

/obj/item/weapon/gun/rifle/m16/grenadier/repro/handle_starting_attachment()
	..()
	var/obj/item/attachable/attached_gun/grenade/m203/integrated = new(src)
	integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	integrated.hidden = FALSE
	integrated.Attach(src)
	update_attachable(integrated.slot)

/obj/item/weapon/gun/rifle/m16/grenadier/repro/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_11)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_11)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_7
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_10
	burst_scatter_mult = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_6
	recoil_unwielded = RECOIL_AMOUNT_TIER_2
	start_automatic = TRUE

/obj/item/weapon/gun/minigun/lancer
	name = "\improper Minigun"
	desc = "An enormous multi-barreled rotating gatling gun. This thing looks like its straight out of an action movie. Sporting immaculate grips and triggers this bad bitch has been customized solely by order for the user and costing more than you can dream. It also contains space age anti scratch and anti jam technology, along with magnets to auto attach to armor. Only thing this gun lacks is IFF tech. aint the future great?"
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/event.dmi'
	icon_state = "painless"
	item_state = "painless"

	fire_sound = 'sound/weapons/gun_minigun.ogg'
	cocked_sound = 'sound/weapons/gun_minigun_cocked.ogg'
	current_mag = /obj/item/ammo_magazine/minigun
	w_class = SIZE_HUGE
	force = 20
	flags_gun_features = GUN_AUTO_EJECTOR|GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_RECOIL_BUILDUP|GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_HEAVY
	start_semiauto = FALSE
	start_automatic = TRUE

/obj/item/weapon/gun/minigun/lancer/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/minigun/lancer/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_12)

	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3

	scatter = SCATTER_AMOUNT_TIER_9 // Most of the scatter should come from the recoil

	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5
	recoil_buildup_limit = RECOIL_AMOUNT_TIER_3 / RECOIL_BUILDUP_VIEWPUNCH_MULTIPLIER

/obj/item/weapon/gun/minigun/lancer/handle_starting_attachment()
	..()
	//invisible mag harness
	var/obj/item/attachable/magnetic_harness/Integrated = new(src)
	Integrated.hidden = TRUE
	Integrated.flags_attach_features &= ~ATTACH_REMOVABLE
	Integrated.Attach(src)
	update_attachable(Integrated.slot)

/obj/item/ammo_magazine/rifle/m16/ext
	name = "\improper M16 Extended magazine (5.56x45mm)"
	desc = "An extended 5.56x45mm magazine for the M16 assault rifle."
	caliber = "5.56x45mm"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 50
	gun_type = /obj/item/weapon/gun/rifle/m16
	w_class = SIZE_MEDIUM
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/colony.dmi'
	icon_state = "m16_ext"

/obj/item/ammo_magazine/rifle/l42a/l42B
	name = "\improper L42B magazine (10x26mm)"
	desc = "An L42B magazine loaded with 10x26mm caseless"
	caliber = "10x26mm"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 20
	icon_state = "l42mk1"

/obj/item/ammo_magazine/rifle/l42a/l42Bext
	name = "\improper L42B extended magazine (10x26mm)"
	desc = "An extended L42B magazine loaded with 10x26mm caseless"
	caliber = "10x26mm"
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 40
	icon_state = "l42mk1_extended"
