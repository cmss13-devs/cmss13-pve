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

/obj/effect/landmark/corpsespawner/bluecollar
	name = "Corpse - Blue-Collar"
	equip_path = /datum/equipment_preset/corpse/bluecollar

/obj/effect/landmark/corpsespawner/whitecollar
	name = "Corpse - White-Collar"
	equip_path = /datum/equipment_preset/corpse/whitecollar

/obj/effect/landmark/corpsespawner/guard
	name = "Corpse - Security Guard, Prison"
	equip_path = /datum/equipment_preset/corpse/guard

/obj/effect/landmark/corpsespawner/prisoner
	name = "Corpse - Prisoner"
	equip_path = /datum/equipment_preset/corpse/prisoner

/obj/effect/landmark/corpsespawner/riot
	name = "Corpse - Security Guard, UA Colonial Guard"
	equip_path = /datum/equipment_preset/corpse/riot

/obj/effect/landmark/corpsespawner/doctor
	name = "Corpse - Doctor"
	equip_path = /datum/equipment_preset/corpse/doctor

/obj/effect/landmark/corpsespawner/scrubs
	name = "Corpse - Doctor, Scrubs"
	equip_path = /datum/equipment_preset/corpse/doctor/scrubs

/obj/effect/landmark/corpsespawner/security
	name = "Corpse - Security Guard, Wey-Yu"
	equip_path = /datum/equipment_preset/colonist/corpse/security

//FORECON
/obj/effect/landmark/corpsespawner/forecon_spotter
	name = "USCM Reconnaissance Spotter"
	equip_path = /datum/equipment_preset/corpse/forecon_spotter
