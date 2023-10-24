/obj/effect/spawner/dwarf_fortress_wild_plant
	name = "random wild plant spawner"

	/// List of all seeds that can be spawned as plants
	var/list/seeds_we_can_spawn = list(
		/obj/item/seeds/corn,
		/obj/item/seeds/cotton,
		/obj/item/seeds/river_reeds,
		/obj/item/seeds/berry,
		/obj/item/seeds/berry/poison,
		/obj/item/seeds/wheat/oat,
		/obj/item/seeds/wheat/rice,
		/obj/item/seeds/chili,
		/obj/item/seeds/sugarcane,
		/obj/item/seeds/watermelon,
		/obj/item/seeds/pineapple,
		/obj/item/seeds/herbs,
		/obj/item/seeds/onion/red,
		/obj/item/seeds/whitebeet,
	)

/obj/effect/spawner/dwarf_fortress_wild_plant/Initialize(mapload)
	. = ..()

	var/obj/structure/simple_farm/spawns_grown/wild_crop = new(get_turf(src))
	var/seed_we_are_using = pick(seeds_we_can_spawn)
	wild_crop.planted_seed = new seed_we_are_using(wild_crop)
	wild_crop.update_appearance()
	// All of the wild plants should be one harvest only just to encourage farming
	wild_crop.deletes_on_harvest = TRUE
	return INITIALIZE_HINT_QDEL

/obj/structure/simple_farm/spawns_grown
	spawns_fully_grown = TRUE

/obj/effect/spawner/dwarf_fortress_wild_plant/water_loving
	name = "random wild water plant spawner"
	seeds_we_can_spawn = list(
		/obj/item/seeds/river_reeds,
		/obj/item/seeds/wheat/rice,
		/obj/item/seeds/sugarcane,
	)

/obj/effect/spawner/dwarf_fortress_wild_plant/forest
	name = "random wild forest plant spawner"
	seeds_we_can_spawn = list(
		/obj/item/seeds/corn,
		/obj/item/seeds/cotton,
		/obj/item/seeds/wheat/oat,
		/obj/item/seeds/chili,
		/obj/item/seeds/watermelon,
		/obj/item/seeds/pineapple,
	)

/obj/effect/spawner/dwarf_fortress_wild_plant/hill
	name = "random wild hill plant spawner"
	seeds_we_can_spawn = list(
		/obj/item/seeds/berry,
		/obj/item/seeds/berry/poison,
		/obj/item/seeds/herbs,
		/obj/item/seeds/onion/red,
		/obj/item/seeds/whitebeet,
	)
