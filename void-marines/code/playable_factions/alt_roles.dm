/datum/squad/marine/fl
	name = SQUAD_MERC
	equipment_color = "#687a9c"
	chat_color = "#687a9c"
	access = list(ACCESS_ILLEGAL_PIRATE)
	radio_freq = MERC_FREQ
	minimap_color = "#687a9c"
	use_stripe_overlay = FALSE
	usable = TRUE

/datum/squad/marine/pmc
	name = SQUAD_PMCPLT
	chat_color = "#ccffe9"
	minimap_color = MINIMAP_SQUAD_PMC
	use_stripe_overlay = FALSE
	usable = TRUE
	squad_one_access = ACCESS_PMC_SQUAD_ONE
	squad_two_access = ACCESS_PMC_SQUAD_TWO
	faction = FACTION_PMC

/datum/job/marine/leader/ai/pmc
	title = JOB_PMCPLAT_LEADER
	gear_preset = /datum/equipment_preset/uscm/pmc/sl
	gear_preset_secondary = /datum/equipment_preset/uscm/pmc/sl

/obj/effect/landmark/start/marine/leader/pmc
	name = JOB_PMCPLAT_LEADER
	squad = SQUAD_PMCPLT
	job = /datum/job/marine/leader/ai/pmc

/datum/job/marine/medic/ai/pmc
	title = JOB_PMCPLAT_MEDIC
	gear_preset = /datum/equipment_preset/uscm/pmc/med
	gear_preset_secondary = /datum/equipment_preset/uscm/pmc/med

/obj/effect/landmark/start/marine/medic/pmc
	name = JOB_PMCPLAT_MEDIC
	squad = SQUAD_PMCPLT
	job = /datum/job/marine/medic/ai/pmc

/datum/job/marine/smartgunner/ai/pmc
	title = JOB_PMCPLAT_SG
	gear_preset = /datum/equipment_preset/uscm/pmc/sg
	gear_preset_secondary = /datum/equipment_preset/uscm/pmc/sg

/obj/effect/landmark/start/marine/smartgunner/pmc
	name = JOB_PMCPLAT_SG
	squad = SQUAD_PMCPLT

/datum/job/marine/standard/ai/pmc
	title = JOB_PMCPLAT_STANDARD
	gear_preset = /datum/equipment_preset/uscm/pmc
	gear_preset_secondary = /datum/equipment_preset/uscm/pmc

/obj/effect/landmark/start/marine/pmc
	name = JOB_PMCPLAT_STANDARD
	squad = SQUAD_PMCPLT
	job = /datum/job/marine/standard/ai/pmc

/datum/job/marine/tl/ai/pmc
	title = JOB_PMCPLAT_FTL
	gear_preset = /datum/equipment_preset/uscm/pmc/tl
	gear_preset_secondary = /datum/equipment_preset/uscm/pmc/tl

/obj/effect/landmark/start/marine/tl/pmc
	name = JOB_PMCPLAT_FTL
	squad = SQUAD_PMCPLT
	job = /datum/job/marine/tl/ai/pmc



/datum/job/marine/leader/ai/fl
	title = JOB_SQUAD_LEADER_FL
	gear_preset = /datum/equipment_preset/uscm/leader/fl

/obj/effect/landmark/start/marine/leader/fl
	name = JOB_SQUAD_LEADER_FL
	squad = SQUAD_MERC
	job = /datum/job/marine/leader/ai/fl

/datum/job/marine/medic/ai/fl
	title = JOB_SQUAD_MEDIC_FL
	gear_preset = /datum/equipment_preset/uscm/medic/fl

/obj/effect/landmark/start/marine/medic/fl
	name = JOB_SQUAD_MEDIC_FL
	squad = SQUAD_MERC
	job = /datum/job/marine/medic/ai/fl

/datum/job/marine/smartgunner/ai/fl
	title = JOB_SQUAD_SMARTGUN_FL
	gear_preset = /datum/equipment_preset/uscm/smartgunner/fl

/obj/effect/landmark/start/marine/smartgunner/fl
	name = JOB_SQUAD_SMARTGUN_FL
	squad = SQUAD_MERC
	job = /datum/job/marine/smartgunner/ai/fl

/datum/job/marine/standard/ai/fl
	title = JOB_SQUAD_RIFLEMAN_FL
	gear_preset = /datum/equipment_preset/uscm/pfc/fl

/obj/effect/landmark/start/marine/fl
	name = JOB_SQUAD_RIFLEMAN_FL
	squad = SQUAD_MERC
	job = /datum/job/marine/standard/ai/fl

/datum/job/command/bridge/ai/fl
	title = JOB_RTO_FL
	gear_preset = /datum/equipment_preset/uscm/rto/fl

/obj/effect/landmark/start/bridge/fl
	name = JOB_RTO_FL
	squad = SQUAD_MERC
	icon_state = "so_spawn"
	job = /datum/job/command/bridge/ai/fl

/datum/job/marine/tl/ai/fl
	title = JOB_SQUAD_TEAM_LEADER_FL
	gear_preset = /datum/equipment_preset/uscm/tl/fl

/obj/effect/landmark/start/marine/tl/ai/fl
	name = JOB_SQUAD_TEAM_LEADER_FL
	squad = SQUAD_MERC
	job = /datum/job/marine/tl/ai/fl
