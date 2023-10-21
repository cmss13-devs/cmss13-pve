// MINERAL DOOR
/obj/structure/mineral_door/xeno_ai_obstacle(mob/living/carbon/xenomorph/X, direction)
	return DOOR_PENALTY

/obj/structure/mineral_door/xeno_ai_act(mob/living/carbon/xenomorph/X)
	X.do_click(src, "", list())

/obj/structure/mineral_door/resin/xeno_ai_obstacle(mob/living/carbon/xenomorph/xeno)
	if(xeno.hivenumber != hivenumber)
		return ..()
	return 0

/obj/structure/mineral_door/resin/xeno_ai_act(mob/living/carbon/xenomorph/acting_xeno)
	acting_xeno.a_intent = INTENT_HELP
	. = ..()

// AIRLOCK
/obj/structure/machinery/door/airlock/xeno_ai_obstacle(mob/living/carbon/xenomorph/X, direction)
	if(locked || welded || isElectrified())
		return INFINITY
	return DOOR_PENALTY

/obj/structure/machinery/door/xeno_ai_act(mob/living/carbon/xenomorph/X)
	X.do_click(src, "", list())

// OBJECTS
/obj/structure/xeno_ai_obstacle(mob/living/carbon/xenomorph/X, direction)
	if(!density)
		return 0

	if(unslashable && !climbable)
		return ..()
	return OBJECT_PENALTY

/obj/structure/xeno_ai_act(mob/living/carbon/xenomorph/X)
	if(unslashable)
		if(!X.action_busy)
			do_climb(X)
		return
	X.do_click(src, "", list())


// HUMANS
/mob/living/carbon/human/xeno_ai_obstacle(mob/living/carbon/xenomorph/X, direction)
	if(status_flags & GODMODE)
		return ..()
	return HUMAN_PENALTY

/mob/living/carbon/human/xeno_ai_act(mob/living/carbon/xenomorph/X)
	if(status_flags & GODMODE)
		return ..()
	X.do_click(src, "", list())

// VEHICLES
/obj/vehicle/xeno_ai_obstacle(mob/living/carbon/xenomorph/X, direction)
	return VEHICLE_PENALTY

/obj/vehicle/xeno_ai_act(mob/living/carbon/xenomorph/X)
	X.do_click(src, "", list())

// SENTRY
/obj/structure/machinery/defenses/xeno_ai_obstacle(mob/living/carbon/xenomorph/X, direction)
	return VEHICLE_PENALTY

/obj/structure/machinery/defenses/xeno_ai_act(mob/living/carbon/xenomorph/X)
	X.do_click(src, "", list())

// WINDOW FRAME
/obj/structure/window_frame/xeno_ai_obstacle(mob/living/carbon/xenomorph/X, direction)
	if(X.claw_type == CLAW_TYPE_VERY_SHARP || (X.claw_type >= CLAW_TYPE_SHARP && !reinforced))
		return ..()
	return WINDOW_FRAME_PENALTY

/obj/structure/window_frame/xeno_ai_act(mob/living/carbon/xenomorph/X)
	. = ..()
	if(!X.action_busy)
		do_climb(X)

// Avoid barricades if possible.
/obj/structure/barricade/xeno_ai_obstacle(mob/living/carbon/xenomorph/X, direction)
	return BARRICADE_PENALTY

// FIRE
/obj/flamer_fire/xeno_ai_obstacle(mob/living/carbon/xenomorph/xeno, direction)
	if(xeno.caste?.fire_immunity & (FIRE_IMMUNITY_NO_IGNITE|FIRE_IMMUNITY_NO_DAMAGE))
		return 0

	return FIRE_PENALTY
