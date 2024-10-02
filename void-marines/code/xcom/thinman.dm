#define SPECIES_THIN_MAN "Thin Human"

/mob/living/carbon/human/thin_man/Initialize(mapload)
	. = ..(mapload, new_species = name)

/datum/species/human/thin_man
	group = SPECIES_HUMAN // to be like a human guy
	name = SPECIES_THIN_MAN
	brute_mod = 1.5
	burn_mod = 0.75
	mob_flags = KNOWS_TECHNOLOGY|NO_POISON|NO_NEURO
	pain_type = /datum/pain/human_hero
	unarmed_type = /datum/unarmed_attack/claws/strong
	secondary_unarmed_type = /datum/unarmed_attack
	death_message = "lets out a faint scream as it collapses and stops moving..."
	knock_down_reduction = 0.5
	stun_reduction = 0.5
	slowdown = -0.25
	mob_inherent_traits = list(
		TRAIT_EMOTE_CD_EXEMPT,
		TRAIT_YAUTJA_TECH,
		TRAIT_FOREIGN_BIO,
		TRAIT_DEXTROUS,
		TRAIT_CRAWLER,
    )
	blood_color = BLOOD_COLOR_YAUTJA
	uses_skin_color = FALSE
	hair_color = "#000000"

/datum/species/human/thin_man/handle_post_spawn(mob/living/carbon/human/H)
	H.set_languages(list(LANGUAGE_ENGLISH, LANGUAGE_YAUTJA))
	H.universal_understand = TRUE

	H.gender = MALE
	H.f_style = "Shaved"
	H.h_style = "Mulder"

	RegisterSignal(H, COMSIG_LIVING_CLIMB_STRUCTURE, PROC_REF(handle_climbing))
	give_action(H, /datum/action/human_action/activable/acid_spit)

	H.default_lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	H.update_sight()

	return ..()

/datum/species/human/thin_man/proc/handle_climbing(mob/living/M, list/climbdata)
	SIGNAL_HANDLER
	climbdata["climb_delay"] *= 0.5

/datum/species/human/thin_man/handle_death(mob/living/carbon/human/H, gibbed)
	create_shrapnel(get_turf(H), 64, , , /datum/ammo/xeno/acid, create_cause_data("acid splatter", H))
	if(!gibbed)
		playsound(H.loc, 'sound/voice/joe/death_normal.ogg', 75, FALSE)
	return ..()

//////////////////////////////////////
/*				ABILITIES			*/
//////////////////////////////////////
/datum/action/human_action/activable/acid_spit
	name = "Acid Spit"
	icon_file = 'icons/mob/hud/actions_xeno.dmi'
	action_icon_state = "acid_spray_cone"

	cooldown = 18 SECONDS

/datum/action/human_action/activable/acid_spit/use_ability(atom/A)
	var/mob/living/carbon/human/X = owner
	if(!can_use_action() || !action_cooldown_check() || !isturf(X.loc))
		return

	if(!do_after(X, 0.5 SECONDS, INTERRUPT_ALL | BEHAVIOR_IMMOBILE, BUSY_ICON_HOSTILE))
		to_chat(X, SPAN_XENODANGER("You cancel your acid spit."))
		return

	if(!can_use_action() || !action_cooldown_check() || !isturf(X.loc))
		return

	enter_cooldown()

	to_chat(X, SPAN_XENOWARNING("You lob a compressed ball of acid into the air!"))
	playsound(X.loc, get_sfx("acid_spit"), 25, 1)

	var/obj/projectile/proj = new (get_turf(X), create_cause_data("Thinman Acid", X))
	proj.generate_bullet(GLOB.ammo_list[/datum/ammo/xeno/boiler_gas/acid/small])
	proj.permutated += X
	proj.def_zone = X.get_limbzone_target()

	proj.fire_at(A, X, X, 8, 0.8)

	return ..()

/datum/ammo/xeno/boiler_gas/acid/small
	smokerange = 2

//////////////////////////////////////
/*				EQUIP				*/
//////////////////////////////////////
/datum/equipment_preset/thinman
	name = "XCOM - Thinman"
	assignment = "Civilian"
	flags = EQUIPMENT_PRESET_START_OF_ROUND

	languages = list(LANGUAGE_ENGLISH, LANGUAGE_YAUTJA)

	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "IRO Agent"
	rank = "IRO Agent"
	faction = "Alien"
	access = list(ACCESS_CIVILIAN_PUBLIC)
	skills = /datum/skills/spy
	idtype = /obj/item/card/id/lanyard

/datum/equipment_preset/thinman/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_THIN_MAN)
	if(!mob_client)
		mob_client = new_human.client

/datum/equipment_preset/thinman/load_name(mob/living/carbon/human/new_human, randomise, client/mob_client)
	. = ..()

	new_human.gender = MALE

	new_human.f_style = "Shaved"
	new_human.h_style = "Mulder"

	new_human.r_hair = 0
	new_human.g_hair = 0
	new_human.b_hair = 0

/datum/equipment_preset/thinman/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/hybrisa/detective_synth_uniform/alt(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate/black(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big(new_human), WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/rxfm5_eva/alien(new_human), WEAR_L_STORE)

	..()
