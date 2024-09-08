// --- Species --- \\

#define SPECIES_ASTARTES "Astartes"

/datum/species/human/astartes
	name = SPECIES_ASTARTES
	name_plural = "Astartes"

	brute_mod = 0.7
	burn_mod = 0.7
	flags = NO_POISON|NO_NEURO|SPECIAL_BONEBREAK|NO_SHRAPNEL|HAS_HARDCRIT
	unarmed_type = /datum/unarmed_attack/punch/astartes
	icon_template = 'void-marines/wh40k/icons/species/r_template_tall.dmi'
	icobase = 'void-marines/wh40k/icons/species/r_astartes.dmi'
	deform = 'void-marines/wh40k/icons/species/r_astartes.dmi'
	eye_icon_location = 'void-marines/wh40k/icons/species/astartes_face.dmi'
	slowdown = -0.3 //Increased move speed
	pain_type = /datum/pain/yautja
	stamina_type = /datum/stamina/none
	total_health = 200
	darksight = 5
	special_body_types = FALSE
	uses_skin_color = FALSE
	mob_inherent_traits = list(
		TRAIT_SUPER_STRONG
	)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/astachaos,
		/mob/living/carbon/human/proc/astacharge,
		/mob/living/carbon/human/proc/astacrush,
		/mob/living/carbon/human/proc/astadamage,
		/mob/living/carbon/human/proc/astadiescum,
		/mob/living/carbon/human/proc/astaeatboltgun,
		/mob/living/carbon/human/proc/astafaithshield,
		/mob/living/carbon/human/proc/astafallback,
		/mob/living/carbon/human/proc/astaforglory,
		/mob/living/carbon/human/proc/astagrenades,
		/mob/living/carbon/human/proc/astakill,
		/mob/living/carbon/human/proc/astanonestopus,
		/mob/living/carbon/human/proc/astaourwrath,
		/mob/living/carbon/human/proc/astaready,
		/mob/living/carbon/human/proc/astatoglory,
		/mob/living/carbon/human/proc/astaxenos
	)

/datum/species
	var/eye_icon_location = 'icons/mob/humans/onmob/human_face.dmi'

/mob/living/carbon/human/astartes
	gender = MALE
	blood_volume = 860
	body_type = "astartes"

/mob/living/carbon/human/astartes/Initialize(mapload)
	. = ..(mapload, new_species = SPECIES_ASTARTES)

/datum/unarmed_attack/punch/astartes
	damage = 25

