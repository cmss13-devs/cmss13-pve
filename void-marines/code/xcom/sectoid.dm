#define SPECIES_SECTOID "Sectoid"

/mob/living/carbon/human/sectoid/Initialize(mapload, new_species)
	. = ..(mapload, new_species = name)

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
	pain_type = /datum/pain/human_hero
	unarmed_type = /datum/unarmed_attack/claws/strong
	secondary_unarmed_type = /datum/unarmed_attack
	death_message = "lets out a faint scream as it collapses and stops moving..."
	knock_down_reduction = 0.5
	stun_reduction = 0.5
	gibbed_anim = "gibbed-m"
	dusted_anim = "dust-m"
	inherent_verbs = list(
		/mob/living/proc/ventcrawl,
		/mob/living/proc/hide,
	)
	mob_inherent_traits = list(
		TRAIT_EMOTE_CD_EXEMPT,
		TRAIT_YAUTJA_TECH,
		TRAIT_FOREIGN_BIO,
	)
	blood_color = COLOR_ORANGE
	uses_skin_color = FALSE

/datum/species/sectoid/New()
	equip_adjust = list(
		WEAR_R_HAND = list("[NORTH]" = list("x" = 1, "y" = -5), "[EAST]" = list("x" = 3, "y" = -5), "[SOUTH]" = list("x" = 3, "y" = -5), "[WEST]" = list("x" = -3, "y" = -5)),
		WEAR_L_HAND = list("[NORTH]" = list("x" = -1, "y" = 5), "[EAST]" = list("x" = 3, "y" = 5), "[SOUTH]" = list("x" = 3, "y" = 5), "[WEST]" = list("x" = -3, "y" = 5)),
		WEAR_WAIST = list("[NORTH]" = list("x" = 0, "y" = 3), "[EAST]" = list("x" = 0, "y" = 3), "[SOUTH]" = list("x" = 0, "y" = 3), "[WEST]" = list("x" = 0, "y" = 3)),
		WEAR_FEET = list("[NORTH]" = list("x" = 0, "y" = 7), "[EAST]" = list("x" = -1, "y" = 7), "[SOUTH]" = list("x" = 0, "y" = 7), "[WEST]" = list("x" = 1, "y" = 7)),
		WEAR_HEAD = list("[NORTH]" = list("x" = 2, "y" = -3), "[EAST]" = list("x" = 0, "y" = -5), "[SOUTH]" = list("x" = 2, "y" = -3), "[WEST]" = list("x" = 0, "y" = -5)),
		WEAR_FACE = list("[NORTH]" = list("x" = 0, "y" = 0), "[EAST]" = list("x" = -1, "y" = 0), "[SOUTH]" = list("x" = 0, "y" = 0), "[WEST]" = list("x" = 1, "y" = 0))
	)
	..()

/datum/species/sectoid/handle_post_spawn(mob/living/carbon/human/H)
	H.set_languages(list(LANGUAGE_YAUTJA))
	H.universal_understand = TRUE

	H.gender = PLURAL

	H.default_lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	H.update_sight()

	return ..()

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
