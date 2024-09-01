/obj/item/weapon/sword/warhammer
	name = "Drusian Pattern Chainsword"
	desc = "A chainsword, likely belonging to an NCO or higher rank in the Astra Militarium. Under the golden eagle it reads 'For the Throne'"
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "chainsword_on"
	item_state = "chainsword_on"
	force = MELEE_FORCE_STRONG
	flags_equip_slot = SLOT_WAIST|SLOT_BACK
	throwforce = MELEE_FORCE_WEAK
	sharp = IS_SHARP_ITEM_BIG
	edge = 1
	w_class = SIZE_LARGE
	hitsound = 'void-marines/wh40k/sounds/weapons/chainsword.ogg'
	attack_verb = list("attacked", "slashed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 5



/obj/item/weapon/sword/warhammer/astartes
	name = "Mars Pattern Chainsword"
	desc = "A beautifully crafted Chainsword encrusted in gold, made on Mars especially for Astartes. That's why it's the size of a man. "
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "Rchainsword_on"
	item_state = "Rchainsword_on"
	force = MELEE_FORCE_STRONG
	throwforce = MELEE_FORCE_NORMAL
	attack_speed = 3

/obj/item/weapon/sword/warhammer/astartes/pickup(mob/user, silent)
	. = ..()
	var/mob/living/carbon/human/human = user
	if(!human.species == SPECIES_ASTARTES)
		to_chat(user, SPAN_DANGER("It's too big and too heavy for me"))
		attack_speed = 8
	else
		attack_speed = 3

/obj/item/weapon/sword/warhammer/power
	name = "Helios Pattern Power Sword"
	desc = "A adamantium sword with a void shield generator inside of it, the void shield will cut through almost anything that it touches when its on, so make sure you don't cut yourself."
	item_state = "powersword"
	icon_state = "powersword"
	force = MELEE_FORCE_STRONG
	var/activated = 0
	var/activated_force = MELEE_FORCE_VERY_STRONG
	attack_speed = 7

/obj/item/weapon/sword/warhammer/power/attack_self(mob/user)
	. = ..()
	activation()

/obj/item/weapon/sword/warhammer/power/proc/activation(mob/user)
	var/action = "activate"
	if(activated)
		force = activated_force
		item_state += "_on"
		icon_state += "_on"
	if(!activated)
		action = "deactivate"
		force = initial(force)
		item_state = initial(item_state)
		icon_state = initial(icon_state)
	visible_message(SPAN_DANGER("With mini\The [user] [action] his \the [src] "), max_distance = COMBAT_MESSAGE_RANGE)

/obj/item/weapon/sword/warhammer/power/astartes
	name = "Ingelldina Pattern Power Sword"
	desc = "A adamantium sword with a voidshield generator inside of it, this one is very long and heavy, clearly having been made for one of the sons of the emperor."
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	force = MELEE_FORCE_STRONG
	activated_force = MELEE_FORCE_TIER_11
