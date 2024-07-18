GLOBAL_LIST_EMPTY(simulacrum_playersaves)

/datum/simulacrum_humansave
	var/obj/item/boots
	var/obj/item/gloves
	var/obj/item/uniform
	var/obj/item/suit
	var/obj/item/glasses
	var/obj/item/mask
	var/obj/item/ear_main
	var/obj/item/ear_secondary
	var/obj/item/helmet
	var/obj/item/suitstorage
	var/obj/item/idcard
	var/obj/item/belt
	var/obj/item/lefthand
	var/obj/item/righthand
	var/obj/item/pocket1
	var/obj/item/pocket2

	var/list/suit_contents = list()
	var/list/helmet_contents = list()
	var/list/suitstorage_contents = list()
	var/list/belt_contents = list()
	var/list/pocket1_contents = list()
	var/list/pocket2_contents = list()

	var/tied_ckey
	var/mob/living/carbon/human/tied_human

/datum/simulacrum_humansave/Destroy(force, ...)
	tied_human = null //cba for the rest
	return ..()

// hell
/proc/save_human(mob/living/carbon/human/human)
	var/datum/simulacrum_humansave/save = new()
	save.boots = DuplicateObject(human.shoes, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.gloves = DuplicateObject(human.gloves, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.uniform = DuplicateObject(human.w_uniform, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.suit = DuplicateObject(human.wear_suit, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.glasses = DuplicateObject(human.glasses, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.mask = DuplicateObject(human.wear_mask, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.ear_main = DuplicateObject(human.wear_l_ear, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.ear_secondary = DuplicateObject(human.wear_r_ear, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.helmet = DuplicateObject(human.head, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.suitstorage = DuplicateObject(human.s_store, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.idcard = DuplicateObject(human.wear_id, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.belt = DuplicateObject(human.belt, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.lefthand = DuplicateObject(human.l_hand, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.righthand = DuplicateObject(human.r_hand, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.pocket1 = DuplicateObject(human.l_store, perfectcopy = TRUE, sameloc = FALSE, newloc = null)
	save.pocket2 = DuplicateObject(human.r_store, perfectcopy = TRUE, sameloc = FALSE, newloc = null)

	if(istype(human.wear_suit, /obj/item/clothing/suit/storage))
		var/obj/item/clothing/suit/storage/storage_suit = human.wear_suit
		for(var/obj/item/I in storage_suit.pockets.contents)
			save.suit_contents += DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null)

	if(istype(human.head, /obj/item/clothing/head/helmet/marine))
		var/obj/item/clothing/head/helmet/marine/storage_helm = human.head
		for(var/obj/item/I in storage_helm.pockets.contents)
			save.helmet_contents += DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null)

	if(isstorage(human.s_store))
		var/obj/item/storage/pouch = human.s_store
		for(var/obj/item/I in pouch.contents)
			save.suitstorage_contents += DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null)

	if(isstorage(human.belt))
		var/obj/item/storage/pouch = human.belt
		for(var/obj/item/I in pouch.contents)
			save.belt_contents += DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null)

	if(isstorage(human.l_store))
		var/obj/item/storage/pouch = human.l_store
		for(var/obj/item/I in pouch.contents)
			save.pocket1_contents += DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null)

	if(isstorage(human.r_store))
		var/obj/item/storage/pouch = human.r_store
		for(var/obj/item/I in pouch.contents)
			save.pocket2_contents += DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null)

	save.tied_ckey = human.ckey || human.persistent_ckey || ""
	save.tied_human = human
	GLOB.simulacrum_playersaves[save.tied_ckey] = save

/proc/load_human(mob/living/carbon/human/human)
	if(!((human.ckey || human.persistent_ckey) in GLOB.simulacrum_playersaves))
		return

	var/datum/simulacrum_humansave/save = GLOB.simulacrum_playersaves[(human.ckey || human.persistent_ckey)]
	human.rejuvenate()
	for (var/obj/item/I in human)
		if(istype(I, /obj/item/implant))
			continue
		qdel(I)

	arm_equipment(human, /datum/equipment_preset/strip, FALSE, FALSE)
	human.equip_to_slot(DuplicateObject(save.boots, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_FEET)
	human.equip_to_slot(DuplicateObject(save.gloves, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_HANDS)
	human.equip_to_slot(DuplicateObject(save.uniform, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_BODY)
	human.equip_to_slot(DuplicateObject(save.suit, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_JACKET)
	human.equip_to_slot(DuplicateObject(save.glasses, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_EYES)
	human.equip_to_slot(DuplicateObject(save.mask, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_FACE)
	human.equip_to_slot(DuplicateObject(save.ear_main, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_L_EAR)
	human.equip_to_slot(DuplicateObject(save.ear_secondary, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_R_EAR)
	human.equip_to_slot(DuplicateObject(save.helmet, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_HEAD)
	human.equip_to_slot(DuplicateObject(save.suitstorage, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_J_STORE)
	human.equip_to_slot(DuplicateObject(save.idcard, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_ID)
	human.equip_to_slot(DuplicateObject(save.belt, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_WAIST)
	human.equip_to_slot(DuplicateObject(save.lefthand, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_L_HAND)
	human.equip_to_slot(DuplicateObject(save.righthand, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_R_HAND)
	human.equip_to_slot(DuplicateObject(save.pocket1, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_L_STORE)
	human.equip_to_slot(DuplicateObject(save.pocket2, perfectcopy = TRUE, sameloc = FALSE, newloc = null), WEAR_R_STORE)

	if(istype(human.wear_suit, /obj/item/clothing/suit/storage))
		var/obj/item/clothing/suit/storage/storage_suit = human.wear_suit
		for(var/obj/item/I as anything in save.suit_contents)
			storage_suit.pockets.handle_item_insertion(DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null), TRUE, human)

	if(istype(human.head, /obj/item/clothing/head/helmet/marine))
		var/obj/item/clothing/head/helmet/marine/storage_head = human.head
		for(var/obj/item/I as anything in save.helmet_contents)
			storage_head.pockets.handle_item_insertion(DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null), TRUE, human)

	if(isstorage(human.s_store))
		var/obj/item/storage/pouch = human.s_store
		for(var/obj/item/I2 in pouch.contents)
			qdel(I2)
		for(var/obj/item/I as anything in save.suitstorage_contents)
			pouch.handle_item_insertion(DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null), TRUE, human)

	if(isstorage(human.belt))
		var/obj/item/storage/pouch = human.belt
		for(var/obj/item/I2 in pouch.contents)
			qdel(I2)
		for(var/obj/item/I as anything in save.belt_contents)
			pouch.handle_item_insertion(DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null), TRUE, human)
		human.belt.icon_state = replacetext(human.belt.icon_state, "_g_g", "_g") // dumb check for a dumb case

	if(isstorage(human.l_store))
		var/obj/item/storage/pouch = human.l_store
		for(var/obj/item/I2 in pouch.contents)
			qdel(I2)
		for(var/obj/item/I as anything in save.pocket1_contents)
			pouch.handle_item_insertion(DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null), TRUE, human)

	if(isstorage(human.r_store))
		var/obj/item/storage/pouch = human.r_store
		for(var/obj/item/I2 in pouch.contents)
			qdel(I2)
		for(var/obj/item/I as anything in save.pocket2_contents)
			pouch.handle_item_insertion(DuplicateObject(I, perfectcopy = TRUE, sameloc = FALSE, newloc = null), TRUE, human)
