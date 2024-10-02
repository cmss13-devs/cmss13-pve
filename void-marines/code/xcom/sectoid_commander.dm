#define SPECIES_SECTOID_COMMANDER "Sectoid Commander"

/mob/living/carbon/human/sectoid/commander/Initialize(mapload)
	. = ..(mapload)

/datum/species/sectoid/commander
	name = SPECIES_SECTOID_COMMANDER
	inherent_verbs = list()
	brute_mod = 1.25
	burn_mod = 1.25

/datum/species/sectoid/commander/handle_post_spawn(mob/living/carbon/human/H)
	. = ..()
	give_action(H, /datum/action/human_action/activable/mindfray)
	H.color = COLOUR_SILVER

//////////////////////////////////////
/*				ABILITIES			*/
//////////////////////////////////////
/datum/action/human_action/activable/mindfray
	name = "Mindfray"
	icon_file = 'icons/mob/hud/actions_xeno.dmi'
	action_icon_state = "place_queen_beacon"

	cooldown = 45 SECONDS
	var/radius = 4

/datum/action/human_action/activable/mindfray/use_ability(atom/A)
	if(!can_use_action())
		return

	var/turf/T = get_turf(A)
	var/mob/living/carbon/human/X = owner

	to_chat(X, SPAN_XENODANGER("You start channeling your psychic energy towards [A]..."))
	playsound(X.loc, 'sound/voice/deep_alien_screech.ogg', 25)

	if(!do_after(X, 2 SECONDS, INTERRUPT_ALL | BEHAVIOR_IMMOBILE, BUSY_ICON_HOSTILE))
		to_chat(X, SPAN_XENODANGER("You stop channeling your psychic energy."))
		return

	if(!can_use_action())
		return

	enter_cooldown()
	playsound(T, 'sound/effects/metalscrape.ogg', 100)

	var/list/turfs_around = RANGE_TURFS(radius, T)
	for(var/i in 1 to rand(3,5))
		var/turf/t = pick(turfs_around)

		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(rand(1,3), FALSE, t)
		s.start()

		turfs_around -= t

	var/i = 0
	var/effect = rand(1,4)
	for(var/mob/living/carbon/C as anything in shuffle(GLOB.living_mob_list))
		if(get_dist(C, T) > radius)
			continue

		if(HAS_TRAIT(C, TRAIT_FOREIGN_BIO))
			continue

		to_chat(C, SPAN_XENOWARNING("Ты чувствуешь чьё-то присутствие в своей голове..."))

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
					C.druggy = 20
				if(3)
					C.set_movement_intent(MOVE_INTENT_WALK)
					C.set_resting(TRUE, TRUE, TRUE)
					C.spin(35, 2)
				if(4)
					if(!C.get_active_hand())
						C?:holster_verb()
					var/turf/target = get_random_turf_in_range(C, 5, 5)
					C?.client?.MouseDown(target, target, TRUE, "left")

	return ..()

/datum/action/human_action/activable/mindfray/proc/remove_hallucinations(mob/living/L)
	L.hallucination = 0

//////////////////////////////////////
/*				EQUIP				*/
//////////////////////////////////////
/datum/equipment_preset/sectoid/pistol/commander
	name = "XCOM - Sectoid Commander"

/datum/equipment_preset/sectoid/pistol/commander/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_SECTOID_COMMANDER)
	if(!mob_client)
		mob_client = new_human.client
