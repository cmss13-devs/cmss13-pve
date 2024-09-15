/datum/species/human/thin_man
	name = "Human Man"
	name_plural = "Human Man"
	group = SPECIES_THIN_MAN
	brute_mod = 1.25
	burn_mod = 1.25
	mob_flags = KNOWS_TECHNOLOGY|NO_POISON|NO_NEURO
	pain_type = /datum/pain/human_hero
	unarmed_type = /datum/unarmed_attack/claws/strong
	secondary_unarmed_type = /datum/unarmed_attack
	death_message = "lets out a faint scream as it collapses and stops moving..."
	knock_down_reduction = 0.5
	stun_reduction = 0.5
	slowdown = -0.5
	inherent_verbs = list(
		/mob/living/proc/ventcrawl,
	)
	mob_inherent_traits = list(
		TRAIT_EMOTE_CD_EXEMPT,
		TRAIT_YAUTJA_TECH,
		TRAIT_FOREIGN_BIO,
        TRAIT_DEXTROUS,
    )
	darksight = 5
	blood_color = BLOOD_COLOR_YAUTJA
	uses_skin_color = FALSE
	hair_color = "#000000"

/datum/species/human/thin_man/handle_post_spawn(mob/living/carbon/human/H)
	H.set_languages(list(LANGUAGE_YAUTJA))
	H.gender = MALE
	H.f_style = "Shaved"
	H.h_style = "Mulder"
	return ..()

/datum/species/human/thin_man/handle_death(mob/living/carbon/human/H)
	create_shrapnel(get_turf(H), 22, , , /datum/ammo/xeno/acid/prae_nade, create_cause_data("acid splatter", H))

/mob/living/carbon/human/thin_man/Initialize(mapload)
	. = ..(mapload, new_species = "Thin Man")
