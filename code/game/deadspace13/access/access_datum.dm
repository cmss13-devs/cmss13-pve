/datum/access
	var/id = 0
	var/desc = ""
	var/region = ACCESS_REGION_NONE
	var/access_type = ACCESS_TYPE_STATION

/*****************
* Department General Access *
*****************/
//One per department
/var/const/access_maint_tunnels = 1
/datum/access/maint_tunnels
	id = access_maint_tunnels
	desc = "Maintenance"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_security = 2
/datum/access/security
	id = access_security
	desc = "Security"
	region = ACCESS_REGION_SECURITY

/var/const/access_medical = 3
/datum/access/medical
	id = access_medical
	desc = "Medical"
	region = ACCESS_REGION_MEDBAY

/var/const/access_research = 4
/datum/access/science
	id = access_research
	desc = "Science"
	region = ACCESS_REGION_RESEARCH

/var/const/access_engineering = 5
/datum/access/engineering
	id = access_engineering
	desc = "Engineering"
	region = ACCESS_REGION_ENGINEERING

//Bar, kitchen, hydro, janitor
/var/const/access_service = 6
/datum/access/servjce
	id = access_service
	desc = "Service"
	region = ACCESS_REGION_GENERAL

/var/const/access_cargo = 7
/datum/access/cargo
	id = access_cargo
	desc = "Cargo Bay"
	region = ACCESS_REGION_SUPPLY

/**********************
* Secure Areas Access *
***********************/
/var/const/access_armory = 10
/datum/access/armory
	id = access_armory
	desc = "Armory"
	region = ACCESS_REGION_SECURITY

/var/const/access_bridge = 11
/datum/access/bridge
	id = access_bridge
	desc = "Bridge"
	region = ACCESS_REGION_COMMAND

/var/const/access_chemistry = 12
/datum/access/chemistry
	id = access_chemistry
	desc = "Chemistry Lab"
	region = ACCESS_REGION_MEDBAY

/var/const/access_surgery = 13
/datum/access/surgery
	id = access_surgery
	desc = "Operating Theatre"
	region = ACCESS_REGION_MEDBAY

/var/const/access_tech_storage = 14
/datum/access/tech_storage
	id = access_tech_storage
	desc = "Technical Storage"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_external_airlocks = 15
/datum/access/external_airlocks
	id = access_external_airlocks
	desc = "External Airlocks"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_chaplain = 16
/datum/access/chaplain
	id = access_chaplain
	desc = "Unitology Church"
	access_type = ACCESS_REGION_GENERAL

/var/const/access_psychiatrist = 17
/datum/access/psychologist
	id = access_psychiatrist
	desc = "Medical"
	access_type = ACCESS_REGION_MEDBAY


/**********************
* Per Role Accesses	  *
***********************/
//For private offices, generally heads of staff only
/var/const/access_captain = 100
/datum/access/captain
	id = access_captain
	desc = "Captain"
	region = ACCESS_REGION_COMMAND

/var/const/access_cscio = 101
/datum/access/cscio
	id = access_cscio
	desc = "Chief Science Officer"
	region = ACCESS_REGION_COMMAND

/var/const/access_smo = 102
/datum/access/smo
	id = access_smo
	desc = "Senior Medical Officer"
	region = ACCESS_REGION_RESEARCH

/var/const/access_so = 103
/datum/access/so
	id = access_so
	desc = "Supply Officer"
	region = ACCESS_REGION_SUPPLY

/var/const/access_dom = 104
/datum/access/dom
	id = access_dom
	desc = "Director of Mining"
	region = ACCESS_REGION_SUPPLY

/var/const/access_mf = 105
/datum/access/mf
	id = access_mf
	desc = "Mining Foreman"
	region = ACCESS_REGION_SUPPLY

























/var/const/access_mining = 46
/datum/access/mining
	id = access_mining
	desc = "Mining"
	region = ACCESS_REGION_SUPPLY

/var/const/access_cook = 47
/datum/access/cook
	id = access_cook
	desc = "Line Cook"
	region = ACCESS_REGION_SUPPLY

/var/const/access_bartender = 48
/datum/access/bartender
	id = access_bartender
	desc = "Bartender"
	region = ACCESS_REGION_SUPPLY

/var/const/access_ce = 56
/datum/access/ce
	id = access_ce
	desc = "Chief Engineer"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_fl = 57
/datum/access/fl
	id = access_fl
	desc = "First Lieutenant"
	region = ACCESS_REGION_COMMAND

/var/const/access_cseco = 58
/datum/access/cseco
	id = access_cseco
	desc = "Chief Security Officer"
	region = ACCESS_REGION_SECURITY

/var/const/access_RC_announce = 59 //Request console announcements
/datum/access/RC_announce
	id = access_RC_announce
	desc = "RC Announcements"
	region = ACCESS_REGION_COMMAND

/var/const/access_keycard_auth = 60 //Used for events which require at least two people to confirm them
/datum/access/keycard_auth
	id = access_keycard_auth
	desc = "Keycode Auth. Device"
	region = ACCESS_REGION_COMMAND

/var/const/access_keycard_modification = 61
/datum/access/keycard_modification
	id = access_keycard_modification
	desc = "ID Card Modification"
	region = ACCESS_REGION_COMMAND

/* ERT */

// Kellion
/var/const/access_kellion = 900
/datum/access/kellion
	id = access_kellion
	desc = "USG Kellion Access"
	region = ACCESS_REGION_NONE

/var/const/access_klead = 901
/datum/access/klead
	id = access_klead
	desc = "Kellion Security Leader"
	region = ACCESS_REGION_NONE

/var/const/access_kgrunt = 902
/datum/access/kgrunt
	id = access_kgrunt
	desc = "Kellion Security"
	region = ACCESS_REGION_NONE

/var/const/access_ktechnician = 903
/datum/access/ktechnician
	id = access_ktechnician
	desc = "Kellion Technician"
	region = ACCESS_REGION_NONE

/var/const/access_kengineer = 904
/datum/access/kengineer
	id = access_kengineer
	desc = "Kellion Engineer"
	region = ACCESS_REGION_NONE


//Valor
/var/const/access_valor = 905
/datum/access/valor
	id = access_valor
	desc = "USS Valor Access"
	region = ACCESS_REGION_NONE


//Deliverance
/var/const/access_unitologist = 910
/datum/access/unitologist
	id = access_unitologist
	desc = "Unmarked Vessel Access"
	region = ACCESS_REGION_NONE

/var/const/access_ulead = 911
/datum/access/ulead
	id = access_ulead
	desc = "UNI Deacon"
	region = ACCESS_REGION_NONE

/var/const/access_ufaithful = 912
/datum/access/ufaithful
	id = access_ufaithful
	desc = "UNI Faithful"
	region = ACCESS_REGION_NONE

/var/const/access_uberserker = 913
/datum/access/uberserker
	id = access_uberserker
	desc = "UNI Berserker"
	region = ACCESS_REGION_NONE

/var/const/access_uhealer = 914
/datum/access/uhealer
	id = access_uhealer
	desc = "UNI Healer"
	region = ACCESS_REGION_NONE

/var/const/access_umechanic = 915
/datum/access/umechanic
	id = access_umechanic
	desc = "UNI Mechanic"
	region = ACCESS_REGION_NONE



/var/const/access_powerlock = 9999//Allows bluespacetechs to open powerlocks
/datum/access/cent_powerlock
	id = access_powerlock
	desc = "Power Lock Administrative Override"
	access_type = ACCESS_TYPE_CENTCOM
