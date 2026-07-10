//Chainsword
/obj/item/weapon/chainsword
	name = "chainsword"
	desc = "A brutal melee weapon, the chainsword is a sword with a motorized chain running along its edge, allowing it to tear through armor and flesh alike."
	icon = 'icons/obj/items/weapons/weapons.dmi'
	icon_state = "chainsword"
	item_state = "chainsword"
	flags_equip_slot = SLOT_WAIST|SLOT_SUIT_STORE
	w_class = SIZE_LARGE
	force = MELEE_FORCE_WEAK
	var/on = 0

/obj/item/weapon/chainsword/attack_self(mob/user as mob)
	..()

	on = !on
	if(on)
		user.visible_message(SPAN_DANGER("With a subtle click, [user] activates \his [src]."),\
		SPAN_DANGER("You extend \the [src]."),\
		"You hear an ominous click, and the sudden buzz of a chainsword.")
		icon_state = "chainsword_active"
		w_class = SIZE_MEDIUM
		force = MELEE_FORCE_VERY_STRONG
		attack_verb = list("slashed", "stabbed", "maimed")
	else
		user.visible_message(SPAN_NOTICE("Using a quiet click, [user] de-activates \his [src]."),\
		SPAN_NOTICE("You collapse \the [src]."),\
		"You hear a click.")
		icon_state = "chainsword"
		w_class = SIZE_LARGE
		force = MELEE_FORCE_WEAK
		attack_verb = list("hit", "slapped")

	playsound(user, 'sound/weapons/chainsword_startup.ogg', 25, sound_range = 5)

	if(blood_overlay && blood_color)
		overlays.Cut()
		add_blood(blood_color)
	return
