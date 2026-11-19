/obj/item/weapon/sword
	name = "combat sword"
	desc = "A dusty sword commonly seen in historical museums. Where you got this is a mystery, for sure. Only a mercenary would be nuts enough to carry one of these. Sharpened to deal massive damage."
	icon_state = "mercsword"
	item_state = "machete"
	flags_atom = FPRINT|QUICK_DRAWABLE|CONDUCT
	flags_equip_slot = SLOT_WAIST
	force = MELEE_FORCE_STRONG
	throwforce = MELEE_FORCE_WEAK
	sharp = IS_SHARP_ITEM_BIG
	flags_human_ai = MELEE_WEAPON_ITEM
	edge = 1
	w_class = SIZE_LARGE
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 9

/obj/item/weapon/sword/claymore
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon_state = "claymore"
	item_state = "claymore"

/obj/item/weapon/sword/ceremonial
	name = "Ceremonial Sword"
	desc = "A fancy ceremonial sword passed down from generation to generation. Despite this, it has been very well cared for, and is in top condition."
	icon_state = "ceremonial"

/obj/item/weapon/sword/machete
	name = "\improper M2132 machete"
	desc = "Latest issue of the USCM Machete. Great for clearing out jungle or brush on outlying colonies. Found commonly in the hands of scouts and trackers, but difficult to carry with the usual kit."
	icon_state = "machete"

/obj/item/weapon/sword/machete/attack_self(mob/user)
	if(user.action_busy)
		return

	var/turf/root = get_turf(user)
	var/facing = user.dir
	var/turf/in_front = get_step(root, facing)

	// We check the tile in front of us, if it has flora that can be cut we will attempt to cut it
	for(var/obj/structure/flora/target in in_front)
		if(target.cut_level > 1)
			if(!do_after(user, 10, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
				return
			target.attackby(src, user)

	return ..()

/obj/item/weapon/sword/machete/arnold
	name = "\improper M2100 \"Ngájhe\" machete"
	desc = "An older issue USCM machete, never left testing. Designed in the Central African Republic. The notching made it hard to clean, and as such the USCM refused to adopt it - despite the superior bludgeoning power offered. Difficult to carry with the usual kit ."
	icon_state = "arnold-machete"
	item_state = "arnold-machete"
	force = MELEE_FORCE_TIER_11

/obj/item/weapon/sword/machete/arnold/weak
	name = "\improper M2100 machete"
	desc = "An older issue USCM machete, never left testing. Designed in the Central African Republic. The notching made it hard to clean, and as such the USCM refused to adopt it - despite the superior bludgeoning power offered. This one has been poorly maintained and as such can't really outperform adopted M2132 machete."
	force = MELEE_FORCE_STRONG

/obj/item/weapon/sword/hefa
	name = "HEFA sword"
	icon_state = "hefasword"
	item_state = "hefasword"
	desc = "A blade known to be used by the Order of the HEFA, this highly dangerous blade blows up in a shower of shrapnel on impact."
	attack_verb = list("bapped", "smacked", "clubbed")

	var/primed = FALSE

/obj/item/weapon/sword/hefa/proc/apply_explosion_overlay()
	var/obj/effect/overlay/O = new /obj/effect/overlay(loc)
	O.name = "grenade"
	O.icon = 'icons/effects/explosion.dmi'
	flick("grenade", O)
	QDEL_IN(O, 7)
	return

/obj/item/weapon/sword/hefa/attack_self(mob/user)
	..()

	primed = !primed
	var/msg = "You prime \the [src]! It will now explode when you strike someone."
	if(!primed)
		msg = "You de-activate \the [src]!"
	to_chat(user, SPAN_NOTICE(msg))

/obj/item/weapon/sword/hefa/attack(mob/target, mob/user)
	. = ..()
	if(!primed)
		return

	var/turf/epicenter = get_turf(user)
	epicenter = get_step(epicenter, user.dir)

	var/datum/cause_data/cause_data = create_cause_data(initial(name), user)
	create_shrapnel(epicenter, 48, dir, , /datum/ammo/bullet/shrapnel, cause_data)
	sleep(2) //so that mobs are not knocked down before being hit by shrapnel. shrapnel might also be getting deleted by explosions?
	apply_explosion_overlay()
	cell_explosion(epicenter, 40, 18, EXPLOSION_FALLOFF_SHAPE_LINEAR, user.dir, cause_data)
	qdel(src)

/obj/item/weapon/sword/katana
	name = "katana"
	desc = "A finely made Japanese sword, with a well sharpened blade. The blade has been filed to a molecular edge, and is extremely deadly. Commonly found in the hands of mercenaries and yakuza."
	icon_state = "katana"
	item_state = "katana"
	force = MELEE_FORCE_VERY_STRONG

//To do: replace the toys.
/obj/item/weapon/sword/katana/replica
	name = "replica katana"
	desc = "A cheap knock-off commonly found in regular knife stores. Can still do some damage."
	force = MELEE_FORCE_WEAK
	throwforce = 7

/obj/item/weapon/throwing_knife
	name ="\improper M11 throwing knife"
	icon='icons/obj/items/weapons/weapons.dmi'
	icon_state = "throwing_knife"
	item_state = "combat_knife"
	desc = "A military knife designed to be thrown at the enemy. Much quieter than a firearm, but requires a steady hand to be used optimally, although you should probably just use a gun instead."
	flags_atom = FPRINT|QUICK_DRAWABLE|CONDUCT
	sharp = IS_SHARP_ITEM_ACCURATE
	force = MELEE_FORCE_TIER_1
	w_class = SIZE_SMALL
	throwforce = MELEE_FORCE_TIER_10 //increased by throwspeed to roughly 80
	throw_speed = SPEED_VERY_FAST
	throw_range = 7
	hitsound = 'sound/weapons/slash.ogg'
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	flags_equip_slot = SLOT_STORE|SLOT_FACE
	flags_armor_protection = SLOT_FACE
	flags_item = CAN_DIG_SHRAPNEL

/obj/item/weapon/unathiknife
	name = "duelling knife"
	desc = "A length of leather-bound wood studded with razor-sharp teeth. How crude."
	icon = 'icons/obj/items/weapons/weapons.dmi'
	icon_state = "unathiknife"
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("ripped", "torn", "cut")
	force = MELEE_FORCE_STRONG
	throwforce = MELEE_FORCE_STRONG
	edge = 1

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Colonial Companion Mk. II - Swiss Army Knife with multiple modes - sprites by Crowford.
/obj/item/weapon/swiss_army_knife
	name = "Colonial Companion Mk. II"
	desc = "Your reliable partner in every adventure. This versatile multi-tool seamlessly folds and switches between seven essential modes, each crafted for a specific purpose. Whether you need a razor-sharp blade, a precise screwdriver, or even a handy spoon, it's always ready—just a flick of the wrist away, ready to tackle whatever challenge lies ahead."
	icon = 'icons/obj/items/weapons/weapons.dmi'
	icon_state = "swiss_stock"  // Default state when all tools are folded
	force = 0
	throwforce = 0
	sharp = 0
	throw_range = 6
	w_class = SIZE_SMALL  // Size for all modes
	var/mode = "Closed"
	attack_verb = list("hit")
	var/loaded

/obj/item/weapon/swiss_army_knife/Initialize(mapload, ...)
	. = ..()
	create_reagents(5)

/obj/item/weapon/swiss_army_knife/attack_hand(mob/user)
	if(!ishuman(user))
		return ..()
	var/mob/living/carbon/human/human = user
	if(human.l_hand != src && human.r_hand != src)
		return ..()
	var/list/tool_modes = list(
	"Closed" = image(icon = 'icons/obj/items/weapons/weapons.dmi', icon_state = "swiss_stock"),
	"Knife" = image(icon = 'icons/obj/items/weapons/weapons.dmi', icon_state = "swiss_knife"),
	"Screwdriver" = image(icon = 'icons/obj/items/weapons/weapons.dmi', icon_state = "swiss_screwdriver"),
	"Cutters" = image(icon = 'icons/obj/items/weapons/weapons.dmi', icon_state = "swiss_cutters"),
	"Spoon" = image(icon = 'icons/obj/items/weapons/weapons.dmi', icon_state = "swiss_spoon"),
	"Can Opener" = image(icon = 'icons/obj/items/weapons/weapons.dmi', icon_state = "swiss_opener"),
	"Corkscrew" = image(icon = 'icons/obj/items/weapons/weapons.dmi', icon_state = "swiss_corkscrew")
	)
	var/use_radials = user.client.prefs?.no_radials_preference ? FALSE : TRUE
	switch_tool(use_radials ? show_radial_menu(user, user, tool_modes, require_near = FALSE) : tgui_input_list(user, "Select a tool", "Remove accessory", tool_modes))

/obj/item/weapon/swiss_army_knife/attack(mob/living/carbon/mob as mob, mob/living/carbon/user as mob)
	if(mode == "Cutters")
		if((mob.handcuffed) && (istype(mob.handcuffed, /obj/item/restraint/adjustable/cable)))
			user.visible_message("\The [usr] cuts \the [mob]'s restraints with \the [src]!",\
			"You cut \the [mob]'s restraints with \the [src]!",\
			"You hear cable being cut.")
			mob.handcuffed = null
			mob.handcuff_update()
			return
		else
			..()
	if(mode == "Spoon")
		if(!istype(mob))
			return ..()
		if(user.a_intent != INTENT_HELP)
			return ..()

		if (reagents.total_volume > 0)

			var/fullness = mob.nutrition + (mob.reagents.get_reagent_amount("nutriment") * 25)
			if(fullness > NUTRITION_HIGH)
				to_chat(user, SPAN_WARNING("[user == mob ? "You" : "They"] don't feel like eating more right now."))
				return
			reagents.set_source_mob(user)
			reagents.trans_to_ingest(mob, reagents.total_volume)
			if(mob == user)
				for(var/mob/O in viewers(mob, null))
					O.show_message(SPAN_NOTICE("[user] eats some [loaded] from \the [src]."), SHOW_MESSAGE_VISIBLE)
				mob.reagents.add_reagent("nutriment", 1)
			else
				for(var/mob/O in viewers(mob, null))
					O.show_message(SPAN_NOTICE("[user] feeds [mob] some [loaded] from \the [src]"), SHOW_MESSAGE_VISIBLE)
				mob.reagents.add_reagent("nutriment", 1)
			playsound(mob.loc,'sound/items/eatfood.ogg', 15, 1)
			overlays.Cut()
			return

/obj/item/weapon/swiss_army_knife/proc/switch_tool(new_state)
	switch(new_state)
		if("Closed")
			desc = initial(desc)
			force = initial(force)
			throwforce = initial(throwforce)
			sharp = initial(sharp)
			attack_verb = initial(attack_verb)
			flags_item = initial(flags_item)
			icon_state = initial(icon_state)
			attack_speed = initial(attack_speed)
			flags_atom = initial(flags_atom)
			REMOVE_TRAITS_IN(src,src)
		if("Knife")
			desc = "A sharp knife for cutting things."
			icon_state = "swiss_knife"
			sharp = IS_SHARP_ITEM_ACCURATE
			force = MELEE_FORCE_NORMAL
			throwforce = MELEE_FORCE_NORMAL
			throw_speed = SPEED_VERY_FAST
			throw_range = 6
			hitsound = 'sound/weapons/slash.ogg'
			attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
			attack_speed = 9
			flags_item = CAN_DIG_SHRAPNEL
		if("Screwdriver")
			desc = "A trusty screwdriver for all your fastening needs."
			icon_state = "swiss_screwdriver"
			force = 2
			throwforce = 0
			flags_atom = FPRINT|CONDUCT
			matter = list("metal" = 75)
			attack_verb = list("stabbed")
			flags_item = CAN_DIG_SHRAPNEL
			ADD_TRAIT(src,TRAIT_TOOL_SCREWDRIVER,src)
		if("Cutters")
			desc = "Cutters for cutting through wires and various materials."
			icon_state = "swiss_cutters"
			attack_verb = list("pinched", "nipped")
			force = 5
			throwforce = 0
			flags_atom = FPRINT|CONDUCT
			sharp = IS_SHARP_ITEM_SIMPLE
			edge = 1
			ADD_TRAIT(src,TRAIT_TOOL_WIRECUTTERS,src)
		if("Spoon")
			desc = "A simple spoon."
			icon_state = "swiss_spoon"
			attack_verb = list("scoop", "stir")
			force = 0
			throwforce = 0
			sharp = 0
		if("Can Opener")
			desc = "A simple can opener, can be used as a knife, although weaker."
			icon_state = "swiss_opener"
			sharp = IS_SHARP_ITEM_ACCURATE
			force = MELEE_FORCE_WEAK
			throwforce = MELEE_FORCE_WEAK
			throw_speed = SPEED_VERY_FAST
			throw_range = 6
			hitsound = 'sound/weapons/slash.ogg'
			attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
			attack_speed = 9
			flags_item = CAN_DIG_SHRAPNEL
		if("Corkscrew")
			desc = "A simple corkscrew."
			icon_state = "swiss_corkscrew"
			force = 2
			throwforce = 0
			flags_atom = FPRINT|CONDUCT
			attack_verb = list("stabbed")
			flags_item = CAN_DIG_SHRAPNEL
	mode = new_state
	update_icon()


/obj/item/weapon/swiss_army_knife/knife
	icon_state = "swiss_knife"
	desc = "A sharp knife for cutting things."
	sharp = IS_SHARP_ITEM_ACCURATE
	force = MELEE_FORCE_NORMAL
	throwforce = MELEE_FORCE_NORMAL
	throw_speed = SPEED_VERY_FAST
	throw_range = 6
	hitsound = 'sound/weapons/slash.ogg'
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 9
	flags_item = CAN_DIG_SHRAPNEL
/obj/item/weapon/swiss_army_knife/screwdriver
	icon_state = "swiss_screwdriver"
	desc = "A trusty screwdriver for all your fastening needs."
	force = 2
	throwforce = 0
	flags_atom = FPRINT|CONDUCT
	matter = list("metal" = 75)
	attack_verb = list("stabbed")
	flags_item = CAN_DIG_SHRAPNEL
	_status_traits = list(TRAIT_TOOL_SCREWDRIVER)

/obj/item/weapon/swiss_army_knife/screwdriver/attack(mob/living/carbon/mob as mob, mob/living/carbon/user as mob)
	if(!istype(mob))
		return ..()
	if(user.zone_selected != "eyes") // && user.zone_selected != "head")
		return ..()
	if(ishuman(mob))
		var/mob/living/carbon/human/H = mob
		var/datum/internal_organ/eyes/E = H.internal_organs_by_name["eyes"]
		if(E)
			var/safety = H.get_eye_protection()
			if(!safety)
				user.visible_message(SPAN_DANGER("[user] stabs [H] in the eyes with [src]!"),
					SPAN_DANGER("You stab [H] in the eyes with [src]!"))
				E.take_damage(rand(8,20))
	return ..()
/obj/item/weapon/swiss_army_knife/wirecutters
	icon_state = "swiss_cutters"
	desc = "Cutters for cutting through wires and various materials."
	attack_verb = list("pinched", "nipped")
	force = 5
	throwforce = 0
	flags_atom = FPRINT|CONDUCT
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = 1
	_status_traits = list(TRAIT_TOOL_WIRECUTTERS)

/obj/item/weapon/swiss_army_knife/wirecutters/attack(mob/living/carbon/mob, mob/user)
	if((mob.handcuffed) && (istype(mob.handcuffed, /obj/item/restraint/adjustable/cable)))
		user.visible_message("\The [usr] cuts \the [mob]'s restraints with \the [src]!",\
		"You cut \the [mob]'s restraints with \the [src]!",\
		"You hear cable being cut.")
		mob.handcuffed = null
		mob.handcuff_update()
		return
	else
		..()
/obj/item/weapon/swiss_army_knife/spoon
	icon_state = "swiss_spoon"
	desc = "A simple spoon."
	attack_verb = list("scoop", "stir")
	force = 0
	throwforce = 0
	sharp = 0

/obj/item/weapon/swiss_army_knife/spoon/Initialize()
	. = ..()
	if (prob(60))
		src.pixel_y = rand(0, 4)
	create_reagents(5)
	return

/obj/item/weapon/swiss_army_knife/spoon/attack(mob/living/carbon/mob as mob, mob/living/carbon/user as mob)
	if(!istype(mob))
		return ..()
	if(user.a_intent != INTENT_HELP)
		return ..()
	if (reagents.total_volume > 0)
		var/fullness = mob.nutrition + (mob.reagents.get_reagent_amount("nutriment") * 25)
		if(fullness > NUTRITION_HIGH)
			to_chat(user, SPAN_WARNING("[user == mob ? "You" : "They"] don't feel like eating more right now."))
			return
		reagents.set_source_mob(user)
		reagents.trans_to_ingest(mob, reagents.total_volume)
		if(mob == user)
			for(var/mob/O in viewers(mob, null))
				O.show_message(SPAN_NOTICE("[user] eats some [loaded] from \the [src]."), SHOW_MESSAGE_VISIBLE)
			mob.reagents.add_reagent("nutriment", 1)
		else
			for(var/mob/O in viewers(mob, null))
				O.show_message(SPAN_NOTICE("[user] feeds [mob] some [loaded] from \the [src]"), SHOW_MESSAGE_VISIBLE)
			mob.reagents.add_reagent("nutriment", 1)
		playsound(mob.loc,'sound/items/eatfood.ogg', 15, 1)
		overlays.Cut()
		return
	else
		..()

/obj/item/weapon/swiss_army_knife/can_opener
	icon = 'icons/obj/items/weapons/weapons.dmi'
	icon_state = "swiss_opener"
	desc = "A simple can opener, can be used as a knife, although weaker."
	sharp = IS_SHARP_ITEM_ACCURATE
	force = MELEE_FORCE_WEAK
	throwforce = MELEE_FORCE_WEAK
	throw_speed = SPEED_VERY_FAST
	throw_range = 6
	hitsound = 'sound/weapons/slash.ogg'
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 9
	flags_item = CAN_DIG_SHRAPNEL
/obj/item/weapon/swiss_army_knife/corkscrew
	icon = 'icons/obj/items/weapons/weapons.dmi'
	icon_state = "swiss_corkscrew"
	desc = "A simple corkscrew."
	attack_verb = list("turn", "screw", "poke", "twist")
	force = 0
	throwforce = 0

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///For digging shrapnel out of OTHER people, not yourself. Triggered by human/attackby() so target is definitely human. User might not be.
/obj/item/proc/dig_out_shrapnel_check(mob/living/carbon/human/target, mob/living/carbon/human/user)
	if(user.a_intent == INTENT_HELP && (target == user || skillcheck(user, SKILL_MEDICAL, SKILL_MEDICAL_MEDIC))) //Squad medics and above, or yourself
		INVOKE_ASYNC(src, TYPE_PROC_REF(/obj/item, dig_out_shrapnel), target, user)
		return TRUE
	return FALSE

// If no user, it means that the embedded_human is removing it themselves
/obj/item/proc/dig_out_shrapnel(mob/living/carbon/human/embedded_human, mob/living/carbon/human/user = null)
	if(!user)
		user = embedded_human

	if(user.action_busy)
		return

	var/address_mode

	if(user != embedded_human)
		user.affected_message(embedded_human,
			SPAN_NOTICE("You begin examining [embedded_human]'s body for shrapnel."),
			SPAN_NOTICE("[user] begins to examine your body for shrapnel to dig out. Hold still, this will probably hurt..."),
			SPAN_NOTICE("[user] begins to examine [embedded_human]'s body for shrapnel."))
		address_mode = "out of [embedded_human]'s" //includes "out of " to prevent capital-T 'The unknown'.
		if(!do_after(user, 20, INTERRUPT_ALL, BUSY_ICON_FRIENDLY, embedded_human, INTERRUPT_MOVED, BUSY_ICON_MEDICAL))
			to_chat(user, SPAN_NOTICE("You were interrupted!"))
			return
	else
		user.visible_message(SPAN_NOTICE("[user] starts checking \his body for shrapnel."), \
			SPAN_NOTICE("You begin searching your body for shrapnel."))
		address_mode = "out of your"
		if(!do_after(embedded_human, 20, INTERRUPT_ALL, BUSY_ICON_FRIENDLY))
			to_chat(user, SPAN_NOTICE("You were interrupted!"))
			return

	var/list/removed_limbs = list()
	for(var/obj/item/shard/S in embedded_human.embedded_items)
		var/obj/limb/organ = S.embedded_organ

		if(!(organ.display_name in removed_limbs))
			removed_limbs += organ.display_name

		S.forceMove(embedded_human.loc)
		organ.implants -= S
		embedded_human.embedded_items -= S
		organ = null
		for(var/i in 1 to S.count-1)
			user.count_niche_stat(STATISTICS_NICHE_SURGERY_SHRAPNEL)
			var/shrapnel = new S.type(S.loc)
			QDEL_IN(shrapnel, 300)
		user.count_niche_stat(STATISTICS_NICHE_SURGERY_SHRAPNEL)
		QDEL_IN(S, 300)

	if(length(removed_limbs))
		var/duglimbs = english_list(removed_limbs, final_comma_text = ",")
		user.affected_message(embedded_human,
			SPAN_NOTICE("You dig the shrapnel [address_mode] [duglimbs] with your [src.name]."),
			SPAN_NOTICE("[user] digs the shrapnel out of your [duglimbs] with \his [src.name]."),
			SPAN_NOTICE(user != embedded_human ? "[user] uses \his [src.name] to dig the shrapnel out of [embedded_human]'s [duglimbs]." : "[user] digs the shrapnel out of \his [duglimbs] with \his [src.name]."))

		if(!embedded_human.stat && embedded_human.pain.feels_pain && embedded_human.pain.reduction_pain < PAIN_REDUCTION_HEAVY)
			if(prob(25))
				INVOKE_ASYNC(embedded_human, TYPE_PROC_REF(/mob, emote), "pain")
			else
				INVOKE_ASYNC(embedded_human, TYPE_PROC_REF(/mob, emote), "me", 1, pick("winces.", "grimaces.", "flinches."))

		SEND_SIGNAL(embedded_human, COMSIG_HUMAN_SHRAPNEL_REMOVED)

	else
		to_chat(user, SPAN_NOTICE("You couldn't find any shrapnel."))

// Demo and example of a 64x64 weapon.
/obj/item/weapon/ritual
	name = "cool knife"
	desc = "It shines with awesome coding power"
	icon_state = "dark_blade"
	item_state = "dark_blade"
	force = MELEE_FORCE_VERY_STRONG
	throwforce = MELEE_FORCE_WEAK
	sharp = IS_SHARP_ITEM_BIG
	edge = TRUE
	w_class = SIZE_MEDIUM
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 7
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	item_icons = list(
		WEAR_L_HAND = 'icons/mob/humans/onmob/items_lefthand_64.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/items_righthand_64.dmi'
		)

/obj/item/weapon/straight_razor
	name = "straight razor"
	desc = "The commandant's favorite weapon against marines who dare break the grooming standards."
	icon_state = "razor"
	hitsound = 'sound/weapons/genhit3.ogg'
	force = MELEE_FORCE_TIER_1
	throwforce = MELEE_FORCE_TIER_1
	throw_speed = SPEED_VERY_FAST
	throw_range = 6
	w_class = SIZE_SMALL
	///Icon state for opened razor
	var/enabled_icon = "razor"
	///Icon state for closed razor
	var/disabled_icon = "razor_off"
	///If the razor is able to be used
	var/razor_opened = FALSE
	///Time taken to open/close the razor
	var/interaction_time = 3 SECONDS

/obj/item/weapon/straight_razor/Initialize(mapload, ...)
	. = ..()
	RegisterSignal(src, COMSIG_ITEM_ATTEMPTING_EQUIP, PROC_REF(can_fit_in_shoe))
	change_razor_state(razor_opened)
	if(prob(1))
		desc += " There is phrase etched into it, \"<i>It can guarantee the closest shave you'll ever know.</i>\"..."

/obj/item/weapon/straight_razor/update_icon()
	. = ..()
	if(razor_opened)
		icon_state = enabled_icon
		return
	icon_state = disabled_icon

/obj/item/weapon/straight_razor/attack_hand(mob/user)
	if(!ishuman(user))
		return ..()
	var/mob/living/carbon/human/human = user
	if(human.l_hand != src && human.r_hand != src) //Only do unique stuff if you are holding it
		return ..()

	playsound(user, 'sound/weapons/flipblade.ogg', 15, 1)
	change_razor_state(!razor_opened)
	to_chat(user, SPAN_NOTICE("You [razor_opened ? "reveal" : "hide"] [src]'s blade."))

///Check if the item can fit as a boot knife, var/source for signals
/obj/item/weapon/straight_razor/proc/can_fit_in_shoe(source = src, mob/user, slot)
	if(slot != WEAR_IN_SHOES) //Only check if you try putting it in a shoe
		return
	if(razor_opened)
		to_chat(user, SPAN_NOTICE("You cannot store [src] in your shoes until the blade is hidden."))
		return COMPONENT_CANCEL_EQUIP

///Changes all the vars for the straight razor
/obj/item/weapon/straight_razor/proc/change_razor_state(opening = FALSE)
	razor_opened = opening
	update_icon()
	if(opening)
		force = MELEE_FORCE_NORMAL
		throwforce = MELEE_FORCE_NORMAL
		sharp = IS_SHARP_ITEM_ACCURATE
		edge = TRUE
		attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
		hitsound = 'sound/weapons/slash.ogg'
		if(!(flags_item & CAN_DIG_SHRAPNEL))
			flags_item |= CAN_DIG_SHRAPNEL
		return
	force = MELEE_FORCE_TIER_1
	throwforce = MELEE_FORCE_TIER_1
	sharp = FALSE
	edge = FALSE
	attack_verb = list("smashed", "beaten", "slammed", "struck", "smashed", "battered", "cracked")
	hitsound = 'sound/weapons/genhit3.ogg'
	if(flags_item & CAN_DIG_SHRAPNEL)
		flags_item &= ~CAN_DIG_SHRAPNEL

/obj/item/weapon/straight_razor/verb/change_hair_style()
	set name = "Change Hair Style"
	set desc = "Change your hair style"
	set category = "Object"
	set src in usr

	var/mob/living/carbon/human/human_user = usr
	if(!istype(human_user))
		return

	if(!razor_opened)
		to_chat(human_user, SPAN_NOTICE("You need to reveal [src]'s blade to change your hairstyle."))
		return

	var/list/species_facial_hair = GLOB.facial_hair_styles_list
	var/list/species_hair = GLOB.hair_styles_list

	if(human_user.species) //Facial hair
		species_facial_hair = list()
		for(var/current_style in GLOB.facial_hair_styles_list)
			var/datum/sprite_accessory/facial_hair/temp_beard_style = GLOB.facial_hair_styles_list[current_style]
			if(!(human_user.species.name in temp_beard_style.species_allowed))
				continue
			if(!temp_beard_style.selectable)
				continue
			species_facial_hair += current_style

	if(human_user.species) //Hair
		species_hair = list()
		for(var/current_style in GLOB.hair_styles_list)
			var/datum/sprite_accessory/hair/temp_hair_style = GLOB.hair_styles_list[current_style]
			if(!(human_user.species.name in temp_hair_style.species_allowed))
				continue
			if(!temp_hair_style.selectable)
				continue
			species_hair += current_style

	var/new_beard_style
	var/new_hair_style
	if(human_user.gender == MALE)
		new_beard_style = tgui_input_list(human_user, "Select a facial hair style", "Grooming", species_facial_hair)
	new_hair_style = tgui_input_list(human_user, "Select a hair style", "Grooming", species_hair)

	if(loc != human_user)
		to_chat(human_user, SPAN_NOTICE("You are too far from [src] to change your hair styles."))
		return

	if(!new_beard_style && !new_hair_style)
		return

	if(!do_after(human_user, interaction_time, INTERRUPT_ALL, BUSY_ICON_GENERIC))
		return

	if(!razor_opened)
		to_chat(human_user, SPAN_NOTICE("You need to reveal [src]'s blade to change your hairstyle."))
		return

	if(new_beard_style)
		human_user.f_style = new_beard_style
	if(new_hair_style)
		human_user.h_style = new_hair_style

	human_user.apply_damage(rand(1,5), BRUTE, "head", src)
	human_user.update_hair()

/obj/item/weapon/straight_razor/attack(mob/target, mob/user)
	if((!ishuman(target)) || (user.a_intent == INTENT_HARM) || !razor_opened)
		return ..()
	var/mob/living/carbon/human/poor_bastard = target

	var/timer = 10 SECONDS
	var/message = "\The [user] begins to shave \the [poor_bastard]!"
	if(skillcheck(user, SKILL_LEADERSHIP, SKILL_LEAD_EXPERT))
		timer = 5 SECONDS
		message = "\The [user] begins to <b>expertly</b> shave \the [poor_bastard]!"

	user.visible_message(SPAN_WARNING(message))
	if(!do_after(user, timer, INTERRUPT_ALL, BUSY_ICON_HOSTILE))
		return

	switch(user.zone_selected)
		if("mouth")
			poor_bastard.f_style = "Shaved"
			user.visible_message(SPAN_WARNING("\The [user] shaves off \the [poor_bastard]'s facial hair!"))
		if("head")
			poor_bastard.h_style = pick("Skinhead", "Bald")
			user.visible_message(SPAN_WARNING("\The [user] shaves off \the [poor_bastard]'s hair!"))

	poor_bastard.apply_damage(rand(1,5), BRUTE, "head", src)
	poor_bastard.update_hair()
	return TRUE

/obj/item/weapon/knife/marine
	name = "\improper M13 fighting knife"
	icon = 'icons/obj/items/weapons/weapons.dmi'
	icon_state = "knife_gerber"
	item_state = "knife_gerber"
	desc = "A standard issue USCMC fighting knife developed by the Kershaw-Gerber company, a subsidiary of Armat Battlefield Systems. Neatly fits into boot-mounted holsters, and can - in emergencies - be utilized to dig out shrapnel."
	flags_atom = FPRINT|QUICK_DRAWABLE|CONDUCT
	flags_equip_slot = SLOT_WAIST|SLOT_FACE
	flags_armor_protection = SLOT_FACE
	flags_item = CAN_DIG_SHRAPNEL
	w_class = SIZE_SMALL
	edge = 1
	sharp = IS_SHARP_ITEM_ACCURATE
	force = MELEE_FORCE_NORMAL
	throwforce = MELEE_FORCE_NORMAL
	throw_speed = SPEED_VERY_FAST
	throw_range = 6
	hitsound = 'sound/weapons/slash.ogg'
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 9

/obj/item/weapon/knife/marine/kabar
	name = "\improper KA-BAR utility knife"
	icon_state = "knife_kabar"
	item_state = "knife_kabar"
	desc = "An old school Marine Corps combat knife. The iconic look of the knife and its association with the Corps' cultural history has seen it remain popular among marines well after its replacement as standard-issue. Fits neatly into boot-mounted holsters, and can - in emergencies - be utilized to dig out shrapnel."

/obj/item/weapon/knife/marine/baker
	name = "\improper M1 Baker-pattern fighting knife"
	icon_state = "knife_baker"
	item_state = "knife_baker"
	desc = "A modern take on an older design, issued primarily to US army members & some elements of the USASF. Fits neatly into boot-mounted holsters, and can - in emergencies - be utilized to dig out shrapnel."

/obj/item/weapon/knife/marine/bowie
	name = "\improper Bowie fighting knife"
	icon_state = "knife_bowie"
	item_state = "knife_bowie"
	desc = "A large, devastating fighting knife of the old American west. Not an antique in of itself, but a high quality piece of equipment for the discerning outdoorsman. Now THIS is a knife."
	w_class = SIZE_MEDIUM
	force = MELEE_FORCE_TIER_6
	throwforce = MELEE_FORCE_WEAK
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/weapon/knife/marine/bowie/kukri
	name = "\improper Kukri utility knife"
	icon_state = "knife_kukri"
	desc = "A large, recurved fighting knife originating from the Indian subcontinent. Traditionally wielded by the Gurkhas of Nepal or their extrasolar colonial descendants, it's rare to see one in the hands of outsiders."
	flags_equip_slot = SLOT_WAIST

/obj/item/weapon/knife/marine/sas
	name = "\improper Fairbairn-Sykes fighting knife"
	icon_state = "knife_fairbairn"
	item_state = "knife_gerber"
	desc = "This isn't for dressing game or performing camp chores. It's for killing men and has done so successfully for a number of centuries. When all else has failed you, this knife will be in your hand, ready to execute its grim task."
