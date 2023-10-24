#define BIOME_SALT_POND ( /datum/biome/dwarf_fortress/water_pond )
#define BIOME_POND_SAND_SURROUNDINGS ( /datum/biome/dwarf_fortress/water_pond_surroundings )
#define BIOME_FOREST ( /datum/biome/dwarf_fortress/surface_forest )
#define BIOME_HILL_SURROUNDINGS ( /datum/biome/dwarf_fortress/surface_forest/hillside )
#define BIOME_HILL ( /datum/biome/dwarf_fortress/surface_forest/hillside/top )

/datum/map_generator/dwarf_fortress_surface_generator
	var/name = "Dwarf Fortress Surface Generator"

	/// Used to select "zoom" level into the perlin noise, higher numbers result in slower transitions
	var/perlin_zoom = 50

/datum/map_generator/dwarf_fortress_surface_generator/generate_terrain(list/turfs, area/generate_in)
	. = ..()

	var/mobs_allowed = (generate_in.area_flags & MOB_SPAWN_ALLOWED)

	var/biome_seed = rand(0, 50000)

	var/start_time = REALTIMEOFDAY

	var/closed = FALSE

	for(var/iterated_turf in turfs) //Go through all the turfs and generate them

		var/turf/gen_turf = iterated_turf

		var/perlin_x = gen_turf.x / perlin_zoom
		var/perlin_y = gen_turf.y / perlin_zoom

		var/biome_type = text2num(rustg_noise_get_at_coordinates("[biome_seed]", "[perlin_x]", "[perlin_y]"))

		var/datum/biome/selected_biome

		switch(biome_type)
			if(0 to 0.05)
				selected_biome = BIOME_SALT_POND
			if(0.05 to 0.08)
				selected_biome = BIOME_POND_SAND_SURROUNDINGS
			if(0.08 to 0.7)
				selected_biome = BIOME_FOREST
			if(0.7 to 0.75)
				selected_biome = BIOME_HILL_SURROUNDINGS
			if(0.75 to 1)
				selected_biome = BIOME_HILL

		selected_biome = SSmapping.biomes[selected_biome] //Get the instance of this biome from SSmapping
		selected_biome.generate_turf(gen_turf, closed, generate_in, mobs_allowed)

		CHECK_TICK

	var/message = "[name] finished in [(REALTIMEOFDAY - start_time)/10]s!"

	add_startup_message(message)
	log_world(message)
