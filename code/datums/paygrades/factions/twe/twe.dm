/datum/paygrade/twe
	name = "TWE Paygrade"
	pay_multiplier = 2 // less people = more to pay them
	default_faction = FACTION_TWE

//RMC Emlisted
/datum/paygrade/twe/e1
	paygrade = PAY_SHORT_RMC1
	name = "Marine"
	prefix = "Mne"

/datum/paygrade/twe/e2
	paygrade = PAY_SHORT_RMC2
	name = "Lance Corporal"
	prefix = "LCpl"
	pay_multiplier = 2.1

/datum/paygrade/twe/e2n //RMC medics are attached naval personnel, don't see them forgoing this tradition even in the aliens universe
	paygrade = PAY_SHORT_RMC2N
	name = "Medical Assistant"
	prefix = "MA"
	pay_multiplier = 2.2

/datum/paygrade/twe/e2e //RMC gets combat engineering support from the army royal engineers, as above, don't see them changing that tradition
	paygrade = PAY_SHORT_RMC2E
	name = "Sapper"
	prefix = "Spr"
	pay_multiplier = 2

/datum/paygrade/twe/e2g //RMC also gets indirect fire support from the army royal artillery. Again, don't see them changing that tradition
	paygrade = PAY_SHORT_RMC2G
	name = "Gunner"
	prefix = "Gnr"
	pay_multiplier = 2

/datum/paygrade/twe/e3
	paygrade = PAY_SHORT_RMC3
	name = "Corporal"
	prefix = "Cpl"
	pay_multiplier = 2.2

/datum/paygrade/twe/e4
	paygrade = PAY_SHORT_RMC4
	name = "Sergeant"
	prefix = "Sgt"
	pay_multiplier = 2.3

/datum/paygrade/twe/e5
	paygrade = PAY_SHORT_RMC5
	name = "Colour Sergeant"
	prefix = "CSgt"
	pay_multiplier = 2.4

//RMC Warrant Officer - Different from US ones, equiv to US E8 & E9 technical & command track ranks for the brits
/datum/paygrade/twe/wo1
	paygrade = PAY_SHORT_RMOW
	name = "Warrant Officer"
	prefix = "WO"
	pay_multiplier = 3.5

//RMC Officers
/datum/paygrade/twe/o1
	paygrade = PAY_SHORT_RMO1
	name = "Second Lieutenant"
	prefix = "2nd LT"
	pay_multiplier = 3
	officer_grade = GRADE_OFFICER

/datum/paygrade/twe/o2
	paygrade = PAY_SHORT_RMO2
	name = "Lieutenant"
	prefix = "LT"
	pay_multiplier = 3.25
	officer_grade = GRADE_OFFICER

/datum/paygrade/twe/o3
	paygrade = PAY_SHORT_RMO3
	name = "Captain"
	prefix = "Capt"
	pay_multiplier = 3.5
	officer_grade = GRADE_OFFICER

/datum/paygrade/twe/o4
	paygrade = PAY_SHORT_RMO4
	name = "Major"
	prefix = "Maj"
	pay_multiplier = 5
	officer_grade = GRADE_OFFICER

/datum/paygrade/twe/o5
	paygrade = PAY_SHORT_RMO5
	name = "Lieutenant Colonel"
	prefix = "Lt Col"
	pay_multiplier = 7
	officer_grade = GRADE_OFFICER

/datum/paygrade/twe/o6
	paygrade = PAY_SHORT_RMO6
	name = "Colonel"
	prefix = "Col"
	pay_multiplier = 9
	officer_grade = GRADE_FLAG

/datum/paygrade/twe/o7
	paygrade = PAY_SHORT_RMO7
	name = "Brigadier"
	prefix = "Brig"
	pay_multiplier = 10
	officer_grade = GRADE_FLAG
