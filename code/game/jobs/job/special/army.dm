/datum/job/trooper/standard
	title = JOB_ARMY_TROOPER
	supervisors = "the ranking Army member present"
	gear_preset = /datum/equipment_preset/usa/trooper

/datum/job/trooper/standard/on_config_load()
	entry_message_body = "You are a rank-and-file Soldier of your standing army, and that is your strength. What you lack alone, you gain standing shoulder to shoulder with the men and women of the platoon. Hoo-ah!"
	return ..()

/datum/job/trooper/gunner
	title = JOB_ARMY_GUNNER
	gear_preset = /datum/equipment_preset/usa/gunner

/datum/job/trooper/sapper
	title = JOB_ARMY_ENGI
	gear_preset = /datum/equipment_preset/usa/sapper

/datum/job/trooper/medic
	title = JOB_ARMY_MEDIC
	gear_preset = /datum/equipment_preset/usa/medic

/datum/job/trooper/nco
	title = JOB_ARMY_NCO
	gear_preset = /datum/equipment_preset/usa/nco
	gear_preset_secondary = /datum/equipment_preset/usa/nco/lesser_rank

/datum/job/trooper/snco
	title = JOB_ARMY_SNCO
	gear_preset = /datum/equipment_preset/usa/snco
	gear_preset_secondary = /datum/equipment_preset/usa/snco/lesser_rank

/datum/job/trooper/lt
	title = JOB_ARMY_LT
	gear_preset = /datum/equipment_preset/usa/lt
	gear_preset_secondary = /datum/equipment_preset/usa/lt/lesser_rank
