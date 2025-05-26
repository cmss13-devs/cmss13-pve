/*
//======
					Rifle Ammo
//======
*/

//====== 10X24 Pulse Rifle
/datum/ammo/bullet/rifle
	name = "10x24 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 40
	penetration = ARMOR_PENETRATION_TIER_1
	accurate_range = 16
	accuracy = HIT_ACCURACY_TIER_4
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = AMMO_SPEED_TIER_6
	effective_range_max = 7
	damage_falloff = DAMAGE_FALLOFF_TIER_7
	max_range = 24

/datum/ammo/bullet/rifle/holo_target
	name = "holo-targeting 10x24 bullet"
	damage = 30
	/// inflicts this many holo stacks per bullet hit
	var/holo_stacks = 10
	/// modifies the default cap limit of 100 by this amount
	var/bonus_damage_cap_increase = 0
	/// multiplies the default drain of 5 holo stacks per second by this amount
	var/stack_loss_multiplier = 1

/datum/ammo/bullet/rifle/holo_target/on_hit_mob(mob/hit_mob, obj/projectile/bullet)
	. = ..()
	hit_mob.AddComponent(/datum/component/bonus_damage_stack, holo_stacks, world.time, bonus_damage_cap_increase, stack_loss_multiplier)


/datum/ammo/bullet/rifle/holo_target/hunting
	name = "holo-targeting 10x24 bullet"
	damage = 25
	holo_stacks = 15

/datum/ammo/bullet/rifle/holo_target/tracer
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

/datum/ammo/bullet/rifle/explosive
	name = "explosive 10x24 bullet"
	damage = 25
	accurate_range = 22
	accuracy = 0
	shell_speed = AMMO_SPEED_TIER_4
	damage_falloff = DAMAGE_FALLOFF_TIER_9

/datum/ammo/bullet/rifle/explosive/on_hit_mob(mob/M, obj/projectile/P)
	cell_explosion(get_turf(M), 80, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, P.dir, P.weapon_cause_data)

/datum/ammo/bullet/rifle/explosive/on_hit_obj(obj/O, obj/projectile/P)
	cell_explosion(get_turf(O), 80, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, P.dir, P.weapon_cause_data)

/datum/ammo/bullet/rifle/explosive/on_hit_turf(turf/T, obj/projectile/P)
	if(T.density)
		cell_explosion(T, 80, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, P.dir, P.weapon_cause_data)


/datum/ammo/bullet/rifle/ap
	name = "armor-piercing 10x24 bullet"

	damage = 30
	penetration = ARMOR_PENETRATION_TIER_8

/datum/ammo/bullet/rifle/ap/tracer
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

/datum/ammo/bullet/rifle/tracer
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

// Basically AP but better. Focused at taking out armour temporarily
/datum/ammo/bullet/rifle/ap/toxin
	name = "toxic 10x24 bullet"
	var/acid_per_hit = 7
	var/organic_damage_mult = 3

/datum/ammo/bullet/rifle/ap/toxin/on_hit_mob(mob/M, obj/projectile/P)
	. = ..()
	M.AddComponent(/datum/component/status_effect/toxic_buildup, acid_per_hit)

/datum/ammo/bullet/rifle/ap/toxin/on_hit_turf(turf/T, obj/projectile/P)
	. = ..()
	if(T.turf_flags & TURF_ORGANIC)
		P.damage *= organic_damage_mult

/datum/ammo/bullet/rifle/ap/toxin/on_hit_obj(obj/O, obj/projectile/P)
	. = ..()
	if(O.flags_obj & OBJ_ORGANIC)
		P.damage *= organic_damage_mult


/datum/ammo/bullet/rifle/ap/penetrating
	name = "wall-penetrating 10x24 bullet"
	shrapnel_chance = 0

	damage = 35
	penetration = ARMOR_PENETRATION_TIER_10

/datum/ammo/bullet/rifle/ap/penetrating/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_penetrating)
	))


/datum/ammo/bullet/rifle/le
	name = "armor-shredding 10x24 bullet"
	damage = 20
	penetration = ARMOR_PENETRATION_TIER_4
	pen_armor_punch = 5


/datum/ammo/bullet/rifle/heap
	name = "high-explosive armor-piercing 10x24 bullet"
	headshot_state = HEADSHOT_OVERLAY_HEAVY
	damage = 55//big damage, doesn't actually blow up because thats stupid.
	penetration = ARMOR_PENETRATION_TIER_8
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_3

/datum/ammo/bullet/rifle/heap/tracer
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

/datum/ammo/bullet/rifle/rubber
	name = "rubber 10x24 bullet"
	damage = 5
	stamina_damage = 15
	shrapnel_chance = 0

/datum/ammo/bullet/rifle/incendiary
	name = "incendiary 10x24 bullet"
	damage_type = BURN
	shrapnel_chance = 0
	flags_ammo_behavior = AMMO_BALLISTIC
	damage = 30
	shell_speed = AMMO_SPEED_TIER_4
	accuracy = -HIT_ACCURACY_TIER_2
	damage_falloff = DAMAGE_FALLOFF_TIER_10


/datum/ammo/bullet/rifle/incendiary/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

//====== 10X28 Smartgun

/datum/ammo/bullet/rifle/heavy
	name = "10x28 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 55
	penetration = ARMOR_PENETRATION_TIER_3
	accuracy = HIT_ACCURACY_TIER_3
	shell_speed = AMMO_SPEED_TIER_6
	effective_range_max = 10
	damage_falloff = DAMAGE_FALLOFF_TIER_9

//Only applicable for the M42A 'basic' magazines
/datum/ammo/bullet/rifle/heavy/on_hit_mob(mob/M,obj/projectile/P)
	if((P.projectile_flags & PROJECTILE_BULLSEYE) && M == P.original)
		var/mob/living/L = M
		L.apply_armoured_damage(damage*2, ARMOR_BULLET, BRUTE, null, penetration)
		to_chat(P.firer, SPAN_WARNING("Bullseye!"))

/datum/ammo/bullet/rifle/heavy/tracer
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

/datum/ammo/bullet/rifle/heavy/ap
	name = "armor-piercing 10x28 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 40
	penetration = ARMOR_PENETRATION_TIER_7

/datum/ammo/bullet/rifle/heavy/ap/tracer
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

/datum/ammo/bullet/rifle/heavy/impdet
	name = "impact-detonating 10x28 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 40
	penetration = -ARMOR_PENETRATION_TIER_2
	damage_falloff = DAMAGE_FALLOFF_TIER_5
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

/datum/ammo/bullet/rifle/heavy/impdet/on_hit_mob(mob/entity, obj/projectile/bullet)
	slowdown(entity, bullet)

/datum/ammo/bullet/rifle/heavy/heap
	name = "high explosive armor-piercing 10x28 bullet"
	headshot_state = HEADSHOT_OVERLAY_HEAVY
	damage = 70
	penetration = ARMOR_PENETRATION_TIER_10
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_3

/datum/ammo/bullet/rifle/heavy/heap/tracer
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

/datum/ammo/bullet/rifle/heavy/du
	name = "depleted uranium 10x28 bullet"

	damage = 60
	accurate_range_min = 4
	penetration = ARMOR_PENETRATION_TIER_5
	scatter = -SCATTER_AMOUNT_TIER_8

/datum/ammo/bullet/rifle/heavy/du/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_penetrating)
	))

/datum/ammo/bullet/rifle/heavy/du/on_hit_mob(mob/target, obj/projectile/fired_proj)
	target.AddComponent(/datum/component/status_effect/toxic_buildup)
	knockback(target, fired_proj, max_range = 2)

// Terminator Smartgun

/datum/ammo/bullet/rifle/heavy/dirty
	name = "irradiated 10x28 bullet"
	debilitate = list(0,0,0,3,0,0,0,1)
	damage = 60
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_7

/datum/ammo/bullet/rifle/heavy/ap/dirty
	name = "irradiated armor-piercing 10x28 bullet"
	debilitate = list(0,0,0,3,0,0,0,1)
	damage = 45

/datum/ammo/bullet/rifle/heavy/impdet/dirty
	name = "irradiated impact-detonating 10x28 bullet"
	damage = 45
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_7

// RMC Smartgun

/datum/ammo/bullet/rifle/heavy/holo_target //Royal marines smartgun bullet has only diff between regular ammo is this one does holostacks and less damage
	name = "holo-targeting 10x28 bullet"
	damage = 50
	/// inflicts this many holo stacks per bullet hit
	var/holo_stacks = 15
	/// modifies the default cap limit of 100 by this amount
	var/bonus_damage_cap_increase = 0
	/// multiplies the default drain of 5 holo stacks per second by this amount
	var/stack_loss_multiplier = 1

/datum/ammo/bullet/rifle/heavy/holo_target/on_hit_mob(mob/hit_mob, obj/projectile/bullet)
	. = ..()
	hit_mob.AddComponent(/datum/component/bonus_damage_stack, holo_stacks, world.time, bonus_damage_cap_increase, stack_loss_multiplier)

/datum/ammo/bullet/rifle/heavy/holo_target/ap
	name = "holo-targetting armor-piercing 10x28 bullet"
	icon_state = "bullet"

	accuracy = HIT_ACCURACY_TIER_2
	damage = 35
	penetration = ARMOR_PENETRATION_TIER_8

/datum/ammo/bullet/rifle/heavy/holo_target/impdet
	name = "holo-targetting impact-detonating 10x28 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	holo_stacks = 25 //holo's all over targets, or something
	damage = 35
	penetration = -ARMOR_PENETRATION_TIER_2
	damage_falloff = DAMAGE_FALLOFF_TIER_5

/datum/ammo/bullet/rifle/heavy/holo_target/impdet/on_hit_mob(mob/entity, obj/projectile/bullet)
	slowdown(entity, bullet)

// Specialist M42A rounds

/datum/ammo/bullet/rifle/heavy/heap/sniper
	name = "high explosive armor-piercing sniper bullet"
	damage = 90 //match-grade munitions developing better velocity from the rifle
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SNIPER|AMMO_IGNORE_COVER

	accurate_range_min = 4
	accurate_range = 32
	effective_range_max = 0
	max_range = 32
	accuracy = HIT_ACCURACY_TIER_8
	scatter = 0
	shell_speed = AMMO_SPEED_TIER_8

/datum/ammo/bullet/rifle/heavy/incendiary
	name = "incendiary sniper bullet"
	damage_type = BRUTE
	damage = 60
	penetration = ARMOR_PENETRATION_TIER_4
	shrapnel_chance = 0
	headshot_state = HEADSHOT_OVERLAY_HEAVY
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SNIPER|AMMO_IGNORE_COVER

	accurate_range_min = 4
	accurate_range = 32
	effective_range_max = 0
	max_range = 32
	accuracy = HIT_ACCURACY_TIER_6
	shell_speed = AMMO_SPEED_TIER_7

/datum/ammo/bullet/rifle/heavy/incendiary/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

/datum/ammo/bullet/rifle/heavy/incendiary/on_hit_mob(mob/M,obj/projectile/P)
	if((P.projectile_flags & PROJECTILE_BULLSEYE) && M == P.original)
		var/mob/living/L = M
		var/blind_duration = 5
		if(isxeno(M))
			var/mob/living/carbon/xenomorph/target = M
			if(target.mob_size >= MOB_SIZE_BIG)
				blind_duration = 2
		L.AdjustEyeBlur(blind_duration)
		L.adjust_fire_stacks(10)
		to_chat(P.firer, SPAN_WARNING("Bullseye!"))

/datum/ammo/bullet/rifle/heavy/flak
	name = "flak sniper bullet"
	damage_type = BRUTE
	damage = 55
	damage_var_high = PROJECTILE_VARIANCE_TIER_8 //Documenting old code: This converts to a variance of 96-109% damage. -Kaga
	penetration = 0
	headshot_state = HEADSHOT_OVERLAY_HEAVY
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SNIPER|AMMO_IGNORE_COVER

	accurate_range_min = 4
	accurate_range = 32
	effective_range_max = 0
	max_range = 32
	accuracy = HIT_ACCURACY_TIER_8
	scatter = SCATTER_AMOUNT_TIER_8
	shell_speed = AMMO_SPEED_TIER_7

/datum/ammo/bullet/rifle/heavy/flak/on_hit_mob(mob/M,obj/projectile/P)
	if((P.projectile_flags & PROJECTILE_BULLSEYE) && M == P.original)
		var/slow_duration = 7
		var/mob/living/L = M
		if(isxeno(M))
			var/mob/living/carbon/xenomorph/target = M
			if(target.mob_size >= MOB_SIZE_BIG)
				slow_duration = 4
		M.adjust_effect(slow_duration, SUPERSLOW)
		L.apply_armoured_damage(damage, ARMOR_BULLET, BRUTE, null, penetration)
		to_chat(P.firer, SPAN_WARNING("Bullseye!"))
	else
		burst(get_turf(M),P,damage_type, 2 , 2)
		burst(get_turf(M),P,damage_type, 1 , 2 , 0)

/datum/ammo/bullet/rifle/heavy/flak/on_near_target(turf/T, obj/projectile/P)
	burst(T,P,damage_type, 2 , 2)
	burst(T,P,damage_type, 1 , 2, 0)
	return 1

// Custom Specialist M49A rounds

/datum/ammo/bullet/rifle/heavy/spec
	name = "high velocity 10x28 bullet"
	shrapnel_chance = 0
	damage_falloff = 0
	flags_ammo_behavior = AMMO_BALLISTIC
	accurate_range_min = 4

	damage = 55
	scatter = -SCATTER_AMOUNT_TIER_8
	penetration= ARMOR_PENETRATION_TIER_7
	shell_speed = AMMO_SPEED_TIER_7

/datum/ammo/bullet/rifle/heavy/spec/incendiary
	name = "high velocity incendiary 10x28 bullet"
	flags_ammo_behavior = AMMO_BALLISTIC

	damage = 40
	accuracy = HIT_ACCURACY_TIER_4
	penetration= ARMOR_PENETRATION_TIER_5

/datum/ammo/bullet/rifle/heavy/spec/incendiary/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

/datum/ammo/bullet/rifle/heavy/spec/impact
	name = "high velocity impact 10x28 bullet"
	flags_ammo_behavior = AMMO_BALLISTIC

	damage = 40
	accuracy = -HIT_ACCURACY_TIER_2
	penetration = ARMOR_PENETRATION_TIER_10

/datum/ammo/bullet/rifle/heavy/spec/impact/on_hit_mob(mob/M, obj/projectile/P)
	knockback(M, P, 32) // Can knockback basically at max range max range is 24 tiles...

/datum/ammo/bullet/rifle/heavy/spec/impact/knockback_effects(mob/living/living_mob, obj/projectile/fired_projectile)
	if(iscarbonsizexeno(living_mob))
		var/mob/living/carbon/xenomorph/target = living_mob
		to_chat(target, SPAN_XENODANGER("You are shaken and slowed by the sudden impact!"))
		target.KnockDown(0.5) // purely for visual effect, noone actually cares
		target.Stun(0.5)
		target.apply_effect(2, SUPERSLOW)
		target.apply_effect(5, SLOW)
	else
		if(!isyautja(living_mob)) //Not predators.
			living_mob.apply_effect(1, SUPERSLOW)
			living_mob.apply_effect(2, SLOW)
			to_chat(living_mob, SPAN_HIGHDANGER("The impact knocks you off-balance!"))
		living_mob.apply_stamina_damage(fired_projectile.ammo.damage, fired_projectile.def_zone, ARMOR_BULLET)

/datum/ammo/bullet/rifle/heavy/iff/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff)
	))

//====== 10x27 Type 71

/datum/ammo/bullet/rifle/upp
	name = "10x27 bullet"
	headshot_state = HEADSHOT_OVERLAY_MEDIUM
	damage = 50
	penetration = ARMOR_PENETRATION_TIER_2
	accuracy = HIT_ACCURACY_TIER_3
	shell_speed = AMMO_SPEED_TIER_6
	effective_range_max = 10
	damage_falloff = DAMAGE_FALLOFF_TIER_7

/datum/ammo/bullet/rifle/upp/ap
	name = "armor-piercing 10x27 bullet"
	damage = 45
	penetration = ARMOR_PENETRATION_TIER_8

/datum/ammo/bullet/rifle/upp/heap
	name = "high-explosive armor-piercing 10x27 bullet"
	headshot_state = HEADSHOT_OVERLAY_HEAVY
	damage = 55
	penetration = ARMOR_PENETRATION_TIER_8
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_3

/datum/ammo/bullet/rifle/upp/heap/mg
	icon_state = "bullet_green"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_GREEN

//10X31 AK500
/datum/ammo/bullet/rifle/heavy/upp
	name = "10x31 bullet"

// Misc

/datum/ammo/bullet/rifle/mar40
	name = "8.8x29 rifle bullet"
	damage = 45
	shell_casing = /obj/effect/decal/ammo_casing/cartridge

/datum/ammo/bullet/rifle/m16
	name = "5.56x45 rifle bullet"
	damage = 35
	shell_casing = /obj/effect/decal/ammo_casing/cartridge

/datum/ammo/bullet/rifle/m16/ap
	name = "armor-piercing 5.56x45 rifle bullet"
	damage = 30
	penetration = ARMOR_PENETRATION_TIER_5

/datum/ammo/bullet/rifle/ar10
	name = "7.62x51 rifle bullet"
	damage = 55
	shell_casing = /obj/effect/decal/ammo_casing/cartridge

//9.7x16 AG80

/datum/ammo/bullet/rifle/ag80
	name = "9.7x16 bullet"
	damage = 35
	penetration = ARMOR_PENETRATION_TIER_2

/datum/ammo/bullet/rifle/ag80/tracer
	icon_state = "bullet_green"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_GREEN

/datum/ammo/bullet/rifle/ag80/ap
	name = "armor-piercing 9.7x16 bullet"
	damage = 35
	penetration = ARMOR_PENETRATION_TIER_9

/datum/ammo/bullet/rifle/ag80/ap/tracer
	icon_state = "bullet_green"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

/datum/ammo/bullet/rifle/ag80/heap
	name = "high-explosive armor-piercing 9.7x16 bullet"
	headshot_state = HEADSHOT_OVERLAY_HEAVY
	damage = 50 //big damage, doesn't actually blow up because thats stupid.
	penetration = ARMOR_PENETRATION_TIER_8
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_9

/datum/ammo/bullet/rifle/ag80/heap/tracer
	icon_state = "bullet_green"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_GREEN
