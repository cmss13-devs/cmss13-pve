/obj/item/clothing/head/soft
	name = "cargo cap"
	desc = "It's a baseball hat in a tasteless yellow color."
	icon_state = "cargosoft"
	flags_inventory = COVEREYES
	item_state = "helmet"
	var/cap_color = "cargo"
	var/flipped = 0
	siemens_coefficient = 0.9
	flags_armor_protection = 0

/obj/item/clothing/head/soft/dropped()
	icon_state = "[cap_color]soft"
	flipped=0
	..()

/obj/item/clothing/head/soft/verb/flip()
	set category = "Object"
	set name = "Flip cap"
	set src in usr
	if(!usr.is_mob_incapacitated())
		src.flipped = !src.flipped
		if(src.flipped)
			icon_state = "[cap_color]soft_flipped"
			to_chat(usr, "You flip the hat backwards.")
		else
			icon_state = "[cap_color]soft"
			to_chat(usr, "You flip the hat back in normal position.")
		update_clothing_icon() //so our mob-overlays update

/obj/item/clothing/head/soft/ferret
	name = "\improper Ferret Heavy Industries trucker hat"
	desc = "It's a trucker hat. They're becoming collector items since Ferret went under in 2180."
	icon_state = "ferretsoft"
	cap_color = "ferret"
	black_market_value = 25

/obj/item/clothing/head/soft/trucker
	name = "\improper blue trucker hat"
	desc = "It's a blue trucker hat."
	icon_state = "truckercap_bluesoft"
	cap_color = "truckercap_blue"

/obj/item/clothing/head/soft/trucker/red
	name = "\improper red trucker hat"
	desc = "It's a red trucker hat."
	icon_state = "truckercap_redsoft"
	cap_color = "truckercap_red"

/obj/item/clothing/head/soft/sec
	name = "security cap"
	desc = "It's baseball hat in tasteful red color."
	icon_state = "secsoft"
	cap_color = "sec"

/obj/item/clothing/head/soft/sec/corp
	name = "corporate security cap"
	desc = "It's baseball hat in corporate colors."
	icon_state = "corpsoft"
	cap_color = "corp"

