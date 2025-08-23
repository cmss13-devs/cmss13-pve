/datum/weather_ss_map_holder/redemption_valley
	name = "Redemption Valley Map Holder"

	min_time_between_events = 12 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/light_rain/redemption_valley,
		/datum/weather_event/heavy_rain/redemption_valley,
	)

/datum/weather_ss_map_holder/redemption_valley/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/redemption_valley/should_start_event()
	return prob(PROB_WEATHER_NEW_VARADERO)
