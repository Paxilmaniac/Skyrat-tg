/area/deep_rock_caves
	name = "Surface"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	sound_environment = SOUND_AREA_ICEMOON
	ambient_buzz = null
	always_unpowered = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	requires_power = FALSE

/area/deep_rock_caves/surface_generator
	map_generator = /datum/map_generator/dwarf_fortress_surface_generator

/area/deep_rock_caves/caves
	name = "Underground"
	icon_state = "explored"
	ambience_index = AMBIENCE_MINING
	ambient_buzz = 'sound/ambience/magma.ogg'
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/deep_rock_caves/caves/actually_generates/mobless
	area_flags = UNIQUE_AREA

/area/deep_rock_caves/caves/terry
	name = "A Tunnel Too Far"
