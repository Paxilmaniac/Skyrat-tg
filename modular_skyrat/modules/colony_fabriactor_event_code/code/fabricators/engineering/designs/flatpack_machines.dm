// Machine categories

#define FABRICATOR_CATEGORY_FLATPACK_MACHINES "/Flatpacked Machines"
#define FABRICATOR_SUBCATEGORY_MANUFACTURING "/Manufacturing"
#define FABRICATOR_SUBCATEGORY_POWER "/Power"
#define FABRICATOR_SUBCATEGORY_MATERIALS "/Materials"
#define FABRICATOR_SUBCATEGORY_ATMOS "/Atmospherics"

// Techweb node that shouldnt show up anywhere ever specifically for the fabricator to work with

/datum/techweb_node/colony_fabricator_flatpacks_engi
	id = "colony_fabricator_flatpacks_engi"
	display_name = "Colony Fabricator Engineering Flatpack Designs"
	description = "Contains all of the colony fabricator's flatpack machine designs."
	design_ids = list(
		"flatpack_engineering_fab",
		"flatpack_ore_thumper",
		"turbine_part_compressor_super",
		"turbine_part_rotor_super",
		"turbine_part_stator_super",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000000000000000) // God save you
	hidden = TRUE
	show_on_wiki = FALSE
	starting_node = TRUE

// Engineering fabricators, gives new designs for engineering stuff specifically

/datum/design/flatpack_engineering_fabricator
	name = "Flat-packed Engineering Fabricator"
	desc = "A deployable fabricator capable of producing other flat-packed machines and other special equipment tailored for \
		rapidly constructing functional structures given resources and power. While it cannot be upgraded, it can be repacked \
		and moved to any location you see fit. This one makes specialized engineering designs and tools."
	id = "flatpack_engineering_fab"
	build_type = COLONY_FABRICATOR | COLONY_ENGI_FAB
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 7.5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/engineering_lathe
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MANUFACTURING,
	)
	construction_time = 2 MINUTES

// Engineering fabricators, gives new designs for engineering stuff specifically

/datum/design/flatpack_ore_thumper
	name = "Flat-packed Ore Thumper"
	desc = "A frame with a heavy block of metal suspended atop a pipe. \
		Must be deployed outdoors and given a wired power connection. \
		Forces pressurized gas into the ground which brings up buried resources."
	id = "flatpack_ore_thumper"
	build_type = COLONY_ENGI_FAB
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/ore_thumper
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MATERIALS,
	)
	construction_time = 1 MINUTES

#undef FABRICATOR_CATEGORY_FLATPACK_MACHINES
#undef FABRICATOR_SUBCATEGORY_MANUFACTURING
#undef FABRICATOR_SUBCATEGORY_POWER
#undef FABRICATOR_SUBCATEGORY_MATERIALS
#undef FABRICATOR_SUBCATEGORY_ATMOS
