/datum/weather_event/light_ashfall
	name = "Light Ashfall"
	display_name = "Light Ashfall"
	length = 10 MINUTES
	turf_overlay_icon_state = "ash_fall"

	effect_message = "You feel the ash blow against you."
	damage_per_tick = 0
	damage_type = BRUTE

	ambience = 'sound/ambience/strata/strata_snow.ogg'

	fire_smothering_strength = 0

/datum/weather_event/ashfall
	name = "Ashfall"
	display_name = "Ashfall"
	length = INFINITY
	turf_overlay_icon_state = "ash_fall_dark"

	effect_message = "You feel the ash blow against you."
	damage_per_tick = 0
	damage_type = BRUTE

	ambience = 'sound/ambience/strata/strata_snowstorm.ogg'

	fire_smothering_strength = 0

/datum/weather_event/ashstorm
	name = "Ashstorm"
	display_name = "Ashstorm"
	length = 10 MINUTES
	turf_overlay_icon_state = "ash_storm"

	effect_message = "You feel multiple small rocks hit all over your body!"
	damage_per_tick = 4
	damage_type = BRUTE

	ambience = 'sound/ambience/strata/strata_blizzard.ogg'

	fire_smothering_strength = 0
