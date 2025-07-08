/datum/weather_ss_map_holder/bmg290_otogi_egress_point
	name = "BMG-290 Otogi Egress Point Map Holder"

	min_time_between_events = 15 MINUTES
	no_weather_turf_icon_state = "strata_clearsky"

	potential_weather_events = list(
		/datum/weather_event/light_rain/varadero,
		/datum/weather_event/monsoon,
	)

/datum/weather_ss_map_holder/bmg290_otogi_egress_point/should_affect_area(area/A)
	return !CEILING_IS_PROTECTED(A.ceiling, CEILING_GLASS)

/datum/weather_ss_map_holder/bmg290_otogi_egress_point/should_start_event()
	return prob(PROB_WEATHER_NEW_VARADERO)

/datum/weather_ss_map_holder/bmg290_otogi_egress_point/weather_warning()
	for (var/obj/structure/machinery/storm_siren/WS in GLOB.weather_notify_objects)
		WS.weather_warning()
