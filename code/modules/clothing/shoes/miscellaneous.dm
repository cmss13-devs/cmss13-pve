/obj/item/clothing/shoes/sandal
	desc = "A pair of rather plain, wooden sandals."
	name = "sandals"
	icon_state = "sandals"
	flags_armor_protection = 0

/obj/item/clothing/shoes/laceup
	name = "laceup shoes"
	desc = "A pair of black laceup shoes."
	icon_state = "laceups"

/obj/item/clothing/shoes/laceup/brown
	icon_state = "laceups_brown"
	desc = "A pair of brown laceup shoes."

/obj/item/clothing/shoes/cowboy
	name = "cowboy boots"
	desc = "A pair of geuine leather cowboy boots."
	icon_state = "cowboy"

/obj/item/clothing/shoes/cowboy
	name = "lizardskin cowboy boots"
	desc = "A pair of green lizardskin cowboy boots."
	icon_state = "cowboy-lizard"

/obj/item/clothing/shoes/prison
	name = "inmate boots"
	desc = "A pair of clunky, laceless slip-on boots."
	icon_state = "marine"
	var/obj/item/handcuffs/chained = null

/obj/item/clothing/shoes/prison/proc/attach_cuffs(obj/item/handcuffs/cuffs, mob/user as mob)
	if (src.chained) return

	user.drop_held_item()
	cuffs.forceMove(src)
	src.chained = cuffs
	src.slowdown = 15
	src.icon_state = "marine-prison"

/obj/item/clothing/shoes/prison/proc/remove_cuffs(mob/user as mob)
	if (!src.chained) return

	user.put_in_hands(src.chained)
	src.chained.add_fingerprint(user)

	src.slowdown = initial(slowdown)
	src.icon_state = "marine"
	src.chained = null

/obj/item/clothing/shoes/prison/attack_self(mob/user as mob)
	..()
	remove_cuffs(user)

/obj/item/clothing/shoes/prison/attackby(H as obj, mob/user as mob)
	..()
	if (istype(H, /obj/item/handcuffs))
		attach_cuffs(H, user)

/obj/item/clothing/shoes/black
	name = "black shoes"
	icon_state = "black"
	desc = "A pair of black shoes."

	flags_cold_protection = BODY_FLAG_FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROT
	flags_heat_protection = BODY_FLAG_FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROT

/obj/item/clothing/shoes/brown
	name = "brown shoes"
	desc = "A pair of brown shoes."
	icon_state = "brown"

/obj/item/clothing/shoes/blue
	name = "blue shoes"
	icon_state = "blue"

/obj/item/clothing/shoes/green
	name = "green shoes"
	icon_state = "green"

/obj/item/clothing/shoes/yellow
	name = "yellow shoes"
	icon_state = "yellow"

/obj/item/clothing/shoes/purple
	name = "purple shoes"
	icon_state = "purple"

/obj/item/clothing/shoes/brown
	name = "brown shoes"
	icon_state = "brown"

/obj/item/clothing/shoes/red
	name = "red shoes"
	desc = "Stylish red shoes."
	icon_state = "red"

/obj/item/clothing/shoes/red/knife
	name = "dirty red shoes"
	desc = "Stylish red shoes with a small space to hold a knife."
	items_allowed = list(/obj/item/attachable/bayonet, /obj/item/weapon/throwing_knife, /obj/item/weapon/gun/pistol/holdout, /obj/item/weapon/gun/pistol/clfpistol, /obj/item/tool/screwdriver, /obj/item/weapon/straight_razor)

/obj/item/clothing/shoes/white
	name = "white shoes"
	icon_state = "white"
	permeability_coefficient = 0.01

/obj/item/clothing/shoes/souto
	name = "Souto Man boots"
	desc = "\improper Souto Man's boots. Harder than the kick of Souto Red"
	icon_state = "souto_man"
	item_state = "souto_man"
	flags_inventory = CANTSTRIP|NOSLIPPING
	armor_melee = CLOTHING_ARMOR_HARDCORE
	armor_bullet = CLOTHING_ARMOR_HARDCORE
	armor_laser = CLOTHING_ARMOR_HARDCORE
	armor_energy = CLOTHING_ARMOR_HARDCORE
	armor_bomb = CLOTHING_ARMOR_HARDCORE
	armor_bio = CLOTHING_ARMOR_HARDCORE
	armor_rad = CLOTHING_ARMOR_HARDCORE
	armor_internaldamage = CLOTHING_ARMOR_HARDCORE
	flags_inventory = CANTSTRIP|NOSLIPPING
	unacidable = TRUE

/obj/item/clothing/shoes/swimmingfins
	desc = "Help you swim good."
	name = "swimming fins"
	icon_state = "flippers"
	flags_inventory = NOSLIPPING
	slowdown = SHOES_SLOWDOWN+1

	/obj/item/clothing/shoes/galoshes
	desc = "Rubber boots"
	name = "galoshes"
	icon_state = "galoshes"
	permeability_coefficient = 0.05
	flags_inventory = NOSLIPPING

/obj/item/clothing/shoes/slippers
	name = "bunny slippers"
	desc = "Fluffy!"
	icon_state = "slippers"
	item_state = "slippers"
	w_class = SIZE_SMALL

/obj/item/clothing/shoes/slippers_worn
	name = "worn bunny slippers"
	desc = "Fluffy..."
	icon_state = "slippers_worn"
	item_state = "slippers_worn"
	w_class = SIZE_SMALL
