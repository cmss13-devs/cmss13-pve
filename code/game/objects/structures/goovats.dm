#define ORGANIC_ITEMS list(\
		/obj/item/organ,\
		/obj/item/limb,\
		/obj/item/alien_embryo,\
		/obj/item/prop/alien/hugger,\
		/obj/item/xeno_egg,\
		/obj/item/grown,\
		/obj/item/paper,\
		/obj/item/pizzabox,\
		/obj/item/reagent_container/food,\
		/obj/item/reagent_container/pill,\
		/obj/item/scalp,\
		/obj/item/seeds,\
	)

/obj/structure/goo_vat
	name = "unmarked barrel"
	desc = "Some kind of unmarked barrel. You're not sure what is inside."
	icon = 'icons/obj/structures/goovat.dmi'
	icon_state = "vat_biological"
	wrenchable = TRUE
	anchored = FALSE
	indestructible = TRUE
	unacidable = TRUE
	unslashable = TRUE
	breakable = FALSE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	var/volume = 10
	var/fullness = 0
	var/covered = TRUE
	var/locked = TRUE
	var/lock_overlay = "locked"
	var/fullness_overlay = "empty"
	var/slurry_descriptor
	var/gooable_list

/obj/item/vat_lid
	name = "barrel lid"
	desc = "An inconspicuous red barrel lid with two handles. It looks like it can screw on and seal pretty damn tight if bolted down."
	w_class = SIZE_LARGE
	icon = 'icons/obj/structures/goovat.dmi'
	icon_state = "lid_object"

/obj/structure/goo_vat/biological
	name = "biohazard storage barrel"
	desc = "An inconspicuous red barrel labelled 'biohazard storage' and nothing more."
	slurry_descriptor = "organic"
	gooable_list = ORGANIC_ITEMS

/obj/structure/goo_vat/attack_hand(mob/living/user)

	if(locked)
		to_chat(user, SPAN_WARNING("The lid is locked. You will need to unbolt it with a wrench!"))
		return
	if(!covered)
		to_chat(user, SPAN_WARNING("There is no lid to remove."))
		return
	else if(covered)
		visible_message(SPAN_DANGER("[user] begins to remove the lid from the [src]."), SPAN_NOTICE("You begin to remove the lid from the [src]."))
		if(!do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_GENERIC))
			to_chat(user, SPAN_WARNING("You were interrupted!"))
			return
		visible_message(SPAN_DANGER("[user] removes the lid from the [src]."), SPAN_NOTICE("You remove the lid from the [src]."))
		var/obj/stored_obj = contents[contents.len]
		playsound(loc, 'sound/effects/flag_raised.ogg', 25, 1)
		contents -= stored_obj
		user.put_in_hands(stored_obj)
		covered = FALSE
		update_icon()

/obj/structure/goo_vat/attackby(obj/item/object as obj, mob/user as mob)


	if(HAS_TRAIT(object, TRAIT_TOOL_WRENCH))
		if(!locked)
			visible_message(SPAN_DANGER("[user] begins to wrench in the locking bolts on the [src]."), SPAN_NOTICE("You begin to wrench in the locking bolts on the [src]."))
			if(!do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_GENERIC))
				to_chat(user, SPAN_WARNING("You were interrupted!"))
				return
			playsound(loc, 'sound/items/fulton.ogg', 25, 1)
			locked = TRUE
			update_icon()
			return
		else
			visible_message(SPAN_DANGER("[user] begins to wrench out the locking bolts on the [src]."), SPAN_NOTICE("You begin to wrench out the locking bolts on the [src]."))
			if(!do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_GENERIC))
				to_chat(user, SPAN_WARNING("You were interrupted!"))
				return
			playsound(loc, 'sound/items/fulton.ogg', 25, 1)
			locked = FALSE
			update_icon()
			return


	if(istype(object, /obj/item/vat_lid))
		if(covered)
			to_chat(user, SPAN_WARNING("The barrel already has a lid!"))
		if(!covered)
			visible_message(SPAN_DANGER("[user] begins to put \the [object] on the [src]."), SPAN_NOTICE("You begin to put \the [object] on the [src]."))
			if(!do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_GENERIC))
				to_chat(user, SPAN_WARNING("You were interrupted!"))
				return
			visible_message(SPAN_DANGER("[user] puts \the [object] on the [src]."), SPAN_NOTICE("You put \the [object] on the [src]."))
			playsound(loc, 'sound/effects/flag_raised.ogg', 25, 1)
			covered = TRUE
			user.drop_inv_item_to_loc(object, src)
			contents += object
			update_icon()
			return

	if(is_type_in_list(object, gooable_list))
		. = ..()
		if(locked)
			to_chat(user, SPAN_WARNING("The [src] is locked! Use a wrench to release the locking bolts."))
			return
		else if(covered)
			to_chat(user, SPAN_WARNING("The [src] is covered! Twist it off by hand to remove the lid."))
			return
		else if(!covered && fullness >=	 volume)
			to_chat(user, SPAN_WARNING("The [src] is full!"))
			return
		visible_message(SPAN_DANGER("[user] begins to drop \the [object] into the [slurry_descriptor] slurry."), SPAN_NOTICE("You begin to drop \the [object] into the [slurry_descriptor] slurry."))
		if(!do_after(user, 2 SECONDS, INTERRUPT_ALL, BUSY_ICON_GENERIC))
			to_chat(user, SPAN_WARNING("You were interrupted!"))
			return
		visible_message(SPAN_DANGER("[user] drops \the [object] into the [slurry_descriptor] slurry."), SPAN_NOTICE("You drop \the [object] into the [slurry_descriptor] slurry."))
		qdel(object)
		playsound(loc, "acid_sizzle", 25, 2)
		fullness++
		update_icon()
	else
		to_chat(user, SPAN_WARNING("[object] won't be melted by the [slurry_descriptor] slurry!"))

/obj/structure/goo_vat/update_icon()
	overlays.Cut()

	if(!fullness == 0)
		if(fullness >= volume)
			fullness_overlay = "full"
		else if(fullness >= 1)
			fullness_overlay = "filled"

	if(locked)
		lock_overlay = "locked"
	else if(!locked)
		lock_overlay = "unlocked"
	if(covered)
		overlays += image(icon, icon_state = "lid")
	if(!covered)
		lock_overlay = "open"
		var/overlay_fullness
		if(fullness >= volume)
			overlay_fullness = "goo_3"
		else if(fullness >= volume * 0.5)
			overlay_fullness = "goo_2"
		else if(fullness >=	 1)
			overlay_fullness = "goo_1"
			overlays += image(icon, icon_state = "[overlay_fullness]")
	overlays += image(icon, icon_state = "[lock_overlay]")
	overlays += image(icon, icon_state = "[fullness_overlay]")

/obj/structure/goo_vat/Initialize()
	. = ..()
	contents += new /obj/item/vat_lid(src)
	update_icon()

#undef ORGANIC_ITEMS
