/datum/weather_ss_map_holder/si391_sekhmet_swamp
	name = "SI-391 Sekhmet Map Holder"

	min_time_between_events = 20 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/light_rain,
		/datum/weather_event/heavy_rain,
	)

/datum/weather_ss_map_holder/si391_sekhmet_swamp/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/si391_sekhmet_swamp/should_start_event()
	return prob(PROB_WEATHER_LV624)
