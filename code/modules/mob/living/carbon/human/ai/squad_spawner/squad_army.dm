/datum/human_ai_squad_preset/army
	faction = FACTION_ARMY

/datum/human_ai_squad_preset/army/patrol
	name = "Army Patrol Team"
	desc = "A US Army patrol group of 1 grenadier and 2 riflemen."
	ai_to_spawn = list(
		/datum/equipment_preset/usa/grenadier = 1,
		/datum/equipment_preset/usa/trooper = 2,
	)

/datum/human_ai_squad_preset/army/fireteam
	name = "Army Infantry Fireteam"
	desc = "A standard US Army infantry fireteam."
	ai_to_spawn = list(
		/datum/equipment_preset/usa/nco = 1,
		/datum/equipment_preset/usa/grenadier = 1,
		/datum/equipment_preset/usa/gunner = 1,
		/datum/equipment_preset/usa/trooper = 1,
	)

/datum/human_ai_squad_preset/army/fireteam_dmr
	name = "Army Marksman Fireteam"
	desc = "A US Army infantry fireteam with a marksman in place of the rifleman."
	ai_to_spawn = list(
		/datum/equipment_preset/usa/nco = 1,
		/datum/equipment_preset/usa/grenadier = 1,
		/datum/equipment_preset/usa/gunner = 1,
		/datum/equipment_preset/usa/marksman = 1,
	)

/datum/human_ai_squad_preset/army/squad
	name = "Army Infantry Squad, Standard"
	desc = "A regulation US Army squad, suitable for most detached engagements. Made of 2 fireteams and a squad leader."
	ai_to_spawn = list(
		/datum/equipment_preset/usa/snco = 1,
		/datum/equipment_preset/usa/nco = 2,
		/datum/equipment_preset/usa/grenadier = 2,
		/datum/equipment_preset/usa/gunner = 2,
		/datum/equipment_preset/usa/trooper = 2,
	)

/datum/human_ai_squad_preset/army/heavy_squad
	name = "Army Infantry Squad, Heavy"
	desc = "A heavy US Army squad, organized for greater firepower."
	ai_to_spawn = list(
		/datum/equipment_preset/usa/snco = 1,
		/datum/equipment_preset/usa/nco = 2,
		/datum/equipment_preset/usa/heavygunner = 1,
		/datum/equipment_preset/usa/marksman = 1,
		/datum/equipment_preset/usa/gunner = 2,
		/datum/equipment_preset/usa/grenadier = 2,
	)

/datum/human_ai_squad_preset/army/medical
	name = "Medical Team"
	desc = "A team comprising a medic, escorted by a rifleman."
	ai_to_spawn = list(
		/datum/equipment_preset/usa/medic = 1,
		/datum/equipment_preset/usa/trooper = 1,
	)

/datum/human_ai_squad_preset/army/hq
	name = "Command Component"
	desc = "An army platoon commander, aides, and an escort."
	ai_to_spawn = list(
		/datum/equipment_preset/usa/lt = 1,
		/datum/equipment_preset/usa/snco = 1,
		/datum/equipment_preset/usa/trooper = 2,
	)

/datum/human_ai_squad_preset/army/usasf
	name = "USASF Patrol Team"
	desc = "A US Aerospace Force Security Forces patrol team of 2 riflemen and 1 squad leader."
	ai_to_spawn = list(
		/datum/equipment_preset/usasf/crew/infantry/nco = 1,
		/datum/equipment_preset/usasf/crew/infantry = 2,
	)

/datum/human_ai_squad_preset/army/usasf/maa
	name = "USASF Master-At-Arms Team"
	desc = "A team of USASF Master-At-Arms armed to repel hostiles. Specialized in close-quarters-combat aboard spaceships. Comes with 2 shotgunners and 1 rifleman."
	ai_to_spawn = list(
		/datum/equipment_preset/usasf/crew/armsman/armed = 1,
		/datum/equipment_preset/usasf/crew/armsman/armed_shotgun = 2,
	)

/datum/human_ai_squad_preset/army/usasf/helljumper
	name = "USASF Para-Rescue Squad"
	desc = "A US Aerospace Force Para-Rescue Jumper ('PJs' or 'Helljumpers') Squad. A special unit which conducts operations deep behind hostile lines to support injured or stranded personnel. Comes with 1 Squad leader, 2 Eng-Techs and 1 Med-Tech."
	ai_to_spawn = list(
		/datum/equipment_preset/usasf/helljumper/squadlead = 1,
		/datum/equipment_preset/usasf/helljumper/technical = 2,
		/datum/equipment_preset/usasf/helljumper/medical = 1,
	)

/datum/human_ai_squad_preset/army/usasf/jtac
	name = "USASF OFLO Squad"
	desc = "A US Aerospace Force infantry Squad which provides Joint Fires Control, spotting enemy positions for Close Air Support and Orbital Bombardment. In theory, at least. Composed by 1 officer, 1 aide and 2 escorts."
	ai_to_spawn = list(
		/datum/equipment_preset/usasf/jtac = 1,
		/datum/equipment_preset/usasf/jtac/lesser_rank = 1,
		/datum/equipment_preset/usasf/crew/infantry/nco = 1,
		/datum/equipment_preset/usasf/crew/infantry = 1,
	)
