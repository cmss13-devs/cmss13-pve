/// Every AI with a preset should appraise inventory on spawn
/datum/equipment_preset/load_preset(mob/living/carbon/human/new_human, randomise, count_participant, client/mob_client, show_job_gear)
	. = ..()
	var/datum/human_ai_brain/ai_brain = new_human.get_ai_brain()
	if(ai_brain)
		ai_brain.appraise_inventory()

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

	//new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt(new_human), WEAR_WAIST)
	//new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank(new_human), WEAR_IN_BELT)
	//new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer(new_human), WEAR_BACK)

	//new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt(new_human), WEAR_WAIST)
	//new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rocket/anti_tank(new_human), WEAR_IN_BELT)
	//new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/launcher/rocket/anti_tank(new_human), WEAR_R_HAND)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	if(prob(50))
		spawn_rebel_smg(new_human)
	else
		spawn_rebel_rifle(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)

/datum/equipment_preset/clf/soldier/ai/shotgunner
	name = "CLF Shotgunner (AI)"

/datum/equipment_preset/clf/soldier/ai/shotgunner/load_gear(mob/living/carbon/human/new_human)
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

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/full/random(new_human), WEAR_WAIST)
	spawn_rebel_shotgun(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)

/datum/equipment_preset/clf/specialist/ai
	name = "CLF Specialist (AI)"

/datum/equipment_preset/clf/specialist/ai/load_gear(mob/living/carbon/human/new_human)

	//jumpsuit and their webbing
	var/obj/item/clothing/under/colonist/clf/CLF = new()
	var/obj/item/clothing/accessory/storage/webbing/five_slots/W = new()
	CLF.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(CLF, WEAR_BODY)
	//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/militia(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/swat(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/combat(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/vp70(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/cct(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	//standard backpack stuff
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar(new_human), WEAR_IN_BACK)

	//storage items
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/C4(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	new_human.put_in_active_hand(new /obj/item/weapon/gun/launcher/rocket/anti_tank/disposable(new_human))

/datum/equipment_preset/clf/sniper
	name = "CLF Sniper (AI) (Basira)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_CLF
	rank = JOB_CLF
	role_comm_title = "SNP"
	skills = /datum/skills/clf/sniper

/datum/equipment_preset/clf/sniper/load_gear(mob/living/carbon/human/new_human)
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

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/boltaction(new_human), WEAR_WAIST)
	new_human.put_in_active_hand(new /obj/item/weapon/gun/boltaction(new_human))

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)

/datum/equipment_preset/clf/sniper/svd
	name = "CLF Sniper (AI) (SVD)"

/datum/equipment_preset/clf/sniper/svd/load_gear(mob/living/carbon/human/new_human)
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

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/svd(new_human), WEAR_WAIST)
	new_human.put_in_active_hand(new /obj/item/weapon/gun/rifle/sniper/svd(new_human))

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
