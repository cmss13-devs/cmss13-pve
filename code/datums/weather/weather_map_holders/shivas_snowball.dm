//// Shivas's map holder

/datum/weather_ss_map_holder/shivas_snowball
	name = "Shivas Snowball Map Holder"

	min_time_between_events = 20 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/snow,
	)

/datum/weather_ss_map_holder/shivas_snowball/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/shivas_snowball/should_start_event()
	if (prob(PROB_WEATHER_SHIVAS_SNOWBALL))
		return TRUE
	return FALSE
