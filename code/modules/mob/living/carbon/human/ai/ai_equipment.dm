/datum/equipment_preset/clf/soldier/ai
	name = "CLF Soldier (AI)"

/datum/equipment_preset/clf/soldier/ai/load_gear(mob/living/carbon/human/new_human)
	var/obj/item/clothing/under/colonist/clf/jumpsuit = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	jumpsuit.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(jumpsuit, WEAR_BODY)
	spawn_rebel_suit(new_human)
	spawn_rebel_helmet(new_human)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	//new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/full/random(new_human), WEAR_WAIST)
	//new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/dual_tube/cmb(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	if(prob(50))
		spawn_rebel_smg(new_human)
	else
		spawn_rebel_rifle(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)

/datum/equipment_preset/clf/soldier/ai/load_preset(mob/living/carbon/human/new_human, randomise, count_participant, client/mob_client, show_job_gear)
	. = ..()
	if(new_human.ai_brain)
		new_human.ai_brain.appraise_inventory()
