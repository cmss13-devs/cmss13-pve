/datum/fire_support/gau
	name = "Gun run"
	fire_support_firer = FIRESUPPORT_CAS
	fire_support_type = FIRESUPPORT_TYPE_GUN
	cost = 3
	impact_quantity = 4
	scatter_range = 3
	icon_state = "gau"
	initiate_chat_message = "TARGET ACQUIRED GUN RUN INBOUND."
	initiate_screen_message = list(
		"Target received, gun run inbound",
		"Lase sighted, sending lead delivery hot and ready",
		"Im coming in, keep your heads down!",
		"Finally some targets! Strafe incomin'",
		"Time to let these guns roar, we're inbound.",
	)

/datum/fire_support/gau/do_impact(turf/target_turf)
	var/revdir = REVERSE_DIR(NORTH)
	for(var/i=0 to 2)
		target_turf = get_step(target_turf, revdir)
	var/list/strafelist = list(target_turf)
	strafelist += get_step(target_turf, turn(NORTH, 90))
	strafelist += get_step(target_turf, turn(NORTH, -90)) //Build this list 3 turfs at a time for strafe_turfs
	for(var/b=0 to 6)
		target_turf = get_step(target_turf, NORTH)
		strafelist += target_turf
		strafelist += get_step(target_turf, turn(NORTH, 90))
		strafelist += get_step(target_turf, turn(NORTH, -90))

	if(!length(strafelist))
		return

	strafe_turfs(strafelist)

///Takes the top 3 turfs and miniguns them, then repeats until none left
/datum/fire_support/gau/proc/strafe_turfs(list/strafelist)
	var/turf/strafed
	playsound(strafelist[1], 'sound/effects/gauimpact.ogg', 40, 1, 20, falloff = 3)
	for(var/i=1 to 3)
		strafed = strafelist[1]
		strafelist -= strafed
		strafed.ex_act(EXPLOSION_THRESHOLD_HIGH)
		for(var/target in strafed)
			if(isliving(target))
				var/mob/living/living_target = target
				living_target.apply_damage(250, BRUTE)
			else if(isVehicleMultitile(target))
				var/obj/vehicle/multitile/vic = target
				vic.ex_act(800)
				playsound(vic, 'sound/effects/meteorimpact.ogg', 50)
				vic.at_munition_interior_explosion_effect(cause_data = create_cause_data("GAU strike"))
				vic.interior_crash_effect()
			else if(isobj(target))
				var/obj/obj_target = target
				obj_target.update_health(250)
		new /obj/effect/temp_visual/heavyimpact_cas(strafed)

	if(length(strafelist))
		addtimer(CALLBACK(src, PROC_REF(strafe_turfs), strafelist), 0.2 SECONDS)

/datum/fire_support/gau/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_GUN_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"
	start_visual = /obj/effect/temp_visual/dropship_flyby/krokodil

/datum/fire_support/laser
	name = "Laser run"
	fire_support_firer = FIRESUPPORT_CAS
	fire_support_type = FIRESUPPORT_TYPE_LASER
	cost = 2
	impact_quantity = 7
	scatter_range = 3
	icon_state = "laser"
	initiate_chat_message = "TARGET ACQUIRED LASER RUN INBOUND."
	initiate_screen_message = list(
		"Target received, laser inbound",
		"Flash, flash! Don't look up!",
		"Going to get real hot down there, watch your step.",
		"Close your eyes or put some goggles on, laser pulsing!",
		"Lets grill some motherfuckers!",
	)

/datum/fire_support/laser/do_impact(turf/target_turf)
	var/turf/start_turf = locate(clamp(target_turf.x + rand(-3, 3), 1, world.maxx), clamp(target_turf.y - 6, 1, world.maxy), target_turf.z)
	var/turf/end_turf = locate(clamp(target_turf.x + rand(-3, 3), 1, world.maxx), clamp(target_turf.y + 6, 1, world.maxy), target_turf.z)

	var/list/strafelist = get_line(start_turf, end_turf)
	strafe_turfs(strafelist)

///lases each turf in the line one by one
/datum/fire_support/laser/proc/strafe_turfs(list/strafelist)
	var/turf/strafed = strafelist[1]
	playsound(strafed, 'sound/weapons/fire_support/laser_impact.ogg', 40, 1, 20, falloff = 3)
	for(var/target in strafed)
		if(isliving(target))
			var/mob/living/living_target = target
			living_target.adjustFireLoss(100)
			living_target.adjust_fire_stacks(20)
			living_target.IgniteMob()
		else if(isVehicleMultitile(target))
			var/obj/vehicle/multitile/vic = target
			vic.take_damage_type(200, "Laser strike")
			playsound(vic, 'sound/effects/meteorimpact.ogg', 50)
			vic.at_munition_interior_explosion_effect(shrapnel = FALSE, cause_data = create_cause_data("Laser strike"))
			vic.interior_crash_effect()
		else if(isobj(target))
			var/obj/obj_target = target
			obj_target.update_health(200)
	strafed.ex_act(EXPLOSION_THRESHOLD_VLOW)
	fire_spread_recur(strafed, create_cause_data("cas laser", "fire support"), 1, null, 5, 75, "#EE6515")//Very, very intense, but goes out very quick

	strafelist -= strafed
	if(length(strafelist))
		INVOKE_NEXT_TICK(src, PROC_REF(strafe_turfs), strafelist)

/datum/fire_support/laser/upp
	faction = FACTION_UPP
	fire_support_firer = FIRESUPPORT_CAS_UPP
	fire_support_type = FIRESUPPORT_TYPE_LASER_UPP
	portrait_type = "pilot_red"
	initiate_title = "Pig-1"
	start_visual = /obj/effect/temp_visual/dropship_flyby/krokodil
