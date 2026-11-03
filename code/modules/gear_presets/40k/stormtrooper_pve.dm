/datum/equipment_preset/uscm/stormtrooper
	name = "Imperial Stormtrooper, Rifleman"
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)
	languages = list(LANGUAGE_ENGLISH)
	role_comm_title = "Strm."
	access = list(ACCESS_MARINE_PREP)
	faction_group = list(FACTION_IMPERIAL_GUARD)
	faction = FACTION_IMPERIAL_GUARD
	idtype = /obj/item/card/id/dogtag
	assignment = JOB_STRMPLAT_STANDARD
	rank = JOB_SQUAD_MARINE
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	skills = /datum/skills/rmc

/datum/equipment_preset/uscm/stormtrooper/sl
	name = "Imperial Stormtrooper, Squad Leader"
	paygrades = list(PAY_SHORT_ME8 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP)
	role_comm_title = "Sl."
	assignment = JOB_STRMPLAT_LEADER
	rank = JOB_SQUAD_LEADER
	skills = /datum/skills/rmc/leader

/datum/equipment_preset/uscm/stormtrooper/tl
	name = "Imperial Stormtrooper, Team Leader"
	paygrades = list(PAY_SHORT_ME7 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_TL_PREP)
	role_comm_title = "Tl."
	assignment = JOB_STRMPLAT_FTL
	rank = JOB_SQUAD_TEAM_LEADER
	skills = /datum/skills/rmc/leader

/datum/equipment_preset/uscm/stormtrooper/specialist
	name = "Imperial Stormtrooper, Weapons Specialist"
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	role_comm_title = "Spc."
	assignment = JOB_STRMPLAT_SPECIALIST
	rank = JOB_SQUAD_SPECIALIST
	skills = /datum/skills/rmc/smartgun

/datum/equipment_preset/uscm/stormtrooper/med
	name = "Imperial Stormtrooper, Medicae"
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_CIVILIAN_MEDBAY, ACCESS_MARINE_MEDBAY)
	role_comm_title = "Med."
	assignment = JOB_STRMPLAT_MEDICAE
	rank = JOB_SQUAD_MEDIC
	skills = /datum/skills/rmc/medic
