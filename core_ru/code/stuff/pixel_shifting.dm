
/// define
#define COMSIG_KB_MOB_PIXELSHIFT "keybinding_mob_pixelshift"
#define PIXELSHIFT_MAX 32
#define PIXELSHIFT_PASS_CAP 8

/// keybindings
/mob
	var/is_shifted = FALSE //Whether the mob is pixel shifted or not
	var/shifting = FALSE //If we are in the shifting setting

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
	if(M)
		M.shifting = TRUE
	return TRUE

/datum/keybinding/mob/pixel_shift/up(client/user)
	. = ..()
	if(.)
		return
	var/mob/M = user.mob
	if(M)
		M.shifting = FALSE
	return TRUE

/// code
/mob/proc/unpixel_shift()
	if(is_shifted)
		is_shifted = FALSE
		pixel_x = 0
		pixel_y = 0
		return TRUE

/mob/proc/pixel_shift(direction)
	if(anchored || is_mob_incapacitated())
		return FALSE

	is_shifted = TRUE
	switch(direction)
		if(NORTH)
			pixel_y++
		if(EAST)
			pixel_x++
		if(SOUTH)
			pixel_y--
		if(WEST)
			pixel_x--

	pixel_x = clamp(pixel_x, -PIXELSHIFT_MAX, PIXELSHIFT_MAX)
	pixel_y = clamp(pixel_y, -PIXELSHIFT_MAX, PIXELSHIFT_MAX)

	return TRUE

/mob/living/unpixel_shift()
	. = ..()
	if(.)
		REMOVE_TRAIT(src, TRAIT_UNDENSE, "pixel-shift")

/mob/living/pixel_shift(direction)
	. = ..()
	if(!.)
		return

	if(pixel_x > PIXELSHIFT_PASS_CAP||pixel_x < -PIXELSHIFT_PASS_CAP||pixel_y > PIXELSHIFT_PASS_CAP||pixel_y < -PIXELSHIFT_PASS_CAP)
		ADD_TRAIT(src, TRAIT_UNDENSE, "pixel-shift")
		return

	REMOVE_TRAIT(src, TRAIT_UNDENSE, "pixel-shift")

///overrides
/client/Move(n, direct)
	if(mob.shifting)
		mob.pixel_shift(direct)
		return FALSE

	mob.unpixel_shift()
	. = ..()

/mob/living/on_lying_down(new_lying_angle)
	unpixel_shift()
	. = ..()

/mob/Move(n, direct)
	unpixel_shift()
	. = ..()
