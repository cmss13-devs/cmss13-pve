/obj/item/device/referee
	name = "referee wand"
	icon_state = "signal_wand"
	icon = 'icons/obj/items/items.dmi'
	flags_atom = FPRINT | CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_TINY
	item_state = "electronic"
	throw_speed = SPEED_VERY_FAST
	throw_range = 20
	matter = list("metal" = 500)
	var/obj/item/disk/nuclear/the_disk = null
	var/active = 0
