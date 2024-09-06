/datum/equipment_preset/krieg
	name = "Kriegsman | Lasgun"
	idtype = null //No IDs for him!
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_USCM
	uses_special_name = TRUE
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/krieg/load_name(mob/living/carbon/human/new_human, randomise)
	var/new_name = "Guardsman [rand(1, 9)]-[rand(1, 9)]-[rand(1, 9)]" // 4-8-3, 9-1-1, 1-2-3 etc.
	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/krieg/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/krieger, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/krieg, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lascell, WEAR_IN_BACK)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/chainsword, WEAR_WAIST)
	// uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/storage/krieger, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/lucius, WEAR_R_HAND)

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
	new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/chainsword, WEAR_WAIST)
	// uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/storage/krieger/grenadier, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg/grenadier, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg/grenadier, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/lasgun/lucius, WEAR_R_HAND)

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
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/chainsword, WEAR_WAIST)
	// uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/storage/krieger, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/krieghelmet/sgt, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/bolter/pistol, WEAR_R_HAND)

/datum/equipment_preset/krieg/commissar
	name = "Commissar"

/datum/equipment_preset/krieg/commissar/load_name(mob/living/carbon/human/new_human, randomise, client/mob_client)
	editappearplayer(new_human)

/datum/equipment_preset/krieg/commissar/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/krieg, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter/pistol, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/chainsword, WEAR_WAIST)
	// uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/krieg_uniform/commissar, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/storage/commissar, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/krieg, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/krieg, WEAR_FEET)
//	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/krieg, WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/commissar, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/bolter/pistol, WEAR_R_HAND)

