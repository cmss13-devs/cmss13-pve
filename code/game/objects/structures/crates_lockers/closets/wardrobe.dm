/obj/structure/closet/wardrobe
	name = "wardrobe"
	desc = "It's a storage unit for standard-issue attire."
	icon_state = "blue"
	icon_closed = "blue"
	icon_opened = "blue_open"


/obj/structure/closet/wardrobe/chaplain_black
	name = "chapel wardrobe"
	desc = "It's a storage unit for religious attire."
	icon_state = "black"
	icon_closed = "black"
	icon_opened = "black_open"

/obj/structure/closet/wardrobe/chaplain_black/Initialize()
	. = ..()
	new /obj/item/clothing/suit/holidaypriest(src)
	new /obj/item/clothing/under/wedding/bride_white(src)
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
	new /obj/item/clothing/under/boiler/prison(src)
	new /obj/item/clothing/under/boiler/prison(src)
	new /obj/item/clothing/under/boiler/prison(src)
	new /obj/item/clothing/shoes/orange(src)
	new /obj/item/clothing/shoes/orange(src)
	new /obj/item/clothing/shoes/orange(src)
	return

