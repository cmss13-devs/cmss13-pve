/// In case they drop their primary but get a new one in the time it takes to retrieve their old one
/datum/ongoing_action/item_pickup/pickup_primary
	name = "Pickup Primary"

/datum/ongoing_action/item_pickup/pickup_primary/trigger_action()
	if(brain.primary_weapon)
		return ONGOING_ACTION_COMPLETED
	return ..()
