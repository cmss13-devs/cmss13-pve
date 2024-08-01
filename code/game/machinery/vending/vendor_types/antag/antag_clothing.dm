//------------ADAPTIVE ANTAG CLOSET---------------
//Spawn one of these bad boys and you will have a proper automated closet for CLF/UPP players (for now, more can be always added later)

/obj/structure/machinery/cm_vending/clothing/antag
	name = "\improper Suspicious Automated Equipment Rack"
	desc = "While similar in function to ColMarTech automated racks, this one is clearly not of USCM origin. Contains various equipment."
	icon_state = "antag_clothing"
	req_one_access = list(ACCESS_ILLEGAL_PIRATE, ACCESS_UPP_GENERAL, ACCESS_CLF_GENERAL)
	req_access = null

	listed_products = list()

/obj/structure/machinery/cm_vending/clothing/antag/Initialize()
	. = ..()
	vend_flags |= VEND_FACTION_THEMES

/obj/structure/machinery/cm_vending/clothing/antag/get_listed_products(mob/user)
	if(!user)
		var/list/all_equipment = list()
		var/list/presets = typesof(/datum/equipment_preset)
		for(var/i in presets)
			var/datum/equipment_preset/eq = new i
			var/list/equipment = eq.get_antag_clothing_equipment()
			if(LAZYLEN(equipment))
				all_equipment += equipment
			qdel(eq)
		return all_equipment

	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/list/products_sets = list()
	if(H.assigned_equipment_preset)
		if(!(H.assigned_equipment_preset.type in listed_products))
			listed_products[H.assigned_equipment_preset.type] = H.assigned_equipment_preset.get_antag_clothing_equipment()
		products_sets = listed_products[H.assigned_equipment_preset.type]
	else
		if(!(/datum/equipment_preset/clf in listed_products))
			listed_products[/datum/equipment_preset/clf] = GLOB.gear_path_presets_list[/datum/equipment_preset/clf].get_antag_clothing_equipment()
		products_sets = listed_products[/datum/equipment_preset/clf]
	return products_sets
