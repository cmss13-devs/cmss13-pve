/* Types of tanks!
 * Contains:
 * Oxygen
 * Anesthetic
 * Air
 * Phoron
 * Emergency Oxygen
 */

/*
 * Oxygen
 */
/obj/item/tank/oxygen
	name = "oxygen tank"
	desc = "A tank of oxygen."
	icon_state = "oxygen"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	gas_type = GAS_TYPE_OXYGEN
	w_class = SIZE_LARGE



/obj/item/tank/oxygen/yellow
	desc = "A tank of oxygen, this one is yellow."
	icon_state = "oxygen_f"

/obj/item/tank/oxygen/red
	desc = "A tank of oxygen, this one is red."
	icon_state = "oxygen_fr"


/*
 * Anesthetic
 */
/obj/item/tank/anesthetic
	name = "anesthetic tank"
	desc = "A tank with an N2O/O2 gas mix."
	icon_state = "anesthetic"
	item_state = "anesthetic"
	gas_type = GAS_TYPE_N2O


/*
 * Air
 */
/obj/item/tank/air
	name = "air tank"
	desc = "Mixed anyone?"
	icon_state = "oxygen"
	gas_type = GAS_TYPE_AIR

/*
 * Emergency Oxygen
 */
/obj/item/tank/emergency_oxygen
	name = "emergency oxygen tank"
	desc = "Used for emergencies. Contains very little oxygen, so try to conserve it until you actually need it."
	icon_state = "emergency"
	flags_atom = FPRINT|CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_TINY
	force = 4
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	volume = 1.4 //Tiny. Real life equivalents only have 21 breaths of oxygen in them. They're EMERGENCY tanks anyway -errorage (dangercon 2011)
	gas_type = GAS_TYPE_OXYGEN
	pressure = 3*ONE_ATMOSPHERE
	pressure_full = 3*ONE_ATMOSPHERE

/obj/item/tank/emergency_oxygen/attack(mob/M as mob, mob/user as mob)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M

	//Address the integrated tank on Spacesuit on the person being targeted
		var/obj/item/clothing/suit/space/pressure/tank_to_replace = H.wear_suit
		if((istype(H.wear_suit, /obj/item/clothing/suit/space/pressure)))
			tank_to_replace.attackby(src, user)
			return

/obj/item/tank/get_examine_text(mob/user)
	. = ..()
	if(pressure < 100 && loc==user)
		. += SPAN_DANGER("The meter on \the [src] indicates you are almost out of air!")
	var/standard_breath_rate = STD_BREATH_VOLUME / 10 // Air taken every cycle
	var/air_removal_rate = initial(distribute_pressure)*standard_breath_rate/(R_IDEAL_GAS_EQUATION*temperature)/5
	var/moles_in_tank = (pressure_full * src.volume) / (R_IDEAL_GAS_EQUATION * temperature)
	if(gas_type == GAS_TYPE_AIR)
		moles_in_tank = moles_in_tank*O2STANDARD
	var/remaining_cycles = moles_in_tank / air_removal_rate
	var/remaining_minutes = round((remaining_cycles*1.1) * 5 / 60, 0.1) //it runs every two deciseconds i think. Also the 1.1 is to compensate for this always being slightly wrong fnr
	. += SPAN_NOTICE("Assuming it is full, and either oxygen or air mixture, this tank has about [remaining_minutes] minutes of breathable air supply at [(gas_type == GAS_TYPE_OXYGEN) ? "21" : "104"]Kpa.")

/obj/item/tank/emergency_oxygen/empty
	pressure = 33

/obj/item/tank/emergency_oxygen/engi
	name = "extended-capacity emergency oxygen tank"
	icon_state = "emergency_engi"
	w_class = SIZE_SMALL
	volume = 3.5
	pressure = 5*ONE_ATMOSPHERE
	pressure_full = 5*ONE_ATMOSPHERE

/obj/item/tank/emergency_oxygen/double
	name = "Compact oxygen tank"
	desc = "Capable of sustaining a short EVA, but should not be solely depended on."
	icon_state = "emergency_double"
	w_class = SIZE_MEDIUM
	volume = 8
	pressure = 5*ONE_ATMOSPHERE
	pressure_full = 5*ONE_ATMOSPHERE

/*
 * Nitrogen
 */
/obj/item/tank/nitrogen
	name = "nitrogen tank"
	desc = "A tank of nitrogen."
	icon_state = "oxygen_fr"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	gas_type = GAS_TYPE_NITROGEN

// Phoron, used for generators.
/obj/item/tank/phoron
	name = "phoron tank"
	desc = "A tank of liquid phoron. WARNING: Phumes are extremely dangerous."
	icon_state = "phoron"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	gas_type = GAS_TYPE_PHORON

/obj/item/tank/phoron/update_icon()
	. = ..()

	if(volume <= 0)
		icon_state = "phoron_empty"
	else
		icon_state = "phoron"
