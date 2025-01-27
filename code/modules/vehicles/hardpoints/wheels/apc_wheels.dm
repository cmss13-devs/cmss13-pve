/obj/item/hardpoint/locomotion/apc_wheels
	name = "\improper APC Wheels"
	desc = "Integral to the movement of the APC."
	icon = 'icons/obj/vehicles/hardpoints/apc.dmi'

	damage_multiplier = 0.20

	icon_state = "tires"
	disp_icon = "apc"
	disp_icon_state = "wheels"

	health = 1500

	move_delay = VEHICLE_SPEED_SUPERFAST
	move_max_momentum = 2
	move_momentum_build_factor = 1.5
	move_turn_momentum_loss_factor = 0.5

/obj/item/hardpoint/locomotion/apc_wheels/arc
	name = "ARC Wheels"
	desc = "Not to be confused with the APC wheels, these are designed for the M540 ARC in mind."
	icon = 'icons/obj/vehicles/hardpoints/arc.dmi'

	icon_state = "tires"
	disp_icon = "arc"
	disp_icon_state = "arc_wheels"
