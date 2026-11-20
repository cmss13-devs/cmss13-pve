/datum/equipment_preset/uscm/imperial
	name = "Imperial Guardsman, Rifleman"
	paygrades = list(PAY_SHORT_ME2 = JOB_PLAYTIME_TIER_0)
	languages = list(LANGUAGE_ENGLISH)
	role_comm_title = "Grd."
	access = list(ACCESS_MARINE_PREP)
	faction_group = list(FACTION_IMPERIAL_GUARD)
	faction = FACTION_IMPERIAL_GUARD
	idtype = /obj/item/card/id/dogtag
	assignment = JOB_IMPPLAT_STANDARD
	rank = JOB_SQUAD_MARINE
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	skills = /datum/skills/pfc/recon

/datum/equipment_preset/uscm/imperial/vox
	name = "Imperial Guardsman, Vox Operator"
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP)
	role_comm_title = "Vox."
	assignment = JOB_IMPPLAT_VOX
	rank = JOB_SQUAD_RTO
	skills = /datum/skills/tl/recon

/datum/equipment_preset/uscm/imperial/sl
	name = "Imperial Guardsman, Section Leader"
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_DROPSHIP)
	role_comm_title = "Sl."
	assignment = JOB_IMPPLAT_LEADER
	rank = JOB_SQUAD_LEADER
	skills = /datum/skills/sl_pve

/datum/equipment_preset/uscm/imperial/tl
	name = "Imperial Guardsman, Team Leader"
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_TL_PREP)
	role_comm_title = "Tl."
	assignment = JOB_IMPPLAT_FTL
	rank = JOB_SQUAD_TEAM_LEADER
	skills = /datum/skills/tl/recon

/datum/equipment_preset/uscm/imperial/specialist
	name = "Imperial Guardsman, Weapons Specialist"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	role_comm_title = "Spc."
	assignment = JOB_IMPPLAT_SPECIALIST
	rank = JOB_SQUAD_SPECIALIST
	skills = /datum/skills/pfc/recon

/datum/equipment_preset/uscm/imperial/med
	name = "Imperial Guardsman, Medicae"
	paygrades = list(PAY_SHORT_ME3 = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_MARINE_PREP, ACCESS_CIVILIAN_MEDBAY, ACCESS_MARINE_MEDBAY)
	role_comm_title = "Med."
	assignment = JOB_IMPPLAT_MEDICAE
	rank = JOB_SQUAD_MEDIC
	skills = /datum/skills/combat_medic_pve
