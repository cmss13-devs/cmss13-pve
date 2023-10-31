
// Just try not to think about this too much.


GLOBAL_LIST_EMPTY(ai_hives)

/datum/component/ai_behavior_override/hive
	behavior_icon_state = "core"

	var/hive_radius = 7

/datum/component/ai_behavior_override/hive/Initialize(...)
	. = ..()

	if(!istype(parent, /turf/open))
		return COMPONENT_INCOMPATIBLE

	GLOB.ai_hives += src
	new /obj/effect/alien/weeds/node(get_turf(parent))

/datum/component/ai_behavior_override/hive/Destroy(force, silent, ...)
	GLOB.ai_hives -= src

	. = ..()
