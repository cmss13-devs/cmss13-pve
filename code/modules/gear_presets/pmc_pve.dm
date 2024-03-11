// new file - don't wanna cram this in with other pmc's, feels bloaty

// riflemen
/datum/equipment_preset/uscm/pmc
	name = "Tactical Unit"
	paygrade = "PMC"
	access = list(ACCESS_WY_GENERAL)
	languages = list(LANGUAGE_JAPANESE, LANGUAGE_ENGLISH)
	faction_group = list(FACTION_LIST_WY)
	faction = FACTION_PMC

/datum/equipment_preset/uscm/pmc/sl
	name = "Operation Leader"
	paygrade = "PMC-TL"
	access = list(ACCESS_WY_GENERAL, ACCESS_WY_SENIOR_LEAD, ACCESS_WY_ARMORY)

/datum/equipment_preset/uscm/pmc/tl
	name = "Team Leader"
	paygrade = "PMC-OP"
	access = list(ACCESS_WY_GENERAL, ACCESS_WY_ARMORY)

/datum/equipment_preset/uscm/pmc/sg
	name = "Heavy Weapons Specialist"
	paygrade = "PMC-WS"
	access = list(ACCESS_WY_GENERAL,ACCESS_WY_ENGINEERING)

/datum/equipment_preset/uscm/pmc/med
	name = "Medical Specialist"
	paygrade = "PMC-MS"
	access = list(ACCESS_WY_GENERAL, ACCESS_PMC_TLPREP, ACCESS_WY_MEDICAL)

