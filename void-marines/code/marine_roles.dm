//Copy of the original squad jobs folder, used for prevent merge conflicts. Include it instead of the main one

#define STANDARD_MARINE_TO_TOTAL_SPAWN_RATIO 0.4

#define PVT_VARIANT "Private"
#define PFC_VARIANT "Private First Class"

#define SGT_VARIANT "Sergeant"
#define LCPL_VARIANT "Lance Corporal"
#define CPL_VARIANT "Corporal"

//SL

/datum/job/marine/leader
	title = JOB_SQUAD_LEADER
	total_positions = 4
	spawn_positions = 4
	supervisors = "the acting commanding officer"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/leader
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You are responsible for the men and women of your squad.</a> Make sure they are on task, working together, and communicating. You are also in charge of communicating with command and letting them know about the situation first hand. Keep out of harm's way."

	job_options = list(SGT_VARIANT = "SGT")

/datum/job/marine/leader/whiskey
	title = JOB_WO_SQUAD_LEADER
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/sl

AddTimelock(/datum/job/marine/leader, list(
	JOB_SQUAD_ROLES = 10 HOURS
))

/obj/effect/landmark/start/marine/leader
	name = JOB_SQUAD_LEADER
	icon_state = "leader_spawn"
	job = /datum/job/marine/leader

/obj/effect/landmark/start/marine/leader/alpha
	icon_state = "leader_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/leader/bravo
	icon_state = "leader_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/leader/charlie
	icon_state = "leader_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/leader/delta
	icon_state = "leader_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/leader/ai
	total_positions = 1
	spawn_positions = 1

/datum/job/marine/leader/ai/upp
	title = JOB_SQUAD_LEADER_UPP
	gear_preset = /datum/equipment_preset/uscm/leader/upp
	gear_preset_secondary = /datum/equipment_preset/uscm/leader/upp/lesser_rank

/datum/job/marine/leader/ai/forecon
	title = JOB_SQUAD_LEADER_FORECON
	gear_preset = /datum/equipment_preset/uscm/leader/forecon
	gear_preset_secondary = /datum/equipment_preset/uscm/leader/forecon/lesser_rank

/obj/effect/landmark/start/marine/leader/upp
	name = JOB_SQUAD_LEADER_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/leader/ai/upp

/obj/effect/landmark/start/marine/leader/forecon
	name = JOB_SQUAD_LEADER_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/leader/ai/forecon

//MEDIC

/datum/job/marine/medic
	title = JOB_SQUAD_MEDIC
	total_positions = 16
	spawn_positions = 16
	allow_additional = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/medic
	gear_preset_secondary = /datum/equipment_preset/uscm/medic/lesser_rank
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You tend the wounds of your squad mates</a> and make sure they are healthy and active. You may not be a fully-fledged doctor, but you stand between life and death when it matters."

	job_options = list(CPL_VARIANT = "CPL", LCPL_VARIANT = "LCPL")

/datum/job/marine/medic/set_spawn_positions(count)
	for(var/datum/squad/sq in RoleAuthority.squads)
		if(sq)
			sq.max_medics = medic_slot_formula(count)

/datum/job/marine/medic/get_total_positions(latejoin=0)
	var/slots = medic_slot_formula(get_total_marines())

	if(slots <= total_positions_so_far)
		slots = total_positions_so_far
	else
		total_positions_so_far = slots

	if(latejoin)
		for(var/datum/squad/sq in RoleAuthority.squads)
			if(sq)
				sq.max_medics = slots

	return (slots*4)

/datum/job/marine/medic/handle_job_options(option)
	if(option != CPL_VARIANT)
		gear_preset = gear_preset_secondary
	else
		gear_preset = initial(gear_preset)

/datum/job/marine/medic/whiskey
	title = JOB_WO_SQUAD_MEDIC
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/medic

AddTimelock(/datum/job/marine/medic, list(
	JOB_MEDIC_ROLES = 1 HOURS,
	JOB_SQUAD_ROLES = 1 HOURS
))

/obj/effect/landmark/start/marine/medic
	name = JOB_SQUAD_MEDIC
	icon_state = "medic_spawn"
	job = /datum/job/marine/medic

/obj/effect/landmark/start/marine/medic/alpha
	icon_state = "medic_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/medic/bravo
	icon_state = "medic_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/medic/charlie
	icon_state = "medic_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/medic/delta
	icon_state = "medic_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/medic/ai
	total_positions = 1
	spawn_positions = 1

/datum/job/marine/medic/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/medic/ai/get_total_positions(latejoin=0)
	return latejoin ? total_positions : spawn_positions

/datum/job/marine/medic/ai/upp
	title = JOB_SQUAD_MEDIC_UPP
	gear_preset = /datum/equipment_preset/uscm/medic/upp
	gear_preset_secondary = /datum/equipment_preset/uscm/medic/upp/lesser_rank

/datum/job/marine/medic/ai/forecon
	title = JOB_SQUAD_MEDIC_FORECON
	gear_preset = /datum/equipment_preset/uscm/medic/forecon
	gear_preset_secondary = /datum/equipment_preset/uscm/medic/forecon/lesser_rank

/obj/effect/landmark/start/marine/medic/upp
	name = JOB_SQUAD_MEDIC_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/medic/ai/upp

/obj/effect/landmark/start/marine/medic/forecon
	name = JOB_SQUAD_MEDIC_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/medic/ai/forecon

//SG

/datum/job/marine/smartgunner
	title = JOB_SQUAD_SMARTGUN
	total_positions = 4
	spawn_positions = 4
	allow_additional = 1
	scaled = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/sg
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You are the smartgunner.</a> Your task is to provide heavy weapons support."

	job_options = list(LCPL_VARIANT = "LCPL")

/datum/job/marine/smartgunner/set_spawn_positions(count)
	spawn_positions = sg_slot_formula(count)

/datum/job/marine/smartgunner/get_total_positions(latejoin = 0)
	var/positions = spawn_positions
	if(latejoin)
		positions = sg_slot_formula(get_total_marines())
		if(positions <= total_positions_so_far)
			positions = total_positions_so_far
		else
			total_positions_so_far = positions
	else
		total_positions_so_far = positions
	return positions

/datum/job/marine/smartgunner/whiskey
	title = JOB_WO_SQUAD_SMARTGUNNER
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/sg

AddTimelock(/datum/job/marine/smartgunner, list(
	JOB_SQUAD_ROLES = 5 HOURS
))

/obj/effect/landmark/start/marine/smartgunner
	name = JOB_SQUAD_SMARTGUN
	icon_state = "smartgunner_spawn"
	job = /datum/job/marine/smartgunner

/obj/effect/landmark/start/marine/smartgunner/alpha
	icon_state = "smartgunner_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/smartgunner/bravo
	icon_state = "smartgunner_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/smartgunner/charlie
	icon_state = "smartgunner_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/smartgunner/delta
	icon_state = "smartgunner_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/smartgunner/ai
	total_positions = 2
	spawn_positions = 2

/datum/job/marine/smartgunner/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/smartgunner/ai/get_total_positions(latejoin = 0)
	return latejoin ? total_positions : spawn_positions

/datum/job/marine/smartgunner/ai/upp
	title = JOB_SQUAD_SMARTGUN_UPP
	gear_preset = /datum/equipment_preset/uscm/sg/upp

/datum/job/marine/smartgunner/ai/forecon
	title = JOB_SQUAD_SMARTGUN_FORECON
	total_positions = 1
	spawn_positions = 1
	gear_preset = /datum/equipment_preset/uscm/sg/forecon

/obj/effect/landmark/start/marine/smartgunner/upp
	name = JOB_SQUAD_SMARTGUN_UPP
	job = JOB_SQUAD_SMARTGUN_UPP
	squad = SQUAD_UPP

/obj/effect/landmark/start/marine/smartgunner/forecon
	name = JOB_SQUAD_SMARTGUN_FORECON
	job = JOB_SQUAD_SMARTGUN_FORECON
	squad = SQUAD_LRRP

//PFC/PVT

/datum/job/marine/standard
	title = JOB_SQUAD_MARINE
	total_positions = -1
	spawn_positions = -1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/pfc
	gear_preset_secondary = /datum/equipment_preset/uscm/pfc/lesser_rank
	job_options = list(PFC_VARIANT = "PFC", PVT_VARIANT = "PVT")

/datum/job/marine/standard/on_config_load()
	entry_message_body = "You are a rank-and-file <a href='[CONFIG_GET(string/wikiarticleurl)]/[URL_WIKI_MARINE_QUICKSTART]'>Marine of the USCM</a>, and that is your strength. What you lack alone, you gain standing shoulder to shoulder with the men and women of the corps. Ooh-rah!"
	return ..()

/datum/job/marine/standard/set_spawn_positions(count)
	spawn_positions = max((round(count * STANDARD_MARINE_TO_TOTAL_SPAWN_RATIO)), 8)

/datum/job/marine/standard/handle_job_options(option)
	if(option != PFC_VARIANT)
		gear_preset = gear_preset_secondary
	else
		gear_preset = initial(gear_preset)

/datum/job/marine/standard/whiskey
	title = JOB_WO_SQUAD_MARINE
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/pfc

/obj/effect/landmark/start/marine
	name = JOB_SQUAD_MARINE
	icon_state = "marine_spawn"
	job = /datum/job/marine/standard

/obj/effect/landmark/start/marine/alpha
	icon_state = "marine_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/bravo
	icon_state = "marine_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/charlie
	icon_state = "marine_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/delta
	icon_state = "marine_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/standard/ai
	total_positions = 4
	spawn_positions = 4

/datum/job/marine/standard/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/standard/ai/upp
	title = JOB_SQUAD_MARINE_UPP
	gear_preset = /datum/equipment_preset/uscm/pfc/upp
	gear_preset_secondary = /datum/equipment_preset/uscm/pfc/upp/lesser_rank

/datum/job/marine/standard/ai/forecon
	title = JOB_SQUAD_MARINE_FORECON
	total_positions = 2
	spawn_positions = 2
	gear_preset = /datum/equipment_preset/uscm/pfc/forecon
	gear_preset_secondary = /datum/equipment_preset/uscm/pfc/forecon/lesser_rank

/datum/job/marine/standard/ai/rto
	total_positions = 1
	spawn_positions = 1
	title = JOB_SQUAD_RTO
	gear_preset = /datum/equipment_preset/uscm/rto
	gear_preset_secondary = /datum/equipment_preset/uscm/rto/lesser_rank

/obj/effect/landmark/start/marine/upp
	name = JOB_SQUAD_MARINE_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/standard/ai/upp

/obj/effect/landmark/start/marine/forecon
	name = JOB_SQUAD_MARINE_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/standard/ai/forecon

/obj/effect/landmark/start/marine/rto
	name = JOB_SQUAD_RTO
	squad = SQUAD_LRRP
	job = /datum/job/marine/standard/ai/rto

//FT-L

/datum/job/marine/tl
	title = JOB_SQUAD_TEAM_LEADER
	total_positions = 8
	spawn_positions = 8
	allow_additional = 1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/tl
	entry_message_body = "You are the <a href='"+WIKI_PLACEHOLDER+"'>Fireteam Leader.</a>Your task is to assist the squad leader in leading the squad as well as utilize ordnance such as orbital bombardments, CAS, and mortar as well as coordinating resupply with Requisitions and CIC. If the squad leader dies, you are expected to lead in their place."

	job_options = list(CPL_VARIANT = "CPL")

/datum/job/marine/tl/generate_entry_conditions(mob/living/carbon/human/spawning_human)
	. = ..()
	spawning_human.important_radio_channels += JTAC_FREQ

AddTimelock(/datum/job/marine/tl, list(
	JOB_SQUAD_ROLES = 8 HOURS
))

/obj/effect/landmark/start/marine/tl
	name = JOB_SQUAD_TEAM_LEADER
	icon_state = "tl_spawn"
	job = /datum/job/marine/tl

/obj/effect/landmark/start/marine/tl/alpha
	icon_state = "tl_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/tl/bravo
	icon_state = "tl_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/tl/charlie
	icon_state = "tl_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/tl/delta
	icon_state = "tl_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/tl/ai
	total_positions = 2
	spawn_positions = 2

/datum/job/marine/tl/ai/upp
	title = JOB_SQUAD_TEAM_LEADER_UPP
	gear_preset = /datum/equipment_preset/uscm/tl/upp

/datum/job/marine/tl/ai/forecon
	total_positions = 1
	spawn_positions = 1
	title = JOB_SQUAD_TEAM_LEADER_FORECON
	gear_preset = /datum/equipment_preset/uscm/tl/forecon

/obj/effect/landmark/start/marine/tl/upp
	name = JOB_SQUAD_TEAM_LEADER_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/tl/ai/upp

/obj/effect/landmark/start/marine/tl/forecon
	name = JOB_SQUAD_TEAM_LEADER_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/tl/ai/forecon

#undef PVT_VARIANT
#undef PFC_VARIANT

#undef SGT_VARIANT
#undef LCPL_VARIANT
#undef CPL_VARIANT

//END
