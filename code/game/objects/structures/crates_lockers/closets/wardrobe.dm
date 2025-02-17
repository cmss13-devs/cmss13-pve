/obj/structure/closet/wardrobe
	name = "wardrobe"
	desc = "It's a storage unit for standard-issue attire."
	icon_state = "closed"
	icon_closed = "closed"
	icon_opened = "open"

/obj/structure/closet/wardrobe/chaplain_black
	name = "wardrobe"
	desc = "It's a storage unit for religious attire."
	icon_state = "closed"
	icon_closed = "closed"
	icon_opened = "open"

/obj/structure/closet/wardrobe/chaplain_black/Initialize()
	. = ..()
	new /obj/item/clothing/under/rank/chaplain(src)
	new /obj/item/clothing/suit/holidaypriest(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/storage/fancy/candle_box(src)
	return

/obj/structure/closet/wardrobe/orange
	name = "prison wardrobe"
	desc = "It's a storage unit for prisoner attire."
	icon_state = "orange"
	icon_closed = "orange"
	icon_opened = "orange_open"

/obj/structure/closet/wardrobe/orange/Initialize()
	. = ..()
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/shoes/white(src)
	return


/obj/structure/closet/wardrobe/engineering_yellow
	name = "engineering wardrobe"
	icon_state = "closed"
	icon_closed = "closed"
	icon_opened = "open"

/obj/structure/closet/wardrobe/engineering_yellow/Initialize()
	. = ..()
	new /obj/item/clothing/head/hardhat/orange(src)
	new /obj/item/clothing/head/hardhat/orange(src)
	new /obj/item/clothing/head/hardhat/orange(src)
	return

/obj/structure/closet/wardrobe/medic_white
	name = "medical wardrobe"
	icon_state = "white"
	icon_closed = "white"
	icon_opened = "white_open"

/obj/structure/closet/wardrobe/medic_white/Initialize()
	. = ..()
	new /obj/item/clothing/under/rank/medical(src)
	new /obj/item/clothing/under/rank/medical(src)
	new /obj/item/clothing/under/rank/medical/lightblue(src)
	new /obj/item/clothing/under/rank/medical/blue(src)
	new /obj/item/clothing/under/rank/medical/lightblue(src)
	new /obj/item/clothing/under/rank/medical/green(src)
	new /obj/item/clothing/under/rank/medical/purple(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/shoes/white(src)
	new /obj/item/clothing/suit/storage/labcoat(src)
	new /obj/item/clothing/suit/storage/labcoat(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/clothing/mask/surgical(src)
	return
