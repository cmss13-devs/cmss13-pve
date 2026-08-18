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
		SPAN_DANGER("You start \the [src]."),\
		"You hear an ominous click, and the sudden buzz of a chainsword.")
		icon_state = "chainsword_active"
		w_class = SIZE_MEDIUM
		force = 120
		attack_verb = list("slashed", "stabbed", "maimed")
		playsound(user, 'sound/weapons/chainsword_startup.ogg', 25, sound_range = 5)
	else
		user.visible_message(SPAN_NOTICE("Using a quiet click, [user] de-activates \his [src]."),\
		SPAN_NOTICE("You turn off \the [src]."),\
		"You hear a click.")
		icon_state = "chainsword"
		w_class = SIZE_LARGE
		force = MELEE_FORCE_WEAK
		attack_verb = list("hit", "slapped")

	if(blood_overlay && blood_color)
		overlays.Cut()
		add_blood(blood_color)
	return

//Powersword
/obj/item/weapon/powersword
	name = "powersabre"
	desc = "A rare and powerful melee weapon, the powersword is often used by high ranking officers of the Imperium to denote status and strike fear into the heart of their enemies. This one is in the style of a cavalry sabre. If you hear it's distinct hum... don't get too close."
	icon = 'icons/obj/items/weapons/weapons.dmi'
	icon_state = "powersword"
	item_state = "powersword"
	flags_equip_slot = SLOT_WAIST|SLOT_SUIT_STORE
	w_class = SIZE_LARGE
	force = MELEE_FORCE_STRONG
	var/on = 0

/obj/item/weapon/powersword/attack_self(mob/user as mob)
	..()

	on = !on
	if(on)
		user.visible_message(SPAN_DANGER("With a subtle click, [user] activates \his [src]."),\
		SPAN_DANGER("You start \the [src]."),\
		"You hear an ominous click, and the hum of the powersword starting up.")
		icon_state = "powersword_active"
		w_class = SIZE_MEDIUM
		force = 235
		attack_verb = list("slashed", "stabbed", "maimed")
		playsound(user, 'sound/weapons/powersword_startup.ogg', 25, sound_range = 5)
	else
		user.visible_message(SPAN_NOTICE("Using a quiet click, [user] de-activates \his [src]."),\
		SPAN_NOTICE("You collapse \the [src]."),\
		"You hear a click.")
		icon_state = "powersword"
		w_class = SIZE_LARGE
		force = MELEE_FORCE_STRONG
		attack_verb = list("hit", "stabbed")
		playsound(user, 'sound/weapons/powersword_end.ogg', 25, sound_range = 5)

	if(blood_overlay && blood_color)
		overlays.Cut()
		add_blood(blood_color)
	return
