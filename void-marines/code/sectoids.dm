#define SPECIES_SECTOID "Sectoid"
#define SPECIES_THIN_MAN "Thin Man"

/datum/species/sectoid
	group = SPECIES_SECTOID
	name = "Sectoid"
	name_plural = "Sectoids"
	icobase = 'void-marines/icons/r_sectoid.dmi'
	deform = 'void-marines/icons/r_sectoid.dmi'
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
	darksight = 5
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
	return ..()

/datum/species/sectoid/get_bodytype(mob/living/carbon/human/H)
	return SPECIES_SECTOID

/datum/species/sectoid/handle_on_fire(humanoidmob)
	. = ..()
	INVOKE_ASYNC(humanoidmob, TYPE_PROC_REF(/mob, emote), pick("pain", "scream"))

/mob/living/carbon/human/sectoid/Initialize(mapload)
	. = ..(mapload, new_species = "Sectoid")

/obj/item/weapon/gun/energy/laz_uzi/sectoid
	name = "weapon of unknown design"
	desc = "A strange alien weapon."
	icon = 'void-marines/icons/energy64.dmi'
	icon_state = "ter"
	item_state = "ter"

	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/energy_left_1.dmi',
		WEAR_R_HAND = 'void-marines/icons/energy_right_1.dmi'
		)

	muzzle_flash = "muzzle_laser"
	gun_category = GUN_CATEGORY_SMG
	flags_equip_slot = SLOT_WAIST
	charge_cost = 100
	charge_icon = "ter_e"

/obj/item/weapon/gun/energy/laz_uzi/sectoid/handle_fire(atom/target, mob/living/carbon/human/user, params, reflex, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)
	. = ..()
	if(. && !istype(user.species, /datum/species/sectoid) && !istype(user.species, /datum/species/human/thin_man))
		cell_explosion(get_turf(src), 30, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("weapon explosion", user))
		visible_message(SPAN_DANGER("[src] explodes right in the hands of [user]!"))
		if(!QDELETED(src))
			qdel(src)

/obj/item/weapon/gun/energy/rxfm5_eva/sectoid
	name = "weapon of unknown design"
	desc = "A strange alien weapon."
	icon = 'void-marines/icons/energy64.dmi'
	icon_state = "tep"
	item_state = "tep"

	item_icons = list(
		WEAR_L_HAND = 'void-marines/icons/energy_left_1.dmi',
		WEAR_R_HAND = 'void-marines/icons/energy_right_1.dmi'
		)

	muzzle_flash = "muzzle_laser"
	fire_sound = 'sound/weapons/Laser4.ogg'

	attachable_allowed = list()
	starting_attachment_types = list()

	has_charge_meter = FALSE
	charge_icon = "tep_e"

/obj/item/weapon/gun/energy/rxfm5_eva/sectoid/update_icon()
	return

/obj/item/weapon/gun/energy/rxfm5_eva/sectoid/handle_fire(atom/target, mob/living/carbon/human/user, params, reflex, dual_wield, check_for_attachment_fire, akimbo, fired_by_akimbo)
	. = ..()
	if(. && !istype(user.species, /datum/species/sectoid) && !istype(user.species, /datum/species/human/thin_man))
		cell_explosion(get_turf(src), 30, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("weapon explosion", user))
		visible_message(SPAN_DANGER("[src] explodes right in the hands of [user]!"))
		if(!QDELETED(src))
			qdel(src)
