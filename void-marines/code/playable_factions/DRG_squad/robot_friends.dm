/mob/living/simple_animal/hostile/drg
	name = "Robot"
	desc = "An DRG Company personal automaton, used for various purposes."
	icon = 'void-marines/icons/robots.dmi'
	icon_state = "Detective Ball"
	icon_dead = "gib7"
	wander = FALSE
	health = 500
	maxHealth = 500

	attacktext = "pokes"
	attack_sound = null
	friendly = "pokes"
	faction = FACTION_DRG

	var/lives = 2
	var/max_lives = 2
	var/damaged = FALSE


	var/base_robot_icon = "Detective Ball"

/mob/living/simple_animal/hostile/drg/get_examine_text(mob/user)
	. = ..()

	if(user == src)
		. += SPAN_NOTICE("Your current integrity status is [100*(health/maxHealth)]%.")
		. += SPAN_NOTICE("You can handle atleast [lives] quick repairs before full destruction.")
	else
		if(lives <= 0 && stat != DEAD)
			. += SPAN_DANGER("This robo-fella looks like it will explode any time soon. It will probably not live through next fight.")
		else if(lives <= max_lives * 0.5)
			. += SPAN_ORANGE("This unit suffered from heavy physical damage, which cannot be fixed here!")
		else if(lives > max_lives * 0.5)
			. += SPAN_GREEN("It looks a lil' bit scratched, but good otherwise.")

/mob/living/simple_animal/hostile/drg/Life(delta_time)

	if(damaged)
		anchored = TRUE
		icon_state = "[base_robot_icon]_broken"
		next_move_slowdown = 100
	if(health <= 50 && lives > 0)
		health = maxHealth
		lives -= 1
		damaged = TRUE

	. = ..()

/mob/living/simple_animal/hostile/drg/Collided(atom/movable/AM)
	if(!AM) return

	if(damaged || anchored)
		return

	..()

/mob/living/simple_animal/hostile/drg/ranged //will shoot enemies on sight, player will NOT have control over this, so make survivors the same faction!
	COOLDOWN_DECLARE(ranged_cooldown)
	var/projectile_to_fire = /datum/ammo/bullet/rifle
	var/attack_range = 10
	var/cooldown_duration = 1 SECONDS
	var/list/possible_targets = list()

	var/list/weapons = list("basic")
	var/weapon_choosed = "basic"
	var/using_special_ammo = FALSE
	var/special_ammo = 0
	var/special_ammo_max = 0 //so we can count it or refill

	var/list/fire_modes_list = list("automatic", "manual")

	var/fire_mode = "automatic"
	var/fire_disabled = FALSE

/mob/living/simple_animal/hostile/drg/ranged/get_examine_text(mob/user)
	. = ..()

	if(user == src)
		. += " "
		. += SPAN_DANGER("Your current weapon is [weapon_choosed].")
		. += SPAN_DANGER("Your weapon system currently in [fire_mode] mode.")
		. += " "
		if(fire_disabled)
			. += SPAN_GREEN("It's safety is ON!")
		else if(!fire_disabled)
			. += SPAN_DANGER("It's safety is OFF!")
		. += " "
		. += SPAN_GREEN("Your current special ammunition supplies is: [special_ammo]/[special_ammo_max].")

/mob/living/simple_animal/hostile/drg/ranged/proc/change_fire_mode()
	var/choose = tgui_input_list(usr, "Choose what to do!", "Weapons Control", fire_modes_list)
	switch(choose)
		if("automatic")
			fire_mode = "automatic"
			return TRUE
		if("manual")
			fire_mode = "manual"
			return TRUE

/mob/living/simple_animal/hostile/drg/ranged/proc/change_ammunition() //doesn't do anything by itself, used for different robo-guns
	var/projectile = tgui_input_list(usr, "Choose wanted weapon!", "Weapons Control", weapons)
	if(!projectile)
		return FALSE
	switch(projectile)
		if("basic")
			weapon_choosed = "basic"
			return TRUE

/mob/living/simple_animal/hostile/drg/ranged/click(atom/A, list/mods)
	. = ..()
	if(mods["middle"] || mods["shift"] || mods["alt"] || mods["ctrl"])
		return
	if(get_dist(A, src) >= 3 && fire_mode == "manual")
		if(COOLDOWN_FINISHED(src, ranged_cooldown) && !damaged && !fire_disabled)

			if(using_special_ammo && special_ammo <= 0)
				to_chat(usr, SPAN_DANGER("OUT OF SPECIAL AMMUNITION!"))
				return FALSE

			var/datum/ammo/projectile_type = GLOB.ammo_list[projectile_to_fire]

			var/obj/projectile/projectile = new /obj/projectile(loc, create_cause_data(src))
			projectile.generate_bullet(projectile_type)
			projectile.permutated += src
			projectile.fire_at(A, src, src, projectile_type.max_range, projectile_type.shell_speed)
			if(using_special_ammo)
				special_ammo -= 1
				to_chat(usr, SPAN_DANGER("[special_ammo]/[special_ammo_max] AMMUNITION POINTS LEFT!"))
			COOLDOWN_START(src, ranged_cooldown, cooldown_duration)

/mob/living/simple_animal/hostile/drg/ranged/UnarmedAttack(atom/A, proximity, click_parameters)
	if(A == src)
		var/list/options = list("Disable Weapons", "Change Primary", "Change Mode")
		var/choosed_thing = tgui_input_list(usr, "Choose what to do!", "Weapons Control", options)
		if(!choosed_thing)
			return FALSE
		switch(choosed_thing)
			if("Disable Weapons")
				if(!fire_disabled)
					fire_disabled = TRUE
					to_chat(usr, SPAN_DANGER("You disabled your weapons!"))
					return TRUE
				if(fire_disabled)
					fire_disabled = FALSE
					to_chat(usr, SPAN_DANGER("You enabled your weapons!"))
					return TRUE
			if("Change Primary")
				change_ammunition()
				return TRUE
			if("Change Mode")
				change_fire_mode()
				return TRUE
	..()

/mob/living/simple_animal/hostile/drg/ranged/Life(delta_time)
	..()

	if(COOLDOWN_FINISHED(src, ranged_cooldown) && !damaged && !fire_disabled && fire_mode == "automatic")
		for(var/mob/living/target in view(attack_range, src))
			if(target.faction != src.faction && target.stat != DEAD)
				possible_targets += target

		if(!possible_targets.len)
			return FALSE
		var/current_target = pick(possible_targets)

		if(using_special_ammo && special_ammo <= 0)
			to_chat(usr, SPAN_DANGER("OUT OF SPECIAL AMMUNITION!"))
			return FALSE

		var/datum/ammo/projectile_type = GLOB.ammo_list[projectile_to_fire]

		var/obj/projectile/projectile = new /obj/projectile(loc, create_cause_data(src))
		projectile.generate_bullet(projectile_type)
		projectile.permutated += src
		projectile.fire_at(current_target, src, src, projectile_type.max_range, projectile_type.shell_speed)
		if(using_special_ammo)
			special_ammo -= 1
			to_chat(usr, SPAN_DANGER("[special_ammo]/[special_ammo_max] AMMUNITION POINTS LEFT!"))
		possible_targets.Cut()
		COOLDOWN_START(src, ranged_cooldown, cooldown_duration)

//ROBOT TYPES

/mob/living/simple_animal/hostile/drg/howard
	name = "H-0W-RD"
	desc = "An DRG Company personal automaton. This one made for bar duty and service assistance."
	icon_state = "Howard"

	health = 99999
	maxHealth = 99999
	lives = 99999
	max_lives = 99999

	base_robot_icon = "Howard"

	var/list/reagents_to_choose = list("beer", "bilk", "ale", "manlydorf", "grog")
	var/reagent_to_dispense = null

/mob/living/simple_animal/hostile/drg/howard/UnarmedAttack(atom/A, proximity, click_parameters)
	if(A == src)
		reagent_to_dispense = tgui_input_list(usr, "Choose the drink you need!", "Reagent Selection", reagents_to_choose)
		if(!reagent_to_dispense)
			return FALSE
		to_chat(usr, SPAN_DANGER("Now you will dispense [reagent_to_dispense]!"))
		return TRUE
	if(istype(A, /obj/item/reagent_container))
		var/obj/item/reagent_container/target = A
		if(target.reagents.total_volume >= target.reagents.maximum_volume)
			to_chat(usr, SPAN_DANGER("[target] is full!"))
			return FALSE
		src.visible_message(SPAN_WARNING("[src] happily beeps, and then starts to pour some liquid into [target]."),
		SPAN_NOTICE("You filled [target] with 5U of [reagent_to_dispense]."))
		playsound(src.loc, 'sound/effects/refill.ogg', 25, 1, 3)
		target.reagents.add_reagent(reagent_to_dispense, 5)
		return TRUE
	..()

/datum/ammo/bullet/rifle/explosive/bosco
	name = "heavy bolt"
	icon_state = "bolter"
	damage = 85
	accurate_range = 22
	penetration = ARMOR_PENETRATION_TIER_4
	accuracy = HIT_ACCURACY_TIER_MAX
	shell_speed = AMMO_SPEED_TIER_6
	damage_falloff = DAMAGE_FALLOFF_TIER_5
	damage_falloff = 0
	scatter = 0

/datum/ammo/bullet/shotgun/buckshot/special/bosco_heavy
	name = "fragmentated shell"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/spread/special/bosco_heavy

	accurate_range = 6
	max_range = 8
	damage = 100
	bonus_projectiles_amount = EXTRA_PROJECTILES_TIER_10
	firing_freq_offset = SOUND_FREQ_LOW

/datum/ammo/bullet/shotgun/spread/special/bosco_heavy
	name = "shell heavy fragment"
	accurate_range = 8
	max_range = 10
	damage = 65
	firing_freq_offset = SOUND_FREQ_LOW

/mob/living/simple_animal/hostile/drg/ranged/robert
	name = "R-0B-ER-T"
	desc = "An DRG Company personal automaton. This one made for simple on-duty work."
	icon_state = "Robert"
	base_robot_icon = "Robert"

	health = 1000
	maxHealth = 1000
	var/miner_buff = 3 SECONDS

	melee_damage_lower = 30
	melee_damage_upper = 60

	projectile_to_fire = /datum/ammo/bullet/rifle/explosive/bosco

/mob/living/simple_animal/hostile/drg/ranged/robert/UnarmedAttack(atom/A, proximity, click_parameters)

	if(istype(A, /obj/structure/surface/table/rock))
		var/obj/structure/surface/table/rock/target = A
		if(do_after(src, target.dig_time - miner_buff, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			if(target.have_minerals)
				new target.mineral_drop(target.loc)
			src.visible_message(SPAN_WARNING("[target] crumbles to dust."),
			SPAN_NOTICE("You dug through [target]."))
			qdel(target)

	..()

/mob/living/simple_animal/hostile/drg/ranged/robert/brother
	name = "HU-3-BERT"
	desc = "An DRG Company personal automaton. This one made for simple on-duty work and equiped with much more dangerous equipment."
	icon_state = "Huebert"
	base_robot_icon = "Huebert"

	health = 2500
	maxHealth = 2500
	miner_buff = 5 SECONDS

	melee_damage_lower = 40
	melee_damage_upper = 80

	special_ammo = 10
	special_ammo_max = 10

	weapons = list("shotgun", "rockets")
	weapon_choosed = "shotgun"
	projectile_to_fire = /datum/ammo/bullet/shotgun/buckshot/special/bosco_heavy
	cooldown_duration = 3 SECONDS

/mob/living/simple_animal/hostile/drg/ranged/robert/brother/change_ammunition()

	var/projectile = tgui_input_list(usr, "Choose wanted weapon!", "Weapons Control", weapons)
	if(!projectile)
		return FALSE
	switch(projectile)
		if("shotgun")
			projectile_to_fire = /datum/ammo/bullet/shotgun/buckshot/special/bosco_heavy
			cooldown_duration = 3 SECONDS
			using_special_ammo = FALSE
			weapon_choosed = "shotgun"
			return TRUE
		if("rockets")
			projectile_to_fire = /datum/ammo/rocket
			using_special_ammo = TRUE
			cooldown_duration = 8 SECONDS
			weapon_choosed = "rockets"
			return TRUE

GLOBAL_LIST_INIT(stored_minerals, list(/obj/item/drg/glyphid_egg = 0))
GLOBAL_LIST_INIT(minerals_to_name, list(/obj/item/drg/glyphid_egg = "Glyphid eggs"))

/mob/living/simple_animal/hostile/drg/dora
	name = "D-0-RA"
	desc = "An DRG Company personal automaton. This one made for transporting various things AND easly traversing difficult cave terrain."
	icon_state = "Dora"
	base_robot_icon = "Dora"

	var/atom/move_target

/mob/living/simple_animal/hostile/drg/dora/Initialize()
	. = ..()
	START_PROCESSING(SSfastobj, src)

/mob/living/simple_animal/hostile/drg/dora/Destroy()
	. = ..()
	STOP_PROCESSING(SSfastobj, src)

/mob/living/simple_animal/hostile/drg/dora/get_examine_text(mob/user)
	. = ..()
	. += " "
	. += SPAN_LARGE(SPAN_INFO("It currently holds:"))
	for(var/mineral in GLOB.stored_minerals)
		var/amount = GLOB.stored_minerals[mineral]
		if(!amount)
			continue
		. += SPAN_GREEN("[amount] [GLOB.minerals_to_name[mineral]].")

/mob/living/simple_animal/hostile/drg/dora/attackby(obj/item/W, mob/user, click_data)
	var/item_type
	for(var/atom/A in W)
		item_type = A.type
		if(isnull(GLOB.stored_minerals[item_type]))
			item_type = null
			continue

		if(!do_after(user, 0.2 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_GENERIC))
			return ..()

		GLOB.stored_minerals[item_type] += 1
		user.client.remove_from_screen(A)
		qdel(A)

	if(item_type)
		return ..()

	item_type = W.type

	if(isnull(GLOB.stored_minerals[item_type]))
		to_chat(user, SPAN_DANGER("M.U.L.E can't accept this!"))
		return ..()

	GLOB.stored_minerals[item_type] += 1
	qdel(W)

/mob/living/simple_animal/hostile/drg/dora/process()
	. = ..()

	/// Trying to follow last marker placed
	var/new_target = GLOB.dora_navpoints[1]

	if(!new_target)
		return

	/// Make a happy sound when new navpoint is found
	if(new_target != move_target)
		playsound(loc, 'void-marines/sound/drg/DoraTalk_recieved.ogg', 25, TRUE)

	/// Set new target
	move_target = new_target

	/// Are we on the same plane of existance?
	if(move_target.z != z)
		return

	if(get_dist(src, move_target) <= 1)
		if(!anchored)
			playsound(loc, 'void-marines/sound/drg/DoraTalk_destination.ogg', 25, TRUE)
			anchored = TRUE // We made it to navpoint
		return

	/// Step sound
	playsound(loc, pick('void-marines/sound/drg/DoraStep_01.ogg',
	'void-marines/sound/drg/DoraStep_02.ogg',
	'void-marines/sound/drg/DoraStep_03.ogg',
	'void-marines/sound/drg/DoraStep_04.ogg'), 25, TRUE)

	/// We are on the move again
	anchored = FALSE
	step_to(src, move_target)

/mob/living/simple_animal/hostile/drg/dora/Life(delta_time)
	return
