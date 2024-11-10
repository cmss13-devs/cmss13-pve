/datum/ai_action/fire_at_target/point_blank
	name = "Fire At Target (Point Blank)"

/datum/ai_action/fire_at_target/point_blank/get_weight(datum/human_ai_brain/brain)
	if(!brain.in_combat)
		return 0

	if(brain.tried_reload)
		return 0

	if(!brain.primary_weapon)
		return 0

	if(!brain.target_turf)
		return 0

	if(get_dist(brain.tied_human, brain.target_turf) > 1)
		return 0

	if(brain.should_reload())
		return 0

	return 11 // higher weight than regular firing

/datum/ai_action/fire_at_target/point_blank/trigger_action()
	var/obj/item/weapon/gun/primary_weapon = brain.primary_weapon
	if(!primary_weapon || brain.active_grenade_found)
		return ONGOING_ACTION_COMPLETED

	if(currently_firing)
		stop_firing()

	var/mob/living/carbon/tied_human = brain.tied_human
	if(!(primary_weapon in tied_human.get_hands()))
		brain.unholster_primary()

	var/datum/firearm_appraisal/gun_data = brain.gun_data
	gun_data.before_fire(primary_weapon, tied_human, brain)
	if(brain.should_reload())
		if(gun_data?.disposable)
			tied_human.drop_held_item(primary_weapon)
			brain.set_primary_weapon(null)
		return ONGOING_ACTION_COMPLETED

	tied_human.face_atom(brain.target_turf)
	tied_human.a_intent = INTENT_HARM

	RegisterSignal(tied_human, COMSIG_MOB_FIRED_GUN, PROC_REF(on_gun_fire), TRUE)

	var/mob/living/target
	for(var/mob/living/being in brain.target_turf)
		if(!brain.faction_check(being))
			target = being
			break

	if(!target)
		return

	INVOKE_ASYNC(primary_weapon, TYPE_PROC_REF(/obj/item/weapon/gun, attack), target, brain.tied_human)
	return ONGOING_ACTION_UNFINISHED


/datum/ai_action/fire_at_target/point_blank/on_gun_fire(datum/source, obj/item/weapon/gun/fired)
	if(!brain)
		qdel(src)
		return

	var/mob/living/carbon/tied_human = brain.tied_human
	tied_human.a_intent = INTENT_HARM

	brain.shot_at = get_turf(brain.target_turf)
	tied_human.face_atom(brain.target_turf)

	currently_firing = TRUE

	var/obj/item/weapon/gun/primary_weapon = brain.primary_weapon
	if(istype(primary_weapon, /obj/item/weapon/gun/shotgun/pump))
		currently_firing = FALSE
		var/obj/item/weapon/gun/shotgun/pump/shotgun = primary_weapon
		addtimer(CALLBACK(shotgun, TYPE_PROC_REF(/obj/item/weapon/gun/shotgun/pump, pump_shotgun), tied_human), shotgun.pump_delay)
/* Basira doesn't need cocking???
	else if(istype(primary_weapon, /obj/item/weapon/gun/boltaction))
		var/obj/item/weapon/gun/boltaction/bolt = primary_weapon
		currently_firing = FALSE
		addtimer(CALLBACK(bolt, TYPE_PROC_REF(/obj/item/weapon/gun/boltaction, unique_action), tied_human), 1)
		addtimer(CALLBACK(bolt, TYPE_PROC_REF(/obj/item/weapon/gun/boltaction, unique_action), tied_human), bolt.bolt_delay + 1)
*/
	else if(primary_weapon.gun_firemode == GUN_FIREMODE_AUTOMATIC)
		rounds_burst_fired++

	var/datum/firearm_appraisal/gun_data = brain.gun_data
	if(brain.should_reload()) // note that bullet removal comes after comsig is triggered
		if(gun_data?.disposable)
			tied_human.drop_held_item(primary_weapon)
			brain.set_primary_weapon(null)
		qdel(src)
		return

	qdel(src)
	return

