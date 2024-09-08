
/datum/equipment_preset/astartes
	name = " Astartes | Ultramarine Tactical Brother"
	idtype = null
	languages = list(LANGUAGE_ENGLISH)
	faction = FACTION_USCM
	uses_special_name = TRUE
	skills = /datum/skills/commando/deathsquad
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/astartes/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_ASTARTES)
	new_human.body_type = "astartes"

/datum/equipment_preset/astartes/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/astartes, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/astartes, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/astartes/bodysuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/bolter/astartes, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)

/datum/equipment_preset/astartes/bloodraven
	name = " Astartes | Blood Raven Tactical Brother"

/datum/equipment_preset/astartes/bloodraven/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/astartes/bloodraven, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/bloodraven, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/astartes/bloodraven, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/astartes/bodysuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/bloodraven, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/bolter/astartes, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)

/datum/equipment_preset/astartes/ravenguard
	name = " Astartes | Raven Guard Tactical Brother"

/datum/equipment_preset/astartes/ravenguard/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/astartes/ravenguard, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/ravenguard, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/astartes/ravenguard, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/astartes/bodysuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/ravenguard, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/bolter/astartes, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)

/datum/equipment_preset/astartes/salamander
	name = " Astartes | Salamanders Tactical Brother"

/datum/equipment_preset/astartes/salamander/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/astartes/salamander, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/salamander, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/astartes/salamander, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/astartes/bodysuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/salamander, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/bolter/astartes, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)

/datum/equipment_preset/astartes/sergeant
	name = " Astartes | Ultramarine Sergeant"

/datum/equipment_preset/astartes/sergeant/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/astartes, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/astartes/sergeant, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/astartes, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/astartes/bodysuit, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/astartes/sergeant, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/bolter/astartes, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/bolter, WEAR_IN_BACK)
