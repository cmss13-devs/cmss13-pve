/datum/equipment_preset/redneck
	name = "Angry Redneck"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_COLONIST
	rank = JOB_COLONIST
	faction = FACTION_COLONIST
	languages = list()
	access = list(ACCESS_CIVILIAN_PUBLIC)
	skills = /datum/skills/clf
	idtype = /obj/item/card/id/lanyard

/datum/equipment_preset/redneck/basic
	name = "Angry Redneck (Basic)"
	assignment = "Civilian"
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/redneck/basic/load_gear(mob/living/carbon/human/new_human)

	var/random_clothing = rand(1,5)
	switch(random_clothing)
		if(1) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/soft/trucker(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/brown(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/hybrisa/civilian_vest(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/five_slots(new_human), WEAR_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack(new_human), WEAR_BACK)

		if(2) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/red(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hazardvest/kelland_mining(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/tshirt/w_br(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/industrial(new_human), WEAR_BACK)

		if(3) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/militia/bucket(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/prison_boiler(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/five_slots(new_human), WEAR_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/militia/partial(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/orange(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/norm(new_human), WEAR_BACK)

		if(4) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/welding(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/wy_davisone(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/hybrisa/civilian_vest(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/brown(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/eng(new_human), WEAR_BACK)

		if(5) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/soft/trucker/red(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/darkred(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(new_human), WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(new_human), WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/norm(new_human), WEAR_BACK)

	var/random_gear = rand(1,5)
	switch(random_gear)
		if(1) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/nailgun(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_BACK)

			new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_ACCESSORY)

		if(2) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/p90(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p90(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p90(new_human), WEAR_IN_BACK)

		if(3) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/skorpion(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/skorpion(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/skorpion(new_human), WEAR_IN_BACK)

		if(4) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/dual_tube/cmb(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)

		if(5) // Colonist
			new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/five_slots(new_human), WEAR_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_ACCESSORY)
			new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_ACCESSORY)

			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/nailgun(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_BACK)
	..()
