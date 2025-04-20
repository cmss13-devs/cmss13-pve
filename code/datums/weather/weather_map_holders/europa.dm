/datum/weather_ss_map_holder/europa
	name = "Europa Map Holder"

	min_time_between_events = 1 MINUTES

	potential_weather_events = list(
		/datum/weather_event/strong_winds,
	)

/datum/weather_ss_map_holder/europa/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/europa/should_start_event()
	return prob(100) //idgaf


/datum/weather_event/strong_winds
	name = "Strong Winds"
	display_name = "Strong wind"
	length = 50 MINUTES
	turf_overlay_icon_state = null

	effect_message = "You feel unstoppable winds of Europa strike you full force."
	damage_per_tick = 5

	ambience = 'sound/ambience/strata/strata_blizzard.ogg'

	fire_smothering_strength = 15

/datum/weather_event/strong_winds/process_mob_effect(mob/living/carbon/affected_mob, delta_time = 1)
	if(ishuman(affected_mob))
		var/mob/living/carbon/human/human = affected_mob
		if(human.full_spacesuit_check())
			return
		else
			..()
	..()