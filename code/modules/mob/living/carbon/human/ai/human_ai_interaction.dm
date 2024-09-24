/atom/proc/human_ai_obstacle(mob/living/carbon/human/ai_human, datum/human_ai_brain/brain, direction, turf/target)
	if(get_turf(src) == target)
		return 0
	return INFINITY

/atom/proc/human_ai_act(mob/living/carbon/human/ai_human, datum/human_ai_brain/brain)
	return TRUE


/////////////////////////////
//         OBJECTS         //
/////////////////////////////
/obj/structure/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	if(!density)
		return 0

	if(!climbable)
		return

	return OBJECT_PENALTY

/obj/structure/human_ai_act(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain)
	if(climbable && !human_ai.action_busy)
		do_climb(human_ai)

	return ..()


/////////////////////////////
//       MINERAL DOOR      //
/////////////////////////////
/obj/structure/mineral_door/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	if(!brain.primary_weapon)
		return INFINITY

	return DOOR_PENALTY

/obj/structure/mineral_door/resin/human_ai_act(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain)
	ADD_ONGOING_ACTION(brain, AI_ACTION_MELEE_ATOM, src)
	return ..()


/////////////////////////////
//        PLATFORMS        //
/////////////////////////////
/obj/structure/platform/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	return DOOR_PENALTY


/////////////////////////////
//         PODDDOORS       //
/////////////////////////////
/obj/structure/machinery/door/poddoor/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	if(!(stat & NOPOWER))
		return INFINITY

	if(density && !operating && !unacidable && brain.get_tool_from_equipment_map(TRAIT_TOOL_CROWBAR))
		return DOOR_PENALTY

	return INFINITY

/obj/structure/machinery/door/poddoor/human_ai_act(mob/living/carbon/human/ai_human, datum/human_ai_brain/brain)
	. = ..()
	brain.holster_primary()
	var/obj/item/crowbar = brain.get_tool_from_equipment_map(TRAIT_TOOL_CROWBAR)
	brain.equip_item_from_equipment_map(HUMAN_AI_TOOLS, crowbar)
	attackby(crowbar, ai_human)
	brain.store_item(crowbar, brain.storage_has_room(crowbar), HUMAN_AI_TOOLS)


/////////////////////////////
//         AIRLOCK         //
/////////////////////////////
/obj/structure/machinery/door/airlock/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	if(locked || welded || isElectrified())
		return LOCKED_DOOR_PENALTY

	return DOOR_PENALTY


/////////////////////////////
//          MOBS           //
/////////////////////////////
/mob/living/ai_check_stat(mob/living/carbon/xenomorph/X)
	return stat == CONSCIOUS && !(locate(/datum/effects/crit) in effects_list)


/////////////////////////////
//         HUMANS         //
/////////////////////////////
/mob/living/carbon/human/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	if(status_flags & GODMODE)
		return ..()

	return HUMAN_PENALTY

/*/mob/living/carbon/human/xeno_ai_act(mob/living/carbon/xenomorph/X)
	if(status_flags & GODMODE)
		return

	. = ..()
*/


/////////////////////////////
//          XENOS          //
/////////////////////////////
/mob/living/carbon/xenomorph/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	return XENO_PENALTY

/////////////////////////////
//         VEHICLES        //
/////////////////////////////
/obj/vehicle/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	return VEHICLE_PENALTY


/////////////////////////////
//         SENTRY          //
/////////////////////////////
/obj/structure/machinery/defenses/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	return SENTRY_PENALTY


/////////////////////////////
//      WINDOW FRAME       //
/////////////////////////////
/*obj/structure/window_frame/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	if(buildstacktype && brain.get_tool_from_equipment_map(TRAIT_TOOL_WRENCH))
		return ..()
	return WINDOW_FRAME_PENALTY*/


/////////////////////////////
//       BARRICADES        //
/////////////////////////////
/obj/structure/barricade/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	return BARRICADE_PENALTY

/obj/structure/barricade/plasteel/human_ai_act(mob/living/carbon/human/ai_human, datum/human_ai_brain/brain)
	. = ..()
	if(!closed)
		close(src)

/obj/structure/barricade/handrail/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	return DOOR_PENALTY


/////////////////////////////
//          FIRE           //
/////////////////////////////
/obj/flamer_fire/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/braineno, direction, turf/target)
	. = ..()
	if(!.)
		return

	return FIRE_PENALTY


/////////////////////////////
//          WALLS          //
/////////////////////////////
/turf/closed/wall/resin/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/braineno, direction, turf/target)
	. = ..()
	if(!.)
		return

	return WALL_PENALTY


/////////////////////////////
//          FLOOR          //
/////////////////////////////
/*
	Sometimes open turfs are passed back as obstacles due to platforms and such,
	generally it's fast so very slight penalty mainly for handling subtypes properly
*/
/turf/open/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	return OPEN_TURF_PENALTY

/turf/open/human_ai_act(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain)
	return FALSE

/turf/open/space/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(!.)
		return

	return INFINITY


/////////////////////////////
//          RIVER          //
/////////////////////////////
/turf/open/gm/river/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	. = ..()
	if(. && !covered)
		. += base_river_slowdown

/turf/open/gm/river/desert/human_ai_obstacle(mob/living/carbon/human/human_ai, datum/human_ai_brain/brain, direction, turf/target)
	if(toxic && !covered)
		return FIRE_PENALTY

	return ..()
