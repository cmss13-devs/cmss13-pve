/obj/structure/interior_exit/vehicle/humvee
	name = "humvee side door"
	icon = 'icons/obj/vehicles/interiors/general_humvee.dmi'
	icon_state = "exit_door"
	density = FALSE

/obj/structure/interior_exit/vehicle/humvee/left
	name = "humvee left door"
	entrance_id = "left"
	icon_state = "exit_door1"

/obj/structure/interior_exit/vehicle/humvee/right
	name = "humvee right door"
	entrance_id = "right"
	alpha = 50

/obj/structure/interior_exit/vehicle/humvee/left2
	name = "humvee left rear door"
	entrance_id = "rear left"
	icon_state = "exit_door1"

/obj/structure/interior_exit/vehicle/humvee/right2
	name = "humvee right rear door"
	entrance_id = "rear right"
	alpha = 50

/obj/structure/interior_exit/vehicle/humvee/back/left
	entrance_id = "rear left"
	icon_state = "carrier_backdoor1"

/obj/structure/interior_exit/vehicle/humvee/back/right
	entrance_id = "rear right"
	icon_state = "carrier_backdoor2"

/obj/structure/interior_exit/vehicle/humvee/back/medical/left
	entrance_id = "rear left"
	icon_state = "medical_backdoor1"

/obj/structure/interior_exit/vehicle/humvee/back/medical/right
	entrance_id = "rear right"
	icon_state = "medical_backdoor2"

/obj/structure/bed/chair/comfy/vehicle/driver/humvee
	icon = 'icons/obj/vehicles/interiors/general_humvee.dmi'
	icon_state = "car_seat"

/obj/structure/bed/chair/comfy/vehicle/gunner/humvee
	icon = 'icons/obj/vehicles/interiors/general_humvee.dmi'
	icon_state = "car_seat"

/obj/structure/bed/chair/comfy/vehicle/passager
	name = "seat"
	icon = 'icons/obj/vehicles/interiors/general_humvee.dmi'
	icon_state = "car_seat"
	unacidable = TRUE
	unslashable = TRUE
	can_rotate = FALSE

/obj/structure/prop/vehicle/humvee
	name = "Humvee chassis"

	icon = 'icons/obj/vehicles/interiors/humvee_chassis.dmi'
	icon_state = "humvee_chassis"
	layer = ABOVE_TURF_LAYER
	mouse_opacity = FALSE
	density = FALSE
	opacity = TRUE

/obj/structure/prop/vehicle/humvee/medical
	icon_state = "humvee_chassis_medical"

/obj/structure/prop/vehicle/humvee/transport
	icon_state = "humvee_chassis_transport"
