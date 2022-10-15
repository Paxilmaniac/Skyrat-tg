/datum/weather/rain_storm
	name = "rain storm"
	desc = "A storm brews over the area, providing a shower of rain for any unfortunate enough to not be indoors."

	telegraph_message = span_notice("Dark clouds form in the air above, drops of rain falling from above!")
	telegraph_duration = 15 SECONDS
	telegraph_overlay = "rain_low"
	telegraph_sound = 'sound/ambience/acidrain_start.ogg'

	weather_message = span_boldnotice("The rain suddenly picks up in intensity, soaking everything under the sky!")
	weather_duration_lower = 5 MINUTES
	weather_duration_upper = 10 MINUTES
	weather_overlay = "rain_high"
	weather_sound = 'sound/ambience/acidrain_mid.ogg'

	end_message = span_notice("The rain seems to be slowing down, the clouds above finally starting to clear up.")
	end_duration = 20 SECONDS
	end_overlay = "rain_low"
	end_sound = 'sound/ambience/acidrain_end.ogg'

	area_type = /area/df_event
	protect_indoors = TRUE
	target_trait = ZTRAIT_SNOWSTORM

	probability = 100

	barometer_predictable = TRUE

/datum/weather/rain_storm/can_weather_act(mob/living/mob_to_check)
	. = ..()
	if(!. || !ishuman(mob_to_check))
		return

/datum/weather/rain_storm/weather_act(mob/living/victim)
	victim.wash(CLEAN_RAD | CLEAN_WASH) //Standing in the rain cleans you off :)
