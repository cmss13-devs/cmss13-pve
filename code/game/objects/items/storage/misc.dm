/obj/item/storage/pill_bottle/dice
	name = "pack of dice"
	desc = "It's a small container with dice inside."

/obj/item/storage/pill_bottle/dice/fill_preset_inventory()
		new /obj/item/toy/dice( src )
		new /obj/item/toy/dice/d20( src )

/*
 * Donut Box
 */

/obj/item/storage/donut_box
	icon = 'icons/obj/items/food.dmi'
	icon_state = "donutbox"
	name = "\improper Yum! donuts"
	desc = "A box of mouth-watering \"<i>Yum!</i>\" brand donuts."
	storage_slots = 6
	var/startswith = 6
	var/open = 0
	can_hold = list(/obj/item/reagent_container/food/snacks/donut)
	foldable = /obj/item/stack/sheet/cardboard

/obj/item/storage/donut_box/fill_preset_inventory()
	for(var/i=1; i <= startswith; i++)
		new /obj/item/reagent_container/food/snacks/donut/normal(src)

/obj/item/storage/donut_box/attack_self(mob/user as mob)
	var/message = "You [open ? "close [src]. Another time, then." : "open [src]. Mmmmm... donuts."]"
	to_chat(user, message)
	open = !open
	update_icon()
	if(!length(contents))
		..()
	return

/obj/item/storage/donut_box/update_icon()
	overlays.Cut()
	if(!open)
		icon_state = "donutbox"
		return
	icon_state = "donutbox_o"
	var/i = 0
	for(var/obj/item/reagent_container/food/snacks/donut/D in contents)
		i++
		var/image/img = image('icons/obj/items/food.dmi', "[D.overlay_state]-[i]")
		overlays += img

/obj/item/storage/donut_box/empty
	icon_state = "donutbox_o"
	startswith = 0

/*
 * Mateba Case
 */

/obj/item/storage/mateba_case
	icon = 'icons/obj/items/storage/kits.dmi'
	icon_state = "matebacase"
	name = "mateba customization kit case"
	desc = "A wooden case used for storing the tools and parts needed to customize a Mateba revolver. Comes with three barrel lengths and the necessary key to swap them out."
	storage_slots = 5
	can_hold = list(/obj/item/attachable/mateba, /obj/item/weapon/gun/revolver/mateba, /obj/item/weapon/mateba_key)

/obj/item/storage/mateba_case/captain/fill_preset_inventory()
	new /obj/item/attachable/mateba/short(src)
	new /obj/item/attachable/mateba(src)
	new /obj/item/attachable/mateba/long(src)
	new /obj/item/weapon/mateba_key(src)

/obj/item/storage/mateba_case/captain/council
	icon_state = "c_matebacase"
	name = "colonel's mateba customization kit case"
	desc = "A black-ebony case used for storing the tools and parts needed to customize a Mateba revolver. This variant is custom-made for colonels."

/obj/item/storage/mateba_case/general
	icon_state = "c_matebacase"
	name = "general's mateba customization kit case"
	desc = "A black-ebony case used for storing the tools and parts needed to customize a Mateba revolver. This variant is made for general-grade golden Matebas and comes with golden barrel attachments."

/obj/item/storage/mateba_case/general/fill_preset_inventory()
	new /obj/item/attachable/mateba/short/dark(src)
	new /obj/item/attachable/mateba/dark(src)
	new /obj/item/attachable/mateba/long/dark(src)
	new /obj/item/weapon/mateba_key(src)

//6 pack

/obj/item/storage/beer_pack
	name = "beer pack"
	desc = "A pack of Aspen beer cans."
	icon = 'icons/obj/items/drinkcans.dmi'
	icon_state = "6_pack_6"
	item_state = "souto_classic"
	storage_slots = 6
	can_hold = list(/obj/item/reagent_container/food/drinks/cans/aspen)

/obj/item/storage/beer_pack/fill_preset_inventory()
	for(var/i in 1 to 6)
		new /obj/item/reagent_container/food/drinks/cans/aspen(src)

/obj/item/storage/beer_pack/update_icon()
	if(length(contents) == 1)
		var/turf/T = get_turf(src)
		var/obj/item/reagent_container/food/drinks/cans/aspen/B = new(T)
		if(ishuman(loc))
			var/mob/living/carbon/human/H = loc
			H.temp_drop_inv_item(src)
			H.put_in_inactive_hand(B)
		qdel(src)
	else
		icon_state = "6_pack_[length(contents)]"

/obj/item/storage/box/loadout
	name = "storage case"
	desc = "A wooden case that fits a pistol and a number of magazines."
	icon = 'icons/obj/items/storage/kits.dmi'
	icon_state = "matebacase"
	w_class = SIZE_LARGE
	max_w_class = SIZE_MEDIUM
	storage_slots = 7

/obj/item/storage/box/loadout/upp
	name = "Type 73 storing case"
	desc = "A small case containing a loaded Type 73, and additional magazines."
	can_hold = list(/obj/item/weapon/gun/pistol/t73, /obj/item/ammo_magazine/pistol/t73)

/obj/item/storage/box/loadout/upp/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/t73())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol/t73(src)

/obj/item/storage/box/loadout/M4A3_custom_loadout
	name = "M4A3 storage case"
	desc = "A relatively large storage case containing a loaded M4A3 and additional magazines."
	can_hold = list(/obj/item/weapon/gun/pistol/m4a3/custom, /obj/item/ammo_magazine/pistol)

/obj/item/storage/box/loadout/M4A3_custom_loadout/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/m4a3/custom())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol(src)

/obj/item/storage/box/loadout/HG45_civilian_loadout
	name = "HG 45 'Aguila' storage case"
	desc = "A relatively large storage case containing a loaded HG 45 'Aguila' and additional magazines."
	can_hold = list(/obj/item/weapon/gun/pistol/highpower, /obj/item/ammo_magazine/pistol/highpower)

/obj/item/storage/box/loadout/HG45_civilian_loadout/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/highpower())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol/highpower(src)

/obj/item/storage/box/loadout/HG45_marine_loadout
	name = "HG 45 'Marina' storage case"
	desc = "A relatively large storage case containing a loaded HG 45 'Marina' and additional magazines."
	can_hold = list(/obj/item/weapon/gun/pistol/highpower/black, /obj/item/ammo_magazine/pistol/highpower/black)

/obj/item/storage/box/loadout/HG45_marine_loadout/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/highpower/black())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol/highpower/black(src)

/obj/item/storage/box/loadout/HG44_loadout
	name = "HG 44 'Automag' storage case"
	desc = "A relatively large storage case containing a loaded HG 44 'Automag' and additional magazines."
	can_hold = list(/obj/item/weapon/gun/pistol/highpower/automag, /obj/item/ammo_magazine/pistol/highpower/automag)

/obj/item/storage/box/loadout/HG44_loadout/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/highpower/automag())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol/highpower/automag(src)

/obj/item/storage/box/loadout/Spearhead_loadout
	name = "Spearhead Armoury storage case"
	desc = "A relatively large storage case containing a loaded Spearhead Armoury revolver and additional speedloaders."
	can_hold = list(/obj/item/weapon/gun/revolver/spearhead, /obj/item/ammo_magazine/revolver/spearhead)

/obj/item/storage/box/loadout/Spearhead_loadout/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/revolver/spearhead())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/revolver/spearhead(src)

/obj/item/storage/box/loadout/Spearhead_loadout/custom
	name = "Spearhead Armoury storage case"
	desc = "A relatively large storage case containing a loaded Spearhead Armoury revolver and additional speedloaders."
	can_hold = list(/obj/item/weapon/gun/revolver/spearhead/black, /obj/item/ammo_magazine/revolver/spearhead)

/obj/item/storage/box/loadout/Spearhead_loadout/custom/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/revolver/spearhead/black())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/revolver/spearhead(src)

/obj/item/storage/box/loadout/M1911_loadout
	name = "M1911 storage case"
	desc = "A relatively large storage case containing a loaded M1911 and additional magazines."
	can_hold = list(/obj/item/weapon/gun/pistol/m1911, /obj/item/ammo_magazine/pistol/m1911)

/obj/item/storage/box/loadout/M1911_loadout/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/m1911())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol/m1911(src)

/obj/item/storage/box/loadout/M44_loadout
	name = "M44 storage case"
	desc = "A relatively large storage case containing a loaded M44 revolver and additional speedloaders."
	can_hold = list(/obj/item/weapon/gun/revolver/m44, /obj/item/ammo_magazine/revolver)

/obj/item/storage/box/loadout/M44_loadout/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/revolver/m44())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/revolver(src)

/obj/item/storage/box/loadout/M44_custom_loadout
	name = "M44 storage case"
	desc = "A relatively large storage case containing a loaded M44 revolver and additional speedloaders."
	can_hold = list(/obj/item/weapon/gun/revolver/m44/custom, /obj/item/ammo_magazine/revolver)

/obj/item/storage/box/loadout/M44_custom_loadout/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/revolver/m44/custom())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/revolver(src)

/obj/item/storage/box/loadout/clf
	name = "Hummingbird storage box"
	desc = "A slim storage case containing a loaded Hummingbird pistol and additional magazines."
	w_class = SIZE_SMALL
	max_w_class = SIZE_TINY
	storage_slots = 4
	can_hold = list(/obj/item/weapon/gun/pistol/clfpistol, /obj/item/ammo_magazine/pistol/clfpistol)

/obj/item/storage/box/loadout/clf/fill_preset_inventory()
	handle_item_insertion(new /obj/item/weapon/gun/pistol/clfpistol())
	for(var/i = 1 to storage_slots - 1)
		new /obj/item/ammo_magazine/pistol/clfpistol(src)

/obj/item/storage/box/loadout/co2_knife
	name = "M8 cartridge bayonet packaging"
	desc = "Contains one M8 Cartridge Bayonet and two sister CO2 cartridges. Thanks for being a dedicated Boots magazine subscriber!"
	icon = 'icons/obj/items/storage/kits.dmi'
	icon_state = "co2_box"
	foldable = TRUE
	storage_slots = 3
	w_class = SIZE_SMALL
	max_w_class = SIZE_SMALL
	can_hold = list(/obj/item/attachable/bayonet/co2, /obj/item/co2_cartridge)

/obj/item/storage/box/loadout/co2_knife/fill_preset_inventory()
	new /obj/item/attachable/bayonet/co2(src)
	new /obj/item/co2_cartridge(src)
	new /obj/item/co2_cartridge(src)
