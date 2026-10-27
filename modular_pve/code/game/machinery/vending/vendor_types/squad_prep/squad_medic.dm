// Chemical vendor

GLOBAL_LIST_INIT(cm_vending_chemical_medic, list(

		list("ESSENTIAL MEDICATION (CHOOSE 1)", 0, null, null, null),
		list("Pill Bottle (Imidazoline-Alkysine)", 0, /obj/item/storage/pill_bottle/imialk, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),
		list("Liquid Bottle (Imidazoline-Alkysine)", 0, /obj/item/reagent_container/glass/bottle/imialk, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("PILL BOTTLES", 0, null, null, null),
		list("Pill Bottle (Meralyne-Bicardine)", 60, /obj/item/storage/pill_bottle/merabica, null, VENDOR_ITEM_REGULAR),
		list("Pill Bottle (Kelotane-Dermaline)", 60, /obj/item/storage/pill_bottle/keloderm, null, VENDOR_ITEM_REGULAR),
		list("Pill Bottle (Nitrogen-Water)", 30, /obj/item/storage/pill_bottle/nitrogenwater, null, VENDOR_ITEM_REGULAR),
		list("Pill Bottle (Dexalin+)", 30, /obj/item/storage/pill_bottle/dexalinplus, null, VENDOR_ITEM_REGULAR),
		list("Pill Bottle (Iron)", 30, /obj/item/storage/pill_bottle/iron, null, VENDOR_ITEM_REGULAR),

		list("LIQUID BOTTLES", 0, null, null, null),
		list("Liquid Bottle (Meralyne-Bicardine)", 40, /obj/item/reagent_container/glass/bottle/merabica, null, VENDOR_ITEM_REGULAR),
		list("Liquid Bottle (Kelotane-Dermaline)", 40, /obj/item/reagent_container/glass/bottle/keloderm, null, VENDOR_ITEM_REGULAR),
		list("Liquid Bottle (Dexalin+)", 30, /obj/item/reagent_container/glass/bottle/dexalinplus, null, VENDOR_ITEM_REGULAR),

		list("INJECTORS", 0, null, null, null),
		list("Smart Refill Tank", 40, /obj/item/reagent_container/glass/minitank, null, VENDOR_ITEM_REGULAR),
	))

/obj/structure/machinery/cm_vending/gear/medic_chemical
	name = "\improper ColMarTech Squad Medical Chemical Rack"
	desc = "An automated gear rack for specialized chemicals for the hospital corpsman."
	icon = 'modular_pve/icons/obj/structures/machinery/vending.dmi'
	icon_state = "med_chem"
	show_points = TRUE
	use_snowflake_points = TRUE
	vendor_role = list(JOB_SQUAD_MEDIC)
	req_access = list(ACCESS_MARINE_MEDPREP)

/obj/structure/machinery/cm_vending/gear/medic_chemical/get_listed_products(mob/user)
	return GLOB.cm_vending_chemical_medic
