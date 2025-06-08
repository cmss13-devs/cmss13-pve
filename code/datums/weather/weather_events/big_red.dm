/datum/weather_event/dust
	name = "Duststorm"
	display_name = "Duststorm"
	length = 10 MINUTES
	turf_overlay_icon_state = "bigred_dust"

	effect_message = "You feel dust blow into every crevice of your body, annoying."
	damage_per_tick = 0
	damage_type = BRUTE

	ambience = 'sound/ambience/strata/strata_snow.ogg'

	fire_smothering_strength = 1

/datum/weather_event/sand
	name = "Sandstorm"
	display_name = "Sandstorm"
	length = 6 MINUTES
	turf_overlay_icon_state = "bigred_sand"

	effect_message = "You feel sand scraping the upper layers of your exterior away!"
	damage_per_tick = 0
	damage_type = BRUTE

	ambience = 'sound/ambience/strata/strata_snowstorm.ogg'

	fire_smothering_strength = 2

/datum/weather_event/rock
	name = "Rockstorm"
	display_name = "Rockstorm"
	length = 4 MINUTES
	turf_overlay_icon_state = "bigred_rocks"

	effect_message = "You feel multiple small rocks hit all over your body!"
	damage_per_tick = 3
	damage_type = BRUTE

	ambience = 'sound/ambience/strata/strata_blizzard.ogg'

	fire_smothering_strength = 3

/datum/weather_event/sand/strong
	name = "Giga Sandstorm"
	length = INFINITY
	turf_overlay_icon_state = "gigadust"

	effect_message = "You feel metallic dust scratch against your body, slowing you down!"


	ambience = 'sound/ambience/strata/strata_blizzard.ogg'
	fullscreen_type = /atom/movable/screen/fullscreen/weather/sand

/datum/weather_event/sand/strong/process_mob_effect(mob/living/carbon/affected_mob, delta_time = 1)
	..()
	if(prob(33))
		var/new_slowdown = affected_mob.next_move_slowdown + rand(2,3)
		affected_mob.next_move_slowdown = new_slowdown
		to_chat(affected_mob, SPAN_WARNING("You stumble in the dust storm."))