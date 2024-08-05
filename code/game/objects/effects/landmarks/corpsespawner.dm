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

///////////Civilians//////////////////////

/obj/effect/landmark/corpsespawner/prisoner
	name = "Prisoner"
	equip_path = /datum/equipment_preset/corpse/prisoner

/obj/effect/landmark/corpsespawner/doctor
	name = "Doctor"
	equip_path = /datum/equipment_preset/corpse/doctor

/obj/effect/landmark/corpsespawner/engineer
	name = "Engineer"
	equip_path = /datum/equipment_preset/corpse/engineer

/obj/effect/landmark/corpsespawner/scientist
	name = "Scientist"
	equip_path = /datum/equipment_preset/corpse/scientist

/obj/effect/landmark/corpsespawner/miner
	name = "Shaft Miner"
	equip_path = /datum/equipment_preset/corpse/miner

/obj/effect/landmark/corpsespawner/security
	name = "Security"
	equip_path = /datum/equipment_preset/corpse/security

/obj/effect/landmark/corpsespawner/security/marshal
	name = "Colonial Marshal"
	equip_path = /datum/equipment_preset/corpse/security/marshal

/obj/effect/landmark/corpsespawner/security/liaison
	name = "Corporate Liaison"
	equip_path = /datum/equipment_preset/corpse/security/liaison

/obj/effect/landmark/corpsespawner/prison_security
	name = "Prison Guard"
	equip_path = /datum/equipment_preset/corpse/prison_security

/////////////////Officers//////////////////////

/obj/effect/landmark/corpsespawner/commander
	name = "Commanding Officer"
	equip_path = /datum/equipment_preset/corpse/commander

/obj/effect/landmark/corpsespawner/wysec
	name = "Weyland-Yutani Corporate Security Guard"
	equip_path = /datum/equipment_preset/corpse/wysec

///CM specific jobs///

/obj/effect/landmark/corpsespawner/ua_riot
	name = "UA Officer"
	equip_path = /datum/equipment_preset/corpse/ua_riot

/obj/effect/landmark/corpsespawner/ua_riot/burst
	name = "Burst UA Officer"
	equip_path = /datum/equipment_preset/corpse/ua_riot/burst

/obj/effect/landmark/corpsespawner/wy/manager
	name = "Corporate Supervisor"
	equip_path = /datum/equipment_preset/corpse/wy/manager

/obj/effect/landmark/corpsespawner/wy/manager/burst
	name = "Burst Corporate Supervisor"
	equip_path = /datum/equipment_preset/corpse/ua_riot/burst


///////////Faction Specific Corpses//////////////////////

/obj/effect/landmark/corpsespawner/clf
	name = "Colonial Liberation Front Soldier"
	equip_path = /datum/equipment_preset/corpse/clf

/obj/effect/landmark/corpsespawner/clf/burst
	name = "Burst Colonial Liberation Front Soldier"
	equip_path = /datum/equipment_preset/corpse/clf/burst

/obj/effect/landmark/corpsespawner/upp
	name = "Union of Progressive Peoples Soldier"
	equip_path = /datum/equipment_preset/corpse/upp

/obj/effect/landmark/corpsespawner/upp/burst
	name = "Burst Union of Progressive Peoples Soldier"
	equip_path = /datum/equipment_preset/corpse/upp/burst

/obj/effect/landmark/corpsespawner/pmc
	name = "Weyland-Yutani PMC (Standard)"
	equip_path = /datum/equipment_preset/corpse/pmc

/obj/effect/landmark/corpsespawner/pmc/burst
	name = "Burst Weyland-Yutani PMC (Standard)"
	equip_path = /datum/equipment_preset/corpse/pmc/burst

/obj/effect/landmark/corpsespawner/freelancer
	name = "Freelancer Mercenary"
	equip_path = /datum/equipment_preset/corpse/freelancer

/obj/effect/landmark/corpsespawner/freelancer/burst
	name = "Burst Freelancer Mercenary"
	equip_path = /datum/equipment_preset/corpse/freelancer/burst
