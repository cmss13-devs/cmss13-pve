///*****************************LV-522 Force Recon Survivors*******************************************************/
//Nanu told me to put them here so they dont clutter up survivors.dm
/datum/equipment_preset/survivor/forecon
	paygrade = "ME5"
	idtype = /obj/item/card/id/dogtag
	role_comm_title = "FORECON"
	rank = JOB_SURVIVOR
	faction_group = list(FACTION_USCM, FACTION_SURVIVOR)
	flags = EQUIPMENT_PRESET_START_OF_ROUND
	access = list(
		ACCESS_CIVILIAN_PUBLIC,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_CIVILIAN_LOGISTICS,
	)

/datum/equipment_preset/survivor/forecon/load_gear(mob/living/carbon/human/new_human)
	var/obj/item/clothing/under/marine = new()
	var/obj/item/clothing/accessory/storage/droppouch/pouch = new()
	var/obj/item/clothing/accessory/ranks/marine/e5/pin = new()
	var/obj/item/clothing/accessory/patch/patch_uscm = new()
	var/obj/item/clothing/accessory/patch/forecon/patch_forecon = new()
	uniform.attach_accessory(new_human,pouch)
	uniform.attach_accessory(new_human,patch_uscm)
	uniform.attach_accessory(new_human,pin)
	uniform.attach_accessory(new_human,patch_forecon)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/forecon(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/facepaint/sniper(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/MRE(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/jungle/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/sof(new_human), WEAR_L_EAR)
	GLOB.character_traits[/datum/character_trait/skills/spotter].apply_trait(new_human)

/datum/equipment_preset/survivor/forecon/add_survivor_weapon_security(mob/living/carbon/human/new_human)
	return

/datum/equipment_preset/survivor/forecon/proc/add_forecon_weapon(mob/living/carbon/human/new_human)
	var/random_gun = rand(1,3)
	switch(random_gun)
		if(1 , 2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_L_HAND)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1(new_human), WEAR_IN_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m4ra/pve(new_human), WEAR_L_HAND)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/pve(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/pve(new_human), WEAR_IN_BACK)

/datum/equipment_preset/survivor/forecon/add_survivor_weapon_pistol(mob/living/carbon/human/new_human)
	return

/datum/equipment_preset/survivor/forecon/proc/add_forecon_weapon_pistol(mob/living/carbon/human/new_human)
	var/random_pistol = rand(1,4)
	switch(random_pistol)
		if(1 , 2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3(new_human), WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/m1911/socom(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BELT)
		if(3 , 4)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt(new_human), WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector(new_human),WEAR_IN_WAIST)

/datum/equipment_preset/survivor/forecon/add_random_survivor_equipment(mob/living/carbon/human/new_human)
	return

/datum/equipment_preset/survivor/forecon/proc/add_forecon_equipment(mob/living/carbon/human/new_human)
	var/random_equipment = rand(1,3)
	switch(random_equipment)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/device/walkman(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/device/cassette_tape/indie(new_human), WEAR_IN_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/toy/deck(new_human), WEAR_IN_ACCESSORY)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/lucky_strikes(new_human), WEAR_IN_ACCESSORY)

/datum/equipment_preset/survivor/forecon/proc/spawn_random_headgear(mob/living/carbon/human/new_human)
	var/i = rand(1,10)
	switch(i)
		if (1 , 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)
		if (3 , 4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/boonie(new_human), WEAR_HEAD)
		if (5 , 6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/durag(new_human), WEAR_HEAD)
		if (7 , 8)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/boonie/tan(new_human), WEAR_HEAD)
		if (9)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine(new_human), WEAR_HEAD)


