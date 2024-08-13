/obj/item/hardpoint/locomotion/van_wheels
	name = "Van wheels"
	desc = "Integral to the movement of the van"
	icon = 'icons/obj/vehicles/hardpoints/van.dmi'

	icon_state = "tires"
	disp_icon = "van"
	disp_icon_state = "wheels"

	slot = HDPT_WHEELS

	health = 250

	move_delay = VEHICLE_SPEED_VERYFAST

/obj/item/hardpoint/locomotion/truck
	name = "truck wheels"
	desc = "Integral to the movement of the truck"
	icon = 'icons/obj/vehicles/hardpoints/van.dmi'

	icon_state = "tires"
	disp_icon = "miltruck"
	disp_icon_state = "miltruckwheels"

	slot = HDPT_WHEELS

	health = 500

	move_delay = VEHICLE_SPEED_FASTER

/obj/item/hardpoint/locomotion/truck/treads
	name = "truck treads"
	desc = "Integral to the movement of the truck."

	icon_state = "treads"
	disp_icon_state = "miltrucktreads"

	health = 750

	move_delay = VEHICLE_SPEED_FASTNORMAL
