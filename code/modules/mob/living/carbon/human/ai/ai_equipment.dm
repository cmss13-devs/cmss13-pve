/// Every AI with a preset should appraise inventory on spawn
/datum/equipment_preset/load_preset(mob/living/carbon/human/new_human, randomise, count_participant, client/mob_client, show_job_gear)
	. = ..()
	var/datum/human_ai_brain/ai_brain = new_human.get_ai_brain()
	if(ai_brain)
		ai_brain.appraise_inventory()

/datum/equipment_preset/upp/sniper
	name = "UPP Marksman"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/upp/specialist
	assignment = JOB_UPP_SNIPER
	rank = JOB_UPP_SNIPER
	role_comm_title = "Snp"
	paygrades = list(PAY_SHORT_UE5 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/upp/sniper/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack/upp, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher, WEAR_IN_BACK) //1
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //1.33
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/snacks/upp, WEAR_IN_BACK) //1.66
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/UPP, WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp, WEAR_HEAD)
	//body
	var/obj/item/clothing/under/marine/veteran/UPP/UPP = new()
	new_human.equip_to_slot_or_del(UPP, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp/naval, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/UPP, WEAR_JACKET)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/green, WEAR_FACE)

	//body
	var/obj/item/clothing/accessory/storage/black_vest/W = new()
	UPP.attach_accessory(new_human, W)
	for(var/i in 1 to W.hold.storage_slots)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/svd, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/svd, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/svd, WEAR_IN_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/svd(new_human), WEAR_WAIST)

/datum/equipment_preset/other/freelancer/marksman
	name = "Freelancer (Marksman)"
	paygrades = list(PAY_SHORT_FL_WL = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Freelancer Marksman"
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_RUSSIAN, LANGUAGE_CHINESE, LANGUAGE_JAPANESE)
	skills = /datum/skills/freelancer/marksman

/datum/equipment_preset/other/freelancer/marksman/load_gear(mob/living/carbon/human/new_human)
	//generic clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/freelancer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/pmc, WEAR_HANDS)
	add_merc_helmet(new_human)
	//storage and specific stuff, they all get an ERT medpouch.
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	//storage items
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/upp, WEAR_R_STORE)
	add_weapon(/obj/item/weapon/gun/rifle/m4ra/marksman, /obj/item/ammo_magazine/rifle/m4ra, new_human, 0, 9)
	//backpack stuff
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
