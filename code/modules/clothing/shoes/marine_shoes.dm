

/obj/item/clothing/shoes/marine
	name = "\improper USCM combat boots"
	desc = "A pair of standard issue all-black USCM combat boots."
	icon_state = "marine"
	item_state = "marine"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	flags_cold_protection = BODY_FLAG_FEET
	flags_heat_protection = BODY_FLAG_FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROT
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROT
	siemens_coefficient = 0.7
	var/armor_stage = 0
	items_allowed = list(/obj/item/attachable/bayonet, /obj/item/weapon/throwing_knife, /obj/item/weapon/gun/pistol/holdout, /obj/item/weapon/gun/pistol/clfpistol, /obj/item/tool/screwdriver, /obj/item/tool/surgery/scalpel, /obj/item/weapon/straight_razor)
	var/knife_type

/obj/item/clothing/shoes/marine/Initialize(mapload, ...)
	. = ..()
	if(knife_type)
		stored_item = new knife_type(src)
	update_icon()

/obj/item/clothing/shoes/marine/update_icon()
	if(stored_item && !armor_stage)
		icon_state = "[initial(icon_state)]-1"
	else
		if(!armor_stage)
			icon_state = initial(icon_state)

/obj/item/clothing/shoes/marine/knife
	knife_type = /obj/item/attachable/bayonet

/obj/item/clothing/shoes/marine/jungle
	icon_state = "marine_jungle"
	desc = "A pair of standard issue USCM jungle boots. Don't go walkin' slow, the devil's on the loose."

/obj/item/clothing/shoes/marine/jungle/knife
	knife_type = /obj/item/attachable/bayonet

/obj/item/clothing/shoes/marine/upp
	name = "\improper UPP combat boots"
	desc = "A pair of standard issue brown UPP Naval Infantry combat boots."
	icon_state = "marine_brown"
	knife_type = /obj/item/attachable/bayonet/upp

/obj/item/clothing/shoes/marine/upp_knife
	knife_type = /obj/item/attachable/bayonet/upp

/obj/item/clothing/shoes/marine/pve_mopp
	name = "\improper M2 MOPP boots"
	desc = "M2 MOPP boots excel at keeping viscera or other biological contaminants away from your feet."
	icon_state = "cbrn"
	item_state = "cbrn"
	armor_rad = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_bio = CLOTHING_ARMOR_GIGAHIGHPLUS


/obj/item/clothing/shoes/marine/rmc
	name = "\improper RMC combat boots"
	desc = "A pair of standard issue black RMC combat boots."
	icon_state = "marine"
/obj/item/clothing/shoes/marine/rmc/New()
	..()
	var/obj/item/attachable/bayonet/upp/knife = new(src)
	knife.name = "\improper Fairbairn-Sykes fighting knife"
	knife.desc = "This isn't for dressing game or performing camp chores. It's for killing men and has done so successfully for a number of centuries. When all else has failed you, this knife will be in your hand, ready to execute its grim task."
	stored_item = knife
	update_icon()

/obj/item/clothing/shoes/marine/civilian
	name = "rugged boots"
	desc = "A pair of black boots not so dissimilar from USCM combat boots, a likely culprit for their inspiration. They'll get the job done, whether that's hiking, or kicking in teeth."
	knife_type = /obj/item/attachable/bayonet

/obj/item/clothing/shoes/marine/civilian/brown
	icon_state = "marine_brown"
	desc = "A pair of brown boots not so dissimilar from UPP combat boots, a likely culprit for their inspiration. They'll get the job done, whether that's hiking, or kicking in teeth."

/obj/item/clothing/shoes/marine/joe
	name = "biohazard boots"
	desc = "A pair of biohazard boots. Tomorrow, Together."
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	knife_type = /obj/item/attachable/bayonet

/obj/item/clothing/shoes/marine/pve_mopp
	name = "\improper M2 MOPP boots"
	desc = "M2 MOPP boots excel at keeping viscera or other biological contaminants away from your feet."
	icon_state = "cbrn"
	item_state = "cbrn"
	armor_rad = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_bio = CLOTHING_ARMOR_GIGAHIGHPLUS
