/datum/paygrade/spooks
	name = "IRO Paygrade"
	pay_multiplier = 1

/datum/paygrade/spooks/civilian
	paygrade = "C"
	name = "Contractor"
	pay_multiplier = 1.25 	//Gotta attract civs to the work somehow
	ranking = 0

/datum/paygrade/spooks/standard
	paygrade = "IA-1"
	name = "Field Agent"
	prefix = "Agt."
	ranking = 1

/datum/paygrade/spooks/tl
	paygrade = "IA-2"
	name = "Supervisor"
	prefix = "Spv."
	pay_multiplier = 2
	ranking = 2

/datum/paygrade/spooks/engi
	paygrade = "IA-2T"
	name = "Technician"
	prefix = "Tec."
	pay_multiplier = 2.25
	ranking = 3

/datum/paygrade/spooks/medsci
	paygrade = "IA-2M"
	name = "Science Officer"
	prefix = "Sci."
	pay_multiplier = 2.5
	ranking = 4

/datum/paygrade/spooks/syn
	paygrade = "IA-0S"
	name = "Support Synthetic"
	prefix = "Syn."
	pay_multiplier = 1
	ranking = 5

/datum/paygrade/spooks/lead
	paygrade = "IA-3"
	name = "Station Chief"
	prefix = "Chf."
	pay_multiplier = 2.75
	ranking = 6

//Event/special-showing ranks

/datum/paygrade/spooks/bigboss	//Thrown together to cover contingency scenarios where a bigger boss is needing to show up
	paygrade = "IA-4"
	name = "Sector Overseer"
	prefix = "Ovrsr."
	pay_multiplier = 3.5
	ranking = 7
