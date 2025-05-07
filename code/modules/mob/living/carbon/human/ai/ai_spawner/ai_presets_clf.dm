/datum/human_ai_equipment_preset/clf
	faction = "Insurrectionists"

/datum/equipment_preset/rebel/handgunner
	name = "UA Rebel, Soldier (Pistol)"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/rebel/handgunner/get_assignment(mob/living/carbon/human/new_human)
	return "Rifleman"

/datum/equipment_preset/rebel/handgunner/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/rebel_ua(new_human), WEAR_L_EAR)
	if(prob(45))
		add_facewrap(new_human)
	//uniform
	add_rebel_ua_uniform(new_human)
	//jacket
	if(prob(20))
		add_rebel_ua_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
	//limbs
	add_rebel_ua_shoes(new_human)
	if(prob(35))
		add_rebel_gloves(new_human)

	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)

/datum/equipment_preset/clf/handgunner
	name = "TWE Rebel, Soldier (Pistol)"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/pfc
	idtype = /obj/item/card/id/dogtag
	assignment = "Revolutionary Guardsman"

/datum/equipment_preset/clf/handgunner/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE) + list(ACCESS_CLF_ARMORY)

/datum/equipment_preset/clf/handgunner/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/rebel_twe(new_human), WEAR_L_EAR)
	if(prob(65))
		add_facewrap(new_human)
	//uniform
	add_rebel_twe_uniform(new_human)
	//jacket
	if(prob(20))
		add_rebel_twe_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_WAIST)
	//limbs
	add_rebel_twe_shoes(new_human)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)

/datum/human_ai_equipment_preset/clf/ua/handgunner
	name = "UA Rebel, Soldier (Pistol)"
	desc = "Will only be equipped with a VP70 pistol."
	path = /datum/equipment_preset/rebel/handgunner

/datum/human_ai_equipment_preset/clf/handgunner
	name = "TWE Rebel, Soldier (Pistol)"
	desc = "Armed with a L54 pistol.."
	path = /datum/equipment_preset/clf/handgunner

/datum/human_ai_equipment_preset/clf/soldier
	name = "TWE Rebel, Soldier (Rifle)"
	desc = "Armed with either a Bizon SMG, MAR variant rifle and very rarely an F90 rifle."
	path = /datum/equipment_preset/clf/soldier

/datum/human_ai_equipment_preset/clf/shotgunner
	name = "TWE Rebel, Soldier (Shotgunner)"
	desc = "Armed with an HG-37 shotgun."
	path = /datum/equipment_preset/clf/soldier/shotgun

/datum/human_ai_equipment_preset/clf/flamer
	name = "TWE Rebel, Soldier (Incinerator)"
	desc = "Armed with a M240A1 incinerator unit."
	path = /datum/equipment_preset/clf/soldier/flamer

/datum/human_ai_equipment_preset/clf/engineer
	name = "TWE Rebel, Anti-Tank"
	desc = "Armed with a few M83 SADARs."
	path = /datum/equipment_preset/clf/engineer

/datum/human_ai_equipment_preset/clf/medic
	name = "TWE Rebel Medic"
	desc = "Armed with either a Bizon SMG, L54 pistol or a HG-45 pistol."
	path = /datum/equipment_preset/clf/medic

/datum/human_ai_equipment_preset/clf/multipurpose_synth
	name = "TWE Rebel Multipurpose Synthetic"
	desc = "Tanky support unit. The multipurpose synth is a neutered version of the combat synth that can’t use firearms. Combat synth recommended to be used instead."
	path = /datum/equipment_preset/clf/synth

/datum/human_ai_equipment_preset/clf/leader
	name = "TWE Rebel Leader"
	desc = "Armed with either a MAR variant or a F90."
	path = /datum/equipment_preset/clf/leader

/datum/human_ai_equipment_preset/clf/cell_commander
	name = "TWE Rebel Cell Commander"
	desc = "Armed with a M56B smartgun."
	path = /datum/equipment_preset/clf/commander

//UA Rebels

/datum/human_ai_equipment_preset/clf/ua/soldier
	name = "UA Rebel, Soldier (Rifle)"
	desc = "Armed with a M20A, L42A or very rarely a M41A. Even more rarely, will only be equipped with a M1911, M4A3 or VP70."
	path = /datum/equipment_preset/rebel/soldier

/datum/human_ai_equipment_preset/clf/ua/shotgunner
	name = "UA Rebel, Soldier (Shotgunner)"
	desc = "Armed with either a M120 combat shotgun or a Ithaca-37 pump-shotgun."
	path = /datum/equipment_preset/rebel/soldier/shotgun

/datum/human_ai_equipment_preset/clf/ua/flamer
	name = "UA Rebel, Soldier (Incinerator)"
	desc = "Armed with a M240A1 incinerator unit."
	path = /datum/equipment_preset/rebel/soldier/flamer

/datum/human_ai_equipment_preset/clf/ua/engineer
	name = "UA Rebel, Anti-Tank"
	desc = "Armed with a few M83 SADARs."
	path = /datum/equipment_preset/rebel/at

/datum/human_ai_equipment_preset/clf/ua/medic
	name = "UA Rebel Medic"
	desc = "Armed with either a M1911, M4A3 or VP70. Rarely, will be armed with a M20A, L42A or very rarely a M41A"
	path = /datum/equipment_preset/rebel/medic

/datum/human_ai_equipment_preset/clf/ua/leader
	name = "UA Rebel Leader"
	desc = "Armed with a M41A."
	path = /datum/equipment_preset/rebel/soldier/leader

/datum/human_ai_equipment_preset/clf/ua/cell_commander
	name = "UA Rebel Cell Commander"
	desc = "Armed with a M56A2 smartgun."
	path = /datum/equipment_preset/rebel/commander

