GLOBAL_LIST_EMPTY(ai_hive_landmarks)

/obj/effect/landmark/ai_hive
	name = "Hive Landmark"
	var/hive_radius = 7

/obj/effect/landmark/ai_hive/New()
	. = ..()

	GLOB.ai_hive_landmarks += src
	new /obj/effect/alien/weeds/node(loc)

/obj/effect/landmark/ai_hive/Destroy()
	. = ..()
	GLOB.ai_hive_landmarks -= src
