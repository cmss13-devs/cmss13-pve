/datum/faction/royal_marines_commando
	name = "Royal Marines Commando"
	faction_tag = FACTION_TWE

/datum/faction/royal_marines_commando/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	var/hud_icon_state
	var/obj/item/card/id/dogtag/ID = H.get_idcard()
	var/_role
	if(H.mind)
		_role = H.job
	else if(ID)
		_role = ID.rank
	switch(_role)
		if(JOB_TWE_RMC_COMMANDER)
			hud_icon_state = "commander"
		if(JOB_TWE_RMC_LIEUTENANT)
			hud_icon_state = "lieutenant"
		if(JOB_TWE_RMC_TROOPLEADER)
			hud_icon_state = "troopleader"
		if(JOB_TWE_RMC_SECTIONLEADER)
			hud_icon_state = "sectionleader"
		if(JOB_TWE_RMC_TEAMLEADER)
			hud_icon_state = "teamleader"
		if(JOB_TWE_RMC_MARKSMAN)
			hud_icon_state = "marksman"
		if(JOB_TWE_RMC_RIFLEMAN)
			hud_icon_state = "rifleman"
		if(JOB_TWE_RMC_SMARTGUNNER)
			hud_icon_state = "smartgunner"
		if(JOB_TWE_RMC_BREACHER)
			hud_icon_state = "breacher"
		if(JOB_TWE_RMC_MEDIC)
			hud_icon_state = "medic"
		if(JOB_TWE_RMC_ENGI)
			hud_icon_state = "engi"
	if(hud_icon_state)
		holder.overlays += image('icons/mob/hud/marine_hud.dmi', H, "rmc_[hud_icon_state]")

	var/datum/squad/squad = H.assigned_squad
	if(istype(squad, /datum/squad/marine/rmc))
		var/squad_clr = H.assigned_squad.equipment_color
		switch(GET_DEFAULT_ROLE(_role))
			if(JOB_TWE_RMC_RIFLEMAN) hud_icon_state = "rifleman"
			if(JOB_TWE_RMC_MEDIC) hud_icon_state = "medic"
			if(JOB_TWE_RMC_ENGI) hud_icon_state = "engi"
			if(JOB_TWE_RMC_BREACHER) hud_icon_state = "breacher"
			if(JOB_TWE_RMC_MARKSMAN) hud_icon_state = "marksman"
			if(JOB_TWE_RMC_SMARTGUNNER) hud_icon_state = "smartgunner"
			if(JOB_TWE_RMC_TEAMLEADER) hud_icon_state = "teamleader"
			if(JOB_TWE_RMC_SECTIONLEADER) hud_icon_state = "sectionleader"
			if(JOB_TWE_RMC_TROOPLEADER) hud_icon_state = "troopleader"
			if(JOB_TWE_RMC_LIEUTENANT) hud_icon_state = "lieutenant"
		if(squad.fireteam_leaders["SQ1"] == H || squad.fireteam_leaders["SQ2"] == H || squad.fireteam_leaders["SQ3"] == H || squad.fireteam_leaders["SQ4"] == H)
			H.langchat_styles = "langchat_smaller_bolded"
		else
			H.langchat_styles = initial(H.langchat_styles)
		H.langchat_color = H.assigned_squad.chat_color

		if(!hud_icon_state) hud_icon_state = H.rank_fallback
		if(hud_icon_state)
			var/image/IMG = image('icons/mob/hud/marine_hud.dmi', H, "rmc_[hud_icon_state]")
			holder.overlays += IMG
		if(H.assigned_squad && H.assigned_fireteam)
			var/image/IMG2 = image('icons/mob/hud/marine_hud.dmi', H, "hudsquad_rmc_[H.assigned_fireteam]")
			IMG2.color = squad_clr
			holder.overlays += IMG2
			if(H.assigned_squad.fireteam_leaders[H.assigned_fireteam] == H)
				var/image/IMG3 = image('icons/mob/hud/marine_hud.dmi', H, "hudsquad_rmc_sl")
				IMG3.color = squad_clr
				holder.overlays += IMG3

/datum/faction/royal_marines_commando/get_antag_guns_snowflake_equipment()
	return list(
		list("PRIMARY FIREARMS", 0, null, null, null),
		list("F903A1 Rifle", 20, /obj/item/weapon/gun/rifle/rmc_f90, null, VENDOR_ITEM_REGULAR),
		list("F903A2 Rifle", 30, /obj/item/weapon/gun/rifle/rmc_f90/a_grip, null, VENDOR_ITEM_REGULAR),
		list("F903A1 Marksman Rifle", 30, /obj/item/weapon/gun/rifle/rmc_f90/scope, null, VENDOR_ITEM_REGULAR),
		list("F903A1/B 'Breacher' Rifle", 30, /obj/item/weapon/gun/rifle/rmc_f90/shotgun, null, VENDOR_ITEM_REGULAR),

		list("PRIMARY AMMUNITION", 0, null, null, null),
		list("F903 Magazine (10x24mm)", 5, /obj/item/ammo_magazine/rifle/rmc_f90, null, VENDOR_ITEM_REGULAR),
		list("F903A1 Marksman Magazine (10x24mm)", 15, /obj/item/ammo_magazine/rifle/rmc_f90/marksman, null, VENDOR_ITEM_REGULAR),

		list("SIDEARMS", 0, null, null, null),
		list("L165A1 Pistol", 20, /obj/item/weapon/gun/pistol/vp78/rmc, null, VENDOR_ITEM_REGULAR),
		list("VP70 Combat Pistol", 15, /obj/item/weapon/gun/pistol/vp70, null, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", 0, null, null, null),
		list("L165A1 magazine (9mm)", 5, /obj/item/ammo_magazine/pistol/vp78/rmc, null, VENDOR_ITEM_REGULAR),
		list("VP70 Magazine (9mm)", 5, /obj/item/ammo_magazine/pistol/vp70, null, VENDOR_ITEM_REGULAR),

		list("ATTACHMENTS", 0, null, null, null),
		list("Angled Grip", 15, /obj/item/attachable/angledgrip, null, VENDOR_ITEM_REGULAR),
		list("Burst Fire Assembly", 15, /obj/item/attachable/burstfire_assembly, null, VENDOR_ITEM_REGULAR),
		list("Extended Barrel", 15, /obj/item/attachable/extended_barrel, null, VENDOR_ITEM_REGULAR),
		list("Laser Sight", 15, /obj/item/attachable/lasersight, null, VENDOR_ITEM_REGULAR),
		list("Rail Flashlight", 5, /obj/item/attachable/flashlight, null, VENDOR_ITEM_REGULAR),
		list("Red-Dot Sight", 15, /obj/item/attachable/reddot, null, VENDOR_ITEM_REGULAR),
		list("Reflex Sight", 15, /obj/item/attachable/reflex, null, VENDOR_ITEM_REGULAR),
		list("Suppressor", 15, /obj/item/attachable/suppressor, null, VENDOR_ITEM_REGULAR),
		list("Vertical Grip", 15, /obj/item/attachable/verticalgrip, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("M94 Marking Flare Pack", 3, /obj/item/storage/box/flare, null, VENDOR_ITEM_RECOMMENDED),
		list("Smoke Grenade", 7, /obj/item/explosive/grenade/smokebomb, null, VENDOR_ITEM_REGULAR),
		list("R2175/B HIDP grenade packet", 7, /obj/item/storage/box/packet/rmc/incin, null, VENDOR_ITEM_REGULAR),
		list("R2175/A HEDP grenade packet", 7, /obj/item/storage/box/packet/rmc, null, VENDOR_ITEM_REGULAR),
		list("L5 bayonet", 3, /obj/item/attachable/bayonet/rmc, null, VENDOR_ITEM_REGULAR),
	)

/datum/faction/royal_marines_commando/get_antag_guns_sorted_equipment()
	return list(
		list("PRIMARY FIREARMS", -1, null, null),
		list("F903A1 Rifle", 20, /obj/item/weapon/gun/rifle/rmc_f90, null, VENDOR_ITEM_REGULAR),
		list("F903A2 Rifle", 30, /obj/item/weapon/gun/rifle/rmc_f90/a_grip, null, VENDOR_ITEM_REGULAR),
		list("F903A1 Marksman Rifle", 30, /obj/item/weapon/gun/rifle/rmc_f90/scope, null, VENDOR_ITEM_REGULAR),
		list("F903A1/B 'Breacher' Rifle", 30, /obj/item/weapon/gun/rifle/rmc_f90/shotgun, null, VENDOR_ITEM_REGULAR),

		list("PRIMARY AMMUNITION", -1, null, null),
		list("F903 Magazine (10x24mm)", 5, /obj/item/ammo_magazine/rifle/rmc_f90, null, VENDOR_ITEM_REGULAR),
		list("F903A1 Marksman Magazine (10x24mm)", 15, /obj/item/ammo_magazine/rifle/rmc_f90/marksman, null, VENDOR_ITEM_REGULAR),

		list("SIDEARMS", -1, null, null),
		list("L165A1 Pistol", 20, /obj/item/weapon/gun/pistol/vp78/rmc, null, VENDOR_ITEM_REGULAR),
		list("VP70 Combat Pistol", 15, /obj/item/weapon/gun/pistol/vp70, null, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", -1, null, null),
		list("L165A1 magazine (9mm)", 5, /obj/item/ammo_magazine/pistol/vp78/rmc, null, VENDOR_ITEM_REGULAR),
		list("VP70 Magazine (9mm)", 5, /obj/item/ammo_magazine/pistol/vp70, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", -1, null, null),
		list("M94 Marking Flare Pack", 3, /obj/item/storage/box/flare, null, VENDOR_ITEM_RECOMMENDED),
		list("Smoke Grenade", 7, /obj/item/explosive/grenade/smokebomb, null, VENDOR_ITEM_REGULAR),
		list("R2175/B HIDP grenade packet", 7, /obj/item/storage/box/packet/rmc/incin, null, VENDOR_ITEM_REGULAR),
		list("R2175/A HEDP grenade packet", 7, /obj/item/storage/box/packet/rmc, null, VENDOR_ITEM_REGULAR),
		list("L5 bayonet", 3, /obj/item/attachable/bayonet/rmc, null, VENDOR_ITEM_REGULAR),
	)
