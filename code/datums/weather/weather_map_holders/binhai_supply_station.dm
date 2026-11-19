/datum/weather_ss_map_holder/binhai_supply_station
	name = "Binhai Supply Station Map Holder"

	min_time_between_events = 15 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/dust,
	)

/datum/weather_ss_map_holder/binhai_supply_station/should_affect_area(area/A)
	return A.ceiling == CEILING_UNDERGROUND_BLOCK_CAS

/datum/weather_ss_map_holder/binhai_supply_station/should_start_event()
	return prob(PROB_WEATHER_BIG_RED)
