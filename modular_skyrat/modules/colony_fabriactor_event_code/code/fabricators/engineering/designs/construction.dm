/datum/design/turbine_part_compressor_super
	name = "Turbine Compressor"
	desc = "A completely upgraded turbine compressor."
	id = "turbine_part_compressor_super"
	build_type = COLONY_ENGI_FAB
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5)
	construction_time = 30 SECONDS
	build_path = /obj/item/turbine_parts/compressor/fullupgrade
	category = list(
		RND_CATEGORY_STOCK_PARTS + RND_SUBCATEGORY_STOCK_PARTS_TURBINE
	)

/datum/design/turbine_part_rotor_super
	name = "Turbine Rotor"
	desc = "A completely upgraded turbine rotor."
	id = "turbine_part_rotor_super"
	build_type = COLONY_ENGI_FAB
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5)
	construction_time = 30 SECONDS
	build_path = /obj/item/turbine_parts/rotor/fullupgrade
	category = list(
		RND_CATEGORY_STOCK_PARTS + RND_SUBCATEGORY_STOCK_PARTS_TURBINE
	)

/datum/design/turbine_part_stator_super
	name = "Turbine Stator"
	desc = "A completely upgraded turbine stator."
	id = "turbine_part_stator_super"
	build_type = COLONY_ENGI_FAB
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5)
	construction_time = 30 SECONDS
	build_path = /obj/item/turbine_parts/stator/fullupgrade
	category = list(
		RND_CATEGORY_STOCK_PARTS + RND_SUBCATEGORY_STOCK_PARTS_TURBINE
	)

/datum/design/ignition_control/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/sparker/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/newscaster_frame/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/status_display_frame/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/requests_console/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/board/turbine_computer/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/board/turbine_compressor/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/board/turbine_rotor/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/board/turbine_stator/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB
