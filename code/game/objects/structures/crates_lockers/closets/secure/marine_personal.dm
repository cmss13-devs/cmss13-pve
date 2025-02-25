/obj/structure/closet/secure_closet/spawn_personal
//making this the basetype.
	name = "personal locker"
	desc = "It's an immobile secure storage unit. Contains someone's personal effects."
	icon_state = "secure1"
	can_be_stacked = TRUE
	var/owner
	var/job
	var/has_cryo_gear = TRUE

/obj/structure/closet/secure_closet/spawn_personal/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("It has a name tag[owner ? ": [owner]." : ". They are still in hypersleep..."]")

/obj/structure/closet/secure_closet/spawn_personal/Initialize(mapload, ...)
	. = ..()
	GLOB.personal_closets += src

/obj/structure/closet/secure_closet/spawn_personal/Destroy()
	GLOB.personal_closets -= src
	return ..()

/obj/structure/closet/secure_closet/spawn_personal/allowed(mob/M)
	if(owner == M.real_name)
		return TRUE
	return FALSE

//USCMC LOCKERS
/obj/structure/closet/secure_closet/spawn_personal/marine
	name = "USCMC shipboard personal locker"
	desc = "It's an immobile secure storage unit. Contains a member of the USCMC's personal effects."
	job = JOB_SQUAD_MARINE

/obj/structure/closet/secure_closet/spawn_personal/marine/Initialize()
	. = ..()
	if(has_cryo_gear)
		new /obj/item/clothing/under/marine(src)
		new /obj/item/clothing/shoes/marine/jungle/knife(src)
		new /obj/item/device/radio/headset/almayer/marine/solardevils(src)

/obj/structure/closet/secure_closet/spawn_personal/marine/smartgunner

//NAVINF LOCKERS
/obj/structure/closet/secure_closet/spawn_personal/upp
	name = "Naval Infantry shipboard personal locker"
	desc = "It's an immobile secure storage unit. Contains a member of the UPPAC's personal effects."

/obj/structure/closet/secure_closet/spawn_personal/upp/Initialize()
	. = ..()
	if(has_cryo_gear)
		new /obj/item/clothing/under/marine/veteran/UPP(src)
		new /obj/item/clothing/shoes/marine/upp(src)
		new /obj/item/device/radio/headset/almayer/marine/solardevils/upp(src)

//FORECON lockers
/obj/structure/closet/secure_closet/spawn_personal/marine/forecon
	name = "FORECON shipboard personal locker"
	desc = "It's an immobile secure storage unit. Contains a member of FORECON's personal effects."
	job = JOB_SQUAD_MARINE_FORECON

/obj/structure/closet/secure_closet/spawn_personal/upp/Initialize()
	. = ..()
	if(has_cryo_gear)
		new /obj/item/clothing/under/marine/standard(src)
		new /obj/item/clothing/shoes/marine/jungle/knife(src)
		new /obj/item/device/radio/headset/almayer/marine/solardevils/forecon(src)
