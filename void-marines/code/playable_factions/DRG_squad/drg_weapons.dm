// SCOUT ASSAULT RIFLE //

/obj/item/weapon/gun/drg/scout_assault
	name = "DeepCore GK2"
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
	force = 10
	flags_atom = NOBLOODY|CONDUCT
	flags_item = TWOHANDED

	current_mag = /obj/item/ammo_magazine/rifle/drg/scout_assault

	fire_sound = 'void-marines/sound/drg/scout_smg_twoshot.wav'
	reload_sound = 'void-marines/sound/drg/scout_smg_reload.wav'
	unload_sound = 'sound/weapons/handling/smg_unload.ogg'
	cocked_sound = 'sound/weapons/gun_cocked2.ogg'

	movement_onehanded_acc_penalty_mult = 4
	wield_delay = WIELD_DELAY_VERY_FAST

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_AMMO_COUNTER
	gun_category = GUN_CATEGORY_RIFLE

	start_automatic = TRUE

/obj/item/weapon/gun/drg/scout_assault/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/drg/scout_assault/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_9)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	set_burst_amount(BURST_AMOUNT_TIER_1)
	scatter_unwielded = SCATTER_AMOUNT_TIER_8
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_4
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_AMOUNT_TIER_4

/obj/item/ammo_magazine/rifle/drg/scout_assault
	name = "\improper DeepCore GK2 magazine (10x24mm)"
	desc = "A 10x24mm assault rifle magazine."
	caliber = "10x24mm"
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "deepcoregk2_mag"
	item_state = "generic_mag"
	w_class = SIZE_MEDIUM
	default_ammo = /datum/ammo/bullet/rifle/drg/scout_assault
	max_rounds = 30
	gun_type = /obj/item/weapon/gun/drg/scout_assault

/obj/item/ammo_magazine/rifle/drg/scout_assault/marker
	name = "\improper DeepCore GK2 marker magazine (10x24mm)"
	desc = "A 10x24mm assault rifle magazine, fit with little spy-bugs."
	default_ammo = /datum/ammo/bullet/rifle/drg/scout_assault/marker
	icon_state = "deepcoregk2_marker_mag"

/datum/ammo/bullet/rifle/drg/scout_assault
	name = "rifle bullet"

	damage = 35
	accurate_range = 24
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = AMMO_SPEED_TIER_5
	effective_range_max = 12
	damage_falloff = DAMAGE_FALLOFF_TIER_1
	max_range = 30

/datum/ammo/bullet/rifle/drg/scout_assault/marker
	damage = 15

/datum/ammo/bullet/rifle/drg/scout_assault/marker/on_hit_mob(mob/M, obj/projectile/P)
	. = ..()
	if(!M.marked_creature)
		M.additional_mark_time += 100 SECONDS
		M.mark_mob()

// GUNNER MINIGUN //

/obj/item/weapon/gun/drg/gunner_minigun
	name = "'Lead Storm' Powered Minigun"
	desc = "What's more effective than bullets? A whole LOT of bullets. With a fire rate of more than 3 500 rounds per minute, the Minigun remains a mainstay of any heavy engagement."

	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "leadstorm"
	item_state = "leadstorm_inhand"
	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/drg_weapons.dmi',
		WEAR_R_HAND = 'void-marines/icons/drg_weapons.dmi'
		)

	pickup_sound = "gunequip"
	drop_sound = "gunrustle"
	pickupvol = 7
	dropvol = 15

	w_class = SIZE_LARGE
	force = 10
	flags_atom = NOBLOODY|CONDUCT
	flags_item = TWOHANDED

	current_mag = /obj/item/ammo_magazine/rifle/drg/gunner_minigun

	fire_sound = 'void-marines/sound/drg/minigun_shots.wav'
	reload_sound = 'void-marines/sound/drg/scout_smg_reload.wav'
	unload_sound = 'sound/weapons/handling/smg_unload.ogg'
	cocked_sound = 'sound/weapons/gun_cocked2.ogg'

	movement_onehanded_acc_penalty_mult = 4
	wield_delay = 2 SECONDS
	aim_slowdown = SLOWDOWN_ADS_LMG

	flags_gun_features = GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY|GUN_ANTIQUE
	gun_category = GUN_CATEGORY_HEAVY

	start_automatic = TRUE
	cock_delay = 4 SECONDS // Cooling batteries

	var/heat_stored = 0 //how much we have currently
	var/heat_max = 1000 //how much we need to overheat

	var/heat_gain = 5 //how much heat we gain per shot
	var/overheated = FALSE

	var/heat_loss = 40 //how much heat we lose per second
	var/cooldown_delay = 4 SECONDS //time it takes for minigun to start radiate heat by itself

/obj/item/weapon/gun/drg/gunner_minigun/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0)
		load_into_chamber()
	START_PROCESSING(SSfastobj, src)

/obj/item/weapon/gun/drg/gunner_minigun/Destroy()
	. = ..()
	STOP_PROCESSING(SSfastobj, src)

/obj/item/weapon/gun/drg/gunner_minigun/get_examine_text(mob/user)
	. = ..()
	. += SPAN_ORANGE("CURRENT HEAT: [heat_stored / heat_max * 100]/100.")

/obj/item/weapon/gun/drg/gunner_minigun/process(mob/user)
	var/cool_delay = last_fired + cooldown_delay
	if(world.time > cool_delay && !overheated)
		heat_stored = max(heat_stored - heat_loss / 2, 0)

	handle_heat_effects()

	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_l_hand()
		M.update_inv_r_hand()

/obj/item/weapon/gun/drg/gunner_minigun/handle_fire(atom/target, mob/living/user, params, reflex = FALSE, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)
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

/obj/item/weapon/gun/drg/gunner_minigun/proc/handle_heat_effects()
	var/heat_coeff = heat_stored / heat_max
	if(!heat_coeff)
		remove_filter("heat_outer")
		remove_filter("heat_inner")
		color = COLOR_WHITE
		return

	add_filter("heat_outer", 1, list("type" = "outline", "color" = "#ff5a00", "size" = 0.1 * heat_coeff))
	add_filter("heat_inner", 1, list("type" = "blur", "size" = heat_coeff - 0.4))
	color = rgb(255, 255 - 130 * heat_coeff, 255 - 200 * heat_coeff)

/obj/item/weapon/gun/drg/gunner_minigun/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_SG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	set_burst_amount(BURST_AMOUNT_TIER_1)
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_8
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/drg/gunner_minigun/unique_action(mob/user)
	cock(user)

/obj/item/weapon/gun/drg/gunner_minigun/cock(mob/user)
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

/obj/item/ammo_magazine/rifle/drg/gunner_minigun
	name = "\improper 'Lead Storm' drum (20mm)"
	desc = "A 20mm heavy minigun drum magazine."
	caliber = "20mm"
	icon = 'void-marines/icons/drg_weapons.dmi'
	icon_state = "leadstorm_mag"
	item_state = "generic_mag"
	w_class = SIZE_MEDIUM
	default_ammo = /datum/ammo/bullet/rifle/drg/gunner_minigun
	max_rounds = 2400
	gun_type = /obj/item/weapon/gun/drg/gunner_minigun

/datum/ammo/bullet/rifle/drg/gunner_minigun
	name = "minigun bullet"

	damage = 65
	accurate_range = 18
	penetration = ARMOR_PENETRATION_TIER_8
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_9
	shell_speed = AMMO_SPEED_TIER_3
	effective_range_max = 10
	damage_falloff = DAMAGE_FALLOFF_TIER_1
	max_range = 24
