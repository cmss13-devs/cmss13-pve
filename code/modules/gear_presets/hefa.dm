/datum/equipment_preset/uscm_ship/so/hefa
	name = "Magister"
	paygrade = "Mag"
	assignment = "Magister"
	role_comm_title = "Magister"
	uses_special_name = TRUE

/datum/equipment_preset/uscm_ship/so/hefa/load_name(mob/living/carbon/human/new_human, randomise)
	var/list/initial_name = splittext(new_human.real_name, " ")
	var/first_word = initial_name[1]
	var/second_word = initial_name[2]
	if(second_word[1] == "'" || second_word[1] == "\"")
		second_word = initial_name[3]
	var/new_name = "[first_word] of [second_word]s"

	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/uscm/leader/hefa
	name = "Comandor"
	assignment = "Comandor"
	paygrade = "Com"
	role_comm_title = "Comandor"
	uses_special_name = TRUE

/datum/equipment_preset/uscm/leader/hefa/load_name(mob/living/carbon/human/new_human, randomise)
	var/list/initial_name = splittext(new_human.real_name, " ")
	var/first_word = initial_name[1]
	var/second_word = initial_name[2]
	if(second_word[1] == "'" || second_word[1] == "\"")
		second_word = initial_name[3]
	var/new_name = "[first_word] of [second_word]s"

	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/uscm/tl/hefa
	name = "Prior"
	assignment = "Prior"
	paygrade = "Pri"
	role_comm_title = "Prior"
	uses_special_name = TRUE

/datum/equipment_preset/uscm/tl/hefa/load_name(mob/living/carbon/human/new_human, randomise)
	var/list/initial_name = splittext(new_human.real_name, " ")
	var/first_word = initial_name[1]
	var/second_word = initial_name[2]
	if(second_word[1] == "'" || second_word[1] == "\"")
		second_word = initial_name[3]
	var/new_name = "[first_word] of [second_word]s"

	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/uscm/medic/hefa
	name = "Hospitalier"
	assignment = "Hospitalier"
	paygrade = "Hos"
	role_comm_title = "Hospitalier"
	uses_special_name = TRUE

/datum/equipment_preset/uscm/medic/hefa/load_name(mob/living/carbon/human/new_human, randomise)
	var/list/initial_name = splittext(new_human.real_name, " ")
	var/first_word = initial_name[1]
	var/second_word = initial_name[2]
	if(second_word[1] == "'" || second_word[1] == "\"")
		second_word = initial_name[3]
	var/new_name = "[first_word] of [second_word]s"

	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/uscm/sg/hefa
	name = "Militant"
	paygrade = "Mil"
	assignment = "Militant"
	role_comm_title = "Militant"
	uses_special_name = TRUE

/datum/equipment_preset/uscm/sg/hefa/load_name(mob/living/carbon/human/new_human, randomise)
	var/list/initial_name = splittext(new_human.real_name, " ")
	var/first_word = initial_name[1]
	var/second_word = initial_name[2]
	if(second_word[1] == "'" || second_word[1] == "\"")
		second_word = initial_name[3]
	var/new_name = "[first_word] of [second_word]s"


	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/uscm/pfc/hefa
	name = "Knight"
	assignment = "Knight"
	paygrade = "Kni"
	role_comm_title = "Knight"
	uses_special_name = TRUE

/datum/equipment_preset/uscm/pfc/hefa/load_name(mob/living/carbon/human/new_human, randomise)
	var/list/initial_name = splittext(new_human.real_name, " ")
	var/first_word = initial_name[1]
	var/second_word = initial_name[2]
	if(second_word[1] == "'" || second_word[1] == "\"")
		second_word = initial_name[3]
	var/new_name = "[first_word] of [second_word]s"

	new_human.change_real_name(new_human, new_name)
