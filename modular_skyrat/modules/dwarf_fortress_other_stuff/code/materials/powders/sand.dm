// GENERIC SAND

/datum/material/dwarf_certified/powder/sand
	name = "generic sand"
	desc = "Hey... you shouldn't see this!"

	color = "#ffffff"
	greyscale_colors = "#ffffff"

	sheet_type = /obj/item/stack/dwarf_certified/powder/sand

/obj/item/stack/dwarf_certified/powder/sand
	name = "generic sand pile"
	singular_name = "generic sand pile"

	desc = "Strange... Maybe you shouldn't be seeing this."

	merge_type = /obj/item/stack/dwarf_certified/powder/sand

	mats_per_unit = list(/datum/material/dwarf_certified/powder/sand = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/powder/sand

/obj/item/stack/dwarf_certified/powder/sand/Initialize(mapload)
	. = ..()

	AddComponent(/datum/component/bakeable, /obj/item/stack/dwarf_certified/glass/green, rand(30 SECONDS, 45 SECONDS), TRUE, TRUE)

/obj/item/stack/dwarf_certified/powder/sand/examine(mob/user)
	. = ..()

	. += span_notice("With some <b>potash</b> you could <b>craft</b> a mix to make clear glass.")

// Yellow snad

/datum/material/dwarf_certified/powder/sand/yellow
	name = "yellow sand"
	desc = "The sandiest sand there is, this one is in yellow flavor"

	color = "#e7c57c"
	greyscale_colors = "#e7c57c"

	sheet_type = /obj/item/stack/dwarf_certified/powder/sand/yellow

/obj/item/stack/dwarf_certified/powder/sand/yellow
	name = "yellow sand pile"
	singular_name = "yellow sand pile"

	desc = "A pile of sand. This one is yellow flavor."

	merge_type = /obj/item/stack/dwarf_certified/powder/sand/yellow

	mats_per_unit = list(/datum/material/dwarf_certified/powder/sand/yellow = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/powder/sand/yellow

// White sand

/datum/material/dwarf_certified/powder/sand/white
	name = "white sand"
	desc = "The sandiest sand there is, this one is in white flavor"

	color = "#ffffff"
	greyscale_colors = "#ffffff"

	sheet_type = /obj/item/stack/dwarf_certified/powder/sand/white

/obj/item/stack/dwarf_certified/powder/sand/white
	name = "white sand pile"
	singular_name = "white sand pile"

	desc = "A pile of sand. This one is white flavor."

	merge_type = /obj/item/stack/dwarf_certified/powder/sand/white

	mats_per_unit = list(/datum/material/dwarf_certified/powder/sand/white = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/powder/sand/white

// Black sand

/datum/material/dwarf_certified/powder/sand/black
	name = "black sand"
	desc = "The sandiest sand there is, this one is in black flavor"

	color = "#363636"
	greyscale_colors = "#363636"

	sheet_type = /obj/item/stack/dwarf_certified/powder/sand/black

/obj/item/stack/dwarf_certified/powder/sand/black
	name = "black sand pile"
	singular_name = "black sand pile"

	desc = "A pile of sand. This one is black flavor."

	merge_type = /obj/item/stack/dwarf_certified/powder/sand/black

	mats_per_unit = list(/datum/material/dwarf_certified/powder/sand/black = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/powder/sand/black
