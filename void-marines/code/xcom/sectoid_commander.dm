#define SPECIES_SECTOID_COMMANDER "Sectoid Commander"

/mob/living/carbon/human/sectoid/commander/Initialize(mapload, new_species = SPECIES_SECTOID_COMMANDER)
	. = ..(mapload, new_species)

/datum/species/sectoid/commander
	name = SPECIES_SECTOID_COMMANDER
	brute_mod = 1.25
	burn_mod = 1.25
	inherent_verbs = list()
	mob_inherent_traits = list(
		TRAIT_EMOTE_CD_EXEMPT,
		TRAIT_YAUTJA_TECH,
		TRAIT_FOREIGN_BIO,
		TRAIT_LEADERSHIP,
	)

/datum/species/sectoid/commander/handle_post_spawn(mob/living/carbon/human/H)
	. = ..()
	give_action(H, /datum/action/human_action/activable/mindfray)
	H.color = "#8787A0"

//////////////////////////////////////
/*				ABILITIES			*/
//////////////////////////////////////
/datum/action/human_action/activable/mindfray
	name = "Mindfray"
	icon_file = 'icons/mob/hud/actions_xeno.dmi'
	action_icon_state = "place_queen_beacon"

	cooldown = 30 SECONDS
	var/radius = 4

/datum/action/human_action/activable/mindfray/use_ability(atom/A)
	if(!can_use_action() || !action_cooldown_check())
		return

	var/turf/T = get_turf(A)
	var/mob/living/carbon/human/X = owner

	to_chat(X, SPAN_XENODANGER("You start channeling your psychic energy towards [A]..."))
	playsound(X.loc, 'void-marines/sound/xcom_aliens/sectoid/MindFray.SoundNodeWave_0000009c.ogg', 75)

	if(!do_after(X, 1.5 SECONDS, INTERRUPT_ALL | BEHAVIOR_IMMOBILE, BUSY_ICON_HOSTILE))
		to_chat(X, SPAN_XENODANGER("You stop channeling your psychic energy."))
		return

	if(!can_use_action() || !action_cooldown_check())
		return

	enter_cooldown()

	var/list/turfs_around = RANGE_TURFS(radius, T)
	for(var/i in 1 to rand(3,5))
		var/turf/t = pick(turfs_around)

		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(rand(1,3), FALSE, t)
		s.start()

		turfs_around -= t

	playsound(T, 'void-marines/sound/xcom_aliens/sectoid/SectoidPossessed.SoundNodeWave_0000009c.ogg', 200)
	new /obj/effect/temp_visual/psi_eye(T)

	var/i = 0
	var/effect = rand(1,4)
	for(var/mob/living/carbon/C as anything in shuffle(GLOB.living_mob_list))
		if(get_dist(C, T) > radius)
			continue

		if(HAS_TRAIT(C, TRAIT_FOREIGN_BIO))
			continue

		to_chat(C, SPAN_XENOQUEEN("Ты чувствуешь чьё-то присутствие в своей голове..."))
		new /datum/effects/xeno_slow(C, X, , , 2 SECONDS)

		i += rand(1, 3)
		spawn(i)
			C.flash_eyes(bypass_checks = TRUE, flash_timer = 1 SECONDS)
			C.emote(pick("pain", "scream"))
			C.EyeBlur(12, 28)

			switch(effect)
				if(1)
					C.apply_stamina_damage(80)  // Fake crit, a good way to induce panic
					C.make_jittery(200)
					C.TalkStutter(20)
					C.Stun(2)
				if(2)
					addtimer(CALLBACK(src, PROC_REF(remove_hallucinations), C), rand(20 SECONDS, 35 SECONDS))
					C.hallucination = 1500
					C.confused = 15
					C.druggy = 20
				if(3)
					C.set_movement_intent(MOVE_INTENT_WALK)
					C.set_resting(TRUE, TRUE, TRUE)
					C.spin(35, 2)
				if(4)
					if(C.client)
						if(!C.get_active_hand())
							C?:holster_verb()
						for(var/shots in 1 to rand(1, 15))
							var/turf/target = get_random_turf_in_range(C, 7, 6)
							spawn(1)
								C.client.MouseDown(target, target, TRUE, "left")

	return ..()

/datum/action/human_action/activable/mindfray/proc/remove_hallucinations(mob/living/L)
	L.hallucination = 0

/obj/effect/temp_visual/psi_eye
	icon = 'void-marines/icons/eye.dmi'
	icon_state = "eye_open"
	layer = WEATHER_LAYER
	randomdir = FALSE
	duration = 2.1 SECONDS
	alpha = 200

/obj/effect/temp_visual/psi_eye/Initialize(mapload)
	. = ..()
	flick("eye_opening", src)
	addtimer(CALLBACK(src, PROC_REF(explode)), duration - 1 SECONDS)
	transform = matrix().Scale(2)

/obj/effect/temp_visual/psi_eye/proc/explode()
	flick("eye_explode", src)

//////////////////////////////////////
/*				EQUIP				*/
//////////////////////////////////////
/datum/equipment_preset/sectoid/pistol/commander
	name = "XCOM - Sectoid Commander"
	skills = /datum/skills/clf/leader

/datum/equipment_preset/sectoid/pistol/commander/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_SECTOID_COMMANDER)
	if(!mob_client)
		mob_client = new_human.client

/datum/equipment_preset/sectoid/pistol/commander/load_name(mob/living/carbon/human/new_human, randomise)
	. = ..()
	new_human.change_real_name(new_human, "𒁏 " + new_human.real_name)
