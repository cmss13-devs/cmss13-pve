SUBSYSTEM_DEF(mapping)
	name = "Mapping"
	init_order = SS_INIT_MAPPING
	flags = SS_NO_FIRE

	var/list/datum/map_config/configs
	var/list/datum/map_config/next_map_configs

	///Name of all maps
	var/list/map_templates = list()
	///Name of all shuttles
	var/list/shuttle_templates = list()
	var/list/all_shuttle_templates = list()
	///map_id of all tents
	var/list/tent_type_templates = list()

	var/list/areas_in_z = list()

	/// Used to maintain the plane cube
	var/list/z_level_to_plane_offset = list()
	/// List of z level (as number) -> list of all z levels vertically connected to ours
	/// Useful for fast grouping lookups and such
	var/list/z_level_to_stack = list()
	/// List of z level (as number) -> The lowest plane offset in that z stack
	var/list/z_level_to_lowest_plane_offset = list()
	// This pair allows for easy conversion between an offset plane, and its true representation
	// Both are in the form "input plane" -> output plane(s)
	/// Assoc list of string plane values to their true, non offset representation
	var/list/plane_offset_to_true
	/// Assoc list of true string plane values to a list of all potential offset planess
	var/list/true_to_offset_planes
	/// Assoc list of string plane to the plane's offset value
	var/list/plane_to_offset
	/// List of planes that do not allow for offsetting
	var/list/plane_offset_blacklist
	/// List of render targets that do not allow for offsetting
	var/list/render_offset_blacklist
	/// List of plane masters that are of critical priority
	var/list/critical_planes
	/// The largest plane offset we've generated so far
	var/max_plane_offset = 0

	var/list/turf/unused_turfs = list() //Not actually unused turfs they're unused but reserved for use for whatever requests them. "[zlevel_of_turf]" = list(turfs)
	var/list/datum/turf_reservations //list of turf reservations
	var/list/used_turfs = list() //list of turf = datum/turf_reservation

	var/list/reservation_ready = list()
	var/clearing_reserved_turfs = FALSE

	// Z-manager stuff
	var/ground_start  // should only be used for maploading-related tasks
	var/list/z_list
	var/datum/space_level/transit
	var/num_of_res_levels = 1

//dlete dis once #39770 is resolved
/datum/controller/subsystem/mapping/proc/HACK_LoadMapConfig()
	if(!configs)
		configs = load_map_configs(ALL_MAPTYPES, error_if_missing = FALSE)
		world.name = "[CONFIG_GET(string/title)] - [SSmapping.configs[SHIP_MAP].map_name]"

/datum/controller/subsystem/mapping/Initialize(timeofday)
	HACK_LoadMapConfig()
	if(initialized)
		return SS_INIT_SUCCESS

	for(var/i in ALL_MAPTYPES)
		var/datum/map_config/MC = configs[i]
		if(MC.defaulted)
			var/old_config = configs[i]
			configs[i] = global.config.defaultmaps[i]
			if(!configs || configs[i].defaulted)
				to_chat(world, SPAN_BOLDANNOUNCE("Unable to load next or default map config, defaulting."))
				configs[i] = old_config

	loadWorld()
	repopulate_sorted_areas()
	preloadTemplates()
	// Add the transit level
	transit = add_new_zlevel("Transit/Reserved", list(ZTRAIT_RESERVED = TRUE))
	initialize_reserved_level(transit.z_value)
	repopulate_sorted_areas()
	for(var/maptype as anything in configs)
		var/datum/map_config/MC = configs[maptype]
		if(MC.perf_mode)
			GLOB.perf_flags |= MC.perf_mode

	return SS_INIT_SUCCESS

/datum/controller/subsystem/mapping/proc/wipe_reservations(wipe_safety_delay = 100)
	if(clearing_reserved_turfs || !initialized) //in either case this is just not needed.
		return
	clearing_reserved_turfs = TRUE
	message_admins("Clearing dynamic reservation space.")
	do_wipe_turf_reservations()
	clearing_reserved_turfs = FALSE

/datum/controller/subsystem/mapping/proc/get_reservation_from_turf(turf/T)
	RETURN_TYPE(/datum/turf_reservation)
	return used_turfs[T]

/datum/controller/subsystem/mapping/Recover()
	flags |= SS_NO_INIT
	initialized = SSmapping.initialized
	map_templates = SSmapping.map_templates
	unused_turfs = SSmapping.unused_turfs
	turf_reservations = SSmapping.turf_reservations
	used_turfs = SSmapping.used_turfs

	configs = SSmapping.configs
	next_map_configs = SSmapping.next_map_configs

	clearing_reserved_turfs = SSmapping.clearing_reserved_turfs

	z_list = SSmapping.z_list

#define INIT_ANNOUNCE(X) to_chat(world, "<span class='notice'>[X]</span>"); log_world(X)
/datum/controller/subsystem/mapping/proc/LoadGroup(list/errorList, name, path, files, list/traits, list/default_traits, silent = FALSE, override_map_path = "maps/")
	. = list()
	var/start_time = REALTIMEOFDAY

	if (!islist(files))  // handle single-level maps
		files = list(files)

	// check that the total z count of all maps matches the list of traits
	var/total_z = 0
	var/list/parsed_maps = list()
	for (var/file in files)
		var/full_path = "[override_map_path]/[path]/[file]"
		var/datum/parsed_map/pm = new(file(full_path))
		var/bounds = pm?.bounds
		if (!bounds)
			errorList |= full_path
			continue
		parsed_maps[pm] = total_z  // save the start Z of this file
		total_z += bounds[MAP_MAXZ] - bounds[MAP_MINZ] + 1

	if (!length(traits))  // null or empty - default
		for (var/i in 1 to total_z)
			traits += list(default_traits)
	else if (total_z != traits.len)  // mismatch
		INIT_ANNOUNCE("WARNING: [traits.len] trait sets specified for [total_z] z-levels in [path]!")
		if (total_z < traits.len)  // ignore extra traits
			traits.Cut(total_z + 1)
		while (total_z > traits.len)  // fall back to defaults on extra levels
			traits += list(default_traits)

	// preload the relevant space_level datums
	var/start_z = world.maxz + 1
	var/i = 0
	for (var/level in traits)
		add_new_zlevel("[name][i ? " [i + 1]" : ""]", level)
		++i

	// load the maps
	for (var/datum/parsed_map/pm as anything in parsed_maps)
		var/cur_z = start_z + parsed_maps[pm]
		if (!pm.load(1, 1, cur_z, no_changeturf = TRUE))
			errorList |= pm.original_path
		if(istype(z_list[cur_z], /datum/space_level))
			var/datum/space_level/cur_level = z_list[cur_z]
			cur_level.x_bounds = pm.bounds[MAP_MAXX]
			cur_level.y_bounds = pm.bounds[MAP_MAXY]
	if(!silent)
		INIT_ANNOUNCE("Loaded [name] in [(REALTIMEOFDAY - start_time)/10]s!")
	return parsed_maps

/datum/controller/subsystem/mapping/proc/Loadship(list/errorList, name, path, files, list/traits, list/default_traits, silent = FALSE, override_map_path = "maps/")
	LoadGroup(errorList, name, path, files, traits, default_traits, silent, override_map_path = override_map_path)

/datum/controller/subsystem/mapping/proc/Loadground(list/errorList, name, path, files, list/traits, list/default_traits, silent = FALSE, override_map_path = "maps/")
	LoadGroup(errorList, name, path, files, traits, default_traits, silent, override_map_path = override_map_path)

/datum/controller/subsystem/mapping/proc/loadWorld()
	//if any of these fail, something has gone horribly, HORRIBLY, wrong
	var/list/FailedZs = list()

	// ensure we have space_level datums for compiled-in maps
	InitializeDefaultZLevels()

	// load the ground level
	ground_start = world.maxz + 1

	var/datum/map_config/ground_map = configs[GROUND_MAP]
	INIT_ANNOUNCE("Loading [ground_map.map_name]...")
	var/ground_base_path = "maps/"
	if(ground_map.override_map)
		ground_base_path = "data/"
	Loadground(FailedZs, ground_map.map_name, ground_map.map_path, ground_map.map_file, ground_map.traits, ZTRAITS_GROUND, override_map_path = ground_base_path)

	if(!ground_map.disable_ship_map)
		var/datum/map_config/ship_map = configs[SHIP_MAP]
		var/ship_base_path = "maps/"
		if(ship_map.override_map)
			ship_base_path = "data/"
		INIT_ANNOUNCE("Loading [ship_map.map_name]...")
		Loadship(FailedZs, ship_map.map_name, ship_map.map_path, ship_map.map_file, ship_map.traits, ZTRAITS_MAIN_SHIP, override_map_path = ship_base_path)

	if(LAZYLEN(FailedZs)) //but seriously, unless the server's filesystem is messed up this will never happen
		var/msg = "RED ALERT! The following map files failed to load: [FailedZs[1]]"
		if(FailedZs.len > 1)
			for(var/I in 2 to FailedZs.len)
				msg += ", [FailedZs[I]]"
		msg += ". Yell at your server host!"
		INIT_ANNOUNCE(msg)
#undef INIT_ANNOUNCE

/datum/controller/subsystem/mapping/proc/changemap(datum/map_config/VM, maptype = GROUND_MAP)
	LAZYINITLIST(next_map_configs)
	if(maptype == GROUND_MAP)
		if(!VM.MakeNextMap(maptype))
			next_map_configs[GROUND_MAP] = load_map_configs(list(maptype), default = TRUE)
			message_admins("Failed to set new map with next_map.json for [VM.map_name]! Using default as backup!")
			return

		next_map_configs[GROUND_MAP] = VM
		return TRUE

	else if(maptype == SHIP_MAP)
		if(!VM.MakeNextMap(maptype))
			next_map_configs[SHIP_MAP] = load_map_configs(list(maptype), default = TRUE)
			message_admins("Failed to set new map with next_map.json for [VM.map_name]! Using default as backup!")
			return

		next_map_configs[SHIP_MAP] = VM
		return TRUE

/datum/controller/subsystem/mapping/proc/preloadTemplates(path = "maps/templates/") //see master controller setup
	var/list/filelist = flist(path)
	for(var/map in filelist)
		var/datum/map_template/T = new(path = "[path][map]", rename = "[map]")
		map_templates[T.name] = T

	preloadShuttleTemplates()
	preload_tent_templates()

/proc/generateMapList(filename)
	. = list()
	var/list/Lines = file2list(filename)

	if(!Lines.len)
		return
	for (var/t in Lines)
		if (!t)
			continue

		t = trim(t)
		if (length(t) == 0)
			continue
		else if (t[1] == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null

		if (pos)
			name = lowertext(copytext(t, 1, pos))

		else
			name = lowertext(t)

		if (!name)
			continue

		. += t

/datum/controller/subsystem/mapping/proc/preloadShuttleTemplates()
	for(var/item in subtypesof(/datum/map_template/shuttle))
		var/datum/map_template/shuttle/shuttle_type = item

		var/datum/map_template/shuttle/S = new shuttle_type()

		shuttle_templates[S.shuttle_id] = S
		all_shuttle_templates[item] = S
		map_templates[S.shuttle_id] = S

/datum/controller/subsystem/mapping/proc/preload_tent_templates()
	for(var/template in subtypesof(/datum/map_template/tent))
		var/datum/map_template/tent/new_tent = new template()
		tent_type_templates[new_tent.map_id] = new_tent

/datum/controller/subsystem/mapping/proc/RequestBlockReservation(width, height, z, type = /datum/turf_reservation, turf_type_override)
	UNTIL(initialized && !clearing_reserved_turfs)
	var/datum/turf_reservation/reserve = new type
	if(turf_type_override)
		reserve.turf_type = turf_type_override
	if(!z)
		for(var/i in levels_by_trait(ZTRAIT_RESERVED))
			if(reserve.reserve(width, height, z_reservation = i))
				return reserve
		//If we didn't return at this point, theres a good chance we ran out of room on the exisiting reserved z levels, so lets try a new one
		log_debug("Ran out of space in existing transit levels, adding a new one")
		num_of_res_levels++
		var/datum/space_level/newReserved = add_new_zlevel("Transit/Reserved [num_of_res_levels]", list(ZTRAIT_RESERVED = TRUE))
		initialize_reserved_level(newReserved.z_value)
		for(var/i in levels_by_trait(ZTRAIT_RESERVED))
			if(reserve.reserve(width, height, z_reservation = i))
				return reserve
		CRASH("Despite adding a fresh reserved zlevel still failed to get a reservation")
	else
		if(!level_trait(z, ZTRAIT_RESERVED))
			log_debug("Cannot block reserve on a non-ZTRAIT_RESERVED level")
			qdel(reserve)
			return
		else
			if(reserve.reserve(width, height, z_reservation = z))
				return reserve
	log_debug("unknown reservation failure")
	QDEL_NULL(reserve)

//This is not for wiping reserved levels, use wipe_reservations() for that.
/datum/controller/subsystem/mapping/proc/initialize_reserved_level(z)
	UNTIL(!clearing_reserved_turfs) //regardless, lets add a check just in case.
	clearing_reserved_turfs = TRUE //This operation will likely clear any existing reservations, so lets make sure nothing tries to make one while we're doing it.
	if(!level_trait(z,ZTRAIT_RESERVED))
		clearing_reserved_turfs = FALSE
		CRASH("Invalid z level prepared for reservations.")
	var/turf/A = get_turf(locate(8,8,z))
	var/turf/B = get_turf(locate(world.maxx - 8,world.maxy - 8,z))
	var/block = block(A, B)
	for(var/t in block)
		// No need to empty() these, because it's world init and they're
		// already /turf/open/space/basic.
		var/turf/T = t
		T.flags_turf |= UNUSED_RESERVATION_TURF
	unused_turfs["[z]"] = block
	reservation_ready["[z]"] = TRUE
	clearing_reserved_turfs = FALSE

/datum/controller/subsystem/mapping/proc/reserve_turfs(list/turfs)
	for(var/i in turfs)
		var/turf/T = i
		T.empty(RESERVED_TURF_TYPE, RESERVED_TURF_TYPE, null, TRUE)
		LAZYINITLIST(unused_turfs["[T.z]"])
		unused_turfs["[T.z]"] |= T
		T.flags_turf |= UNUSED_RESERVATION_TURF
		GLOB.areas_by_type[world.area].contents += T
		CHECK_TICK

//DO NOT CALL THIS PROC DIRECTLY, CALL wipe_reservations().
/datum/controller/subsystem/mapping/proc/do_wipe_turf_reservations()
	UNTIL(initialized) //This proc is for AFTER init, before init turf reservations won't even exist and using this will likely break things.
	for(var/i in turf_reservations)
		var/datum/turf_reservation/TR = i
		if(!QDELETED(TR))
			qdel(TR, TRUE)
	UNSETEMPTY(turf_reservations)
	var/list/clearing = list()
	for(var/l in unused_turfs) //unused_turfs is a assoc list by z = list(turfs)
		if(islist(unused_turfs[l]))
			clearing |= unused_turfs[l]
	clearing |= used_turfs //used turfs is an associative list, BUT, reserve_turfs() can still handle it. If the code above works properly, this won't even be needed as the turfs would be freed already.
	unused_turfs.Cut()
	used_turfs.Cut()
	reserve_turfs(clearing)

/datum/controller/subsystem/mapping/proc/reg_in_areas_in_z(list/areas)
	for(var/B in areas)
		var/area/A = B
		A.reg_in_areas_in_z()

/// Gets a name for the marine ship as per the enabled ship map configuration
/datum/controller/subsystem/mapping/proc/get_main_ship_name()
	if(!configs)
		return MAIN_SHIP_DEFAULT_NAME
	var/datum/map_config/MC = configs[SHIP_MAP]
	if(!MC)
		return MAIN_SHIP_DEFAULT_NAME
	return MC.map_name

/// Takes a z level datum, and tells the mapping subsystem to manage it
/// Also handles things like plane offset generation, and other things that happen on a z level to z level basis
/datum/controller/subsystem/mapping/proc/manage_z_level(datum/space_level/new_z, filled_with_space, contain_turfs = TRUE)
	// First, add the z
	z_list += new_z

	// Then we build our lookup lists
	var/z_value = new_z.z_value
	// We are guarenteed that we'll always grow bottom up
	z_level_to_plane_offset.len += 1
	z_level_to_lowest_plane_offset.len += 1
	z_level_to_stack.len += 1
	// Bare minimum we have ourselves
	z_level_to_stack[z_value] = list(z_value)
	// 0's the default value, we'll update it later if required
	z_level_to_plane_offset[z_value] = 0
	z_level_to_lowest_plane_offset[z_value] = 0

	// Now we check if this plane is offset or not
	var/below_offset = new_z.traits[ZTRAIT_DOWN]
	if(below_offset)
		update_plane_tracking(new_z)

	if(contain_turfs)
		build_area_turfs(z_value, filled_with_space)

	// And finally, misc global generation

	// We'll have to update this if offsets change, because we load lowest z to highest z
	generate_lighting_appearance_by_z(z_value)

/datum/controller/subsystem/mapping/proc/build_area_turfs(z_level, space_guaranteed)
	// If we know this is filled with default tiles, we can use the default area
	// Faster
	if(space_guaranteed)
		var/area/global_area = GLOB.areas_by_type[world.area]
		global_area.contained_turfs += Z_TURFS(z_level)
		return

	for(var/turf/to_contain as anything in Z_TURFS(z_level))
		var/area/our_area = to_contain.loc
		our_area.contained_turfs += to_contain

/datum/controller/subsystem/mapping/proc/update_plane_tracking(datum/space_level/update_with)
	// We're essentially going to walk down the stack of connected z levels, and set their plane offset as we go
	var/plane_offset = 0
	var/datum/space_level/current_z = update_with
	var/list/datum/space_level/levels_checked = list()
	var/list/z_stack = list()
	while(TRUE)
		var/z_level = current_z.z_value
		z_stack += z_level
		z_level_to_plane_offset[z_level] = plane_offset
		levels_checked += current_z
		if(!current_z.traits[ZTRAIT_DOWN]) // If there's nothing below, stop looking
			break
		// Otherwise, down down down we go
		current_z = z_list[z_level - 1]
		plane_offset += 1

	/// Updates the lowest offset value
	for(var/datum/space_level/level_to_update in levels_checked)
		z_level_to_lowest_plane_offset[level_to_update.z_value] = plane_offset
		z_level_to_stack[level_to_update.z_value] = z_stack

	// This can be affected by offsets, so we need to update it
	// PAIN
	for(var/i in 1 to length(z_list))
		generate_lighting_appearance_by_z(i)

	var/old_max = max_plane_offset
	max_plane_offset = max(max_plane_offset, plane_offset)
	if(max_plane_offset == old_max)
		return

	create_plane_offsets(old_max + 1, max_plane_offset)
	SEND_SIGNAL(src, COMSIG_PLANE_OFFSET_INCREASE, old_max, max_plane_offset)
	// Sanity check
	if(max_plane_offset > MAX_EXPECTED_Z_DEPTH)
		stack_trace("We've loaded a map deeper then the max expected z depth. Preferences won't cover visually disabling all of it!")

/datum/controller/subsystem/mapping/proc/create_plane_offsets(gen_from, new_offset)
	for(var/plane_offset in gen_from to new_offset)
		for(var/atom/movable/screen/plane_master/master_type as anything in subtypesof(/atom/movable/screen/plane_master) - /atom/movable/screen/plane_master/rendering_plate)
			var/plane_to_use = initial(master_type.plane)
			var/string_real = "[plane_to_use]"

			var/offset_plane = GET_NEW_PLANE(plane_to_use, plane_offset)
			var/string_plane = "[offset_plane]"

			if(!initial(master_type.allows_offsetting))
				plane_offset_blacklist[string_plane] = TRUE
				var/render_target = initial(master_type.render_target)
				if(!render_target)
					render_target = get_plane_master_render_base(initial(master_type.name))
				render_offset_blacklist[render_target] = TRUE
				if(plane_offset != 0)
					continue

			if(initial(master_type.critical) & PLANE_CRITICAL_DISPLAY)
				critical_planes[string_plane] = TRUE

			plane_offset_to_true[string_plane] = plane_to_use
			plane_to_offset[string_plane] = plane_offset

			if(!true_to_offset_planes[string_real])
				true_to_offset_planes[string_real] = list()

			true_to_offset_planes[string_real] |= offset_plane

/// Takes a turf or a z level, and returns a list of all the z levels that are connected to it
/datum/controller/subsystem/mapping/proc/get_connected_levels(turf/connected)
	var/z_level = connected
	if(isturf(z_level))
		z_level = connected.z
	return z_level_to_stack[z_level]

/proc/generate_lighting_appearance_by_z(z_level)
	if(length(GLOB.default_lighting_underlays_by_z) < z_level)
		GLOB.default_lighting_underlays_by_z.len = z_level
	GLOB.default_lighting_underlays_by_z[z_level] = mutable_appearance(LIGHTING_ICON, "transparent", z_level * 0.01, null, LIGHTING_PLANE, 255, RESET_COLOR | RESET_ALPHA | RESET_TRANSFORM, offset_const = GET_Z_PLANE_OFFSET(z_level))
