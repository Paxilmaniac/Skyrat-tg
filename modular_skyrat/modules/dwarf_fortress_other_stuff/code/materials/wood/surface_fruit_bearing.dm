// Oh how I wish so that new items would just fucking fall from a zlevel above like before

/obj/effect/spawner/random/food_or_drink/make_item(spawn_loc, type_path_to_make)
	var/obj/thing_we_made = new type_path_to_make(spawn_loc)
	thing_we_made.throw_at(spawn_loc)
	return thing_we_made

// Tea trees

/datum/material/dwarf_certified/wood/tea
	name = "tea wood"
	desc = "Wood of a tea tree."

	color = "#71675e"
	greyscale_colors = "#71675e"

	leaf_color = "#8a9b6a"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/tea_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/tea

/obj/effect/spawner/random/food_or_drink/tea_tree_leaves
	name = "tea leaf spawner"
	loot = list(
		/obj/item/food/grown/tea = 5,
		/obj/item/food/grown/tea/astra = 1,
	)
	spawn_loot_chance = 90

/obj/item/stack/dwarf_certified/log/tea
	name = "tea logs"
	singular_name = "tea log"

	desc = "Wood from a tea tree. Some dwarves like tea trees for their leaves."

	merge_type = /obj/item/stack/dwarf_certified/log/tea

	mats_per_unit = list(/datum/material/dwarf_certified/wood/tea = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/tea

	cut_type = /obj/item/stack/dwarf_certified/plank/tea

/datum/material/dwarf_certified/wood/tea/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/tea

/obj/item/stack/dwarf_certified/plank/tea
	name = "tea wood planks"
	singular_name = "tea wood plank"

	desc = "Planks cut from the wood of a tea tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/tea

	mats_per_unit = list(/datum/material/dwarf_certified/wood/tea/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/tea/plank

// Apple trees

/datum/material/dwarf_certified/wood/tree_berry
	name = "tree berry wood"
	desc = "Wood of a tree berry... tree."

	color = "#7d5c3c"
	greyscale_colors = "#7d5c3c"

	leaf_color = "#b8d36d"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/tree_berry_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/tree_berry

/obj/effect/spawner/random/food_or_drink/tree_berry_tree_leaves
	name = "tree berry spawner"
	loot = list(
		/obj/item/food/grown/toechtauese = 1,
	)
	spawn_loot_chance = 75

/obj/item/stack/dwarf_certified/log/tree_berry
	name = "tree berry logs"
	singular_name = "tree berry log"

	desc = "Wood from an tree berry tree. Some dwarves like tree berry trees for their fruit."

	merge_type = /obj/item/stack/dwarf_certified/log/tree_berry

	mats_per_unit = list(/datum/material/dwarf_certified/wood/tree_berry = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/tree_berry

	cut_type = /obj/item/stack/dwarf_certified/plank/tree_berry

/datum/material/dwarf_certified/wood/tree_berry/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/tree_berry

/obj/item/stack/dwarf_certified/plank/tree_berry
	name = "tree berry wood planks"
	singular_name = "tree berry wood plank"

	desc = "Planks cut from the wood of an tree berry tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/tree_berry

	mats_per_unit = list(/datum/material/dwarf_certified/wood/tree_berry/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/tree_berry/plank

// korta trees

/datum/material/dwarf_certified/wood/korta
	name = "korta wood"
	desc = "Wood of a korta tree."

	color = "#ad8479"
	greyscale_colors = "#ad8479"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/korta_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/korta

/obj/effect/spawner/random/food_or_drink/korta_tree_leaves
	name = "korta spawner"
	loot = list(
		/obj/item/food/grown/korta_nut = 3,
		/obj/item/food/grown/korta_nut/sweet = 1,
	)
	spawn_loot_chance = 75

/obj/item/stack/dwarf_certified/log/korta
	name = "korta logs"
	singular_name = "korta log"

	desc = "Wood from a korta tree. Some dwarves like korta trees for their fruit."

	merge_type = /obj/item/stack/dwarf_certified/log/korta

	mats_per_unit = list(/datum/material/dwarf_certified/wood/korta = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/korta

	cut_type = /obj/item/stack/dwarf_certified/plank/korta

/datum/material/dwarf_certified/wood/korta/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/korta

/obj/item/stack/dwarf_certified/plank/korta
	name = "korta wood planks"
	singular_name = "korta wood plank"

	desc = "Planks cut from the wood of a korta tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/korta

	mats_per_unit = list(/datum/material/dwarf_certified/wood/korta/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/korta/plank

// plum trees

/datum/material/dwarf_certified/wood/plum
	name = "plum wood"
	desc = "Wood of a plum tree."

	color = "#baab9e"
	greyscale_colors = "#baab9e"

	leaf_color = "#4d2744"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/plum_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/plum

/obj/effect/spawner/random/food_or_drink/plum_tree_leaves
	name = "plum spawner"
	loot = list(
		/obj/item/food/grown/plum = 1,
	)
	spawn_loot_chance = 75

/obj/item/stack/dwarf_certified/log/plum
	name = "plum logs"
	singular_name = "plum log"

	desc = "Wood from a plum tree. Some dwarves like plum trees for their fruit."

	merge_type = /obj/item/stack/dwarf_certified/log/plum

	mats_per_unit = list(/datum/material/dwarf_certified/wood/plum = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/plum

	cut_type = /obj/item/stack/dwarf_certified/plank/plum

/datum/material/dwarf_certified/wood/plum/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/plum

/obj/item/stack/dwarf_certified/plank/plum
	name = "plum wood planks"
	singular_name = "plum wood plank"

	desc = "Planks cut from the wood of a plum tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/plum

	mats_per_unit = list(/datum/material/dwarf_certified/wood/plum/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/plum/plank

// cacao trees

/datum/material/dwarf_certified/wood/cacao
	name = "cacao wood"
	desc = "Wood of a cacao tree."

	color = "#83613d"
	greyscale_colors = "#83613d"

	leaf_color = "#6bd178"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/cacao_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/cacao

/obj/effect/spawner/random/food_or_drink/cacao_tree_leaves
	name = "cacao spawner"
	loot = list(
		/obj/item/food/grown/cocoapod = 1,
	)
	spawn_loot_chance = 75

/obj/item/stack/dwarf_certified/log/cacao
	name = "cacao logs"
	singular_name = "cacao log"

	desc = "Wood from a cacao tree. Some dwarves like cacao trees for their fruit."

	merge_type = /obj/item/stack/dwarf_certified/log/cacao

	mats_per_unit = list(/datum/material/dwarf_certified/wood/cacao = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/cacao

	cut_type = /obj/item/stack/dwarf_certified/plank/cacao

/datum/material/dwarf_certified/wood/cacao/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/cacao

/obj/item/stack/dwarf_certified/plank/cacao
	name = "cacao wood planks"
	singular_name = "cacao wood plank"

	desc = "Planks cut from the wood of a cacao tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/cacao

	mats_per_unit = list(/datum/material/dwarf_certified/wood/cacao/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/cacao/plank

// lime trees

/datum/material/dwarf_certified/wood/lime
	name = "lime wood"
	desc = "Wood of a lime tree."

	color = "#baab9e"
	greyscale_colors = "#baab9e"

	leaf_color = "#4cc752"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/lime_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/lime

/obj/effect/spawner/random/food_or_drink/lime_tree_leaves
	name = "lime spawner"
	loot = list(
		/obj/item/food/grown/citrus/lime = 1,
	)
	spawn_loot_chance = 75

/obj/item/stack/dwarf_certified/log/lime
	name = "lime logs"
	singular_name = "lime log"

	desc = "Wood from a lime tree. Some dwarves like lime trees for their fruit."

	merge_type = /obj/item/stack/dwarf_certified/log/lime

	mats_per_unit = list(/datum/material/dwarf_certified/wood/lime = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/lime

	cut_type = /obj/item/stack/dwarf_certified/plank/lime

/datum/material/dwarf_certified/wood/lime/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/lime

/obj/item/stack/dwarf_certified/plank/lime
	name = "lime wood planks"
	singular_name = "lime wood plank"

	desc = "Planks cut from the wood of a lime tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/lime

	mats_per_unit = list(/datum/material/dwarf_certified/wood/lime/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/lime/plank

// orange trees

/datum/material/dwarf_certified/wood/orange
	name = "orange wood"
	desc = "Wood of a orange tree."

	color = "#837a73"
	greyscale_colors = "#837a73"

	leaf_color = "#6ba36e"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/orange_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/orange

/obj/effect/spawner/random/food_or_drink/orange_tree_leaves
	name = "orange spawner"
	loot = list(
		/obj/item/food/grown/citrus/orange = 1,
	)
	spawn_loot_chance = 75

/obj/item/stack/dwarf_certified/log/orange
	name = "orange logs"
	singular_name = "orange log"

	desc = "Wood from a orange tree. Some dwarves like orange trees for their fruit."

	merge_type = /obj/item/stack/dwarf_certified/log/orange

	mats_per_unit = list(/datum/material/dwarf_certified/wood/orange = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/orange

	cut_type = /obj/item/stack/dwarf_certified/plank/orange

/datum/material/dwarf_certified/wood/orange/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/orange

/obj/item/stack/dwarf_certified/plank/orange
	name = "orange wood planks"
	singular_name = "orange wood plank"

	desc = "Planks cut from the wood of a orange tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/orange

	mats_per_unit = list(/datum/material/dwarf_certified/wood/orange/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/orange/plank

// bungo trees

/datum/material/dwarf_certified/wood/bungo
	name = "bungo wood"
	desc = "Wood of a bungo tree."

	color = "#dddbda"
	greyscale_colors = "#dddbda"

	leaf_color = "#415542"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/bungo_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/bungo

/obj/effect/spawner/random/food_or_drink/bungo_tree_leaves
	name = "bungo spawner"
	loot = list(
		/obj/item/food/grown/bungofruit = 5,
		/obj/item/food/grown/bungopit = 1,
	)
	spawn_loot_chance = 50

/obj/item/stack/dwarf_certified/log/bungo
	name = "bungo logs"
	singular_name = "bungo log"

	desc = "Wood from a bungo tree. Some dwarves like bungo trees for their fruit."

	merge_type = /obj/item/stack/dwarf_certified/log/bungo

	mats_per_unit = list(/datum/material/dwarf_certified/wood/bungo = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/bungo

	cut_type = /obj/item/stack/dwarf_certified/plank/bungo

/datum/material/dwarf_certified/wood/bungo/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/bungo

/obj/item/stack/dwarf_certified/plank/bungo
	name = "bungo wood planks"
	singular_name = "bungo wood plank"

	desc = "Planks cut from the wood of a bungo tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/bungo

	mats_per_unit = list(/datum/material/dwarf_certified/wood/bungo/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/bungo/plank
