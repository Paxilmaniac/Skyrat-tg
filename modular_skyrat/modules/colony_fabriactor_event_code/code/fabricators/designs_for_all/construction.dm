// Look, I had to make its name start with A so it'd be top of the list, fight me

#define FABRICATOR_SUBCATEGORY_STRUCTURES "/Autofab Structures"

// Techweb node that shouldnt show up anywhere ever specifically for the fabricator to work with

/datum/techweb_node/colony_fabricator_structures_two
	id = "colony_fabricator_structures_two"
	display_name = "Colony Fabricator Secondary Structure Designs"
	description = "Contains all of the colony fabricator's structure designs."
	design_ids = list(
		"prefab_manual_airlock_kit",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000000000000000) // God save you
	hidden = TRUE
	show_on_wiki = FALSE
	starting_node = TRUE

// Manul Airlock kit

/datum/design/prefab_manual_airlock_kit
	name = "Prefab Manual Airlock"
	id = "prefab_manual_airlock_kit"
	build_type = COLONY_FABRICATOR | COLONY_ENGI_FAB
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
	)
	build_path = /obj/item/flatpacked_machine/airlock_kit_manual
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + FABRICATOR_SUBCATEGORY_STRUCTURES,
	)
	construction_time = 30 SECONDS

/datum/design/weather_radio
	name = "Mining Weather Radio"
	desc = "A weather radio designed for use in inhospitable environments. Gives audible warnings when storms approach. Has access to cargo channel."
	id = "miniature_fire_axe"
	build_type = COLONY_ENGI_FAB
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT * 2,
	)
	construction_time = 30 SECONDS
	build_path = /obj/item/radio/weather_monitor
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING
	)

#undef FABRICATOR_SUBCATEGORY_STRUCTURES

/datum/design/light_switch_frame/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB

/datum/design/polarizer/New()
	. = ..()
	build_type |= COLONY_FABRICATOR
	build_type |= COLONY_ENGI_FAB
