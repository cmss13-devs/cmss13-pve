#define SPECIES_SECTOID "Sectoid"

/mob/living/carbon/human/sectoid/Initialize(mapload, new_species = SPECIES_SECTOID)
	. = ..(mapload, new_species)

/datum/species/sectoid
	group = SPECIES_SECTOID
	name = SPECIES_SECTOID
	icobase = 'void-marines/icons/r_sectoid.dmi'
	deform = 'void-marines/icons/r_sectoid.dmi'
	eyes = "blank_s"
	blood_mask = 'icons/effects/monkey_blood.dmi'
	brute_mod = 1.5
	burn_mod = 1.5
	mob_flags = KNOWS_TECHNOLOGY
	pain_type = /datum/pain/xeno
	unarmed_type = /datum/unarmed_attack/claws
	secondary_unarmed_type = /datum/unarmed_attack
	death_message = "lets out a faint scream as it collapses and stops moving..."
	knock_down_reduction = 0.5
	stun_reduction = 0.5
	gibbed_anim = "gibbed-m"
	dusted_anim = "dust-m"
	inherent_verbs = list(
		/mob/living/proc/hide,
	)
	mob_inherent_traits = list(
		TRAIT_EMOTE_CD_EXEMPT,
		TRAIT_YAUTJA_TECH,
		TRAIT_FOREIGN_BIO,
		TRAIT_CRAWLER,
	)
	default_lighting_alpha = LIGHTING_PLANE_ALPHA_YAUTJA
	blood_color = COLOR_ORANGE
	uses_skin_color = FALSE
	speech_sounds = list('void-marines/sound/xcom_aliens/sectoid/SectoidSeesHuman01a.SoundNodeWave_0000009c.ogg', 'void-marines/sound/xcom_aliens/sectoid/SectoidSeesHuman02a.SoundNodeWave_0000009c.ogg', 'void-marines/sound/xcom_aliens/sectoid/SectoidSeesHuman03a.SoundNodeWave_0000009c.ogg')
	speech_chance = 100

/datum/species/sectoid/New()
	equip_adjust = list(
		WEAR_R_HAND = list("[NORTH]" = list("x" = 1, "y" = -5), "[EAST]" = list("x" = 3, "y" = -5), "[SOUTH]" = list("x" = 2, "y" = -8), "[WEST]" = list("x" = -3, "y" = -5)),
		WEAR_L_HAND = list("[NORTH]" = list("x" = 0, "y" = -5), "[EAST]" = list("x" = 3, "y" = -5), "[SOUTH]" = list("x" = -1, "y" = -8), "[WEST]" = list("x" = -3, "y" = -5)),
		WEAR_WAIST = list("[NORTH]" = list("x" = 0, "y" = 3), "[EAST]" = list("x" = 0, "y" = 3), "[SOUTH]" = list("x" = 0, "y" = 3), "[WEST]" = list("x" = 0, "y" = 3)),
		WEAR_FEET = list("[NORTH]" = list("x" = 0, "y" = 0), "[EAST]" = list("x" = 0, "y" = 0), "[SOUTH]" = list("x" = 0, "y" = 0), "[WEST]" = list("x" = 0, "y" = 0)),
		WEAR_HEAD = list("[NORTH]" = list("x" = 1, "y" = -4), "[EAST]" = list("x" = 0, "y" = -4), "[SOUTH]" = list("x" = 1, "y" = -4), "[WEST]" = list("x" = 0, "y" = -4)),
		WEAR_FACE = list("[NORTH]" = list("x" = 1, "y" = -4), "[EAST]" = list("x" = 0, "y" = -4), "[SOUTH]" = list("x" = 1, "y" = -4), "[WEST]" = list("x" = 0, "y" = -4))
	)
	..()

/datum/species/sectoid/handle_post_spawn(mob/living/carbon/human/H)
	H.set_languages(list(LANGUAGE_YAUTJA))
	H.universal_understand = TRUE

	H.gender = PLURAL
	H.color = "#E6E6FF"

	H.default_lighting_alpha = LIGHTING_PLANE_ALPHA_YAUTJA
	H.update_sight()

	return ..()

/datum/species/sectoid/handle_death(mob/living/carbon/human/H, gibbed)
	. = ..()
	playsound(H, 'void-marines/sound/xcom_aliens/sectoid/SectoidBrainFry.SoundNodeWave_0000009c.ogg', 75, TRUE)
	if(!gibbed)
		var/obj/limb/head = H.get_limb("head")
		head.droplimb(FALSE, TRUE)
		QDEL_NULL(head)

/datum/species/sectoid/handle_on_fire(humanoidmob)
	. = ..()
	INVOKE_ASYNC(humanoidmob, TYPE_PROC_REF(/mob, emote), pick("pain", "scream"))

//////////////////////////////////////
/*				EQUIP				*/
//////////////////////////////////////
/datum/equipment_preset/sectoid
	name = "XCOM - Sectoid"
	assignment = "Civilian"
	flags = EQUIPMENT_PRESET_START_OF_ROUND

	languages = list(LANGUAGE_YAUTJA)

	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_COLONIST
	rank = JOB_COLONIST
	faction = "Alien"
	access = list(ACCESS_CIVILIAN_PUBLIC)
	skills = /datum/skills/clf
	idtype = null

/datum/equipment_preset/sectoid/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_SECTOID)
	if(!mob_client)
		mob_client = new_human.client

/datum/equipment_preset/sectoid/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.change_real_name(new_human, generate_sectoid_name(new_human))
	new_human.gender = PLURAL

/datum/equipment_preset/sectoid/load_age(mob/living/carbon/human/new_human, client/mob_client)
	new_human.age = rand(1,999)

/datum/equipment_preset/sectoid/pistol
	name = "XCOM - Sectoid (Pistol)"

/datum/equipment_preset/sectoid/pistol/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/rxfm5_eva/alien(new_human), WEAR_R_HAND)
	..()

/datum/equipment_preset/sectoid/rifle
	name = "XCOM - Sectoid (Submachinegun)"

/datum/equipment_preset/sectoid/rifle/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/laz_uzi/alien(new_human), WEAR_R_HAND)
	..()
