/datum/effects/crit/human/process_mob()
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/carbon/affected_mob = affected_atom
	if(affected_mob.health > HEALTH_THRESHOLD_CRIT)
		qdel(src)
		return FALSE
	if(!affected_mob.reagents || !affected_mob.reagents.has_reagent("inaprovaline"))
		affected_mob.apply_damage(1, OXY)

	for(var/datum/reagent/R in affected_mob.reagents.reagent_list)
		var/datum/chem_property/P = R.get_property(PROPERTY_ELECTROGENETIC)//Adrenaline helps greatly at restarting the heart
		if(P)
			return TRUE

	affected_mob.KnockDown(3)
	affected_mob.Stun(3)

	return TRUE
