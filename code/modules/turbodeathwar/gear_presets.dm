/datum/equipment_preset/uscm/private_equipped/war
	name = "USCM Squad Rifleman (Equipped War)"
	auto_squad_name = SQUAD_MARINE_1

/datum/equipment_preset/upp/rifleman/war
	var/auto_squad_name = SQUAD_UPP

/datum/equipment_preset/upp/rifleman/war/load_preset(mob/living/carbon/human/new_human, randomise, count_participant)
	var/obj/item/card/id/ID = new_human.get_idcard()
	var/datum/squad/auto_squad = get_squad_by_name(auto_squad_name)
	if(auto_squad)
		transfer_marine_to_squad(new_human, auto_squad, new_human.assigned_squad, ID)