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

/datum/material/dwarf_certified/wood/apple
	name = "apple wood"
	desc = "Wood of an apple tree."

	color = "#7d5c3c"
	greyscale_colors = "#7d5c3c"

	leaf_color = "#b8d36d"

	leaf_fruit = /obj/effect/spawner/random/food_or_drink/apple_tree_leaves

	sheet_type = /obj/item/stack/dwarf_certified/log/apple

/obj/effect/spawner/random/food_or_drink/apple_tree_leaves
	name = "apple spawner"
	loot = list(
		/obj/item/food/grown/apple = 1,
	)
	spawn_loot_chance = 75

/obj/item/stack/dwarf_certified/log/apple
	name = "apple logs"
	singular_name = "apple log"

	desc = "Wood from an apple tree. Some dwarves like apple trees for their fruit."

	merge_type = /obj/item/stack/dwarf_certified/log/apple

	mats_per_unit = list(/datum/material/dwarf_certified/wood/apple = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/apple

	cut_type = /obj/item/stack/dwarf_certified/plank/apple

/datum/material/dwarf_certified/wood/apple/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank/apple

/obj/item/stack/dwarf_certified/plank/apple
	name = "apple wood planks"
	singular_name = "apple wood plank"

	desc = "Planks cut from the wood of an apple tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/apple

	mats_per_unit = list(/datum/material/dwarf_certified/wood/apple/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/apple/plank

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
