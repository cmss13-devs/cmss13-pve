/datum/weather_ss_map_holder/kleschers_research_site
	name = "Kleschers Map Holder"

	min_time_between_events = 20 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/snow,
		/datum/weather_event/snowstorm,
		/datum/weather_event/light_rain,
	)

/datum/weather_ss_map_holder/kleschers_research_site/should_affect_area(area/A)
	return (A.temperature <= SOROKYNE_TEMPERATURE)

/datum/weather_ss_map_holder/kleschers_research_site/should_start_event()
	if (prob(PROB_WEATHER_SOROKYNE))
		return TRUE
	return FALSE

/datum/weather_ss_map_holder/kleschers/weather_warning()
	for (var/obj/structure/machinery/weather_siren/WS in GLOB.weather_notify_objects)
		WS.weather_warning()
