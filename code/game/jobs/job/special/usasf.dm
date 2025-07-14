/datum/job/seaman/standard
	title = JOB_NAVY_CREWMAN
	gear_preset = /datum/equipment_preset/usasf/crew
	gear_preset_secondary = /datum/equipment_preset/usasf/crew/snipe

/datum/job/seaman/standard/on_config_load()
	entry_message_body = "You are a rank-and-file sailor of your aerospace force, and that is your strength. You're a part of a great machine, helping operate vessels that sail between the stars and deliver extreme firepower to enemies of your nation. Hoo-yah!"
	return ..()

/datum/job/seaman/skittle
	title = JOB_NAVY_SKITTLE
	gear_preset = /datum/equipment_preset/usasf/crew/flight

/datum/job/seaman/skittle/on_config_load()
	entry_message_body = "You are a part of the flight-deck operations crew aboard a USASF vessel, working to prepare and keep aerospace craft in fighting condition. Hoo-yah!"
	return ..()

/datum/job/seaman/medic
	title = JOB_NAVY_MEDIC
	gear_preset = /datum/equipment_preset/usasf/corpsman

/datum/job/seaman/medic/on_config_load()
	entry_message_body = "You are tasked with keeping the crewmen aboard healthy and strong. You are also an expert when it comes to medication and treatment, and can do minor surgical procedures. Anything beyond your skillset can typically be handled by the autodocs. Hoo-yah!"
	return ..()

/datum/job/seaman/engi
	title = JOB_NAVY_ENGI
	gear_preset = /datum/equipment_preset/usasf/engi

/datum/job/seaman/engi/on_config_load()
	entry_message_body = "Your job is to keep the vessel you're aboard in peak condition, fixing any faults or damages sustained throughout it's tasking. Hoo-yah!"
	return ..()

/datum/job/seaman/helljumper
	title = JOB_NAVY_PARA_TECH
	gear_preset = /datum/equipment_preset/usasf/helljumper

/datum/job/seaman/helljumper/on_config_load()
	entry_message_body = "You're part of the elite 7th Para-Rescue Battalion, equipped with high-end kit and the skills to drop feet first into hell from the back of dropships and help allied units in great need of assistance. Hoo-yah!"
	return ..()

//USASF Officers

/datum/job/seaman/pilot
	title = JOB_NAVY_PILOT
	gear_preset = /datum/equipment_preset/usasf/pilot
	gear_preset_secondary = /datum/equipment_preset/usasf/pilot/lesser_rank

/datum/job/seaman/jtac
	title = JOB_NAVY_JTAC
	gear_preset = /datum/equipment_preset/usasf/jtac
	gear_preset_secondary = /datum/equipment_preset/usasf/jtac/lesser_rank

/datum/job/seaman/jtac/on_config_load()
	entry_message_body = "Often deployed alongside ground forces such as the Colonial Marines or Army, your job is to coordinate fire support from up on high onto concentrations of enemy forces. Hoo-yah!"
	entry_message_end = "This role will likely require coordination with the gamemaster(s) to represent called-in fire-support, ahelp should you have further questions for them."
	return ..()

/datum/job/seaman/officer
	title = JOB_NAVY_SO
	gear_preset = /datum/equipment_preset/usasf/officer
	gear_preset_secondary = /datum/equipment_preset/usasf/officer/lesser_rank

/datum/job/seaman/flightboss
	title = JOB_NAVY_FLIGHT_BOSS
	gear_preset = /datum/equipment_preset/usasf/flightboss

/datum/job/seaman/chief_engineer
	title = JOB_NAVY_CHIEF_ENGINEER
	gear_preset = /datum/equipment_preset/usasf/chief_engineer

/datum/job/seaman/synth
	title = JOB_NAVY_SYNTH
	gear_preset = /datum/equipment_preset/synth/usasf

/datum/job/seaman/CO
	title = JOB_NAVY_CO
	gear_preset = /datum/equipment_preset/usasf/CO
