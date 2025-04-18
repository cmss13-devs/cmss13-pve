/obj/structure/closet/secure_closet/marine_personal
	name = "personal locker"
	desc = "It's an immobile card-locked storage unit."
	icon_state = "secure1"
	can_be_stacked = TRUE
	var/owner
	var/has_cryo_gear = TRUE

	var/job = "Rifleman"
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

/obj/structure/closet/secure_closet/marine_personal/Destroy()
	GLOB.personal_closets -= src
	return ..()

/obj/structure/closet/secure_closet/marine_personal/allowed(mob/M)
	if(owner == M.real_name)
		return TRUE
	return FALSE

/obj/structure/closet/secure_closet/marine_personal/proc/load_contents()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/clothing/shoes/marine/jungle/knife(src)
	new /obj/item/device/radio/headset/almayer/marine/solardevils(src)

/obj/structure/closet/secure_closet/marine_personal/Initialize()
	. = ..()
	if(has_cryo_gear)
		load_contents()

/obj/structure/closet/secure_closet/marine_personal/sof/load_contents()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/device/radio/headset/almayer/sof(src)

