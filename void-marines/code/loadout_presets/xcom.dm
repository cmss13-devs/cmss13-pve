/datum/equipment_preset/sectoid
	name = "Sectoid"

	languages = list(LANGUAGE_YAUTJA)

	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_COLONIST
	rank = JOB_COLONIST
	faction = FACTION_COLONIST
	languages = list()
	access = list(ACCESS_CIVILIAN_PUBLIC)
	skills = /datum/skills/clf
	idtype = null

/datum/equipment_preset/sectoid/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_SECTOID)
	if(!mob_client)
		mob_client = new_human.client

/datum/equipment_preset/sectoid/basic
	name = "Sectoid (Basic)"
	assignment = "Civilian"
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/sectoid/basic/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/rxfm5_eva/sectoid(new_human), WEAR_R_HAND)
	..()

/datum/equipment_preset/thinman
	name = "Thinman"

	languages = list(LANGUAGE_YAUTJA)

	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_COLONIST
	rank = JOB_COLONIST
	faction = FACTION_COLONIST
	languages = list()
	access = list(ACCESS_CIVILIAN_PUBLIC)
	skills = /datum/skills/clf
	idtype = /obj/item/card/id/lanyard

/datum/equipment_preset/thinman/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_THIN_MAN)
	new_human.gender = MALE
	new_human.f_style = "Shaved"
	new_human.h_style = "Mulder"
	if(!mob_client)
		mob_client = new_human.client

/datum/equipment_preset/thinman/basic
	name = "Thinman (Basic)"
	assignment = "Civilian"
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/thinman/basic/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/hybrisa/detective_synth_uniform/alt(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/corporate/black(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big(new_human), WEAR_EYES)

	..()
