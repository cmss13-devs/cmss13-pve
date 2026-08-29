//A special...specialist vendor with actual inventory instead of points. We're old school here. Could maybe even rig it for tokens in the future.
/obj/structure/machinery/cm_vending/sorted/spec/uscm_ground
	name = "\improper ColMarTech Specialist Field Testing Gear Rack"
	desc = "An automated gear rack for Outpost Weapons Specialists. Has a small selection of equipment meant for field testing or limited use."
	icon_state = "spec_gear"
	vend_flags = VEND_TO_HAND|VEND_LIMITED_INVENTORY|VEND_USE_VENDOR_FLAGS
	vendor_role = list(JOB_SQUAD_SPECIALIST)
	req_access = list(ACCESS_MARINE_SPECPREP)

/obj/structure/machinery/cm_vending/sorted/spec/uscm_ground/populate_product_list()
	listed_products = list(
		list("WEAPONS SPECIALIST SETS", -1, null, null),
		list("B18 Future Warrior Set", 1, /obj/item/storage/box/spec/B18/outpost, VENDOR_ITEM_RECOMMENDED),
		list("Sonic Harpoon Operator Set", 1, /obj/item/storage/box/spec/sharp_operator, VENDOR_ITEM_REGULAR),
	)
