/datum/tutorial/marine/pve
	name = "Marine - PvE"
	desc = "A tutorial to get you acquainted with the very basics of how to play a marine of Golden Arrow."
	tutorial_id = "marine_pve_1"
	tutorial_template = /datum/map_template/tutorial/pve
	/// How many items need to be vended from the clothing vendor for the script to continue, if something vends 2 items (for example), increase this number by 2.
	var/clothing_items_to_vend = 9
	var/list/npcs = list()

/datum/tutorial/marine/pve/init_mob()
	. = ..()
	arm_equipment(tutorial_mob, /datum/equipment_preset/tutorial)

	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/machinery/cryopod/tutorial, tutorial_pod)
	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/closet/secure_closet/pve_tutorial, tutorial_closet)
	tutorial_pod.go_in_cryopod(tutorial_mob, TRUE, FALSE)
	tutorial_closet.name = "[tutorial_mob.name]'s locker"

/datum/tutorial/marine/pve/start_tutorial(mob/starting_mob)
	. = ..()
	if(!.)
		return

	init_mob()
	message_to_player("This is the tutorial for Sun Riders Marine of USS Golden Arrow. Leave the cryopod by pressing <b>[retrieve_bind("North")]</b> or <b>[retrieve_bind("East")]</b> to continue.")
	update_objective("Exit the cryopod by pressing [retrieve_bind("North")] or [retrieve_bind("East")].")
	RegisterSignal(tracking_atoms[/obj/structure/machinery/cryopod/tutorial], COMSIG_CRYOPOD_GO_OUT, PROC_REF(on_cryopod_exit))

/datum/tutorial/marine/pve/proc/on_cryopod_exit()
	SIGNAL_HANDLER

	UnregisterSignal(tracking_atoms[/obj/structure/machinery/cryopod/tutorial], COMSIG_CRYOPOD_GO_OUT)
	message_to_player("Good. As you may have noticed, you're butt-naked! You left your personal items in your very own locker down the hall.")
	update_objective("Find your personal locker.")
	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/closet/secure_closet/pve_tutorial, tutorial_closet)
	add_highlight(tutorial_closet)
	RegisterSignal(tutorial_closet, COMSIG_CLOSET_OPEN, PROC_REF(on_closet_open))

/datum/tutorial/marine/pve/proc/on_closet_open(datum/source, obj/structure/machinery/cm_vending/vendor, list/itemspec, mob/living/carbon/human/user)
	SIGNAL_HANDLER

	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/closet/secure_closet/pve_tutorial, tutorial_closet)
	UnregisterSignal(tutorial_closet, COMSIG_CLOSET_OPEN)
	remove_highlight(tutorial_closet)
	message_to_player("Now put your clothes on and go get some chow, canteen is further down the hall.")
	update_objective("Grab some chow.")
	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/machinery/cm_vending/sorted/marine_food/tutorial/pve, food_vendor)
	add_highlight(food_vendor)
	food_vendor.req_access = list()
	RegisterSignal(food_vendor, COMSIG_VENDOR_SUCCESSFUL_VEND, PROC_REF(on_food_vend))

/datum/tutorial/marine/pve/proc/on_food_vend(datum/source, obj/structure/machinery/cm_vending/vendor, list/itemspec, mob/living/carbon/human/user)
	SIGNAL_HANDLER

	//TUTORIAL_ATOM_FROM_TRACKING(/mob/living/carbon/human/dummy, lloyd)
	//lloyd.say("Man, this is awful.")
	var/mob/living/carbon/human/lloyd = npcs["Lloyd"]
	lloyd.say("Man, this is awful.")
	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/machinery/cm_vending/sorted/marine_food/tutorial/pve, food_vendor)
	UnregisterSignal(food_vendor, COMSIG_VENDOR_SUCCESSFUL_VEND)
	remove_highlight(food_vendor)
	message_to_player("This food sucks... but it's the best we've got. Now, sit your ass on the chair next to a table - it's easier and faster to eat that way.")
	update_objective("Sit on a chair and try to enjoy your food..")
	RegisterSignal(tutorial_mob, COMSIG_MOB_BUCKLED, PROC_REF(on_seated))

/datum/tutorial/marine/pve/proc/on_seated()
	SIGNAL_HANDLER
	UnregisterSignal(tutorial_mob, COMSIG_MOB_BUCKLED)
	message_to_player("Every meal's a banquet, huh... No need to hurry, marine - we've got time to spare. On a usual mission you can chat with your buddies and roleplay before getting briefed and gearing up. After you're done eating, head out of canteen.")
	update_objective("Attend briefing.")
	var/mob/living/carbon/human/lloyd = npcs["Lloyd"]
	lloyd.say("Do you think the freakin' collies down there got some, you know, real food?")
	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/bed/chair, briefing_chair)
	add_highlight(briefing_chair)
	RegisterSignal(briefing_chair, COMSIG_OBJ_AFTER_BUCKLE, PROC_REF(attend_briefing))

/datum/tutorial/marine/pve/proc/attend_briefing()
	SIGNAL_HANDLER

	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/bed/chair, briefing_chair)
	remove_highlight(briefing_chair)
	message_to_player("Here you listen to lieutenant's briefing on what you'll have to do during the mission. Unless you want to be a burden to your team, make sure you understand everything.")
	var/mob/living/carbon/human/oestermann = npcs["Oestermann"]
	oestermann.say("Here are the orders, marines. Listen carefully!")
	sleep(50)
	oestermann.say("We go down there, kill the bugs, save the colonist daughters, and go home. Any questions?")
	sleep(50)
	oestermann.say("No? Then go, get your gear on! Chop-chop-chop!")
	oestermann.emote("warcry")
	var/mob/living/carbon/human/bobert = npcs["Bobert"]
	bobert.emote("warcry")
	message_to_player("Return to armory and get some gear on.")
	update_objective("Get your gear from the armory.")
	UnregisterSignal(briefing_chair, COMSIG_OBJ_AFTER_BUCKLE)
	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/tutorial, squad_prep)
	add_highlight(squad_prep)
	squad_prep.req_access = list()
	RegisterSignal(squad_prep, COMSIG_VENDOR_SUCCESSFUL_VEND, PROC_REF(on_clothing_vend))

/datum/tutorial/marine/pve/proc/on_clothing_vend()
	SIGNAL_HANDLER

	clothing_items_to_vend--
	if(clothing_items_to_vend <= 0)
		TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/tutorial, squad_prep)
		UnregisterSignal(squad_prep, COMSIG_VENDOR_SUCCESSFUL_VEND)
		remove_highlight(squad_prep)
		message_to_player("During normal missions you will have more gear to choose from. Now, proceed east to get some weapons.")
		update_objective("Acquire weapons.")
		TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/gun_rack/m41/unloaded/tutorial, gun_rack)
		add_highlight(gun_rack)
		gun_rack.locked = FALSE
		RegisterSignal(gun_rack, COMSIG_GUNRACK_ITEM_TAKEN, PROC_REF(on_rifle_get))

/datum/tutorial/marine/pve/proc/on_rifle_get()
	SIGNAL_HANDLER

	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/gun_rack/m41/unloaded/tutorial, gun_rack)
	remove_highlight(gun_rack)
	message_to_player("Here she is. Come to [tutorial_mob.gender == MALE ? "daddy" : "momma"]. M41A pulse rifle is your only best friend. Solar Devils don't use Mk2s, so that means no attachements. Mk1, however, got a larger mag cap and 5-shot grenade launcher. We keep them unloaded and on safety, and the mags are kept separately in a crate. Crack one open with a crowbar.")
	update_objective("Grab some ammo.")
	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/largecrate/supply/ammo/m41amk1, mk1ammo)
	add_highlight(mk1ammo)
	RegisterSignal(mk1ammo, COMSIG_LARGECRATE_OPEN, PROC_REF(on_ammo_open))


/datum/tutorial/marine/pve/proc/on_ammo_open()
	SIGNAL_HANDLER

	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/largecrate/supply/ammo/m41amk1, mk1ammo)
	remove_highlight(mk1ammo)
	message_to_player("Good job. Now, load'em up and get to the chopper! Uh, dropship, I mean.")
	update_objective("Get to the dropship.")
	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/bed/chair/dropship/passenger, ds_chair)
	add_highlight(ds_chair)
	RegisterSignal(ds_chair, COMSIG_OBJ_AFTER_BUCKLE, PROC_REF(on_ds_buckle))

/datum/tutorial/marine/pve/proc/on_ds_buckle()
	SIGNAL_HANDLER

	TUTORIAL_ATOM_FROM_TRACKING(/obj/structure/bed/chair/dropship/passenger, ds_chair)
	remove_highlight(ds_chair)
	message_to_player("In a few minutes you will be on some alien planet or creepy abandoned space station. The only things that stand between you and grave danger are your rifle and your trusty squadmates.")
	tutorial_end_in(15 SECONDS, TRUE)
	playsound_client(tutorial_mob.client, 'sound/effects/engine_startup.ogg', vol = 50)

/datum/tutorial/marine/pve/init_map()
	var/obj/structure/machinery/cryopod/tutorial/tutorial_pod = new(bottom_left_corner)
	add_to_tracking_atoms(tutorial_pod)
	var/obj/structure/machinery/cm_vending/sorted/marine_food/tutorial/pve/food_vendor = new(loc_from_corner(16, 8))
	add_to_tracking_atoms(food_vendor)
	var/obj/structure/closet/secure_closet/pve_tutorial/tutorial_closet = new(loc_from_corner(7, -1))
	add_to_tracking_atoms(tutorial_closet)
	var/obj/structure/bed/chair/briefing_chair = new(loc_from_corner(34, 16))
	briefing_chair.dir = NORTH
	add_to_tracking_atoms(briefing_chair)
	var/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/tutorial/squad_prep = new(loc_from_corner(35, 6))
	add_to_tracking_atoms(squad_prep)
	var/obj/structure/gun_rack/m41/unloaded/tutorial/gun_rack = new(loc_from_corner(45, 15))
	add_to_tracking_atoms(gun_rack)
	var/obj/structure/largecrate/supply/ammo/m41amk1/mk1ammo = new(loc_from_corner(43, 7))
	add_to_tracking_atoms(mk1ammo)
	var/obj/structure/bed/chair/dropship/passenger/ds_chair = new(loc_from_corner(59, 9))
	ds_chair.dir = EAST
	add_to_tracking_atoms(ds_chair)

	var/mob/living/carbon/human/dummy/lloyd = new(loc_from_corner(15, 3))
	npcs["Lloyd"] = lloyd
	lloyd.anchored = TRUE
	arm_equipment(lloyd, /datum/equipment_preset/tutorial/pve/lloyd)
	lloyd.dir = NORTH

	var/mob/living/carbon/human/dummy/oestermann = new(loc_from_corner(35, 20))
	npcs["Oestermann"] = oestermann
	oestermann.anchored = TRUE
	arm_equipment(oestermann, /datum/equipment_preset/tutorial/pve/oestermann)

	var/mob/living/carbon/human/dummy/bobert = new(loc_from_corner(34, 17))
	npcs["Bobert"] = bobert
	bobert.dir = NORTH
	bobert.anchored = TRUE
	arm_equipment(bobert, /datum/equipment_preset/tutorial/pve/bobert)

	var/mob/living/carbon/human/dummy/bobert2 = new(loc_from_corner(59, 8))
	npcs["Bobert Jr"] = bobert2
	bobert2.anchored = TRUE
	var/obj/structure/bed/chair/dropship/passenger/boberts_chair = locate() in get_turf(bobert2)
	boberts_chair.buckle_mob(bobert2, bobert2)
	arm_equipment(bobert2, /datum/equipment_preset/tutorial/pve/bobert)

/obj/structure/closet/secure_closet/pve_tutorial
	name = "personal closet"
	pixel_x = 8

/obj/structure/closet/secure_closet/pve_tutorial/Initialize()
	. = ..()
	new /obj/item/clothing/under/marine(src)
	new /obj/item/clothing/shoes/marine/knife(src)

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/tutorial
	req_access = list(ACCESS_TUTORIAL_LOCKED)

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/tutorial/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Marine Combat Boots", 0, /obj/item/clothing/shoes/marine/knife, VENDOR_ITEM_REGULAR),
		list("USCM Uniform", 0, /obj/item/clothing/under/marine, VENDOR_ITEM_REGULAR),
		list("Marine Combat Gloves", 1, /obj/item/clothing/gloves/marine, VENDOR_ITEM_REGULAR),
		list("M10 Pattern Marine Helmet", 1, /obj/item/clothing/head/helmet/marine, VENDOR_ITEM_REGULAR),

		list("WEBBINGS", -1, null, null),
		list("Brown Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest/brown_vest, VENDOR_ITEM_REGULAR),
		list("Black Webbing Vest", 0, /obj/item/clothing/accessory/storage/black_vest, VENDOR_ITEM_REGULAR),
		list("Webbing", 1, /obj/item/clothing/accessory/storage/webbing, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),

		list("ARMOR", -1, null, null),
		list("M3 Pattern Carrier Marine Armor", 0, /obj/item/clothing/suit/storage/marine/medium/carrier, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Padded Marine Armor", 0, /obj/item/clothing/suit/storage/marine/medium/padded, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Padless Marine Armor", 0, /obj/item/clothing/suit/storage/marine/medium/padless, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Ridged Marine Armor", 0, /obj/item/clothing/suit/storage/marine/medium/padless_lines, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Skull Marine Armor", 0, /obj/item/clothing/suit/storage/marine/medium/skull, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Smooth Marine Armor", 1, /obj/item/clothing/suit/storage/marine/medium/smooth, VENDOR_ITEM_REGULAR),
		list("M3-EOD Pattern Heavy Armor", 0, /obj/item/clothing/suit/storage/marine/heavy, VENDOR_ITEM_REGULAR),
		list("M3-L Pattern Light Armor", 0, /obj/item/clothing/suit/storage/marine/light, VENDOR_ITEM_REGULAR),

		list("BACKPACK", -1, null, null, null),
		list("Lightweight IMP Backpack", 0, /obj/item/storage/backpack/marine, VENDOR_ITEM_REGULAR),
		list("Technician Backpack", 0, /obj/item/storage/backpack/marine/tech, VENDOR_ITEM_REGULAR),
		list("USCM Satchel", 1, /obj/item/storage/backpack/marine/satchel, VENDOR_ITEM_REGULAR),
		list("USCM Technical Satchel", 0, /obj/item/storage/backpack/marine/satchel/tech, VENDOR_ITEM_REGULAR),

		list("RESTRICTED BACKPACKS", -1, null, null),
		list("Radio Telephone Backpack", 0, /obj/item/storage/backpack/marine/satchel/rto, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("M276 Pattern Ammo Load Rig", 1, /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M40 Grenade Rig", 0, /obj/item/storage/belt/grenade, VENDOR_ITEM_REGULAR),
		list("M276 Pattern General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M276 Pattern General Revolver Holster Rig", 0, /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", 1, /obj/item/storage/pouch/firstaid/full/alternate, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Injectors)", 0, /obj/item/storage/pouch/firstaid/full, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", 1, /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 0, /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),

		list("RESTRICTED POUCHES", -1, null, null, null),
		list("Construction Pouch", 0, /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", 0, /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch (Empty)", 0, /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Tools Pouch", 0, /obj/item/storage/pouch/tools, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 0, /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),
		list("Incinerator Fuel Tank Pouch", 0, /obj/item/storage/pouch/flamertank, VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("M5 Standalone Gas Mask", 0, /obj/item/clothing/mask/gas/m5, VENDOR_ITEM_REGULAR),
		list("M5 Integrated Gas Mask", 0, /obj/item/prop/helmetgarb/helmet_gasmask, VENDOR_ITEM_REGULAR),
		list("Tactical Wrap", 0, /obj/item/clothing/mask/rebreather/scarf/tacticalmask, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, VENDOR_ITEM_REGULAR),
		list("Rebreather", 0, /obj/item/clothing/mask/rebreather, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Ballistic goggles", 0, /obj/item/clothing/glasses/mgoggles, VENDOR_ITEM_REGULAR),
		list("M1A1 Ballistic goggles", 0, /obj/item/clothing/glasses/mgoggles/v2, VENDOR_ITEM_REGULAR),
		list("Prescription ballistic goggles", 0, /obj/item/clothing/glasses/mgoggles/prescription, VENDOR_ITEM_REGULAR),
		list("Marine RPG glasses", 0, /obj/item/clothing/glasses/regular, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Camouflage Wrap", 0, /obj/item/prop/helmetgarb/camocover, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Netting", 0, /obj/item/prop/helmetgarb/netting, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Rain Cover", 0, /obj/item/prop/helmetgarb/raincover, VENDOR_ITEM_REGULAR),
		list("Firearm Lubricant", 0, /obj/item/prop/helmetgarb/gunoil, VENDOR_ITEM_REGULAR),
		list("USCM Flair", 0, /obj/item/prop/helmetgarb/flair_uscm, VENDOR_ITEM_REGULAR),
		list("Solar Devils Shoulder Patch", 1, /obj/item/clothing/accessory/patch/devils, VENDOR_ITEM_REGULAR),
		list("USCM Shoulder Patch", 0, /obj/item/clothing/accessory/patch, VENDOR_ITEM_REGULAR),
		list("Bedroll", 0, /obj/item/roller/bedroll, VENDOR_ITEM_REGULAR),
		)

/obj/structure/gun_rack/m41/unloaded/tutorial
	initial_stored = 1
	locked = TRUE
