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

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/full/random/reasonable(new_human), WEAR_WAIST)
	spawn_rebel_shotgun(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)

/datum/equipment_preset/clf/specialist/ai
	name = "CLF Specialist - SADAR (AI)"

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

/datum/equipment_preset/clf/specialist/ai/flamer
	name = "CLF Specialist - Flamer (AI)"

/datum/equipment_preset/clf/specialist/ai/flamer/load_gear(mob/living/carbon/human/new_human)

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
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/cct(new_human), WEAR_L_EAR)
	//standard backpack stuff
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar(new_human), WEAR_IN_BACK)

	//storage items
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flamertank/weak(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	new_human.put_in_active_hand(new /obj/item/weapon/gun/flamer/weak(new_human))

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

/datum/equipment_preset/clf/engineer/ai
	name = "CLF Engineer (AI)"

/datum/equipment_preset/clf/engineer/ai/load_gear(mob/living/carbon/human/new_human)

	var/obj/item/clothing/under/colonist/clf/M = new()
	var/obj/item/clothing/accessory/storage/webbing/W = new()
	M.attach_accessory(new_human, W)
	new_human.equip_to_slot_or_del(M, WEAR_BODY)

	spawn_rebel_suit(new_human)
	spawn_rebel_shoes(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/meson, WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/yellow, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/welding, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF/cct, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/bayonet/upp(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/ert, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic/breaching_charge, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid, WEAR_R_STORE)

	spawn_rebel_weapon(new_human)

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


/datum/equipment_preset/other/freelancer/standard/rifleman
	name = "Freelancer (Rifleman)"

/datum/equipment_preset/other/freelancer/standard/rifleman/load_gear(mob/living/carbon/human/new_human)
	//generic clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/freelancer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/pmc, WEAR_HANDS)
	spawn_merc_helmet(new_human)
	//storage and specific stuff, they all get an ERT medpouch.
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	//storage items
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/upp, WEAR_R_STORE)
	spawn_merc_weapon(new_human)
	//backpack stuff
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)

/datum/equipment_preset/other/freelancer/standard/shotgunner
	name = "Freelancer (Shotgunner)"

/datum/equipment_preset/other/freelancer/standard/shotgunner/load_gear(mob/living/carbon/human/new_human)
	//generic clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/freelancer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/pmc, WEAR_HANDS)
	spawn_merc_helmet(new_human)
	//storage and specific stuff, they all get an ERT medpouch.
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	//storage items
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	spawn_weapon(/obj/item/weapon/gun/shotgun/type23, pick(GLOB.shotgun_handfuls_8g_reasonable), new_human, 0, 14) //shotgunner mini-spec
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/ied_incendiary, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/custom/ied_incendiary, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb, WEAR_IN_BACK)

/datum/equipment_preset/other/freelancer/standard/machinegunner
	name = "Freelancer (Machinegunner)"

/datum/equipment_preset/other/freelancer/standard/machinegunner/load_gear(mob/living/carbon/human/new_human)
	//generic clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/freelancer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/pmc, WEAR_HANDS)
	spawn_merc_helmet(new_human)
	//storage and specific stuff, they all get an ERT medpouch.
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	spawn_merc_weapon(new_human,1,6)
	spawn_weapon(/obj/item/weapon/gun/rifle/lmg, /obj/item/ammo_magazine/hpr_box, new_human, 0, 5) //HPR mini-spec
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/hpr_box/holo_target, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/hpr_box/holo_target, WEAR_IN_BACK)

/datum/equipment_preset/other/freelancer/medic/ai
	name = "Freelancer (Medic) (AI)"

/datum/equipment_preset/other/freelancer/medic/ai/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/freelancer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/pmc, WEAR_HANDS)
	spawn_merc_helmet(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/attachments(new_human), WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/shotgun/large, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/full/with_suture_and_graft, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_BELT)
	//stuff in backpack
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/smoke, WEAR_IN_BACK)
	//gun
	spawn_merc_shotgun(new_human)

/datum/equipment_preset/other/freelancer/leader/ai
	name = "Freelancer (Leader) (AI)"

/datum/equipment_preset/other/freelancer/leader/ai/load_gear(mob/living/carbon/human/new_human)
	//No random helmet, so that it's more clear that he's the leader
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/freelancer, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/freelancer/beret, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran, WEAR_HANDS)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)

	spawn_weapon(/obj/item/weapon/gun/rifle/m41aMK1, /obj/item/ammo_magazine/rifle/m41aMK1, new_human, 0, 9)
	spawn_merc_weapon(new_human,1,2)

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
	spawn_merc_helmet(new_human)
	//storage and specific stuff, they all get an ERT medpouch.
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/dutch, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert, WEAR_L_STORE)
	//storage items
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/upp, WEAR_R_STORE)
	spawn_weapon(/obj/item/weapon/gun/rifle/m49a/marksman, /obj/item/ammo_magazine/rifle/m49a, new_human, 0, 9)
	//backpack stuff
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response, WEAR_IN_BACK)
