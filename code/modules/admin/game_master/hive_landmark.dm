/obj/effect/landmark/ai_hive
	name = "Hive Landmark"
	var/hive_radius = 7

/obj/effect/landmark/ai_hive/New()
	. = ..()

	new /obj/effect/alien/weeds/node(loc)
