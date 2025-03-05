// Плессхолдеры

/obj/structure/warhammer/aquilla
	name = "Aquilla"
	icon = 'void-marines/wh40k/icons/someshit/structures/aquilla.dmi'
	icon_state = "aquilla"

/obj/structure/warhammer/statue
	icon = 'void-marines/wh40k/icons/someshit/structures/bigstatues.dmi'
	icon_state = "statue_b"

/obj/structure/warhammer/statue/one
	icon = 'void-marines/wh40k/icons/someshit/structures/bigstatues.dmi'
	icon_state = "statue_j"

/obj/structure/warhammer/statue/two
	icon = 'void-marines/wh40k/icons/someshit/structures/bigstatues.dmi'
	icon_state = "statue_rahl"

/obj/structure/warhammer/cage
	icon = 'void-marines/wh40k/icons/someshit/structures/cage.dmi'
	icon_state = "cage"

/obj/structure/warhammer/statue/three
	icon = 'void-marines/wh40k/icons/someshit/structures/crafts.dmi'
	icon_state = "statue4"

/obj/structure/warhammer/statue/four
	icon = 'void-marines/wh40k/icons/someshit/structures/crafts.dmi'
	icon_state = "statue6"

/obj/structure/warhammer/fireplace
	icon = 'void-marines/wh40k/icons/someshit/structures/fireplacebig.dmi'
	icon_state = "fireplace"

/obj/structure/warhammer/fountain
	icon = 'void-marines/wh40k/icons/someshit/structures/fountain.dmi'
	icon_state = "bright_fountain_preview"

/obj/structure/warhammer/fountain/off
	icon = 'void-marines/wh40k/icons/someshit/structures/fountain.dmi'
	icon_state = "bright_fountain"

/obj/structure/warhammer/brokenstatue
	icon = 'void-marines/wh40k/icons/someshit/structures/prayer.dmi'
	icon_state = "prophet_curse"

/obj/structure/warhammer/xenotube
	icon = 'void-marines/wh40k/icons/someshit/structures/xenotube.dmi'
	icon_state = "xenotube"

/obj/structure/warhammer/xenotube/off
	icon_state = "xenotube_off"

/obj/item/warhammer/throne
	icon = 'void-marines/wh40k/icons/someshit/thrones.dmi'
	icon_state = "throne"

/obj/item/warhammer/throne/silver
	icon = 'void-marines/wh40k/icons/someshit/thrones2.dmi'
	icon_state = "throne1"

/obj/item/warhammer/throne/copper
	icon = 'void-marines/wh40k/icons/someshit/thrones3.dmi'
	icon_state = "throne1"

/obj/structure/warhammer/statue/saint
	icon = 'void-marines/wh40k/icons/someshit/structures/64x64.dmi'
	icon_state = "statue"

/obj/structure/warhammer/statue/saint/broken
	icon_state = "statue_broken"

/obj/structure/warhammer/statue/saint/unknown_guardsman
	icon_state = "statue_guardsmen"

/obj/structure/warhammer/statue/angel
	icon = 'void-marines/wh40k/icons/spookystatues.dmi'
	icon_state = "AngelRight"

/obj/structure/warhammer/statue/angel/left
	icon_state = "AngelLeft"

/obj/structure/warhammer/statue/guardian
	icon = 'void-marines/wh40k/icons/spookystatues.dmi'
	icon_state = "defender"

/obj/effect/floor_decal/newcorner/crater_big
	icon = 'void-marines/wh40k/icons/trenches_turfs.dmi'
	icon_state = "l1"

/obj/effect/floor_decal/newcorner/crater_small
	icon = 'void-marines/wh40k/icons/trenches_turfs.dmi'
	icon_state = "crater"

// Candle

/obj/item/tool/candle/church
	icon = 'void-marines/wh40k/icons/candle.dmi'
	icon_state = "church_candle"
	wax = 6000

/obj/item/tool/candle/church/New()
	wax = rand(6000, 7000) // Enough for 27-33 minutes. 30 minutes on average.
	..()

/obj/item/tool/candle/church/update_icon()
	icon_state = "[icon_state][heat_source ? "_lit" : ""]"

/obj/item/tool/candle/church/dinner
	icon_state = "dinner_candle"

/obj/item/tool/candle/church/tiny
	icon_state = "tiny_candle"

// Arty

/obj/structure/artillery
	name = "artillery"
	icon = 'void-marines/wh40k/icons/cannon.dmi'
	icon_state = "modern_cannon"

/obj/item/shell
	name = "high-explosive shell"
	desc = "High-Explosive shell, used in Artillery."
	icon = 'void-marines/wh40k/icons/cannon_ball.dmi'
	icon_state = "shellHE"

/obj/item/shell/phosphex
	name = "phosphex shell"
	icon_state = "shell_phosgen"
	desc = "The phosphex shell is filled with a terrible chemical mixture of white phosphorus, powerful acids and poisons, which when detonated creates pools of sickly green flame, poisoning and corroding everything that can bear its heat, and leaving a patch of land where nothing living will grow for years an area of land where nothing living will grow for years."

/obj/item/shell/gas
	name = "inferno shell"
	desc = "This heavy incendiary shell is filled with promethium gel and has a fucelline explosive core, spreading the flaming mixture over a larger area."
	icon_state = "shell_xb"
