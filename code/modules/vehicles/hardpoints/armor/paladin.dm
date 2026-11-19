/obj/item/hardpoint/armor/paladin
	name = "\improper Paladin Armor"
	desc = "Offers a good balance of protection for the vehicle from both explosive and ballistic sources of damage."

	icon_state = "paladin_armor"
	disp_icon = "tank"
	disp_icon_state = "paladin_armor"

	type_multipliers = list(
		"bullet" = 0.75, //Needed so SADARs still don't insta-kill them
		"explosive" = 0.5,
		"all" = 0.9
	)
