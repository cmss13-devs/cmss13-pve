/* Closets for specific jobs
 * Contains:
 * Bartender
 * Janitor
 * Lawyer
 */

/*
 * Bartender
 */
/obj/structure/closet/gmcloset
	name = "formal closet"
	desc = "It's a storage unit for formal clothing."
	icon_state = "black"
	icon_closed = "black"

/obj/structure/closet/gmcloset/Initialize()
	. = ..()
	new /obj/item/clothing/head/that(src)
	new /obj/item/clothing/head/that(src)
	new /obj/item/clothing/head/hairflower
	new /obj/item/clothing/under/sl_suit(src)
	new /obj/item/clothing/under/sl_suit(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/suit/storage/wcoat(src)
	new /obj/item/clothing/suit/storage/wcoat(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/clothing/shoes/black(src)

/*
 * Janitor
 */
/obj/structure/closet/jcloset
	name = "custodial closet"
	desc = "It's a storage unit for janitorial clothes and gear."
	icon_state = "purple"
	icon_closed = "purple"
	icon_opened = "purple_open"

/obj/structure/closet/jcloset/Initialize()
	. = ..()
	new /obj/item/clothing/under/rank/janitor(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/clothing/head/soft/purple(src)
	new /obj/item/clothing/head/beret/jan(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/tool/wet_sign(src)
	new /obj/item/tool/wet_sign(src)
	new /obj/item/tool/wet_sign(src)
	new /obj/item/tool/wet_sign(src)
	new /obj/item/device/lightreplacer(src)
	new /obj/item/storage/bag/trash(src)
	new /obj/item/clothing/shoes/galoshes(src)

/*
 * Lawyer
 */
/obj/structure/closet/lawcloset
	name = "legal closet"
	desc = "It's a storage unit for courtroom apparel and items."
	icon_state = "blue"
	icon_closed = "blue"
	icon_opened = "blue_open"

/obj/structure/closet/lawcloset/Initialize()
	. = ..()
	new /obj/item/clothing/under/lawyer/female(src)
	new /obj/item/clothing/under/lawyer/black(src)
	new /obj/item/clothing/under/lawyer/red(src)
	new /obj/item/clothing/under/lawyer/bluesuit(src)
	new /obj/item/clothing/suit/storage/lawyer/bluejacket(src)
	new /obj/item/clothing/under/lawyer/purpsuit(src)
	new /obj/item/clothing/suit/storage/lawyer/purpjacket(src)
	new /obj/item/clothing/shoes/brown(src)
	new /obj/item/clothing/shoes/black(src)

/obj/structure/closet/secure_closet/platoon_sergeant
	name = "section sergeant locker"
	desc = "A secure storage unit for the section sergeant."
	req_one_access = list(ACCESS_MARINE_LEADER)

/obj/structure/closet/secure_closet/platoon_sergeant/Initialize()
	. = ..()
	new /obj/item/clothing/head/helmet/marine/leader(src)
	new /obj/item/device/binoculars/range/designator/sergeant(src)
	new /obj/item/device/whistle(src)

/obj/structure/closet/secure_closet/platoon_sergeant_forecon
	name = "squad leader locker"
	desc = "A secure storage unit for the squad leader."
	req_one_access = list(ACCESS_MARINE_LEADER)

/obj/structure/closet/secure_closet/platoon_sergeant_forecon/Initialize()
	. = ..()
	new /obj/item/device/binoculars/range/designator(src)
	new /obj/item/device/whistle(src)

/obj/structure/closet/secure_closet/squad_sergeant
	name = "squad sergeant locker"
	desc = "A secure storage unit for a squad sergeant."
	req_one_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_TL_PREP)

/obj/structure/closet/secure_closet/squad_sergeant/Initialize()
	. = ..()
	new /obj/item/device/binoculars/range/designator(src)
	new /obj/item/device/whistle(src)

/obj/structure/closet/secure_closet/squad_sergeant_forecon
	name = "assistant squad leader locker"
	desc = "A secure storage unit for an assistant squad leader."
	req_one_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_TL_PREP)

/obj/structure/closet/secure_closet/squad_sergeant_forecon/Initialize()
	. = ..()
	new /obj/item/device/binoculars/range/designator(src)
	new /obj/item/device/whistle(src)

/obj/structure/closet/secure_closet/smartgunner
	name = "smartgunner locker"
	desc = "A secure storage unit for a smartgunner."
	req_one_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_SMARTPREP)

/obj/structure/closet/secure_closet/smartgunner/Initialize()
	. = ..()
	new /obj/item/weapon/gun/smartgun/empty(src)
	new /obj/item/smartgun_battery(src)
	new /obj/item/clothing/suit/marine/smartgunner(src)
	new /obj/item/storage/belt/gun/smartgunner/garrow(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/clothing/glasses/night/m56_goggles/no_nightvision(src)
	new /obj/item/storage/large_holster/machete/smartgunner/full(src)
	new /obj/item/clothing/accessory/storage/webbing/m56(src)
	new /obj/item/clothing/accessory/storage/webbing/m56/grenade(src)

/obj/structure/closet/secure_closet/smartgunner_forecon
	name = "smartgunner locker"
	desc = "A secure storage unit for a smartgunner."
	req_one_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_SMARTPREP)

/obj/structure/closet/secure_closet/smartgunner_forecon/Initialize()
	. = ..()
	new /obj/item/weapon/gun/smartgun(src)
	new /obj/item/smartgun_battery(src)
	new /obj/item/clothing/suit/marine/smartgunner/standard(src)
	new /obj/item/storage/belt/gun/smartgunner/garrow(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/clothing/glasses/night/m56_goggles/no_nightvision(src)
	new /obj/item/storage/large_holster/machete/smartgunner/full(src)
	new /obj/item/clothing/accessory/storage/webbing/m56(src)
	new /obj/item/clothing/accessory/storage/webbing/m56/grenade(src)

/obj/structure/closet/cryo/Initialize()
	. = ..()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/clothing/under/marine(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/clothing/shoes/marine/knife(src)
	new /obj/item/device/radio/headset/almayer/marine(src)
	new /obj/item/device/radio/headset/almayer/marine(src)
	new /obj/item/clothing/glasses/night/m56_goggles/no_nightvision(src)

/obj/structure/closet/secure_closet/rmc_troop_sergeant
	name = "troop sergeant locker"
	desc = "A secure storage unit for the senior sergeant of the Royal Marines Commando troop."
	req_access = list(ACCESS_TWE_ARMORY, ACCESS_TWE_TLPREP)

/obj/structure/closet/secure_closet/rmc_troop_sergeant/Initialize()
	. = ..()
	new /obj/item/device/binoculars/range/designator(src)
	new /obj/item/storage/backpack/rmc/frame(src)
	new /obj/item/storage/firstaid/adv(src)
	new /obj/item/ammo_box/magazine/nsg23(src)

/obj/structure/closet/secure_closet/rmc_section_leader
	name = "section leader locker"
	desc = "A secure storage unit for the Royal Marines Commando section leader."
	req_access = list(ACCESS_TWE_TLPREP, ACCESS_TWE_SQUAD_ONE)

/obj/structure/closet/secure_closet/rmc_section_leader/Initialize()
	. = ..()
	new /obj/item/device/binoculars/range/designator(src)
	new /obj/item/device/whistle(src)

/obj/structure/closet/secure_closet/rmc_smartgunner
	name = "smartgunner locker"
	desc = "A secure storage unit for a Royal Marines Commando smartgunner."
	req_access = list(ACCESS_TWE_SQUAD_TWO, ACCESS_TWE_HEVWEAPPREP)

/obj/structure/closet/secure_closet/rmc_smartgunner/Initialize()
	. = ..()
	new /obj/item/smartgun_battery(src)
	new /obj/item/clothing/suit/marine/veteran/royal_marine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun/holo_targeting(src)
	new /obj/item/ammo_magazine/smartgun/holo_targeting(src)
	new /obj/item/ammo_magazine/smartgun/holo_targeting(src)
	new /obj/item/clothing/glasses/night/m56_goggles/rmc(src)

/obj/structure/closet/secure_closet/job_locker/imperial_specialist
	name = "specialist locker"
	req_access = list(ACCESS_MARINE_SPECPREP)
	var/claimed = FALSE
	var/role_lock = TRUE

/obj/structure/closet/secure_closet/job_locker/imperial_specialist/togglelock(mob/living/user)
	if(!allowed(user))
		to_chat(user, SPAN_WARNING("You do not have access to the contents of this locker."))
		return
	if(claimed)
		return ..()
	if(role_lock && ishuman(user))
		var/mob/living/carbon/human/human = user
		var/obj/item/card/id/card = human.get_idcard()
		if(card)
			if(human.job != JOB_SQUAD_SPECIALIST)
				to_chat(user, SPAN_WARNING("You aren't the right occupation for this locker."))
				return
			equipment_giver(user)
		else if(!role_lock && ishuman(user))
			equipment_giver(user)

/obj/structure/closet/secure_closet/job_locker/imperial_specialist/proc/equipment_giver(mob/living/user)
	var/static/list/spec_equipment_list = list(
		"Rocket launcher kit" = /obj/item/storage/box/spec/imperial_launcher,
		"Plasmagun kit" = /obj/item/storage/box/spec/imperial_plasma,
		"Flamer Kit" = /obj/item/storage/box/spec/imperial_flamer,
		"Volleygun Kit" = /obj/item/storage/box/spec/imperial_volleygun,
		)

	var/chosen_kit = tgui_input_list(user, "Equipment Selection", "Select your equipment", spec_equipment_list)

	if(!chosen_kit)
		to_chat(user, SPAN_WARNING("You decide to think on it."))
		return

	if(claimed)
		to_chat(user, SPAN_WARNING("You already got a kit!"))
		return

	chosen_kit = spec_equipment_list[chosen_kit]
	claimed = TRUE
	new chosen_kit(src)
