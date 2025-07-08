/obj/structure/closet/secure_closet/marine_personal
	name = "personal locker"
	desc = "It's an immobile card-locked storage unit."
	icon_state = "secure1"
	can_be_stacked = TRUE
	var/owner
	var/has_cryo_gear = TRUE

	var/job = "DO NOT USE!!!"
	var/x_to_linked_spawn_turf
	var/y_to_linked_spawn_turf
	var/turf/linked_spawn_turf

/obj/structure/closet/secure_closet/marine_personal/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("It has a name tag[owner ? ": [owner]." : ". They are still in hypersleep..."]")

/obj/structure/closet/secure_closet/marine_personal/Initialize(mapload, ...)
	. = ..()
	GLOB.personal_closets += src

	if(x_to_linked_spawn_turf || y_to_linked_spawn_turf)
		linked_spawn_turf = locate(x + x_to_linked_spawn_turf, y + y_to_linked_spawn_turf, z)

	if(has_cryo_gear)
		spawn_gear()

/obj/structure/closet/secure_closet/marine_personal/Destroy()
	GLOB.personal_closets -= src
	return ..()

/obj/structure/closet/secure_closet/marine_personal/allowed(mob/M)
	if(owner == M.real_name)
		return TRUE
	return FALSE

/obj/structure/closet/secure_closet/marine_personal/proc/spawn_gear()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/clothing/shoes/marine/jungle/knife(src)
	new /obj/item/device/radio/headset/almayer/marine/solardevils(src)

/obj/structure/closet/secure_closet/marine_personal/rifleman
	job = JOB_SQUAD_MARINE

/obj/structure/closet/secure_closet/marine_personal/smartgunner
	job = JOB_SQUAD_SMARTGUN

/obj/structure/closet/secure_closet/marine_personal/corpsman
	job = JOB_SQUAD_MEDIC

/obj/structure/closet/secure_closet/marine_personal/squad_leader
	job = JOB_SQUAD_TEAM_LEADER

/obj/structure/closet/secure_closet/marine_personal/platoon_leader
	job = JOB_SQUAD_LEADER

/obj/structure/closet/secure_closet/marine_personal/platoon_commander
	job = JOB_SO

/obj/structure/closet/secure_closet/marine_personal/platoon_commander/spawn_gear()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/clothing/under/marine/officer/boiler(src)
	new /obj/item/clothing/under/marine/officer/bridge(src)
	new /obj/item/clothing/suit/storage/jacket/marine/service(src)
	new /obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber(src)
	new /obj/item/clothing/shoes/marine/jungle/knife(src)
	new /obj/item/device/radio/headset/almayer/marine/solardevils(src)

/obj/structure/closet/secure_closet/marine_personal/upp/spawn_gear()
	new /obj/item/clothing/under/marine/veteran/UPP(src)
	new /obj/item/clothing/shoes/marine/upp(src)
	new /obj/item/device/radio/headset/almayer/marine/solardevils/upp(src)

/obj/structure/closet/secure_closet/marine_personal/upp/rifleman
	job = JOB_SQUAD_MARINE

/obj/structure/closet/secure_closet/marine_personal/upp/smartgunner
	job = JOB_SQUAD_SMARTGUN

/obj/structure/closet/secure_closet/marine_personal/upp/corpsman
	job = JOB_SQUAD_MEDIC

/obj/structure/closet/secure_closet/marine_personal/upp/squad_leader
	job = JOB_SQUAD_TEAM_LEADER

/obj/structure/closet/secure_closet/marine_personal/upp/platoon_leader
	job = JOB_SQUAD_LEADER

/obj/structure/closet/secure_closet/marine_personal/upp/platoon_commander
	job = JOB_SO

/obj/structure/closet/secure_closet/marine_personal/upp/platoon_commander/spawn_gear()
	new /obj/item/clothing/under/marine/veteran/UPP/naval(src)
	new /obj/item/clothing/suit/storage/jacket/marine/upp/naval(src)
	new /obj/item/clothing/shoes/marine/upp(src)
	new /obj/item/device/radio/headset/almayer/marine/solardevils/upp(src)
	new /obj/item/clothing/suit/storage/jacket/marine/upp/naval(src)
	new /obj/item/clothing/suit/storage/jacket/marine/upp(src)

/obj/structure/closet/secure_closet/marine_personal/forecon/spawn_gear()
	new /obj/item/clothing/under/marine/standard(src)
	new /obj/item/clothing/shoes/marine/jungle/knife(src)
	new /obj/item/device/radio/headset/almayer/marine/solardevils/forecon(src)

/obj/structure/closet/secure_closet/marine_personal/forecon/rifleman
	job = JOB_SQUAD_MARINE

/obj/structure/closet/secure_closet/marine_personal/forecon/smartgunner
	job = JOB_SQUAD_SMARTGUN

/obj/structure/closet/secure_closet/marine_personal/forecon/corpsman
	job = JOB_SQUAD_MEDIC

/obj/structure/closet/secure_closet/marine_personal/forecon/squad_leader
	job = JOB_SQUAD_TEAM_LEADER

/obj/structure/closet/secure_closet/marine_personal/forecon/platoon_leader
	job = JOB_SQUAD_LEADER

/obj/structure/closet/secure_closet/marine_personal/forecon/rto
	job = JOB_SQUAD_RTO


/obj/structure/closet/secure_closet/marine_personal/pmc/spawn_gear()
	new /obj/item/clothing/under/marine/veteran/pmc(src)
	new /obj/item/device/radio/headset/distress/pmc/platoon(src)
	new /obj/item/clothing/shoes/marine/civilian/knife(src)

/obj/structure/closet/secure_closet/marine_personal/pmc/rifleman
	job = JOB_SQUAD_MARINE

/obj/structure/closet/secure_closet/marine_personal/pmc/smartgunner
	job = JOB_SQUAD_SMARTGUN

/obj/structure/closet/secure_closet/marine_personal/pmc/corpsman
	job = JOB_SQUAD_MEDIC

/obj/structure/closet/secure_closet/marine_personal/pmc/squad_leader
	job = JOB_SQUAD_TEAM_LEADER

/obj/structure/closet/secure_closet/marine_personal/pmc/platoon_leader
	job = JOB_SQUAD_LEADER

/obj/structure/closet/secure_closet/marine_personal/pmc/platoon_commander
	job = JOB_SO
