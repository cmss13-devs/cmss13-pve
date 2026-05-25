
/*
	The growth tank is where organs are created

	Fetuses can be grown using only biomass
	Limbs and organs require stem cells, which are harvested from fetuses (as well as more biomass)
*/
/obj/machinery/growth_tank
	name = "growth tank"
	desc = "A vat for growing organic components."
	icon = 'icons/obj/machines/ds13/bpl.dmi'
	icon_state = "base"

	var/max_biomass = 150	//1.5 Litre
	var/current_biomass

	var/obj/item/organ/current_growth_atom

	//If true, we are currently growing something
	//This is false when the tank is empty, and also false when the contained organ has finished its growth and is just being maintained
	var/forming = FALSE

	var/growth_rate = 1.2	//This many units of refined biomass are added to the forming organ each tick

	var/efficiency = 0.9	//Some of the biomass is wasted

	//Two tanks can be stacked vertically
	var/upper = FALSE

	var/ticks = 0
	density = TRUE
	anchored = TRUE

	var/icon_updating = FALSE
