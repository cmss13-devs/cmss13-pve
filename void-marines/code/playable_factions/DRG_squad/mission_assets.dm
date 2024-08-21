
// GROUND MINERALS //

/obj/structure/drg/land_crystals
	name = "land ore"
	desc = "Crystal rocks, growing from the floor, walls, and even from cave roof."
	icon = 'void-marines/icons/gray_crystal.dmi'
	icon_state = "crystal_stage1"
	density = TRUE
	opacity = FALSE
	anchored = TRUE

	//pretty same to rocks code
	var/list/allowed_instruments = list(/obj/item/weapon/drg/pickaxe) //what items can be used to dig it out
	var/have_minerals = FALSE //do we have anything tasty?
	var/mineral_drop = null //loot to drop

	var/stage = 1

	var/emmiter_range = 1
	var/emmiter_power = 0.1
	var/emmiter_color = "#ffffff"

/obj/structure/drg/land_crystals/Initialize()
	SHOULD_CALL_PARENT(FALSE)
	set_light(emmiter_range, emmiter_power, l_color = emmiter_color)
	stage = rand(1,3)
	icon_state = "crystal_stage[stage]"

/obj/structure/drg/land_crystals/update_icon()
	icon_state = "crystal_stage[stage]"

/obj/structure/drg/land_crystals/attackby(obj/item/W, mob/user, click_data)

	if(W.type in allowed_instruments)
		playsound(src.loc, 'sound/weapons/Genhit.ogg', 25, 1)
		if(do_after(user, 2 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			if(stage == 1)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
				SPAN_NOTICE("You destroyed some part of [src]."))
				stage = 2
				update_icon()
				return TRUE
			if(stage == 2)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
				SPAN_NOTICE("You destroyed some part of [src]. It's almost fully gone!"))
				stage = 3
				update_icon()
				return TRUE
			if(stage == 3)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[src] crumbles to dust."),
				SPAN_NOTICE("You dug through [src]."))
				qdel(src)
				return TRUE

//Literally all-cure pill
#define PROPERTY_OMNIPOTENT_NERFED "omninerf"

/datum/chem_property/special/omnipotent/nerfed
	name = PROPERTY_OMNIPOTENT_NERFED
	code = "OMN_NERF"
	description = "Mostly revitalizes all bodily functions."

/datum/chem_property/special/omnipotent/nerfed/process(mob/living/M, potency = 1, delta_time)
	M.reagents.remove_all_type(/datum/reagent/toxin, 2.5*REM * delta_time, 0, 1)
	M.setCloneLoss(-50)
	M.setOxyLoss(-50)
	M.heal_limb_damage(POTENCY_MULTIPLIER_MEDIUM * potency, POTENCY_MULTIPLIER_MEDIUM * potency)
	M.apply_damage(-POTENCY_MULTIPLIER_MEDIUM * potency, TOX)
	M.hallucination = 0
	M.setBrainLoss(-50)
	M.disabilities = 0
	M.sdisabilities = 0
	M.SetEyeBlur(0)
	M.SetEyeBlind(0)
	M.set_effect(0, WEAKEN)
	M.set_effect(0, STUN)
	M.set_effect(0, PARALYZE)
	M.silent = 0
	M.dizziness = 0
	M.drowsyness = 0
	M.stuttering = 0
	M.confused = 0
	M.sleeping = 0
	M.jitteriness = 0
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	for(var/datum/internal_organ/I in H.internal_organs)
		M.apply_internal_damage(-0.5 * potency * delta_time, I)

/datum/reagent/medical/red_sugar
	name = "Red sugar"
	id = "rsugar"
	description = "An shredded red sugar. Nothing else!"
	reagent_state = LIQUID
	color = "#C8A5DC" // rgb: 200, 165, 220
	chemclass = CHEM_CLASS_SPECIAL
	objective_value = OBJECTIVE_HIGH_VALUE
	properties = list(
		PROPERTY_NUTRITIOUS = 2,
		PROPERTY_OMNIPOTENT_NERFED = 2,
		PROPERTY_HEMOSTATIC = 2,
		PROPERTY_HEMOGENIC = 2
	)
	flags = REAGENT_TYPE_MEDICAL

/obj/structure/drg/land_crystals/sugar
	name = "red sugar crystal"
	desc = "Crystal rock, posessing strong regenerative abilities."

	color = "#e90505"

	emmiter_range = 3
	emmiter_power = 0.5
	emmiter_color = "#e90505"

/obj/structure/drg/land_crystals/sugar/attackby(obj/item/W, mob/user, click_data)

	if(W.type in allowed_instruments)
		playsound(src.loc, 'sound/weapons/Genhit.ogg', 25, 1)
		if(do_after(user, 2 SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			if(stage == 1)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
				SPAN_NOTICE("You destroyed some part of [src]."))
				stage = 2
				update_icon()
				user.reagents.add_reagent("rsugar", 2)
				return TRUE
			if(stage == 2)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[user] starts to dig [src] out."),
				SPAN_NOTICE("You destroyed some part of [src]. It's almost fully gone!"))
				stage = 3
				update_icon()
				user.reagents.add_reagent("rsugar", 2)
				return TRUE
			if(stage == 3)
				if(have_minerals)
					new mineral_drop(loc)
				user.visible_message(SPAN_WARNING("[src] crumbles to dust."),
				SPAN_NOTICE("You dug through [src]."))
				user.reagents.add_reagent("rsugar", 2)
				qdel(src)
				return TRUE

// EGG-HUNT STUFF //

/obj/structure/surface/table/rock/organic
	icon_state = "meatnormaltable"
	table_prefix = "meatnormal"

	color = "#ffffff"
	name = "organic mass"
	desc = "This is...flesh?"
	dig_time = 5 SECONDS

/obj/structure/surface/table/rock/organic/veiny
	icon_state = "meatnormal2table"
	table_prefix = "meatnormal2"

/obj/effect/decal/organic_veins
	icon = 'void-marines/icons/glyphid_egg.dmi'
	icon_state = "veins"
	layer = TURF_LAYER
	name = "strange red vines"

/turf/open/floor/organic
	icon = 'void-marines/icons/glyphid_egg.dmi'
	icon_state = "default"
	name = "organic mass"
	desc = "This is...flesh?"
	plating_type = /turf/open/auto_turf/sand_white/layer0

/turf/open/floor/organic/veiny
	icon_state = "eyes"

/obj/item/drg/glyphid_egg
	icon = 'void-marines/icons/glyphid_egg.dmi'
	icon_state = "egg"
	name = "strange egg"
	desc = "An strange alien egg, used for pretty simple things - like cooking omlet"
	w_class = SIZE_LARGE
