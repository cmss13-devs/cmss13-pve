/datum/equipment_preset/wy
	name = "WY"
	paygrades = list(PAY_SHORT_WYC1 = JOB_PLAYTIME_TIER_0)

	faction = FACTION_WY
	rank = FACTION_WY
	idtype = /obj/item/card/id/silver
	faction_group = FACTION_LIST_WY
	skills = /datum/skills/civilian
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	var/headset_type = /obj/item/device/radio/headset/distress/WY

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

/datum/equipment_preset/wy/New()
	. = ..()
	access += get_access(ACCESS_LIST_WY_BASE)

/datum/equipment_preset/wy/load_id(mob/living/carbon/human/new_human)
	. = ..()

/datum/equipment_preset/wy/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/ivy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	. = ..()

