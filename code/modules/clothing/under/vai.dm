/obj/item/clothing/under/vai
	name = "\improper VAI parensuit"
	desc = "You shouldn't be seeing this."
	siemens_coefficient = 0.9
	icon_state = "marine_jumpsuit"
	worn_state = "marine_jumpsuit"
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	drop_sound = "armorequip"
	///Makes it so that we can see the right name in the vendor.
	var/specialty = "USCM"
	///List of map variants that use sleeve rolling on something else, like snow uniforms rolling the collar, and therefore shouldn't hide patches etc when rolled.
	var/list/map_variants_roll_accessories = list("s_")
	layer = UPPER_ITEM_LAYER

/obj/item/clothing/under/vai/plaid
	name = "\improper Plaid shirt and denim pants"
	desc = "A simple outfit composed of a plaid shirt and denim jeans, favored by lumberjacks and private contractors."
	item_state = "obj_plaid"
	worn_state = "plaid"
	contained_sprite = TRUE
	icon = 'icons/mob/humans/onmob/contained/vai.dmi'

/obj/item/clothing/under/vai/flower
	name = "\improper Blue Hawaiian shirt and khaki cargo pants"
	desc = "A simple outfit composed of a Blue Hawaiian shirt and khaki cargo pants, favored by dads and private contractors."
	item_state = "obj_blu"
	worn_state = "blueflower"

/obj/item/clothing/under/vai/flower/green
	name = "\improper Green Hawaiian shirt and denim pants"
	desc = "A simple outfit composed of a Green Hawaiian shirt which depicts palms and denim jeans, favored by tourists and private contractors."
	item_state = "obj_green"
	worn_state = "greenflower"
