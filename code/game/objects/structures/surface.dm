//Surface structures are structures that can have items placed on them
/obj/structure/surface
	health = 100

/obj/structure/surface/attackby(obj/item/W, mob/user, click_data)
	if(!user.drop_inv_item_to_loc(W, loc))
		return

	auto_align(W, click_data)
	user.next_move = world.time + 2
	return TRUE

/obj/structure/surface/proc/auto_align(obj/item/W, click_data)
	if(!W.center_of_mass) // Clothing, material stacks, generally items with large sprites where exact placement would be unhandy.
		W.pixel_x = rand(-W.randpixel, W.randpixel)
		W.pixel_y = rand(-W.randpixel, W.randpixel)
		W.pixel_z = 0
		return

	if(!click_data)
		return

	if(!click_data["icon-x"] || !click_data["icon-y"])
		return

	// Calculation to apply new pixelshift.
	var/mouse_x = text2num(click_data["icon-x"])-1 // Ranging from 0 to 31
	var/mouse_y = text2num(click_data["icon-y"])-1

	var/cell_x = Clamp(round(mouse_x/CELLSIZE), 0, CELLS-1) // Ranging from 0 to CELLS-1
	var/cell_y = Clamp(round(mouse_y/CELLSIZE), 0, CELLS-1)

	var/list/center = cached_key_number_decode(W.center_of_mass)

	W.pixel_x = (CELLSIZE * (cell_x + 0.5)) - center["x"]
	W.pixel_y = (CELLSIZE * (cell_y + 0.5)) - center["y"]
	W.pixel_z = 0
