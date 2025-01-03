/obj/structure/closet/secure_closet/marine_personal
	name = "personal locker"
	desc = "It's an immobile card-locked storage unit."
	icon_state = "secure1"
	can_be_stacked = TRUE
	var/owner
	var/job = "Rifleman"
	var/has_cryo_gear = TRUE
	var/has_officer_gear = FALSE
	var/has_liaison_gear = FALSE
	var/has_advisor_gear = FALSE
	var/has_pilot_gear = FALSE

/obj/structure/closet/secure_closet/marine_personal/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("It has a name tag[owner ? ": [owner]." : ". They are still in hypersleep..."]")

/obj/structure/closet/secure_closet/marine_personal/Initialize(mapload, ...)
	. = ..()
	GLOB.personal_closets += src

/obj/structure/closet/secure_closet/marine_personal/Destroy()
	GLOB.personal_closets -= src
	return ..()

/obj/structure/closet/secure_closet/marine_personal/allowed(mob/M)
	if(owner == M.real_name)
		return TRUE
	return FALSE

/obj/structure/closet/secure_closet/marine_personal/Initialize()
	. = ..()
	if(has_cryo_gear)
		new /obj/item/clothing/under/marine(src)
		new /obj/item/device/radio/headset/almayer/marine/solardevils(src)
		new /obj/item/clothing/shoes/marine/jungle/knife(src)
	if(has_officer_gear)
		new /obj/item/clothing/under/marine/officer/boiler(src)
		new /obj/item/clothing/suit/storage/jacket/marine/service(src)
		new /obj/item/clothing/under/marine/officer/bridge(src)
	if(has_liaison_gear)
		new /obj/item/clothing/under/liaison_suit/outing(src)
		new /obj/item/clothing/under/liaison_suit/outing/red(src)
		new /obj/item/clothing/under/liaison_suit(src)
		new /obj/item/clothing/shoes/laceup/brown(src)
		new /obj/item/clothing/shoes/marine/civilian(src)
	if(has_advisor_gear)
		new /obj/item/clothing/under/ripley(src)
		new /obj/item/clothing/under/colonist/boilersuit/darkblue(src)
		new /obj/item/clothing/under/colonist/boilersuit/khaki(src)
		new /obj/item/clothing/suit/storage/jacket/marine/corporate/brown/leather(src)
		new /obj/item/clothing/shoes/stompers(src)
	if(has_pilot_gear)
		new /obj/item/clothing/under/marine/officer/pilot/pve(src)
		new /obj/item/clothing/shoes/marine/knife(src)
		new /obj/item/device/radio/headset/almayer/marine/solardevils(src)

/obj/structure/closet/secure_closet/marine_personal/platooncommander
	job = "Platoon Commander"
	has_officer_gear = TRUE

/obj/structure/closet/secure_closet/marine_personal/liaison
	job = "Corporate Liaison"
	has_cryo_gear = FALSE
	has_liaison_gear = TRUE

/obj/structure/closet/secure_closet/marine_personal/advisor
	job = "Civilian Advisor"
	has_cryo_gear = FALSE
	has_advisor_gear = TRUE

/obj/structure/closet/secure_closet/marine_personal/pilot
	job = "Dropship Pilot"
	has_cryo_gear = FALSE
	has_pilot_gear = TRUE
