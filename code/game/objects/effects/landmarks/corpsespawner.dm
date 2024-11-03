///////////////////// LANDMARK CORPSE ///////


//These are meant for spawning on maps, namely Away Missions.

/obj/effect/landmark/corpsespawner
	name = "Unknown"
	icon_state = "corpse_spawner"
	var/equip_path = null

/obj/effect/landmark/corpsespawner/Initialize(mapload, ...)
	. = ..()
	GLOB.corpse_spawns += src

/obj/effect/landmark/corpsespawner/Destroy()
	GLOB.corpse_spawns -= src
	return ..()

//FORECON

/obj/effect/landmark/corpsespawner/forecon_spotter
	name = "USCM Reconnaissance Spotter"
	equip_path = /datum/equipment_preset/corpse/forecon_spotter
