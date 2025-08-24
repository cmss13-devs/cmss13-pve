/datum/weather_ss_map_holder/bosenmori_basho
	name = "Bosenmori Basho Map Holder"

	min_time_between_events = 20 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/dust,
		/datum/weather_event/sand,
	)

/datum/weather_ss_map_holder/bosenmori_basho/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/bosenmori_basho/should_start_event()
	return prob(PROB_WEATHER_BIG_RED)
