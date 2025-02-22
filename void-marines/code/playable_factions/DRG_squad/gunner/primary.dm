/****************************************/
/*
		    'Lead Storm' minigun
*/
/****************************************/

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
		balloon_alert(src, "*overheated*")
		return

	heat_stored = min(heat_stored + heat_gain, heat_max)
	handle_heat_effects()

	if(heat_stored >= heat_max)
		playsound(loc, 'sound/effects/acid_sizzle4.ogg', 25, TRUE)
		balloon_alert_to_viewers("*minigun overheats!*")
		overheated = TRUE
		return

	. = ..()

/obj/item/weapon/gun/drg_gunner_minigun/proc/handle_heat_effects()
	var/heat_coeff = heat_stored / heat_max
	if(!heat_coeff)
		remove_filter("heat_outline")
		remove_filter("heat_blur")
		color = COLOR_WHITE
		return

	add_filter("heat_outline", 1, list("type" = "outline", "color" = "#ff5a00", "size" = 0.1 * heat_coeff))
	add_filter("heat_blur", 1, list("type" = "blur", "size" = heat_coeff - 0.4))
	color = rgb(255, 255 - 130 * heat_coeff, 255 - 200 * heat_coeff)

/obj/item/weapon/gun/drg_gunner_minigun/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_SG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	scatter = SCATTER_AMOUNT_TIER_8
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/drg_gunner_minigun/unique_action(mob/user)
	if(!overheated)
		to_chat(user, SPAN_DANGER("[src] is already in a somewhat good state!"))
		return

	if(cock_cooldown > world.time)
		return

	cock(user)

/obj/item/weapon/gun/drg_gunner_minigun/cock(mob/user)
	balloon_alert_to_viewers("*tries to release batteries*")
	cock_cooldown = world.time + cock_delay

	if(!do_after(user, cock_delay, INTERRUPT_INCAPACITATED, BUSY_ICON_GENERIC))
		to_chat(user, SPAN_DANGER("[src] cooling process was interrupted!"))
		balloon_alert_to_viewers("*cooling was interrupted!*")
		return

	user.visible_message(SPAN_NOTICE("[user] opens [src] batteries, giving them some time to cool."),
	SPAN_NOTICE("You open [src] batteries, giving them some time to cool."), null, 4, CHAT_TYPE_WEAPON_USE)

	heat_stored -= heat_max / 10
	overheated = FALSE

	playsound(loc, 'sound/effects/acid_sizzle4.ogg', 25, TRUE)
	playsound(user, cocked_sound, 25, TRUE)

	handle_heat_effects()

/*
	Ammo magazine / bullets
*/
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

	damage = 80
	penetration = ARMOR_PENETRATION_TIER_8
	accurate_range = 18
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_9
	shell_speed = AMMO_SPEED_TIER_3
	effective_range_max = 10
	damage_falloff = DAMAGE_FALLOFF_TIER_1
	max_range = 24
