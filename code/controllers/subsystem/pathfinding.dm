SUBSYSTEM_DEF(xeno_pathfinding)
	name = "Xeno Pathfinding"
	priority = SS_PRIORITY_XENO_PATHFINDING
	flags = SS_NO_INIT|SS_TICKER|SS_BACKGROUND
	wait = 1
	/// A list of path_agents scheduled to process
	var/list/current_processing = list()
	/// A list of path_agents to calculate
	var/list/paths_to_calculate = list()
	/// Assoc list of path_agents for xenos, in the form of: xeno = path_agent
	var/list/agent_lookup = list()
	var/current_position = 1

	/// Assoc list of paths for goals, in the form of: goal = path_search
	var/list/path_lookup = list()

/datum/controller/subsystem/xeno_pathfinding/stat_entry(msg)
	msg = "P:[length(paths_to_calculate)]"
	return ..()

/datum/controller/subsystem/xeno_pathfinding/fire(resumed = FALSE)
	if(!resumed)
		current_processing = paths_to_calculate.Copy()
		path_lookup.Cut()

	while(length(current_processing))
		// A* Pathfinding. Uses priority queue
		if(current_position < 1 || current_position > length(current_processing))
			current_position = length(current_processing)

		var/datum/path_agent/current_run = current_processing[current_position]
		current_position++

		var/datum/path_search/current_path = path_lookup[current_run.goal]
		if(!current_path)
			current_path = new(current_run.goal)
			path_lookup[current_run.goal] = current_path

		var/turf/target = current_run.origin

		var/mob/living/carbon/xenomorph/X = current_run.agent

		var/list/visited_nodes = current_path.visited_nodes
		var/list/distances = current_path.distances
		var/list/f_distances = current_path.f_distances
		var/list/prev = current_path.prev

		while(length(visited_nodes))
			current_path.current_node = visited_nodes[visited_nodes.len]
			visited_nodes.len--
			if(current_path.current_node == target)
				break

			for(var/direction in cardinal)
				var/turf/neighbor = get_step(current_path.current_node, direction)
				var/distance_between = distances[current_path.current_node] * DISTANCE_PENALTY
				if(isnull(distances[neighbor]))
					if(get_dist(neighbor, X) > current_run.path_range)
						continue
					distances[neighbor] = INFINITY
					f_distances[neighbor] = INFINITY

				if(direction != get_dir(prev[neighbor], neighbor))
					distance_between += DIRECTION_CHANGE_PENALTY

				if(!neighbor.weeds)
					distance_between += NO_WEED_PENALTY

				for(var/i in neighbor)
					var/atom/A = i
					distance_between += A.object_weight

				var/list/L = LinkBlocked(X, current_path.current_node, neighbor, current_run.ignore, TRUE)
				L += check_special_blockers(X, neighbor)
				if(length(L))
					for(var/i in L)
						var/atom/A = i
						distance_between += A.xeno_ai_obstacle(X, direction, target)

				if(distance_between < distances[neighbor])
					distances[neighbor] = distance_between
					var/f_distance = distance_between + ASTAR_COST_FUNCTION(neighbor)
					f_distances[neighbor] = f_distance
					prev[neighbor] = current_path.current_node
					if(neighbor in visited_nodes)
						visited_nodes -= neighbor

					for(var/i in 0 to length(visited_nodes))
						var/index_to_check = length(visited_nodes) - i
						if(index_to_check == 0)
							visited_nodes.Insert(1, neighbor)
							break

						if(f_distance < f_distances[visited_nodes[index_to_check]])
							visited_nodes.Insert(index_to_check, neighbor)
							break

			if(MC_TICK_CHECK)
				return

		#ifdef TESTING
		for(var/i in distances)
			var/turf/T = i
			var/distance = distances[i]
			if(distance == INFINITY)
				T.color = "#000000"
				for(var/l in T)
					var/atom/A = l
					A.color = "#000000"
				continue

			var/red = num2hex(min(distance*10, 255), 2)
			var/green = num2hex(max(255-distance*10, 0), 2)

			for(var/l in T)
				var/atom/A = l
				A.color = "#[red][green]00"
			T.color = "#[red][green]00"
			T.maptext = distance
		#endif

		if(!prev[target])
			current_run.to_return.Invoke()
			QDEL_NULL(current_run)
			return

		var/list/path = list()
		var/turf/current_node = target
		while(current_node)
			path.Insert(1, current_node)
			if(current_node == current_run.goal)
				break
			current_node = prev[current_node]

		current_run.to_return.Invoke(path)
		QDEL_NULL(current_run)

/datum/controller/subsystem/xeno_pathfinding/proc/check_special_blockers(mob/living/carbon/xenomorph/xeno, turf/checking_turf)
	var/list/pass_back = list()

	for(var/spec_blocker in XENO_AI_SPECIAL_BLOCKERS)
		pass_back += istype(checking_turf, spec_blocker) ? checking_turf : list()

		for(var/atom/checked_atom as anything in checking_turf)
			pass_back += istype(checked_atom, spec_blocker) ? checked_atom : list()

	return pass_back

/datum/controller/subsystem/xeno_pathfinding/proc/stop_calculating_path(mob/living/carbon/xenomorph/X)
	var/datum/path_agent/data = agent_lookup[X]
	qdel(data)

/datum/controller/subsystem/xeno_pathfinding/proc/calculate_path(atom/origin, atom/goal, path_range, mob/living/carbon/xenomorph/travelling_xeno, datum/callback/CB, list/ignore)
	if(!get_turf(origin) || !get_turf(goal))
		return

	var/datum/path_agent/data = agent_lookup[travelling_xeno]
	SSxeno_pathfinding.current_processing -= data

	if(!data)
		data = new()
		data.RegisterSignal(travelling_xeno, COMSIG_PARENT_QDELETING, TYPE_PROC_REF(/datum/path_agent, qdel_wrapper))

		agent_lookup[travelling_xeno] = data
		paths_to_calculate += data

	data.agent = travelling_xeno
	data.origin = get_turf(origin)
	data.goal = get_turf(goal)
	data.to_return = CB
	data.path_range = path_range
	//data.ignore = ignore

/datum/path_agent
	var/atom/movable/agent
	var/turf/origin
	var/turf/goal
	var/datum/callback/to_return
	var/path_range
	var/list/ignore

/datum/path_agent/proc/qdel_wrapper()
	SIGNAL_HANDLER
	qdel(src)

/datum/path_agent/Destroy(force)
	SSxeno_pathfinding.agent_lookup -= agent
	SSxeno_pathfinding.paths_to_calculate -= src
	SSxeno_pathfinding.current_processing -= src

	agent = null
	origin = null
	goal = null
	to_return = null
	ignore = null

	return ..()

/datum/path_search
	var/turf/goal
	var/turf/current_node
	var/list/visited_nodes
	var/list/distances
	var/list/f_distances
	var/list/prev

/datum/path_search/New(turf/goal)
	. = ..()
	src.goal = get_turf(goal)
	current_node = src.goal

	distances = list()
	distances[current_node] = 0
	f_distances = list()
	f_distances[current_node] = 0
	visited_nodes = list(current_node)
	prev = list()

/datum/path_search/Destroy(force)
	SSxeno_pathfinding.path_lookup -= goal

	#ifdef TESTING
	addtimer(CALLBACK(src, PROC_REF(clear_colors), distances), 5 SECONDS)
	#endif

	goal = null
	current_node = null
	visited_nodes = null
	distances = null
	f_distances = null
	prev = null

	return ..()

#ifdef TESTING
/datum/path_search/proc/clear_colors(list/L)
	for(var/i in L)
		var/turf/T = i
		for(var/l in T)
			var/atom/A = l
			A.color = null
		T.color = null
		T.maptext = null
#endif
