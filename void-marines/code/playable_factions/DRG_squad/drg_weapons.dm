
// DRILLER FLAMETHROWER //

/obj/item/weapon/gun/flamer/drg_driller_flamer
	name = "\improper CRSPR Flamethrower"
	desc = "The CRSPR Flamethrower is the Driller's default primary weapon. It is a combat-ready flamethrower which gets its fuel from large tanks inserted into a cage on the side."
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "crspr"
	item_state = "crspr_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)

	force = MELEE_FORCE_NORMAL
	flags_atom = FPRINT|NOBLOODY|CONDUCT

	unload_sound = 'void-marines/sound/drg/FlameThrowerReloadC_1.ogg'
	reload_sound = 'void-marines/sound/drg/FlameThrowerReloadB_1.ogg'

	attachable_allowed = list()

/obj/item/weapon/gun/flamer/drg_driller_flamer/gun_safety_handle(mob/user)
	to_chat(user, SPAN_NOTICE("You [SPAN_BOLD(flags_gun_features & GUN_TRIGGER_SAFETY ? "extinguish" : "ignite")] the pilot lights."))
	playsound(user, 'void-marines/sound/drg/FlameThrowerFireTailCombinedA_1.ogg', 25, 1)
	update_icon()

/obj/item/weapon/gun/flamer/drg_driller_flamer/update_icon()
	..()

	// Have to redo this here because we don't want the empty sprite when the tank is empty (just when it's not in the gun)
	var/new_icon_state = base_gun_icon
	if(has_empty_icon && !current_mag)
		new_icon_state += "_e"
	icon_state = new_icon_state

	if(!(flags_gun_features & GUN_TRIGGER_SAFETY))
		var/image/I = image('icons/obj/items/weapons/guns/guns_by_faction/uscm.dmi', src, "+lit")
		I.pixel_x -= 1
		I.pixel_y -= 3
		overlays += I

/obj/item/weapon/gun/flamer/drg_driller_flamer/get_fire_sound()
	var/list/fire_sounds = list(
							'void-marines/sound/drg/FlameThrowerFireTailCombinedB_1.ogg',
							'void-marines/sound/drg/FlameThrowerFireTailCombinedB_2.ogg',
							'void-marines/sound/drg/FlameThrowerFireTailCombinedB_3.ogg',
							'void-marines/sound/drg/FlameThrowerFireTailCombinedB_4.ogg')
	return pick(fire_sounds)

// ENGINEER SHOTGUN //

/obj/item/weapon/gun/drg_engineer_shotgun
	name = "\improper 'Warthog' Auto 210"
	desc = "The 'Warthog' Auto 210 is a primary weapon for the Engineer. It is a sleek and powerful semi-automatic shotgun (its pump-action mechanism is only used to cycle the action during a reload) that performs best at close range, though it is serviceable at mid to long range."
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "warthog"
	item_state = "warthog_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)
	has_empty_icon = FALSE // TODO: needs empty sprites

	w_class = SIZE_LARGE
	force = MELEE_FORCE_NORMAL
	flags_atom = FPRINT|NOBLOODY|CONDUCT

	current_mag = /obj/item/ammo_magazine/drg_engineer_shotgun

	fire_sound = 'void-marines/sound/drg/CombatShotgunCombinedA_03.ogg'
	reload_sound = 'void-marines/sound/drg/scout_smg_reload.wav'

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_SHOTGUN

	aim_slowdown = SLOWDOWN_ADS_SHOTGUN
	wield_delay = WIELD_DELAY_NORMAL //Shotguns are as hard to pull up as a rifle. They're quite bulky afterall

	start_automatic = TRUE
	start_semiauto = FALSE

	fire_delay_group = list(FIRE_DELAY_GROUP_SHOTGUN)

	starting_attachment_types = list(/obj/item/attachable/stock/drg_engineer_shotgun)
	attachable_allowed = list(/obj/item/attachable/stock/drg_engineer_shotgun)

/obj/item/weapon/gun/drg_engineer_shotgun/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_3
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_10
	scatter = SCATTER_AMOUNT_TIER_6
	burst_scatter_mult = SCATTER_AMOUNT_TIER_8
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_4
	recoil_unwielded = RECOIL_AMOUNT_TIER_2

/obj/item/weapon/gun/drg_engineer_shotgun/set_gun_attachment_offsets()
	attachable_offset = list("stock_x" = 11, "stock_y" = 15)

/obj/item/ammo_magazine/drg_engineer_shotgun
	name = "\improper 'Warthog' buckshot drum (12g)"
	desc = "A 12g automatic shotgun drum magazine."
//	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "m56d_drum" // TODO: make an icon
	default_ammo = /datum/ammo/bullet/shotgun/buckshot
	caliber = "12g"
	gun_type = /obj/item/weapon/gun/drg_engineer_shotgun
	max_rounds = 12
	w_class = SIZE_MEDIUM
	handful_state = "buckshot_shell"
	transfer_handful_amount = 5

/obj/item/ammo_magazine/drg_engineer_shotgun/update_icon(round_diff = 0)
	if(current_rounds <= 0)
		add_to_garbage(src) // TODO: make an empty sprite
	else if(current_rounds - round_diff <= 0)
		icon_state = base_mag_icon
		item_state = base_mag_item
	if(iscarbon(loc))
		var/mob/living/carbon/C = loc
		if(C.r_hand == src)
			C.update_inv_r_hand()
		else if(C.l_hand == src)
			C.update_inv_l_hand()
	if(ammo_band_color && ammo_band_icon)
		update_ammo_band()

/obj/item/ammo_magazine/drg_engineer_shotgun/slug
	name = "\improper 'Warthog' slug drum (12g)"
	default_ammo = /datum/ammo/bullet/shotgun/slug
	handful_state = "slug_shell"

/obj/item/attachable/stock/drg_engineer_shotgun
	name = "\improper 'Warthog' skeletal stock"
	desc = "A sturdy, light and reliable stock."
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "warthog_stock"
	wield_delay_mod = WIELD_DELAY_SLOW
	hud_offset_mod = 6

/obj/item/attachable/stock/drg_engineer_shotgun/New()
	..()
	accuracy_mod = HIT_ACCURACY_MULT_TIER_4
	recoil_mod = -RECOIL_AMOUNT_TIER_5
	scatter_mod = -SCATTER_AMOUNT_TIER_10
	burst_scatter_mod = -SCATTER_AMOUNT_TIER_8
	movement_onehanded_acc_penalty_mod = -MOVEMENT_ACCURACY_PENALTY_MULT_TIER_5
	accuracy_unwielded_mod = HIT_ACCURACY_MULT_TIER_1
	recoil_unwielded_mod = -RECOIL_AMOUNT_TIER_5
	scatter_unwielded_mod = -SCATTER_AMOUNT_TIER_10

// GUNNER MINIGUN //

/obj/item/weapon/gun/drg_gunner_minigun
	name = "\improper 'Lead Storm' Powered Minigun"
	desc = "What's more effective than bullets? A whole LOT of bullets. With a fire rate of more than 3 500 rounds per minute, the Minigun remains a mainstay of any heavy engagement."

	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "leadstorm"
	item_state = "leadstorm_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)

	w_class = SIZE_LARGE
	force = MELEE_FORCE_STRONG
	flags_atom = FPRINT|NOBLOODY|CONDUCT

	current_mag = /obj/item/ammo_magazine/drg_gunner_minigun

	fire_sound = 'void-marines/sound/drg/minigun_shots.wav'
	reload_sound = 'void-marines/sound/drg/scout_smg_reload.wav'
	unload_sound = 'sound/weapons/handling/smg_unload.ogg'
	cocked_sound = 'sound/weapons/gun_cocked2.ogg'

	movement_onehanded_acc_penalty_mult = 4
	aim_slowdown = SLOWDOWN_ADS_LMG

	flags_gun_features = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_ANTIQUE
	gun_category = GUN_CATEGORY_HEAVY

	wield_delay = 2 SECONDS
	cock_delay = 4 SECONDS // Cooling batteries

	start_automatic = TRUE
	start_semiauto = FALSE

	attachable_allowed = list()

	var/heat_stored = 0 //how much we have currently
	var/heat_max = 1000 //how much we need to overheat

	var/heat_gain = 5 //how much heat we gain per shot
	var/overheated = FALSE

	var/heat_loss = 40 //how much heat we lose per second
	var/cooldown_delay = 4 SECONDS //time it takes for minigun to start radiate heat by itself

/obj/item/weapon/gun/drg_gunner_minigun/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0)
		load_into_chamber()
	START_PROCESSING(SSfastobj, src)

/obj/item/weapon/gun/drg_gunner_minigun/Destroy()
	. = ..()
	STOP_PROCESSING(SSfastobj, src)

/obj/item/weapon/gun/drg_gunner_minigun/get_examine_text(mob/user)
	. = ..()
	. += SPAN_ORANGE("CURRENT HEAT: [heat_stored / heat_max * 100]/100.")

/obj/item/weapon/gun/drg_gunner_minigun/process(mob/user)
	var/cool_delay = last_fired + cooldown_delay
	if(world.time > cool_delay && !overheated)
		heat_stored = max(heat_stored - heat_loss / 2, 0)

	handle_heat_effects()

	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_l_hand()
		M.update_inv_r_hand()

/obj/item/weapon/gun/drg_gunner_minigun/handle_fire(atom/target, mob/living/user, params, reflex = FALSE, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)
	if(overheated)
		to_chat(user, SPAN_LARGE(SPAN_DANGER(SPAN_BOLD("COOL IT DOWN!"))))
		return

	heat_stored = min(heat_stored + heat_gain, heat_max)
	handle_heat_effects()

	if(heat_stored >= heat_max)
		to_chat(user, SPAN_LARGE(SPAN_DANGER(SPAN_BOLD("MINIGUN STOPS DUE TO INTENSE HEAT!"))))
		playsound(loc, 'sound/effects/acid_sizzle4.ogg', 25, TRUE)
		overheated = TRUE
		return

	. = ..()

/obj/item/weapon/gun/drg_gunner_minigun/proc/handle_heat_effects()
	var/heat_coeff = heat_stored / heat_max
	if(!heat_coeff)
		remove_filter("heat_outer")
		remove_filter("heat_inner")
		color = COLOR_WHITE
		return

	add_filter("heat_outer", 1, list("type" = "outline", "color" = "#ff5a00", "size" = 0.1 * heat_coeff))
	add_filter("heat_inner", 1, list("type" = "blur", "size" = heat_coeff - 0.4))
	color = rgb(255, 255 - 130 * heat_coeff, 255 - 200 * heat_coeff)

/obj/item/weapon/gun/drg_gunner_minigun/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_SG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_8
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/drg_gunner_minigun/unique_action(mob/user)
	cock(user)

/obj/item/weapon/gun/drg_gunner_minigun/cock(mob/user)
	if(!overheated)
		to_chat(user, SPAN_DANGER("[src] in a somewhat good state! You don't need to cool it manually!"))
		return

	if(cock_cooldown > world.time)
		return

	cock_cooldown = world.time + cock_delay

	if(!do_after(user, cock_delay, INTERRUPT_INCAPACITATED, BUSY_ICON_GENERIC))
		to_chat(user, SPAN_DANGER("Your [src] cooling was interrupted!"))
		return

	user.visible_message(SPAN_NOTICE("[user] opens [src] batteries, giving them some time to cool."),
	SPAN_NOTICE("You open [src] batteries, giving them some time to cool."), null, 4, CHAT_TYPE_COMBAT_ACTION)

	heat_stored -= 100
	overheated = FALSE

	playsound(user, cocked_sound, 25, TRUE)
	handle_heat_effects()

/obj/item/ammo_magazine/drg_gunner_minigun
	name = "\improper 'Lead Storm' drum (20mm)"
	desc = "A 20mm heavy minigun drum magazine."
	caliber = "20mm"
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "leadstorm_mag"
	item_state = "generic_mag"
	w_class = SIZE_MEDIUM
	default_ammo = /datum/ammo/bullet/drg_gunner_minigun
	max_rounds = 2400
	gun_type = /obj/item/weapon/gun/drg_gunner_minigun
	ammo_band_icon = "+m41a_band"
	ammo_band_icon_empty = "+m41a_band_e"

/datum/ammo/bullet/drg_gunner_minigun
	name = "minigun bullet"

	damage = 65
	penetration = ARMOR_PENETRATION_TIER_8
	accurate_range = 18
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_9
	shell_speed = AMMO_SPEED_TIER_3
	effective_range_max = 10
	damage_falloff = DAMAGE_FALLOFF_TIER_1
	max_range = 24

// SCOUT ASSAULT RIFLE //

/obj/item/weapon/gun/drg_scout_assault
	name = "\improper DeepCore GK2"
	desc = "A dependable, hefty weapon. Usually not the first choice of proper Dwarves, but the combination of heft, weight, and satisfying boom makes it worthwhile all the same."

	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "deepcoregk2"
	item_state = "deepcoregk2_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)

	pickup_sound = "gunequip"
	drop_sound = "gunrustle"
	pickupvol = 7
	dropvol = 15

	w_class = SIZE_LARGE
	force = MELEE_FORCE_NORMAL
	flags_atom = NOBLOODY|CONDUCT
	flags_item = TWOHANDED

	current_mag = /obj/item/ammo_magazine/rifle/drg_scout_assault

	fire_sound = 'void-marines/sound/drg/scout_smg_twoshot.wav'
	reload_sound = 'void-marines/sound/drg/scout_smg_reload.wav'
	unload_sound = 'sound/weapons/handling/smg_unload.ogg'
	cocked_sound = 'sound/weapons/gun_cocked2.ogg'

	movement_onehanded_acc_penalty_mult = 4
	wield_delay = WIELD_DELAY_VERY_FAST

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_AMMO_COUNTER
	gun_category = GUN_CATEGORY_RIFLE

	start_automatic = TRUE

	attachable_allowed = list()

/obj/item/weapon/gun/drg_scout_assault/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/drg_scout_assault/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_9)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	scatter_unwielded = SCATTER_AMOUNT_TIER_8
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_AMOUNT_TIER_4

/obj/item/ammo_magazine/rifle/drg_scout_assault
	name = "\improper DeepCore GK2 magazine (10x24mm)"
	desc = "A 10x24mm assault rifle magazine."
	caliber = "10x24mm"
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "deepcoregk2_mag"
	item_state = "generic_mag"
	w_class = SIZE_MEDIUM
	default_ammo = /datum/ammo/bullet/rifle/drg_scout_assault
	max_rounds = 30
	gun_type = /obj/item/weapon/gun/drg_scout_assault

/obj/item/ammo_magazine/rifle/drg_scout_assault/marker
	name = "\improper DeepCore GK2 marker magazine (10x24mm)"
	desc = "A 10x24mm assault rifle magazine, fit with little spy-bugs."
	default_ammo = /datum/ammo/bullet/rifle/drg_scout_assault/marker
	icon_state = "deepcoregk2_marker_mag"

/datum/ammo/bullet/rifle/drg_scout_assault
	name = "rifle bullet"

	damage = 35
	accurate_range = 24
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = AMMO_SPEED_TIER_5
	effective_range_max = 12
	damage_falloff = DAMAGE_FALLOFF_TIER_1
	max_range = 30

/datum/ammo/bullet/rifle/drg_scout_assault/marker
	damage = 15

/datum/ammo/bullet/rifle/drg_scout_assault/marker/on_hit_mob(mob/M, obj/projectile/P)
	. = ..()
	if(!M.marked_creature)
		M.additional_mark_time += 100 SECONDS
		M.mark_mob()
