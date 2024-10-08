/datum/job/seaman/standard
	title = JOB_NAVY_CREWMAN
	total_positions = -1
	spawn_positions = -1
	gear_preset = /datum/equipment_preset/uscm/pfc

/datum/job/seaman/standard/on_config_load()
	entry_message_body = "You are a rank-and-file sailor of your aerospace force, and that is your strength. You're a part of a great machine, helping operate vessels that sail between the stars and deliver extreme firepower to enemies of your nation. Hoo-yah!"
	return ..()
