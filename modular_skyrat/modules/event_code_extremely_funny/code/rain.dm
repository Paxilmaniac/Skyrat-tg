/datum/weather/rain_storm
	name = "rain storm"
	desc = "A storm brews over the area, providing a shower of rain for any unfortunate enough to not be indoors."

	telegraph_message = span_notice("Dark clouds form in the air above, drops of rain falling from above!")
	telegraph_duration = 1 MINUTES
	telegraph_overlay = "rain_low"

	weather_message = span_boldnotice("The rain suddenly picks up in intensity, soaking everything under the sky!")
	weather_duration_lower = 5 MINUTES
	weather_duration_upper = 10 MINUTES
	weather_overlay = "rain_high"

	end_message = span_notice("The rain seems to be slowing down, the clouds above finally starting to clear up.")
	end_duration = 30 SECONDS
	end_overlay = "rain_low"

	area_type = /area
	protect_indoors = TRUE
	target_trait = ZTRAIT_ASHSTORM

	probability = 100

	barometer_predictable = TRUE
	var/list/weak_sounds = list()
	var/list/strong_sounds = list()

/datum/weather/rain_storm/telegraph()
	var/list/eligible_areas = list()
	for (var/z in impacted_z_levels)
		eligible_areas += SSmapping.areas_in_z["[z]"]
	for(var/i in 1 to eligible_areas.len)
		var/area/place = eligible_areas[i]
		if(place.outdoors)
			weak_sounds[place] = /datum/looping_sound/weak_outside_rain
			strong_sounds[place] = /datum/looping_sound/active_outside_rain
		else
			weak_sounds[place] = /datum/looping_sound/weak_inside_rain
			strong_sounds[place] = /datum/looping_sound/active_inside_rain
		CHECK_TICK

	//We modify this list instead of setting it to weak/stron sounds in order to preserve things that hold a reference to it
	//It's essentially a playlist for a bunch of components that chose what sound to loop based on the area a player is in
	GLOB.ash_storm_sounds += weak_sounds
	return ..()

/datum/weather/rain_storm/start()
	GLOB.ash_storm_sounds -= weak_sounds
	GLOB.ash_storm_sounds += strong_sounds
	return ..()

/datum/weather/rain_storm/wind_down()
	GLOB.ash_storm_sounds -= strong_sounds
	GLOB.ash_storm_sounds += weak_sounds
	return ..()

/datum/weather/rain_storm/end()
	GLOB.ash_storm_sounds -= weak_sounds
	return ..()

/datum/weather/rain_storm/can_weather_act(mob/living/mob_to_check)
	. = ..()
	if(!. || !ishuman(mob_to_check))
		return

/datum/weather/rain_storm/weather_act(mob/living/victim)
	victim.wash(CLEAN_RAD | CLEAN_WASH) //Standing in the rain cleans you off :)

// Looping sounds

/datum/looping_sound/active_outside_rain
	mid_sounds = list(
		'sound/ambience/acidrain_mid.ogg'=1,
		'sound/ambience/acidrain_mid.ogg'=1,
		'sound/ambience/acidrain_mid.ogg'=1
		)
	mid_length = 80
	start_sound = 'sound/ambience/acidrain_start.ogg'
	start_length = 130
	end_sound = 'sound/ambience/acidrain_end.ogg'
	volume = 80

/datum/looping_sound/active_inside_rain
	mid_sounds = list(
		'sound/ambience/acidrain_mid.ogg'=1,
		'sound/ambience/acidrain_mid.ogg'=1,
		'sound/ambience/acidrain_mid.ogg'=1
		)
	mid_length = 80
	start_sound = 'sound/ambience/acidrain_start.ogg'
	start_length = 130
	end_sound = 'sound/ambience/acidrain_end.ogg'
	volume = 60

/datum/looping_sound/weak_outside_rain
	mid_sounds = list(
		'sound/ambience/acidrain_mid.ogg'=1,
		'sound/ambience/acidrain_mid.ogg'=1,
		'sound/ambience/acidrain_mid.ogg'=1
		)
	mid_length = 80
	start_sound = 'sound/ambience/acidrain_start.ogg'
	start_length = 130
	end_sound = 'sound/ambience/acidrain_end.ogg'
	volume = 50

/datum/looping_sound/weak_inside_rain
	mid_sounds = list(
		'sound/ambience/acidrain_mid.ogg'=1,
		'sound/ambience/acidrain_mid.ogg'=1,
		'sound/ambience/acidrain_mid.ogg'=1
		)
	mid_length = 80
	start_sound = 'sound/ambience/acidrain_start.ogg'
	start_length = 130
	end_sound = 'sound/ambience/acidrain_end.ogg'
	volume = 30
