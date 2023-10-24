/datum/biome/dwarf_fortress/surface_forest
	weighted_open_turf_types = list(
		/turf/open/misc/grass/dwarf_fortress = 5,
		/turf/open/misc/dirt/dwarf_fortress = 1,
	)
	weighted_closed_turf_types = null

	weighted_flora_spawn_list = list(
		/obj/effect/spawner/dwarf_fortress_wild_plant/forest = 2,
		/obj/effect/spawner/dwarf_fortress_wild_tree/sapling = 1,
	)
	weighted_feature_spawn_list = list(
		/obj/effect/spawner/dwarf_fortress_wild_tree = 1,
	)

	mob_spawn_chance = 0
	flora_spawn_chance = 15
	feature_spawn_chance = 12.5

/datum/biome/dwarf_fortress/surface_forest/hillside
	weighted_flora_spawn_list = list(
		/obj/effect/spawner/dwarf_fortress_wild_plant/hill = 3,
		/obj/effect/spawner/dwarf_fortress_wild_tree/sapling = 1,
	)
	weighted_feature_spawn_list = list(
		/obj/effect/spawner/dwarf_fortress_wild_tree = 1,
	)

	mob_spawn_chance = 0
	flora_spawn_chance = 17.5
	feature_spawn_chance = 17.5

/datum/biome/dwarf_fortress/surface_forest/hillside/top
	weighted_open_turf_types = list(
		/turf/open/misc/dirt/dwarf_fortress = 5,
		/turf/open/misc/dirt/dwarf_fortress/stone = 1,
	)

	weighted_flora_spawn_list = list(
		/obj/effect/spawner/dwarf_fortress_wild_plant/hill = 1,
	)
	weighted_feature_spawn_list = list(
		/obj/effect/spawner/dwarf_fortress_wild_tree = 1,
	)

	mob_spawn_chance = 0
	flora_spawn_chance = 17.5
	feature_spawn_chance = 3
