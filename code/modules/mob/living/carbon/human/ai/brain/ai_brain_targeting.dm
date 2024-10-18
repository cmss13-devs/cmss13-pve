#define EXTRA_CHECK_DISTANCE_MULTIPLIER 0.20

/datum/human_ai_brain
	/// At how far out the AI can see cloaked enemies
	var/cloak_visible_range = 3
	/// Maximum range to consider a target
	var/ai_range = 7
	/// Ref to the currently focused (and shooting at) target
	var/mob/living/current_target
	/// Ref to the last turf that the AI shot at
	var/turf/open/target_floor
	/// If TRUE, the AI will throw grenades at enemies who enter cover
	var/grenading_allowed = TRUE
	/// List of overwatched turfs
	var/list/turf/open/overwatch_turfs = list()
	/// If TRUE, we care about the target being in view after shooting at them. If not, then we only do a line check instead
	var/requires_vision = TRUE

	var/allowed_return_fire = TRUE
	COOLDOWN_DECLARE(return_fire)

/datum/human_ai_brain/proc/get_target(range)
	var/list/viable_targets = list()
	var/atom/movable/closest_target
	var/smallest_distance = INFINITY

	for(var/mob/living/carbon/potential_target as anything in GLOB.alive_mob_list)
		if(!istype(potential_target))
			continue

		if(tied_human.z != potential_target.z)
			continue

		if(!can_target(potential_target))
			continue

		if(!(tied_human in viewers(potential_target))) // for now, only consider targets in view
			continue

		var/distance = get_dist(tied_human, potential_target)

		if(distance > ai_range)
			continue

		viable_targets += potential_target

		if(smallest_distance <= distance)
			continue

		closest_target = potential_target
		smallest_distance = distance

	for(var/obj/vehicle/multitile/potential_vehicle_target as anything in GLOB.all_multi_vehicles)
		if(tied_human.z != potential_vehicle_target.z)
			continue

		var/distance = get_dist(tied_human, potential_vehicle_target)

		if(distance > ai_range)
			continue

		if(potential_vehicle_target.health <= 0)
			continue

		if(potential_vehicle_target.vehicle_faction == tied_human.faction)
			continue

		/*var/skip_vehicle = FALSE
		var/list/interior_living_mobs = potential_vehicle_target.interior.get_passengers()
		for(var/mob/living/carbon/human/human_mob in interior_living_mobs)
			if(!can_target(human_mob))
				continue

			skip_vehicle = TRUE
			break

		if(skip_vehicle)
			continue*/

		viable_targets += potential_vehicle_target

		if(smallest_distance <= distance)
			continue

		closest_target = potential_vehicle_target
		smallest_distance = distance

	for(var/obj/structure/machinery/defenses/potential_defense_target as anything in GLOB.all_active_defenses)
		if(tied_human.z != potential_defense_target.z)
			continue

		var/distance = get_dist(tied_human, potential_defense_target)

		if(distance > ai_range)
			continue

		viable_targets += potential_defense_target

		if(smallest_distance <= distance)
			continue

		closest_target = potential_defense_target
		smallest_distance = distance

	var/extra_check_distance = round(smallest_distance * EXTRA_CHECK_DISTANCE_MULTIPLIER)

	if(extra_check_distance < 1)
		return closest_target

	var/list/extra_checked = orange(extra_check_distance, closest_target)

	var/list/final_targets = extra_checked & viable_targets

	return length(final_targets) ? pick(final_targets) : closest_target


/datum/human_ai_brain/proc/can_target(mob/living/carbon/target)
	if(!istype(target))
		return FALSE

	if(target.stat == DEAD)
		return FALSE

	if(!shoot_to_kill && (target.stat == UNCONSCIOUS || (locate(/datum/effects/crit) in target.effects_list)))
		return FALSE

	if(faction_check(target))
		return FALSE

	if(HAS_TRAIT(target, TRAIT_CLOAKED) && get_dist(tied_human, target) > cloak_visible_range)
		return FALSE

	return TRUE

/datum/human_ai_brain/proc/attack_target()
	set waitfor = FALSE

	if(!current_target)
		return

	currently_busy = TRUE

	if(!(primary_weapon in tied_human.get_hands()))
		unholster_primary()
		primary_weapon?.guaranteed_delay_time = world.time
		primary_weapon?.wield_time = world.time
		primary_weapon?.pull_time = world.time

	tied_human.face_atom(current_target)
	tied_human.a_intent = INTENT_HARM

	if((get_dist(tied_human, current_target) > gun_data.maximum_range) && COOLDOWN_FINISHED(src, return_fire))
		currently_busy = FALSE
		return

	primary_weapon?.set_target(current_target)
	gun_data.before_fire(primary_weapon, tied_human, src)
	if((!primary_weapon?.current_mag?.current_rounds && !primary_weapon?.in_chamber) || !friendly_check())
		end_gun_fire()
		return

	currently_firing = TRUE
	enter_combat()
	RegisterSignal(tied_human, COMSIG_MOB_FIRED_GUN, PROC_REF(on_gun_fire), TRUE)
	primary_weapon?.start_fire(object = current_target, bypass_checks = TRUE)

/datum/human_ai_brain/proc/friendly_check()
	var/list/turf_list = get_line(get_turf(tied_human), get_turf(current_target))
	for(var/turf/tile in turf_list)
		if(istype(tile, /turf/closed))
			return TRUE

		for(var/mob/living/carbon/human/possible_friendly in tile)
			if(tied_human == possible_friendly)
				continue

			if(possible_friendly.body_position == LYING_DOWN)
				continue

			if(faction_check(possible_friendly))
				return FALSE
	return TRUE

/datum/human_ai_brain/proc/on_gun_fire(datum/source, obj/item/weapon/gun/fired)
	SIGNAL_HANDLER

	if(QDELETED(current_target))
		end_gun_fire()
		current_target = null
		return

	if(ismob(current_target))
		if(current_target.stat == DEAD)
			end_gun_fire()
			current_target = null
			return

		else if(!shoot_to_kill && (current_target.stat == UNCONSCIOUS || (locate(/datum/effects/crit) in current_target.effects_list)))
			end_gun_fire()
			current_target = null
			return

	if(rounds_burst_fired > gun_data.burst_amount_max)
		COOLDOWN_START(src, fire_overload_cooldown, max(short_action_delay, short_action_delay * action_delay_mult))
		end_gun_fire()
		return

	if(!friendly_check())
		end_gun_fire()
		current_target = null
		return

	if(primary_weapon.current_mag?.current_rounds <= 0 && !primary_weapon.in_chamber) // bullet removal comes after comsig is triggered
		end_gun_fire()
		if(gun_data?.disposable)
			var/obj/item/gun = primary_weapon
			set_primary_weapon(null)
			tied_human.drop_held_item(gun)
		return

	if(requires_vision)
		if(!(current_target in viewers(view_distance, tied_human)))
			if(COOLDOWN_FINISHED(src, return_fire))
				end_gun_fire()
				current_target = null

			if(grenading_allowed && length(equipment_map[HUMAN_AI_GRENADES]))
				end_gun_fire()
				throw_grenade_cover()
				current_target = null
				return

			if(!current_cover && !length(ongoing_actions))
				ADD_ONGOING_ACTION(src, AI_ACTION_APPROACH_CAREFUL, target_floor, 0)

	else if(locate(/turf/closed) in get_line(tied_human, current_target))
		if(COOLDOWN_FINISHED(src, return_fire))
			end_gun_fire()
			current_target = null

		if(grenading_allowed && length(equipment_map[HUMAN_AI_GRENADES]))
			end_gun_fire()
			throw_grenade_cover()
			current_target = null
			return

	if(COOLDOWN_FINISHED(src, return_fire) && get_dist(tied_human, current_target) > gun_data.maximum_range)
		end_gun_fire()
		return

	if(istype(primary_weapon, /obj/item/weapon/gun/shotgun/pump))
		var/obj/item/weapon/gun/shotgun/pump/shotgun = primary_weapon
		addtimer(CALLBACK(shotgun, TYPE_PROC_REF(/obj/item/weapon/gun/shotgun/pump, pump_shotgun), tied_human), shotgun.pump_delay)
		addtimer(CALLBACK(shotgun, TYPE_PROC_REF(/obj/item/weapon/gun/shotgun/pump, start_fire), null, current_target, null, null, null, TRUE), max(shotgun.pump_delay, shotgun.get_fire_delay()) + 1) // max with fire delay

	else if(istype(primary_weapon, /obj/item/weapon/gun/boltaction))
		var/obj/item/weapon/gun/boltaction/bolt = primary_weapon
		addtimer(CALLBACK(bolt, TYPE_PROC_REF(/obj/item/weapon/gun/boltaction, unique_action), tied_human), 1)
		addtimer(CALLBACK(bolt, TYPE_PROC_REF(/obj/item/weapon/gun/boltaction, unique_action), tied_human), bolt.bolt_delay + 1)
		addtimer(CALLBACK(bolt, TYPE_PROC_REF(/obj/item/weapon/gun/boltaction, start_fire), null, current_target, null, null, null, TRUE), (bolt.bolt_delay * 2) + 1)

	else if(primary_weapon.gun_firemode == GUN_FIREMODE_AUTOMATIC)
		rounds_burst_fired++

	else if(primary_weapon.gun_firemode == GUN_FIREMODE_SEMIAUTO)
		addtimer(CALLBACK(primary_weapon, TYPE_PROC_REF(/obj/item/weapon/gun, start_fire), null, current_target, null, null, null, TRUE), primary_weapon.get_fire_delay())

	tied_human.a_intent = INTENT_HARM
	target_floor = get_turf(current_target)
	tied_human.face_atom(target_floor)

/datum/human_ai_brain/proc/end_gun_fire()
	primary_weapon?.set_target(null)
	if(current_target)
		UnregisterSignal(current_target, COMSIG_PARENT_QDELETING)
	UnregisterSignal(tied_human, COMSIG_MOB_FIRED_GUN)
	currently_busy = FALSE
	currently_firing = FALSE
	rounds_burst_fired = 0

/datum/human_ai_brain/proc/throw_grenade_cover()
	if(!target_floor || has_ongoing_action(AI_ACTION_NADE))
		return

	var/obj/item/explosive/grenade/nade = locate() in equipment_map[HUMAN_AI_GRENADES]
	if(!nade)
		return

	ADD_ONGOING_ACTION(src, AI_ACTION_NADE, nade, target_floor)

#undef EXTRA_CHECK_DISTANCE_MULTIPLIER
