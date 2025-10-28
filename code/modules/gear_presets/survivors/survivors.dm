/datum/equipment_preset/survivor
	name = JOB_SURVIVOR
	assignment = JOB_SURVIVOR
	rank = JOB_SURVIVOR

	skills = /datum/skills/civilian/survivor
	languages = list(LANGUAGE_ENGLISH)
	paygrades = list(PAY_SHORT_CIV = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/lanyard
	faction = FACTION_SURVIVOR
	faction_group = list(FACTION_SURVIVOR)
	origin_override = ORIGIN_CIVILIAN

	access = list(ACCESS_CIVILIAN_PUBLIC)

	minimap_icon = "surv"
	minimap_background = MINIMAP_ICON_BACKGROUND_CIVILIAN

	var/survivor_variant = CIVILIAN_SURVIVOR

	dress_under = list(
		/obj/item/clothing/under/liaison_suit/black,
		/obj/item/clothing/under/liaison_suit/blue,
		/obj/item/clothing/under/liaison_suit/brown,
		/obj/item/clothing/under/liaison_suit/corporate_formal,
		/obj/item/clothing/under/liaison_suit,
		/obj/item/clothing/under/liaison_suit/charcoal,
		/obj/item/clothing/under/liaison_suit/formal,
		/obj/item/clothing/under/liaison_suit/blazer,
		/obj/item/clothing/under/liaison_suit/suspenders,
		/obj/item/clothing/under/blackskirt,
		/obj/item/clothing/under/suit_jacket/trainee,
		/obj/item/clothing/under/liaison_suit/ivy,
		/obj/item/clothing/under/liaison_suit/orange,
		/obj/item/clothing/under/liaison_suit/field,
		/obj/item/clothing/under/colonist/workwear,
		/obj/item/clothing/under/colonist/workwear/khaki,
		/obj/item/clothing/under/colonist/workwear/pink,
		/obj/item/clothing/under/colonist/workwear/green,
	)
	dress_over = list(
		/obj/item/clothing/suit/storage/jacket/marine/corporate/black,
		/obj/item/clothing/suit/storage/jacket/marine/corporate,
		/obj/item/clothing/suit/storage/jacket/marine/corporate/brown,
		/obj/item/clothing/suit/storage/jacket/marine/corporate/blue,
		/obj/item/clothing/suit/storage/jacket/marine/corporate/black,
		/obj/item/clothing/suit/storage/jacket/marine/bomber/grey,
		/obj/item/clothing/suit/storage/jacket/marine/bomber/red,
		/obj/item/clothing/suit/storage/jacket/marine/bomber,
		/obj/item/clothing/suit/storage/bomber,
		/obj/item/clothing/suit/storage/bomber/alt,
		/obj/item/clothing/suit/storage/snow_suit/liaison,
		/obj/item/clothing/suit/storage/labcoat,
		/obj/item/clothing/suit/storage/jacket/marine/vest/grey,
		/obj/item/clothing/suit/storage/jacket/marine/vest,
		/obj/item/clothing/suit/storage/jacket/marine/vest/tan,
		/obj/item/clothing/suit/storage/webbing,
	)
	dress_extra = list(
		/obj/item/clothing/accessory/black,
		/obj/item/clothing/accessory/red,
		/obj/item/clothing/accessory/purple,
		/obj/item/clothing/accessory/blue,
		/obj/item/clothing/accessory/green,
		/obj/item/clothing/accessory/gold,
		/obj/item/clothing/accessory/horrible,
		/obj/item/clothing/glasses/sunglasses/big,
		/obj/item/clothing/glasses/sunglasses/aviator,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/glasses/sunglasses/prescription,
		/obj/item/clothing/glasses/regular/hipster,
	)
	dress_gloves = list(
		/obj/item/clothing/gloves/black,
		/obj/item/clothing/gloves/marine/dress,
	)
	dress_shoes = list(
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/shoes/laceup/brown,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/shoes/marine/civilian,
	)
	dress_hat = list(
		/obj/item/clothing/head/fedora,
		/obj/item/clothing/head/beret/cm/black/civilian,
		/obj/item/clothing/head/beret/cm/white/civilian,
	)

/datum/equipment_preset/survivor/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(MALE, FEMALE)
	var/datum/preferences/A = new
	A.randomize_appearance(new_human)
	var/random_name = capitalize(pick(new_human.gender == MALE ? GLOB.first_names_male : GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(21,45)

/datum/equipment_preset/survivor/load_gear(mob/living/carbon/human/new_human) // Essentially where you will put the most essential piece of kit you want survivors to spawn with.
	add_random_survivor_equipment(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/med_small_stack(new_human), WEAR_IN_BACK)
	add_survivor_weapon_pistol(new_human)

/datum/equipment_preset/survivor/load_id(mob/living/carbon/human/new_human, client/mob_client)
	var/obj/item/clothing/under/uniform = new_human.w_uniform
	if(istype(uniform))
		uniform.has_sensor = UNIFORM_HAS_SENSORS
		uniform.sensor_faction = FACTION_COLONIST
	return ..()

/*
From map_config.dm

Standard Survivors :	/datum/equipment_preset/survivor/scientist,
						/datum/equipment_preset/survivor/doctor,
						/datum/equipment_preset/survivor/chef,
						/datum/equipment_preset/survivor/chaplain,
						/datum/equipment_preset/survivor/miner,
						/datum/equipment_preset/survivor/colonial_marshal,
						/datum/equipment_preset/survivor/engineer,
						/datum/equipment_preset/survivor/security

*/
