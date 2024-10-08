/datum/job/trooper/standard
	title = JOB_ARMY_TROOPER
	supervisors = "the acting platoon leader"
	total_positions = -1
	spawn_positions = -1
	gear_preset = /datum/equipment_preset/uscm/pfc

/datum/job/trooper/standard/on_config_load()
	entry_message_body = "You are a rank-and-file Soldier of your standing army, and that is your strength. What you lack alone, you gain standing shoulder to shoulder with the men and women of the platoon. Hoo-ah!"
	return ..()
