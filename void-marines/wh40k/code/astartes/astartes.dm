// --- Species --- \\

#define SPECIES_ASTARTES "Astartes"

/datum/species/human/astartes
	name = SPECIES_ASTARTES
	name_plural = "Astartes"

	brute_mod = 0.7
	burn_mod = 0.7

	unarmed_type = /datum/unarmed_attack/punch/astartes
	icon_template = 'void-marines/wh40k/icons/species/r_template_tall.dmi'
	icobase = 'void-marines/wh40k/icons/species/r_astartes.dmi'
	deform = 'void-marines/wh40k/icons/species/r_astartes.dmi'
	slowdown = -0.3 //Increased move speed
	total_health = 200
	darksight = 5
	special_body_types = FALSE
	uses_skin_color = FALSE
	mob_inherent_traits = list(
		TRAIT_SUPER_STRONG
	)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/astachaos,
		/mob/living/carbon/human/proc/astacharge,
		/mob/living/carbon/human/proc/astacrush,
		/mob/living/carbon/human/proc/astadamage,
		/mob/living/carbon/human/proc/astadiescum,
		/mob/living/carbon/human/proc/astaeatboltgun,
		/mob/living/carbon/human/proc/astafaithshield,
		/mob/living/carbon/human/proc/astafallback,
		/mob/living/carbon/human/proc/astaforglory,
		/mob/living/carbon/human/proc/astagrenades,
		/mob/living/carbon/human/proc/astakill,
		/mob/living/carbon/human/proc/astanonestopus,
		/mob/living/carbon/human/proc/astaourwrath,
		/mob/living/carbon/human/proc/astaready,
		/mob/living/carbon/human/proc/astatoglory,
		/mob/living/carbon/human/proc/astaxenos
	)

/mob/living/carbon/human/astartes
	gender = MALE
	blood_volume = 860
	body_type = "astartes"

/mob/living/carbon/human/astartes/Initialize(mapload)
	. = ..(mapload, new_species = SPECIES_ASTARTES)

/datum/unarmed_attack/punch/astartes
	damage = 25

/datum/equipment_preset/astartes
	name = "Ultramarine"
	idtype = null //No IDs for Yautja!
	languages = list(LANGUAGE_ENGLISH)
	rank = "Battle Brother"
	faction = FACTION_USCM
	uses_special_name = TRUE
	skills = /datum/skills/yautja/warrior
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/astartes/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_ASTARTES)
	new_human.body_type = "astartes"

/datum/equipment_preset/astartes/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/astartes, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/super, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/super, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/super, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/phosphorus, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector, WEAR_IN_BACK)

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
