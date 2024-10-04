
// define

#define COMSIG_KB_MOB_PIXELSHIFT "keybinding_mob_pixelshift"

// code

/mob
	///Whether the mob is pixel shifted or not
	var/is_shifted
	var/shifting //If we are in the shifting setting.

/datum/keybinding/mob/pixel_shift
	hotkey_keys = list("J")
	name = "pixel_shift"
	full_name = "Pixel Shift"
	description = "Shift your characters offset."
	category = CATEGORY_MOVEMENT
	keybind_signal = COMSIG_KB_MOB_PIXELSHIFT
	weight = WEIGHT_HIGHEST

/datum/keybinding/mob/pixel_shift/down(client/user)
	. = ..()
	if(.)
		return
	var/mob/M = user.mob
	M.shifting = TRUE
	return TRUE

/datum/keybinding/mob/pixel_shift/up(client/user)
	. = ..()
	if(.)
		return
	var/mob/M = user.mob
	M.density = 0
	M.shifting = FALSE
	return TRUE


/mob/proc/unpixel_shift()
	return

/mob/living/unpixel_shift()
	if(is_shifted)
		is_shifted = FALSE
		pixel_x = 0
		pixel_y = 0
		density = 1

/mob/proc/pixel_shift(direction)
	return

/mob/living/pixel_shift(direction)
	switch(direction)
		if(NORTH)
			if(!canface())
				return FALSE
			if(pixel_y <= 16)
				pixel_y++
				is_shifted = TRUE
		if(EAST)
			if(!canface())
				return FALSE
			if(pixel_x <= 16)
				pixel_x++
				is_shifted = TRUE
		if(SOUTH)
			if(!canface())
				return FALSE
			if(pixel_y >= -16)
				pixel_y--
				is_shifted = TRUE
		if(WEST)
			if(!canface())
				return FALSE
			if(pixel_x >= -16)
				pixel_x--
				is_shifted = TRUE
