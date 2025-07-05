//// LV624 Long Snow's map holder

/datum/weather_ss_map_holder/lv624_long_snow
	name = "LV624 Long Snow Map Holder"

	min_time_between_events = 30 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/snow,
	)

/datum/weather_ss_map_holder/lv624_long_snow/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/lv624_long_snow/should_start_event()
	if (prob(PROB_WEATHER_SHIVAS_SNOWBALL))
		return TRUE
	return FALSE
