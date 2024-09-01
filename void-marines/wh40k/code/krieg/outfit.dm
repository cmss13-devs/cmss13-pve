/datum/equipment_preset/krieg
	name = "Kriegsman | Lasgun"
	idtype = null //No IDs for him!
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_USCM
	uses_special_name = TRUE
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/krieg/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/krieger, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/krieg, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/warhammer, WEAR_WAIST)
	// uniform
	var/obj/item/clothing/suit/armor/storage/krieger/armor = new()
	new_human.equip_to_slot_or_del(armor, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/warhammer/lucius, WEAR_R_HAND)
/*
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/marsoc, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/super, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/super, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/super, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/sof, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/marsoc, WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/sof, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot, WEAR_IN_HELMET)
	//uniform
	var/obj/item/clothing/under/marine/veteran/marsoc/M = new()
	var/obj/item/clothing/accessory/storage/black_vest/W = new()
	M.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(M, WEAR_BODY)
	for(var/i in 1 to W.hold.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot, WEAR_IN_ACCESSORY)
	//jacket
	var/obj/item/clothing/suit/storage/marine/sof/armor = new()
	new_human.equip_to_slot_or_del(armor, WEAR_JACKET)
	for(var/i in 1 to armor.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/xm40/heap, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41a/elite/xm40, WEAR_J_STORE)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/combat/marsoc, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/socmed/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/full, WEAR_R_STORE)
*/

/datum/equipment_preset/krieg/grenadier
	name = "Kriegsman | Grenadier"
	idtype = null //No IDs for him!
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_USCM
	uses_special_name = TRUE
	skills = /datum/skills/SL
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/krieg/grenadier/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/krieger, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/krieg, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/warhammer, WEAR_WAIST)
	// uniform
	var/obj/item/clothing/suit/armor/storage/krieger/grenadier/armor = new()
	new_human.equip_to_slot_or_del(armor, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg/grenadier, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg/grenadier, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/warhammer/lucius, WEAR_R_HAND)

/datum/equipment_preset/krieg/watchmaster
	name = "Kriegsman | Watchmaster"
	idtype = null //No IDs for him!
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_USCM
	uses_special_name = TRUE
	skills = /datum/skills/SL
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/krieg/watchmaster/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/krieger, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/krieg, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/warhammer/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/warhammer/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/warhammer/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/warhammer/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/warhammer, WEAR_WAIST)
	// uniform
	var/obj/item/clothing/suit/armor/storage/krieger/armor = new()
	new_human.equip_to_slot_or_del(armor, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet/sgt, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/warhammer/bolter/pistol, WEAR_R_HAND)

/datum/equipment_preset/krieg/commissar
	name = "Commissar"

/datum/equipment_preset/krieg/commissar/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/krieg, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/warhammer/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/warhammer/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/warhammer/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/warhammer/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/warhammer, WEAR_WAIST)
	// uniform
	var/obj/item/clothing/suit/armor/storage/krieger/commissar/armor = new()
	new_human.equip_to_slot_or_del(armor, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform/commissar, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg, WEAR_FEET)
//	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet/commissar, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/warhammer/bolter/pistol, WEAR_R_HAND)

//
