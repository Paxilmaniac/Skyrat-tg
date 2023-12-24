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

/datum/design/miniature_fire_axe
	name = "Emergency Disembarkation Axe"
	desc = "A lightweight crowbar with an axe head attached to the other end. \
		Small enough to fit in a backpack, and able to smash windows in case of emergency. \
		Clearly not a fire axe, because what maniac would fight a fire with an axe?"
	id = "miniature_fire_axe"
	build_type = COLONY_ENGI_FAB
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/titanium = HALF_SHEET_MATERIAL_AMOUNT * 3,
	)
	construction_time = 30 SECONDS
	build_path = /obj/item/fireaxe/metal_h2_axe/colony_event
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED
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

// Mech stuff, yippie!

/datum/design/board/ripley_main/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/board/ripley_peri/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/ripley_chassis/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/ripley_torso/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/ripley_left_arm/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/ripley_right_arm/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/ripley_left_leg/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/ripley_right_leg/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/ripleyupgrade/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_drill/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_diamond_drill/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_plasma_cutter/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mecha_kineticgun/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_hydraulic_clamp/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_mining_scanner/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_extinguisher/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_generator/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_radio/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mech_air_tank/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mecha_tracking/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mecha_tracking_ai_control/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB

/datum/design/mecha_camera/New()
	. = ..()
	build_type |= COLONY_ENGI_FAB
