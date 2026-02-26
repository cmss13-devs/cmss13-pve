/datum/weather_event/light_rain/redemption_valley
	name = "Valley Rain"
	display_name = "Light Rain"
	length = 12 MINUTES

	has_process = TRUE
	lightning_chance = 1

	turf_overlay_alpha = 30

	fire_smothering_strength = 1

/datum/weather_event/heavy_rain/redemption_valley
	name = "Valley Storm"
	display_name = "Heavy Rain"
	length = 8 MINUTES

	turf_overlay_alpha = 100

	ambience = 'sound/ambience/varadero_storm.ogg'

	has_process = TRUE
	lightning_chance = 3

	fire_smothering_strength = 4
