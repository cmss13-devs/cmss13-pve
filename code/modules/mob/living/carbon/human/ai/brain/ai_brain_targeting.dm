#define EXTRA_CHECK_DISTANCE_MULTIPLIER 0.20

/datum/human_ai_brain
	/// At how far out the AI can see cloaked enemies
	var/cloak_visible_range = 3
	/// Ref to the currently focused (and shooting at) target
	var/mob/living/current_target
	/// Last turf our target was seen at
	var/turf/target_turf
	/// Ref to the last turf that the AI shot at
	var/turf/shot_at
	/// If TRUE, the AI will throw grenades at enemies who enter cover
	var/grenading_allowed = TRUE
	/// If TRUE, we care about the target being in view after shooting at them. If not, then we only do a line check instead
	var/requires_vision = TRUE

	COOLDOWN_DECLARE(fire_offscreen)

/datum/human_ai_brain/proc/get_target()
	var/list/viable_targets = list()
	var/atom/movable/closest_target
	var/smallest_distance = INFINITY

	/// FOV dirs for if our target is out of base world.view range
	var/list/dir_cone = reverse_nearby_direction(reverse_direction(tied_human.dir))
	var/rear_view_penalty = scope_vision ? view_distance / 7 - 1 : 0

	for(var/mob/living/carbon/potential_target as anything in GLOB.alive_mob_list)
		if(!istype(potential_target))
			continue

		if(tied_human.z != potential_target.z)
			continue

		if(!can_target(potential_target))
			continue

		if(!(tied_human in viewers(view_distance, potential_target)))
			continue

		var/distance = get_dist(tied_human, potential_target)
		if(distance > view_distance)
			continue

		if(scope_vision && (distance > 7) && !(get_dir(tied_human, potential_target) in dir_cone))
			continue

		var/rear_view_check = scope_vision && (get_dir(tied_human, potential_target) in reverse_nearby_direction(tied_human.dir))
		if(rear_view_check && (distance > view_distance - rear_view_penalty))
			continue

		viable_targets += potential_target

		if(smallest_distance <= distance)
			continue

		closest_target = potential_target
		smallest_distance = distance

	for(var/obj/vehicle/multitile/potential_vehicle_target as anything in GLOB.all_multi_vehicles)
		if(tied_human.z != potential_vehicle_target.z) //todo: make this work
			continue

		if(!(tied_human in viewers(view_distance, potential_vehicle_target)))
			continue

		var/distance = get_dist(tied_human, potential_vehicle_target)

		// Vehicles are big and lousy, no need to consider our rear view penalty
		if(distance > view_distance)
			continue

		if(scope_vision && (distance > 7) && !(get_dir(tied_human, potential_vehicle_target) in dir_cone))
			continue

		if(potential_vehicle_target.health <= 0)
			continue

		if(potential_vehicle_target.vehicle_faction == tied_human.faction)
			continue

		viable_targets += potential_vehicle_target

		if(smallest_distance <= distance)
			continue

		closest_target = potential_vehicle_target
		smallest_distance = distance

	for(var/obj/structure/machinery/defenses/potential_defense_target as anything in GLOB.all_active_defenses)
		if(tied_human.z != potential_defense_target.z)
			continue

		if(!(tied_human in viewers(view_distance, potential_defense_target)))
			continue

		var/distance = get_dist(tied_human, potential_defense_target)

		// Let's just not rear check a loud ass CLANK CLANK CLANK servo sentry
		if(distance > view_distance)
			continue

		if(scope_vision && (distance > 7) && !(get_dir(tied_human, potential_defense_target) in dir_cone))
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

#undef EXTRA_CHECK_DISTANCE_MULTIPLIER
