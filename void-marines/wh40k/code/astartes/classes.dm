/*

Сержант
--
- Силовой Меч и болтпистолет / Пиломеч и Плазма пистолет.

``` ```
Апотекарий
- Модуль-гироспрей, в броне.
- Возможность наносить дамага с помощью нарцетиума. Много пробития, мало урона.
- Пиломеч и болтпистолет.

Технодесантник
-

Десантник (х4)
``` КЛАССЫ ДЛЯ ДЕСАНТНИКОВ ```
- Тактический Десантник
Среднестатистический десантник. Болтер, болт-пистолет, гранаты и маленький ножик.

- Штурмовой Десантник
Пиломеч, болт-пистолет, ракетный ранец. Влетает в толпу и наносит кучу урона, хилясь за этот счет. Мельта-бомба в комплекте.

- Опустошитель
Тяжелый Болтер/Лазпушка/Автопушка. Стоит позади и наносит высокий дамаг.

- ВФЫВФЫВФЫ
Я не придумал

*/

// --- Apothecary --- \\

/obj/item/storage/backpack/satchel/astartes/apothecary/verb/togglenarthecium(mob/user)
	set name = "Activate Narthecium"
	set category = "Narthecium"
	set src in usr

	if(user.stat)
		return

	to_chat(usr,"You activate the chainsaw on your narthecium, getting ready to cut through armor and bone.")
	user.put_in_hands(new /obj/item/weapon/sword/warhammer/narthecium(user))

/obj/item/weapon/sword/chainsword/narthecium
	name = "Apothecary's Narthecium"
	desc = "The standard issued narthecium of the apothecaries, powered by a internal promethium generator. It requires to be toggled."
	icon = 'void-marines/wh40k/icons/weapon/guardpower_gear_32xOBJ.dmi'
	icon_state = "hypogauntlet_on"
	item_state = "hypogauntlet_on"

	var/list/images = list()
	var/list/items = list()
	var/list/paths = list(
		/obj/item/reagent_container/hypospray,
		/obj/item/tool/surgery/scalpel/laser/advanced,
		/obj/item/tool/surgery/hemostat,
		/obj/item/tool/surgery/retractor,
		/obj/item/tool/surgery/circular_saw,
		/obj/item/tool/surgery/bonegel,
		/obj/item/tool/surgery/bonesetter,
		/obj/item/tool/surgery/FixOVein,
		/obj/item/tool/surgery/cautery
	)

/obj/item/weapon/sword/chainsword/narthecium/Initialize()
	. = ..()
	for(var/path in paths)
		var/obj/item/I = new path (src)
		items += I
		var/image/img = image(icon = I.icon, icon_state = I.icon_state)
		img.name = I.name
		images[I] = img

/obj/item/weapon/sword/chainsword/narthecium/attack_self(mob/user)
	. = ..()
	if(user.r_hand && user.l_hand)
		to_chat(user, SPAN_DANGER("Your hands are full."))
		return

	var/slot = user.get_inactive_hand()
	if(slot == user.r_hand)
		slot = WEAR_R_HAND
	else
		slot = WEAR_L_HAND

//	if(user.a_intent == INTENT_GRAB)
	var/obj/item = show_radial_menu(user, src, images, radius = 50, require_near = TRUE)
	if(isnull(item) || !src)
		return
	if(user.equip_to_slot_if_possible(item, slot))
		items -= item

/*
	else
		to_chat(user, SPAN_GREEN("Help intent for Injector"))
		to_chat(user, SPAN_ORANGE("Grab intent for Surgery tool"))
*/

/obj/item/weapon/sword/warhammer/narthecium/dropped() /// This should not exist on its own
	..()
	QDEL_IN(src, 0)
