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


/datum/equipment_preset/astartes
	name = "Ultramarine Tactical Brother"
	idtype = null
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_USCM
	uses_special_name = TRUE
	skills = /datum/skills/commando/deathsquad
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/astartes/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_ASTARTES)
	new_human.body_type = "astartes"

/datum/equipment_preset/astartes/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/astartes, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/astartes, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/astartes/bodysuit, WEAR_BODY)
	var/obj/item/clothing/suit/armor/astartes/armor = new
	new_human.equip_to_slot_or_del(armor, WEAR_JACKET)
