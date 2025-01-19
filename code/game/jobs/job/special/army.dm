/datum/job/trooper/standard
	title = JOB_ARMY_TROOPER
	supervisors = "the ranking Army member present"
	gear_preset = /datum/equipment_preset/usa/trooper

/datum/job/trooper/standard/on_config_load()
	entry_message_body = "You are a rank-and-file Soldier of your standing army, and that is your strength. What you lack alone, you gain standing shoulder to shoulder with the men and women of the platoon. Hoo-ah!"
	return ..()

/datum/job/trooper/grenadier
	title = JOB_ARMY_PROPIPE
	gear_preset = /datum/equipment_preset/usa/grenadier

/datum/job/trooper/marksman
	title = JOB_ARMY_MARKSMAN
	gear_preset = /datum/equipment_preset/usa/marksman

/datum/job/trooper/gunner
	title = JOB_ARMY_GUNNER
	gear_preset = /datum/equipment_preset/usa/gunner

/datum/job/trooper/heavygunner
	title = JOB_ARMY_SMARTGUNNER
	gear_preset = /datum/equipment_preset/usa/heavygunner

/datum/job/trooper/ATgunner
	title = JOB_ARMY_ATFIRE
	gear_preset = /datum/equipment_preset/usa/ATgunner

/datum/job/trooper/ATloader
	title = JOB_ARMY_ATLOAD
	gear_preset = /datum/equipment_preset/usa/ATgunner/loader

/datum/job/trooper/sapper
	title = JOB_ARMY_ENGI
	gear_preset = /datum/equipment_preset/usa/sapper

/datum/job/trooper/mainttech
	title = JOB_ARMY_MT
	gear_preset = /datum/equipment_preset/usa/mainttech

/datum/job/trooper/cargotech
	title = JOB_ARMY_CT
	gear_preset = /datum/equipment_preset/usa/cargotech

/datum/job/trooper/medic
	title = JOB_ARMY_MEDIC
	gear_preset = /datum/equipment_preset/usa/medic

/datum/job/trooper/nco
	title = JOB_ARMY_NCO
	gear_preset = /datum/equipment_preset/usa/nco

/datum/job/trooper/snco
	title = JOB_ARMY_SNCO
	gear_preset = /datum/equipment_preset/usa/snco
	gear_preset_secondary = /datum/equipment_preset/usa/snco/lesser_rank

//Army Officers

/datum/job/trooper/lt
	title = JOB_ARMY_LT
	gear_preset = /datum/equipment_preset/usa/lt
	gear_preset_secondary = /datum/equipment_preset/usa/lt/lesser_rank

/datum/job/trooper/intelofficer
	title = JOB_ARMY_INTEL
	gear_preset = /datum/equipment_preset/usa/intelofficer/
	gear_preset_secondary = /datum/equipment_preset/usa/intelofficer/lesser_rank

/datum/job/trooper/researcher
	title = JOB_ARMY_RESEARCHER
	gear_preset = /datum/equipment_preset/usa/researcher
	gear_preset_secondary = /datum/equipment_preset/usa/researcher/lesser_rank

/datum/job/trooper/cargoofficer
	title = JOB_ARMY_QM
	gear_preset = /datum/equipment_preset/usa/cargoofficer
