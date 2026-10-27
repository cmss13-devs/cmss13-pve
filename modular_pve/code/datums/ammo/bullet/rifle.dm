/datum/ammo/bullet/rifle/heavy/tracer
	icon_state = "bullet_red"
	ammo_glowing = TRUE
	bullet_light_color = COLOR_SOFT_RED

	// RMC Smartgun

/datum/ammo/bullet/rifle/heavy/holo_target //Royal marines smartgun bullet, less damage, holo-target effect & range-limited knock/pushback
	name = "holo-targeting 10x28 bullet"
	damage = 40
	/// inflicts this many holo stacks per bullet hit
	var/holo_stacks = 25
	/// modifies the default cap limit of 100 by this amount
	var/bonus_damage_cap_increase = 300
	/// multiplies the default drain of 5 holo stacks per second by this amount
	var/stack_loss_multiplier = 2

/datum/ammo/bullet/rifle/heavy/holo_target/on_hit_mob(mob/hit_mob, obj/projectile/bullet)
	. = ..()
	hit_mob.AddComponent(/datum/component/bonus_damage_stack, holo_stacks, world.time, bonus_damage_cap_increase, stack_loss_multiplier)
	knockback(hit_mob, bullet, max_range = 2)
