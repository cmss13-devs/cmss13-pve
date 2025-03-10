/*
//======
					Pistol Ammo
//======
*/

// Used by M4A3, M4A3 Custom and B92FS
/datum/ammo/bullet/pistol
	name = "9x19 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	accuracy = HIT_ACCURACY_TIER_3
	accuracy_var_low = PROJECTILE_VARIANCE_TIER_6
	damage = 40
	penetration= -ARMOR_PENETRATION_TIER_2
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_2

/datum/ammo/bullet/pistol/tiny
	name = "light pistol bullet"

/datum/ammo/bullet/pistol/tranq
	name = "tranquilizer bullet"
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_IGNORE_RESIST
	stamina_damage = 30
	damage = 15

//2020 rebalance: is supposed to counter runners and lurkers, dealing high damage to the only castes with no armor.
//Limited by its lack of versatility and lower supply, so marines finally have an answer for flanker castes that isn't just buckshot.

/datum/ammo/bullet/pistol/hollow
	name = "hollowpoint 9x19 bullet"

	damage = 55 //hollowpoint is strong
	penetration = -ARMOR_PENETRATION_TIER_5 //hollowpoint can't pierce armor!
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_3 //hollowpoint causes shrapnel

/datum/ammo/bullet/pistol/ap
	name = "armor-piercing 9x19 bullet"

	damage = 25
	accuracy = HIT_ACCURACY_TIER_2
	penetration= ARMOR_PENETRATION_TIER_2
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_2

/datum/ammo/bullet/pistol/ap/penetrating
	name = "wall-penetrating 9x19 bullet"
	shrapnel_chance = 0

	damage = 30
	penetration = ARMOR_PENETRATION_TIER_10

/datum/ammo/bullet/pistol/ap/penetrating/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_penetrating)
	))

/datum/ammo/bullet/pistol/ap/toxin
	name = "toxic 9x19 bullet"
	var/acid_per_hit = 10
	var/organic_damage_mult = 3

/datum/ammo/bullet/pistol/ap/toxin/on_hit_mob(mob/M, obj/projectile/P)
	. = ..()
	M.AddComponent(/datum/component/status_effect/toxic_buildup, acid_per_hit)

/datum/ammo/bullet/pistol/ap/toxin/on_hit_turf(turf/T, obj/projectile/P)
	. = ..()
	if(T.turf_flags & TURF_ORGANIC)
		P.damage *= organic_damage_mult

/datum/ammo/bullet/pistol/ap/toxin/on_hit_obj(obj/O, obj/projectile/P)
	. = ..()
	if(O.flags_obj & OBJ_ORGANIC)
		P.damage *= organic_damage_mult

/datum/ammo/bullet/pistol/le
	name = "armor-shredding 9x19 bullet"

	damage = 15
	penetration = ARMOR_PENETRATION_TIER_4
	pen_armor_punch = 3

/datum/ammo/bullet/pistol/rubber
	name = "rubber 9x19 bullet"
	sound_override = 'sound/weapons/gun_c99.ogg'

	damage = 0
	stamina_damage = 25
	shrapnel_chance = 0

/datum/ammo/bullet/pistol/incendiary
	name = "incendiary 9x19 bullet"
	damage_type = BURN
	shrapnel_chance = 0
	flags_ammo_behavior = AMMO_BALLISTIC

	accuracy = HIT_ACCURACY_TIER_3
	damage = 20

/datum/ammo/bullet/pistol/incendiary/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

// UPP Makarov bullets

/datum/ammo/bullet/pistol/upp
	name = "9x18 bullet"

/datum/ammo/bullet/pistol/tranq/upp
	name = "tranquilizing 9x18 bullet"

// Reskinned rubber bullet used for the ES-4 CL pistol.
/datum/ammo/bullet/pistol/rubber/stun
	name = "stun pistol bullet"
	sound_override = null

// Used by M1911, Deagle and KT-42
/datum/ammo/bullet/pistol/heavy
	name = ".45 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	accuracy = HIT_ACCURACY_TIER_3
	accuracy_var_low = PROJECTILE_VARIANCE_TIER_6
	damage = 45
	penetration = ARMOR_PENETRATION_TIER_3
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_2

/datum/ammo/bullet/pistol/heavy/upp
	name = "7.62x25 bullet"

/datum/ammo/bullet/pistol/heavy/super
	name = ".50 bullet"
	damage = 60
	damage_var_low = PROJECTILE_VARIANCE_TIER_8
	damage_var_high = PROJECTILE_VARIANCE_TIER_6
	penetration = ARMOR_PENETRATION_TIER_4

/datum/ammo/bullet/pistol/heavy/super/highimpact
	name = "high-impact .50 bullet"
	penetration = ARMOR_PENETRATION_TIER_1
	debilitate = list(0,1.5,0,0,0,1,0,0)
	flags_ammo_behavior = AMMO_BALLISTIC

/datum/ammo/bullet/pistol/heavy/super/highimpact/ap
	name = "high-impact armor piercing .50 bullet"
	penetration = ARMOR_PENETRATION_TIER_10
	damage = 45

/datum/ammo/bullet/pistol/heavy/super/highimpact/upp
	name = "high-impact 7.62x25 bullet"
	sound_override = 'sound/weapons/gun_DE50.ogg'
	penetration = ARMOR_PENETRATION_TIER_6
	debilitate = list(0,1.5,0,0,0,1,0,0)
	flags_ammo_behavior = AMMO_BALLISTIC

/datum/ammo/bullet/pistol/heavy/super/highimpact/New()
	..()
	RegisterSignal(src, COMSIG_AMMO_POINT_BLANK, PROC_REF(handle_battlefield_execution))

/datum/ammo/bullet/pistol/heavy/super/highimpact/on_hit_mob(mob/M, obj/projectile/P)
	knockback(M, P, 4)

// Used by VP78 and Auto 9
/datum/ammo/bullet/pistol/squash
	name = "squash-head 9x19 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	debilitate = list(0,0,0,0,0,0,0,2)

	accuracy = HIT_ACCURACY_TIER_2
	damage = 50
	penetration = ARMOR_PENETRATION_TIER_2
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_1
	effective_range_max = 3 //hopefully this fixes the damage woes.
	damage_falloff = DAMAGE_FALLOFF_TIER_6

/datum/ammo/bullet/pistol/squash/toxin
	name = "toxic squash-head 9x19 bullet"
	var/acid_per_hit = 10
	var/organic_damage_mult = 3

/datum/ammo/bullet/pistol/squash/toxin/on_hit_mob(mob/M, obj/projectile/P)
	. = ..()
	M.AddComponent(/datum/component/status_effect/toxic_buildup, acid_per_hit)

/datum/ammo/bullet/pistol/squash/toxin/on_hit_turf(turf/T, obj/projectile/P)
	. = ..()
	if(T.turf_flags & TURF_ORGANIC)
		P.damage *= organic_damage_mult

/datum/ammo/bullet/pistol/squash/toxin/on_hit_obj(obj/O, obj/projectile/P)
	. = ..()
	if(O.flags_obj & OBJ_ORGANIC)
		P.damage *= organic_damage_mult

/datum/ammo/bullet/pistol/squash/penetrating
	name = "wall-penetrating squash-head 9x19 bullet"
	shrapnel_chance = 0
	penetration = ARMOR_PENETRATION_TIER_10

/datum/ammo/bullet/pistol/squash/penetrating/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_penetrating)
	))

/datum/ammo/bullet/pistol/squash/incendiary
	name = "incendiary squash-head 9x19 bullet"
	damage_type = BURN
	shrapnel_chance = 0
	flags_ammo_behavior = AMMO_BALLISTIC
	accuracy = HIT_ACCURACY_TIER_3
	damage = 35

/datum/ammo/bullet/pistol/squash/incendiary/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))


/datum/ammo/bullet/pistol/mankey
	name = "live monkey"
	icon_state = "monkey1"
	ping = null //no bounce off.
	damage_type = BURN
	debilitate = list(4,4,0,0,0,0,0,0)
	flags_ammo_behavior = AMMO_IGNORE_ARMOR

	damage = 15
	damage_var_high = PROJECTILE_VARIANCE_TIER_5
	shell_speed = AMMO_SPEED_TIER_2

/datum/ammo/bullet/pistol/mankey/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

/datum/ammo/bullet/pistol/mankey/on_hit_mob(mob/M,obj/projectile/P)
	if(P && P.loc && !M.stat && !istype(M,/mob/living/carbon/human/monkey))
		P.visible_message(SPAN_DANGER("The [src] chimpers furiously!"))
		new /mob/living/carbon/human/monkey(P.loc)

/datum/ammo/bullet/pistol/smart
	name = "smart .45 bullet"
	flags_ammo_behavior = AMMO_BALLISTIC
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	accuracy = HIT_ACCURACY_TIER_8
	accuracy_var_low = PROJECTILE_VARIANCE_TIER_6
	damage = 45
	penetration = ARMOR_PENETRATION_TIER_3
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_2
