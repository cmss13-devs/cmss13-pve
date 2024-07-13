//=========================//MARINES\\===================================//
//=======================================================================//


/obj/item/clothing/under/marine
	name = "\improper USCM uniform"
	desc = "Standard-issue Marine uniform, with venlar armor inserts at critical areas to protect from blades and ballistics."
	siemens_coefficient = 0.9
	icon = 'icons/mob/humans/onmob/uniform-layer/uniform_marine.dmi'
	icon_state = "marine_jumpsuit"
	worn_state = "marine_jumpsuit"
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	///Makes it so that we can see the right name in the vendor.
	var/specialty = "USCM"
	///List of map variants that use sleeve rolling on something else, like snow uniforms rolling the collar, and therefore shouldn't hide patches etc when rolled.
	var/list/map_variants_roll_accessories = list("s_")
	layer = UPPER_ITEM_LAYER

	//speciality does NOTHING if you have NO_NAME_OVERRIDE

/obj/item/clothing/under/marine/Initialize(mapload, new_protection[] = list(MAP_ICE_COLONY = ICE_PLANET_MIN_COLD_PROT), override_icon_state[] = null)
	if(!(flags_atom & NO_NAME_OVERRIDE))
		name = "[specialty]"
		if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
			name += " snow uniform"
		else
			name += " uniform"
	if(!(flags_atom & NO_SNOW_TYPE))
		select_gamemode_skin(type, override_icon_state, new_protection)
	. = ..() //Done after above in case gamemode skin is missing sprites.

/obj/item/clothing/under/marine/set_sensors(mob/user)
	if(!skillcheckexplicit(user, SKILL_ANTAG, SKILL_ANTAG_AGENT))
		to_chat(user, SPAN_WARNING("The sensors in \the [src] can't be modified."))
		return
	. = ..()

/obj/item/clothing/under/marine/select_gamemode_skin(expected_type, list/override_icon_state, list/override_protection)
	. = ..()
	for(var/i in map_variants_roll_accessories)
		if(findtext(icon_state, i, 1, 3))
			flags_jumpsuit |= UNIFORM_DO_NOT_HIDE_ACCESSORIES

/obj/item/clothing/under/marine/standard
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/standard
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/bridge
	name = "marine service uniform"
	desc = "Officer's uniform, a little outdated. Why it needs to be frag rated is beyond everyone."
	icon_state = "BO_jumpsuit"
	item_state = "BO_jumpsuit"
	worn_state = "BO_jumpsuit"
	specialty = "marine service"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/boiler
	name = "marine operations uniform"
	desc = "Officer's uniform, a little outdated."
	icon_state = "command_jumpsuit"
	item_state = "command_jumpsuit"
	worn_state = "command_jumpsuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE
	specialty = "marine operations"

/obj/item/clothing/under/marine/officer/pilot/flight
	name = "tactical pilot officer flightsuit"
	desc = "A flightsuit worn by pilot officers of the USCM, with plenty of leather straps, pouches, and other essential gear you will never use. Looks badass."
	icon_state = "pilot_flightsuit_alt"
	item_state = "pilot_flightsuit_alt"
	worn_state = "pilot_flightsuit_alt"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_cold_protection = ICE_PLANET_MIN_COLD_PROT

//=========================//DRESS BLUES\\================================\\
//=======================================================================\\

/obj/item/clothing/under/marine/dress/blues
	name = "marine enlisted dress blues"
	desc = "The undershirt and trousers of the legendary Marine dress blues, virtually unchanged since the 19th century. This unadorned variant is for enlisted personnel, E-1 thru E-3."
	icon = 'icons/mob/humans/onmob/uniform-layer/uniform_marine.dmi'
	icon_state = "marine_blues_un"
	item_state = "marine_blues_un"
	worn_state = "marine_blues_un"
	contained_sprite = TRUE
	item_state_slots = null

/obj/item/clothing/under/marine/dress/blues/senior
	name = "marine senior dress blues uniform"
	desc = "The undershirt and trousers of the legendary Marine dress blues, virtually unchanged since the 19th century. This variant features the iconic Blood Stripe, worn by NCOs and officers."
	icon_state = "marine_officer_blues_un"
	item_state = "marine_officer_blues_un"
	worn_state = "marine_officer_blues_un"

//=========================//USCM Survivors\\================================\\
//=======================================================================\\

/obj/item/clothing/under/marine/reconnaissance
	name = "\improper USCM uniform"
	desc = "Torn, Burned and blood stained. This uniform has seen much more than you could possibly imagine."
	icon_state = "recon_marine"
	worn_state = "recon_marine"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/reconnaissance/Initialize(mapload)
	. = ..()
	var/R = rand(1,4)
	switch(R) //this is no longer shitcode, courtesy of stan_albatross
		if(1)
			roll_suit_sleeves(FALSE)
		if(2)
			roll_suit_jacket(FALSE)
		if(3)
			cut_suit_jacket(FALSE)


//=========================//RESPONDERS\\================================\\
//=======================================================================\\

/obj/item/clothing/under/marine/responder
	flags_jumpsuit = FALSE
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make them keep their original name.

//=========================//Marine Raiders\\================================\\

/obj/item/clothing/under/marine/veteran/marsoc
	name = "SOF Uniform"
	desc = "MARSOC standard uniform, in a dark camouflage pattern. Venlar liners provide slight protection from ballistics or blades."
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	icon_state = "marsoc"
	worn_state = "marsoc"
	specialty = "sof uniform"
	flags_item = NO_SNOW_TYPE

//=========================//PMC\\================================\\

/obj/item/clothing/under/marine/veteran/pmc
	name = "\improper PMC fatigues"
	desc = "A white set of fatigues, designed for private security operators. The symbol of the Weyland-Yutani corporation is emblazed on the suit."
	icon_state = "pmc_jumpsuit"
	worn_state = "pmc_jumpsuit"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	suit_restricted = list(
		/obj/item/clothing/suit/storage/marine/veteran/pmc,
		/obj/item/clothing/suit/storage/marine/smartgunner/veteran/pmc,
		/obj/item/clothing/suit/armor/vest/security,
		/obj/item/clothing/suit/storage/hazardvest,
	)

/obj/item/clothing/under/marine/veteran/pmc/leader
	name = "\improper PMC command fatigues"
	desc = "A white set of fatigues, designed for private security operators. The symbol of the Weyland-Yutani corporation is emblazed on the suit. This particular suit looks like it belongs to a high-ranking officer."
	icon_state = "officer_jumpsuit"
	worn_state = "officer_jumpsuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/pmc/commando
	name = "\improper PMC commando uniform"
	desc = "An armored uniform worn by Weyland-Yutani elite commandos. It is well protected while remaining light and comfortable."
	icon_state = "commando_jumpsuit"
	worn_state = "commando_jumpsuit"

/obj/item/clothing/under/marine/veteran/pmc/corporate
	name = "\improper WY corporate security uniform"
	desc = "An armored uniform worn by Weyland-Yutani corporate security members. This variant is commonly worn by what are known as 'goons'."
	icon = 'icons/mob/humans/onmob/contained/wy_goons.dmi'
	icon_state = "uniform"
	item_state = "uniform"
	worn_state = "uniform"
	contained_sprite = TRUE
	item_state_slots = null
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/pmc/corporate/lead
	desc = "An armored uniform worn by Weyland-Yutani corporate security members. This variant is commonly worn by the lead of the 'goonsquad', as they are colloquially known."
	icon_state = "lead_uniform"
	item_state = "lead_uniform"
	worn_state = "lead_uniform"

//=========================//UPP\\================================\\

/obj/item/clothing/under/marine/veteran/bear
	name = "\improper Iron Bear uniform"
	desc = "A uniform worn by Iron Bears mercenaries in the service of Mother Russia. Smells a little like an actual bear."
	icon_state = "bear_jumpsuit"
	worn_state = "bear_jumpsuit"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_NO_SENSORS
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/veteran/bear)

	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/uniform_1.dmi',
	)

/obj/item/clothing/under/marine/veteran/UPP
	name = "\improper UPP fatigues"
	desc = "A set of UPP fatigues, mass produced for the armed-forces of the Union of Progressive Peoples. A rare sight, especially in ICC zones. This particular set sports the dark drab pattern of the UPP 17th battalion, 'Smoldering Sons', operating in the sparse UPP frontier in the Anglo-Japanese arm."
	icon_state = "upp_uniform"
	worn_state = "upp_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_UPP
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/faction/UPP, /obj/item/clothing/suit/gimmick/jason, /obj/item/clothing/suit/storage/snow_suit/soviet, /obj/item/clothing/suit/storage/snow_suit/survivor, /obj/item/clothing/suit/storage/webbing, /obj/item/clothing/suit/storage/marine/smartgunner/upp)
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/UPP/boiler
	name = "\improper UPP operations fatigues"
	desc = "A set of UPP operations fatigues, mass produced for the armed-forces of the Union of Progressive Peoples. A rare sight, especially in ICC zones. This particular set sports the dark drab pattern of the UPP 17th battalion, 'Smoldering Sons', operating in the sparse UPP frontier in the Anglo-Japanese arm."
	icon_state = "upp_boiler"
	worn_state = "upp_boiler"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/marine/veteran/UPP/medic
	name = "\improper UPP medic fatigues"
	desc = "A set of medic UPP fatigues, mass produced for the armed-forces of the Union of Progressive Peoples. A rare sight, especially in ICC zones. This particular set sports the dark drab pattern of the UPP 17th battalion, 'Smoldering Sons', operating in the sparse UPP frontier in the Anglo-Japanese arm."
	icon_state = "upp_uniform_medic"
	worn_state = "upp_uniform_medic"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/UPP/engi
	name = "\improper UPP engineer fatigues"
	desc = "A set of Engineer UPP fatigues, mass produced for the armed-forces of the Union of Progressive Peoples. A rare sight, especially in ICC zones. This particular set sports the dark drab pattern of the UPP 17th battalion, 'Smoldering Sons', operating in the sparse UPP frontier in the Anglo-Japanese arm."
	icon_state = "upp_uniform_engi"
	worn_state = "upp_uniform_engi"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/UPP/mp
	name = "\improper UPP Military Police fatigues"
	desc = "A set of Military Police UPP fatigues, mass produced for the armed-forces of the Union of Progressive Peoples. A rare sight, especially in ICC zones. This particular set sports the dark drab pattern of the UPP 17th battalion, 'Smoldering Sons', operating in the sparse UPP frontier in the Anglo-Japanese arm."
	icon_state = "upp_uniform_mp"
	worn_state = "upp_uniform_mp"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/UPP/officer
	name = "\improper UPP Officer fatigues"
	desc = "A set of Officer UPP fatigues, mass produced for the armed-forces of the Union of Progressive Peoples. A rare sight, especially in ICC zones. This particular set sports the dark drab pattern of the UPP 17th battalion, 'Smoldering Sons', operating in the sparse UPP frontier in the Anglo-Japanese arm."
	icon_state = "upp_uniform_officer"
	worn_state = "upp_uniform_officer"

//=========================//Freelancer\\================================\\

/obj/item/clothing/under/marine/veteran/freelancer
	name = "\improper freelancer fatigues"
	desc = "A set of loose-fitting fatigues, perfect for an informal mercenary. Smells like gunpowder, apple pie, and covered in grease and sake stains."
	icon_state = "freelancer_uniform"
	worn_state = "freelancer_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_NO_SENSORS
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/faction/freelancer, /obj/item/clothing/suit/storage/webbing, /obj/item/clothing/suit/storage/utility_vest)

//=========================//Dutch Dozen\\================================\\

/obj/item/clothing/under/marine/veteran/dutch
	name = "\improper Dutch's Dozen uniform"
	desc = "A comfortable uniform worn by the Dutch's Dozen mercenaries. It's seen some definite wear and tear, but is still in good condition."
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	icon_state = "dutch_jumpsuit"
	worn_state = "dutch_jumpsuit"
	has_sensor = UNIFORM_NO_SENSORS
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/veteran/dutch, /obj/item/clothing/suit/armor/vest/dutch)


/obj/item/clothing/under/marine/veteran/dutch/ranger
	icon_state = "dutch_jumpsuit2"

/obj/item/clothing/under/marine/veteran/van_bandolier
	name = "hunting clothes"
	desc = "A set of tailored clothes, made from fine but sturdy reinforced fabrics. Protects from thorns, weather, and the cuts and scrapes that forever bedevil outdoorsmen."
	icon_state = "van_bandolier"
	worn_state = "van_bandolier"
	item_state = "van_bandolier_clothes"
	flags_cold_protection = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_NO_SENSORS

//=========================//OWLF\\================================\\

/obj/item/clothing/under/marine/veteran/owlf
	name = "\improper OWLF thermal field uniform"
	desc = "A high-tech uniform with built-in thermal cloaking technology. It looks like it's worth more than your life."
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS //This is all a copy and paste of the Dutch's stuff for now.
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	icon_state = "owlf_uniform"
	worn_state = "owlf_uniform"
	has_sensor = UNIFORM_NO_SENSORS
	hood_state = /obj/item/clothing/head/owlf_hood

//===========================//HELGHAST - MERCENARY\\================================\\
//=====================================================================\\

/obj/item/clothing/under/marine/veteran/mercenary
	name = "\improper Mercenary fatigues"
	desc = "A thick, beige suit with a red armband. There is an unknown symbol is emblazed on the suit."
	icon_state = "mercenary_heavy_uniform"
	worn_state = "mercenary_heavy_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/veteran/mercenary)

/obj/item/clothing/under/marine/veteran/mercenary/miner
	name = "\improper Mercenary miner fatigues"
	desc = "A beige suit with a red armband. It looks a little thin, like it wasn't designed for protection. There is an unknown symbol is emblazed on the suit."
	icon_state = "mercenary_miner_uniform"
	worn_state = "mercenary_miner_uniform"

/obj/item/clothing/under/marine/veteran/mercenary/support
	name = "\improper Mercenary engineer fatigues"
	desc = "A blue suit with yellow accents, used by engineers. There is an unknown symbol is emblazed on the suit."
	icon_state = "mercenary_engineer_uniform"
	worn_state = "mercenary_engineer_uniform"


////// Civilians /////////

/obj/item/clothing/under/souto
	name = "\improper Souto Man's cargo pants"
	desc = "The white cargo pants worn by the one and only Souto man. As cool as an ice cold can of Souto Grape!"
	icon_state = "souto_man"
	worn_state = "souto_man"
	has_sensor = UNIFORM_NO_SENSORS

/obj/item/clothing/under/marine/reporter
	name = "combat correspondent uniform"
	desc = "A relaxed and robust uniform fit for any potential reporting needs."
	icon = 'icons/mob/humans/onmob/contained/war_correspondent.dmi'
	icon_state = "wc_uniform"
	worn_state = "wc_uniform"
	contained_sprite = TRUE
	flags_atom = NO_NAME_OVERRIDE

/obj/item/clothing/under/synthetic/flight
	name = "tactical flightsuit"
	desc = "A flightsuit with plenty of leather straps, pouches, and other essential gear."
	icon_state = "pilot_flightsuit_alt"
	item_state = "pilot_flightsuit_alt"
	worn_state = "pilot_flightsuit_alt"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_cold_protection = ICE_PLANET_MIN_COLD_PROT

/obj/item/clothing/under/synthetic/joe
	name = "\improper Working Joe Uniform"
	desc = "A cheap uniform made for Synthetic labor. Tomorrow, Together."
	icon_state = "working_joe"
	worn_state = "working_joe"

/obj/item/clothing/under/synthetic/joe/engi
	name = "\improper Working Joe Hazardous Uniform"
	desc = "A reinforced uniform used for Synthetic labor in hazardous areas. Tomorrow, Together."
	icon_state = "working_joe_engi"
	worn_state = "working_joe_engi"
	flags_inventory = CANTSTRIP
	armor_melee = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_HIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/synthetic/joe/engi/overalls
	name = "\improper Working Joe Hazardous Uniform"
	desc = "A reinforced uniform used for Synthetic labor in hazardous areas. Comes with an additional layer for liquid hazards. Tomorrow, Together."
	icon_state = "working_joe_overalls"
	worn_state = "working_joe_overalls"
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	unacidable = TRUE

//=ROYAL MARINES=\\

/obj/item/clothing/under/marine/veteran/royal_marine
	name = "royal marines commando uniform"
	desc = "The field uniform of the royal marines commando. They have shards of light Kevlar to help protect against stabbing weapons and bullets. Onpar with similar USCM equipment."
	icon_state = "rmc_uniform"
	worn_state = "rmc_uniform"
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	contained_sprite = TRUE
	icon = 'icons/mob/humans/onmob/contained/royal_marines_commando.dmi'

/obj/item/clothing/under/marine/veteran/royal_marine/tl
	icon_state = "rmc_uniform_teaml"
	worn_state = "rmc_uniform_teaml"

/obj/item/clothing/under/marine/veteran/royal_marine/lt
	name = "royal marines commando officers uniform"
	desc = "The officers uniform of the royal marines commando. They have shards of light Kevlar to help protect against stabbing weapons and bullets. Onpar with similar USCM equipment."
	icon_state = "rmc_uniform_lt"
	worn_state = "rmc_uniform_lt"

/obj/item/clothing/under/marine/pve_mopp
	name = "\improper M2 MOPP suit"
	desc = "M2 MOPP suits are purpose built to defend the wearer against biological and radioactive contaminants, from nerve gas to nuclear fallout."
	desc_lore = "The several-paragraph long expository pamphlet that usually comes with these is missing."
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_jumpsuit = NO_FLAGS
	icon_state = "cbrn"
	worn_state = "cbrn"

	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/uniform_1.dmi',
	)


/obj/item/clothing/under/marine/cbrn //CBRN MOPP suit
	name = "\improper M3 MOPP suit"
	desc = "M3 MOPP suits are specially designed and engineered to protect the wearer from unshielded exposure to any Chemical, Biological, Radiological, or Nuclear (CBRN) threats in the field. Despite somewhat resembling commonplace synthetic rubber HAZMAT suits, the Venlar composition provides a significantly more dense and durable baseline material, allowing for modifications without the loss of its air-tight nature. The wearer’s comfort has been significantly taken into consideration, with the suit providing sufficient freedom of movement for even delicate maneuvers and movements once it is donned. As the sealed environment retains many issues from the past, measures have been taken to significantly reduce the suit's passive heat absorption and increase internal absorbance through linings, as well as the capability to fully integrate with external cooling, air cycling, and other life support systems. Strips of M11 detector paper are included with each suit, designed to be slotted into the dominant arm of the wearer’s protective suit, the non-dominant wrist, and then back to the knee, providing at-a-glance warning signs across alternating sides of the body while working. The arm and knee markers are intended to be on the user's dominant The papers change color upon contact with harmful chemical agents, displaying a clear white initially and turning red when activated. The suit has a recommended lifespan of twenty-four hours once contact with a toxic environment is made, but depending on the severity this can be shortened to eight hours or less. Beyond that point, the accuracy of the detector papers deteriorates significantly, as does the protection of the suit itself."
	desc_lore = "Since the outbreak of the New Earth Plague in 2157 and the subsequent Interstellar Commerce Commission (ICC) sanctioned decontamination of the colony and its 40 million inhabitants, the abandoned colony has been left under a strict quarantine blockade to prevent any potential scavengers from spreading what’s left of the highly-durable airborne flesh-eating bacteria. Following those events, the three major superpowers have been investing heavily in the development and procurement of CBRN equipment, in no small part due to the extensive damage that the plague and other similar bioweapons could do. The \"Marine 70\" upgrade package and the launch of the M3 pattern armor series saw the first M3-M prototypes approved for CBRN usage."
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	icon_state = "cbrn"
	worn_state = "cbrn"
	flags_jumpsuit = NO_FLAGS
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_VERYLOW
	armor_bio = CLOTHING_ARMOR_HIGH
	armor_rad = CLOTHING_ARMOR_HIGHPLUS
	fire_intensity_resistance = BURN_LEVEL_TIER_1
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROT
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	actions_types = list(/datum/action/item_action/specialist/toggle_cbrn_hood)

	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/uniform_1.dmi',
	)

	///Whether the hood and gas mask were worn through the hood toggle verb
	var/hood_enabled = FALSE
	///Whether enabling the hood protects you from fire
	var/supports_fire_protection = TRUE
	///Typepath of the attached hood
	var/hood_type = /obj/item/clothing/head/helmet/marine/cbrn_hood
	///The head clothing that the suit uses as a hood
	var/obj/item/clothing/head/linked_hood

/obj/item/clothing/under/marine/cbrn/Initialize()
	linked_hood = new hood_type(src)
	. = ..()

/obj/item/clothing/under/marine/cbrn/Destroy()
	. = ..()
	if(linked_hood)
		qdel(linked_hood)

/obj/item/clothing/under/marine/cbrn/verb/hood_toggle()
	set name = "Toggle Hood"
	set desc = "Pull your hood and gasmask up over your face and head."
	set src in usr
	if(!usr || usr.is_mob_incapacitated(TRUE))
		return
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/user = usr

	if(user.w_uniform != src)
		to_chat(user, SPAN_WARNING("You must be wearing [src] to put on [linked_hood] attached to it!"))
		return

	if(!linked_hood)
		to_chat(user, SPAN_BOLDWARNING("You are missing a linked_hood! This should not be possible."))
		CRASH("[user] attempted to toggle hood on [src] that was missing a linked_hood.")

	playsound(user.loc, "armorequip", 25, 1)
	if(hood_enabled)
		disable_hood(user, FALSE)
		return
	enable_hood(user)

/obj/item/clothing/under/marine/cbrn/proc/enable_hood(mob/living/carbon/human/user)
	if(!istype(user))
		user = usr

	if(!linked_hood.mob_can_equip(user, WEAR_HEAD))
		to_chat(user, SPAN_WARNING("You are unable to equip [linked_hood]."))
		return

	user.equip_to_slot(linked_hood, WEAR_HEAD)

	hood_enabled = TRUE
	RegisterSignal(src, COMSIG_ITEM_UNEQUIPPED, PROC_REF(disable_hood))
	RegisterSignal(linked_hood, COMSIG_ITEM_UNEQUIPPED, PROC_REF(disable_hood))

	if(!supports_fire_protection)
		return
	to_chat(user, SPAN_NOTICE("You raise [linked_hood] over your head. You will no longer catch fire."))
	toggle_fire_protection(user, TRUE)

/obj/item/clothing/under/marine/cbrn/proc/disable_hood(mob/living/carbon/human/user, forced = TRUE)
	if(!istype(user))
		user = usr

	UnregisterSignal(src, COMSIG_ITEM_UNEQUIPPED)
	UnregisterSignal(linked_hood, COMSIG_ITEM_UNEQUIPPED)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/mob/living/carbon/human, drop_inv_item_to_loc), linked_hood, src), 1) //0.1s delay cause you can grab the hood
	addtimer(CALLBACK(src, PROC_REF(check_remove_headgear)), 2) //Checks if it is still not in contents, incase it was dropped

	hood_enabled = FALSE
	if(!forced)
		to_chat(user, SPAN_NOTICE("You take off [linked_hood]."))

	if(supports_fire_protection)
		toggle_fire_protection(user, FALSE)

/obj/item/clothing/under/marine/cbrn/proc/check_remove_headgear(obj/item/clothing/under/marine/cbrn/uniform = src)
	for(var/current_atom in contents)
		if(current_atom == linked_hood)
			return
	linked_hood.forceMove(uniform)

/obj/item/clothing/under/marine/cbrn/proc/toggle_fire_protection(mob/living/carbon/user, enable_fire_protection)
	if(enable_fire_protection)
		RegisterSignal(user, COMSIG_LIVING_PREIGNITION, PROC_REF(fire_shield_is_on))
		RegisterSignal(user, list(COMSIG_LIVING_FLAMER_CROSSED, COMSIG_LIVING_FLAMER_FLAMED), PROC_REF(flamer_fire_callback))
		return
	UnregisterSignal(user, list(COMSIG_LIVING_PREIGNITION, COMSIG_LIVING_FLAMER_CROSSED, COMSIG_LIVING_FLAMER_FLAMED))

/obj/item/clothing/under/marine/cbrn/proc/fire_shield_is_on(mob/living/burning_mob) //Stealing it from the pyro spec armor
	SIGNAL_HANDLER

	if(burning_mob.fire_reagent?.fire_penetrating)
		return

	return COMPONENT_CANCEL_IGNITION

/obj/item/clothing/under/marine/cbrn/proc/flamer_fire_callback(mob/living/burning_mob, datum/reagent/fire_reagent)
	SIGNAL_HANDLER

	if(fire_reagent.fire_penetrating)
		return

	. = COMPONENT_NO_IGNITE|COMPONENT_NO_BURN

/datum/action/item_action/specialist/toggle_cbrn_hood
	ability_primacy = SPEC_PRIMARY_ACTION_2

/datum/action/item_action/specialist/toggle_cbrn_hood/New(obj/item/clothing/under/marine/cbrn/armor, obj/item/holder)
	..()
	name = "Toggle Hood"
	button.name = name
	button.overlays.Cut()
	var/image/button_overlay = image(armor.linked_hood.icon, armor, armor.linked_hood.icon_state)
	button.overlays += button_overlay

/datum/action/item_action/specialist/toggle_cbrn_hood/action_activate()
	var/obj/item/clothing/under/marine/cbrn/armor = holder_item
	if(!istype(armor))
		return
	armor.hood_toggle()

/obj/item/clothing/under/marine/cbrn/advanced
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_HIGHPLUS
	armor_bio = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_rad = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS
	hood_type = /obj/item/clothing/head/helmet/marine/cbrn_hood/advanced
