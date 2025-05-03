/obj/effect/decal/remains
	name = "remains"
	gender = PLURAL
	icon = 'icons/effects/blood.dmi'
	appearance_flags = PIXEL_SCALE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER //Puts them under most objects.

/obj/effect/decal/remains/Initialize()
	. = ..()
	pixel_x = rand(-16, 16)
	pixel_y = rand(-16, 16)
	var/matrix/rotate = matrix()
	rotate.Turn(rand(0, 359))
	transform = rotate

/obj/effect/decal/remains/human
	desc = "They look like human remains. Eerie..."
	icon_state = "remains"

/obj/effect/decal/remains/xeno
	desc = "They look like the remains of some horrible creature. They are not pleasant to look at..."
	icon_state = "remainsxeno"

/obj/effect/decal/remains/robot
	desc = "They look like the remains of something mechanical. They have a strange aura about them."
	icon = 'icons/mob/robots.dmi'
	icon_state = "remainsrobot"
