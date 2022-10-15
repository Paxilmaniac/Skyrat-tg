/area/df_event
	name = "Surface"

	area_flags = UNIQUE_AREA | NOTELEPORT

	outdoors = FALSE
	mood_bonus = -1
	mood_message = "The surface is dark, cold, and rainy, going underground should solve at least one of those."

	base_lighting_alpha = 150
	base_lighting_color = "#8da2b6"

	requires_power = FALSE
	has_gravity = TRUE

	ambience_index = null
	ambient_buzz = null

	flags_1 = NONE

	///What luminosity will the area get
	var/ambient_light_level = 2

/area/df_event/Initialize(mapload)
	. = ..()
	luminosity = ambient_light_level

/area/df_event/underground
	name = "Underground"

	mood_bonus = 2
	mood_message = "Nothing quite beats the safety of the underground!"

	base_lighting_alpha = 50
	base_lighting_color = "#364450"

	ambient_light_level = 1
