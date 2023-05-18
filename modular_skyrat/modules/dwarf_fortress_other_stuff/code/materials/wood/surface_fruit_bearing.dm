// Tea trees

/datum/material/dwarf_certified/wood/tea
	name = "tea wood"
	desc = "Wood of a tea tree."

	color = "#71675e"
	greyscale_colors = "#71675e"

	leaf_fruits = list(
		/obj/item/food/grown/tea = 5,
		/obj/item/food/grown/tea/astra = 1,
	)

	sheet_type = /obj/item/stack/dwarf_certified/log/tea

/obj/item/stack/dwarf_certified/log/tea
	name = "tea logs"
	singular_name = "tea log"

	desc = "Wood from a tea tree. Some dwarves like tea trees for their leaves."

	merge_type = /obj/item/stack/dwarf_certified/log/tea

	mats_per_unit = list(/datum/material/dwarf_certified/wood/tea = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/tea

	cut_type = /obj/item/stack/dwarf_certified/plank/tea

/datum/material/dwarf_certified/wood/tea/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank

/obj/item/stack/dwarf_certified/plank/tea
	name = "tea wood planks"
	singular_name = "tea wood plank"

	desc = "Planks cut from the wood of a tea tree."

	merge_type = /obj/item/stack/dwarf_certified/plank/tea

	mats_per_unit = list(/datum/material/dwarf_certified/wood/tea/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/tea/plank
