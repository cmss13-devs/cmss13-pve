/datum/ai_action/fire_at_target
	name = "Fire At Target"
	action_flags = ACTION_USING_HANDS
	var/rounds_burst_fired = 0
	var/currently_firing

/datum/ai_action/fire_at_target/get_weight(datum/human_ai_brain/brain)
	if(!brain.in_combat)
		return 0

	if(brain.tried_reload)
		return 0

	if(!brain.primary_weapon)
		return 0

	var/turf/target_turf = brain.target_turf
	var/should_fire_offscreen = (target_turf && !COOLDOWN_FINISHED(brain, fire_offscreen))

	if(!brain.current_target && !should_fire_offscreen)
		return 0

	if((get_dist(brain.tied_human, target_turf) > brain.view_distance) && !should_fire_offscreen)
		return 0

	if(brain.should_reload())
		return 0

	return 10

/datum/ai_action/fire_at_target/Destroy(force, ...)
	stop_firing(brain)
	return ..()

/datum/ai_action/fire_at_target/proc/stop_firing(datum/human_ai_brain/brain)
	currently_firing = FALSE
	rounds_burst_fired = 0

	UnregisterSignal(brain.tied_human, COMSIG_MOB_FIRED_GUN)
	brain.primary_weapon?.set_target(null)

/datum/ai_action/fire_at_target/trigger_action()
	. = ..()

	var/obj/item/weapon/gun/primary_weapon = brain.primary_weapon
	if(!primary_weapon || brain.active_grenade_found)
		return ONGOING_ACTION_COMPLETED

	var/should_fire_offscreen = (brain.target_turf && !COOLDOWN_FINISHED(brain, fire_offscreen))
	if(!brain.current_target && !should_fire_offscreen)
		return ONGOING_ACTION_COMPLETED

	if(currently_firing || !COOLDOWN_FINISHED(brain, fire_overload_cooldown))
		return ONGOING_ACTION_UNFINISHED

	var/mob/living/carbon/tied_human = brain.tied_human
	if(!(primary_weapon in tied_human.get_hands()))
		brain.unholster_primary()

	var/datum/firearm_appraisal/gun_data = brain.gun_data
	gun_data.before_fire(primary_weapon, tied_human, brain)
	if(brain.should_reload())
		if(gun_data?.disposable)
			tied_human.drop_held_item(primary_weapon)
			brain.set_primary_weapon(null)
		return ONGOING_ACTION_COMPLETED

	var/turf/target_turf = brain.target_turf
	if((get_dist(tied_human, target_turf) > gun_data.maximum_range) && !should_fire_offscreen)
		return ONGOING_ACTION_COMPLETED

	if(!firing_line_check(brain, target_turf))
		return ONGOING_ACTION_UNFINISHED

	tied_human.face_atom(target_turf)
	tied_human.a_intent = INTENT_HARM

	RegisterSignal(tied_human, COMSIG_MOB_FIRED_GUN, PROC_REF(on_gun_fire), TRUE)

	primary_weapon?.set_target(target_turf)
	primary_weapon?.start_fire(object = target_turf, bypass_checks = TRUE)
	return ONGOING_ACTION_UNFINISHED

/datum/ai_action/fire_at_target/proc/firing_line_check(datum/human_ai_brain/brain, atom/target)
	var/mob/living/carbon/tied_human = brain.tied_human
	var/list/turf_list = get_line(get_turf(tied_human), get_turf(target))
	for(var/turf/tile in turf_list)
		if(get_dist(tied_human, tile) > brain.view_distance)
			continue

		if(tile.density)
			return FALSE

		for(var/mob/living/carbon/human/possible_friendly in tile)
			if(possible_friendly == tied_human)
				continue

			if(possible_friendly.body_position == LYING_DOWN)
				continue

			if(brain.faction_check(possible_friendly))
				return FALSE

	return TRUE

/datum/ai_action/fire_at_target/proc/on_gun_fire(datum/source, obj/item/weapon/gun/fired)
	SIGNAL_HANDLER

	if(!brain)
		qdel(src)
		return

	var/mob/living/current_target = brain.current_target
	var/turf/target_turf = brain.target_turf

	var/mob/living/carbon/tied_human = brain.tied_human
	tied_human.a_intent = INTENT_HARM

	brain.shot_at = get_turf(target_turf)
	tied_human.face_atom(target_turf)

	currently_firing = TRUE

	var/obj/item/weapon/gun/primary_weapon = brain.primary_weapon
	if(istype(primary_weapon, /obj/item/weapon/gun/shotgun/pump))
		currently_firing = FALSE
		var/obj/item/weapon/gun/shotgun/pump/shotgun = primary_weapon
		addtimer(CALLBACK(shotgun, TYPE_PROC_REF(/obj/item/weapon/gun/shotgun/pump, pump_shotgun), tied_human), shotgun.pump_delay)
		addtimer(CALLBACK(shotgun, TYPE_PROC_REF(/obj/item/weapon/gun/shotgun/pump, start_fire), null, current_target, null, null, null, TRUE), max(shotgun.pump_delay, shotgun.get_fire_delay()) + 1) // max with fire delay
/* Basira doesn't need cocking???
	else if(istype(primary_weapon, /obj/item/weapon/gun/boltaction))
		var/obj/item/weapon/gun/boltaction/bolt = primary_weapon
		currently_firing = FALSE
		addtimer(CALLBACK(bolt, TYPE_PROC_REF(/obj/item/weapon/gun/boltaction, unique_action), tied_human), 1)
		addtimer(CALLBACK(bolt, TYPE_PROC_REF(/obj/item/weapon/gun/boltaction, unique_action), tied_human), bolt.bolt_delay + 1)
		addtimer(CALLBACK(bolt, TYPE_PROC_REF(/obj/item/weapon/gun/boltaction, start_fire), null, current_target, null, null, null, TRUE), (bolt.bolt_delay * 2) + 1)
*/
	else if(primary_weapon.gun_firemode == GUN_FIREMODE_SEMIAUTO)
		currently_firing = FALSE
		addtimer(CALLBACK(primary_weapon, TYPE_PROC_REF(/obj/item/weapon/gun, start_fire), null, current_target, null, null, null, TRUE), primary_weapon.get_fire_delay())

	else if(primary_weapon.gun_firemode == GUN_FIREMODE_AUTOMATIC)
		rounds_burst_fired++

	var/datum/firearm_appraisal/gun_data = brain.gun_data
	if(brain.should_reload()) // note that bullet removal comes after comsig is triggered
		if(gun_data?.disposable)
			tied_human.drop_held_item(primary_weapon)
			brain.set_primary_weapon(null)
		qdel(src)
		return

	var/should_fire_offscreen = (target_turf && !COOLDOWN_FINISHED(brain, fire_offscreen))
	var/shoot_next = current_target

	if(QDELETED(current_target))
		if(!should_fire_offscreen)
			qdel(src)
			return
		shoot_next = target_turf

	else if(ismob(current_target))
		if(current_target.stat == DEAD)
			qdel(src)
			return

		var/is_unconscious = (current_target.stat == UNCONSCIOUS || (locate(/datum/effects/crit) in current_target.effects_list))
		if(!brain.shoot_to_kill && is_unconscious)
			brain.lose_target()
			qdel(src)
			return

	if(rounds_burst_fired >= gun_data.burst_amount_max)
		var/short_action_delay = brain.short_action_delay
		COOLDOWN_START(brain, fire_overload_cooldown, max(short_action_delay, short_action_delay * brain.action_delay_mult))
		stop_firing(brain)
		return

	if((get_dist(tied_human, shoot_next) > gun_data.maximum_range) && !should_fire_offscreen)
		qdel(src)
		return

	if(!firing_line_check(brain, shoot_next))
		stop_firing(brain)
		return

	primary_weapon?.set_target(shoot_next)
