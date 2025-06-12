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


/*
Doesn't do anything or hold anything anymore.
Generated per the various mags, and then changed based on the number of
casings. .dir is the main thing that controls the icon. It modifies
the icon_state to look like more casings are hitting the ground.
There are 8 directions, 8 bullets are possible so after that it tries to grab the next
icon_state while reseting the direction. After 16 casings, it just ignores new
ones. At that point there are too many anyway. Shells and bullets leave different
items, so they do not intersect. This is far more efficient than using Bl*nd() or
Turn() or Shift() as there is virtually no overhead. ~N
*/
/obj/effect/decal/ammo_casing
	name = "spent casing"
	desc = "Empty and useless now."
	icon = 'icons/obj/items/casings.dmi'
	icon_state = "casing"
	dir = NORTH //Always north when it spawns.
	var/current_casings = 1 //This is manipulated in the procs that use these.
	var/max_casings = 16
	var/current_icon = 0
	var/number_of_states = 10 //How many variations of this item there are.
	garbage = TRUE
	appearance_flags = PIXEL_SCALE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER //Puts them under most objects.

/obj/effect/decal/ammo_casing/Initialize()
	. = ..()
	pixel_x = rand(-2.0, 2) //Want to move them just a tad.
	pixel_y = rand(-2.0, 2)
	icon_state += "_[rand(1,number_of_states)]" //Set the icon to it.

//This does most of the heavy lifting. It updates the icon and name if needed, then changes .dir to simulate new casings.
/obj/effect/decal/ammo_casing/update_icon()
	if(max_casings >= current_casings)
		if(current_casings == 2) name += "s" //In case there is more than one.
		if(floor((current_casings-1)/8) > current_icon)
			current_icon++
			icon_state += "_[current_icon]"

		var/base_direction = current_casings - (current_icon * 8)
		setDir(base_direction + floor(base_direction)/3)


//Making child objects so that locate() and istype() doesn't screw up.
/obj/effect/decal/ammo_casing/bullet

/obj/effect/decal/ammo_casing/cartridge
	name = "spent cartridge"
	icon_state = "cartridge"

/obj/effect/decal/ammo_casing/greenshell
	name = "spent shell"
	icon_state = "greenshell"

/obj/effect/decal/ammo_casing/redshell
	name = "spent shell"
	icon_state = "redshell"

/obj/effect/decal/ammo_casing/blueshell
	name = "spent shell"
	icon_state = "blueshell"
