/datum/weather_ss_map_holder/greenvault_ranch
	name = "Greenvault Ranch Map Holder"

	min_time_between_events = 20 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/light_rain,
		/datum/weather_event/heavy_rain,
	)

/datum/weather_ss_map_holder/greenvault_ranch/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/greenvault_ranch/should_start_event()
	return TRUE
