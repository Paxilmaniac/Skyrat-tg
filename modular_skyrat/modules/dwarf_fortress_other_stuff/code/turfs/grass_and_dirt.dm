// Surface grass, carpetgrass

/turf/open/misc/grass/dwarf_fortress
	name = "dense carpetgrass"
	desc = "A dense patch of grass."
	icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/smooth_turfs/greyscale_grass.dmi'
	icon_state = "grass-255"
	baseturfs = /turf/baseturf_bottom
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_GRASS
	canSmoothWith = SMOOTH_GROUP_FLOOR_GRASS + SMOOTH_GROUP_CLOSED_TURFS
	layer = HIGH_TURF_LAYER + 0.009
	damaged_dmi = null
	smooth_icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/smooth_turfs/greyscale_grass.dmi'
	color = "#728342"
	tiled_dirt = FALSE
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE

/turf/open/misc/grass/dwarf_fortress/Initialize(mapload)
	. = ..()
	// Yum, flavor
	name = pick("dense carpetgrass","dense dropseed grass","dense dallisgrass","dense dog's tooth grass")
	AddElement(/datum/element/diggable, null, 0, 10)
	AddComponent(/datum/component/simple_farm)

// Dirts

/turf/open/misc/dirt/dwarf_fortress
	gender = PLURAL
	name = "loam"
	desc = "The plainest soil there can be, loam, and also happens to be the basis of all life on earth. At least for the plants."
	icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/smooth_turfs/greyscale_soil.dmi'
	icon_state = "grass-255"
	base_icon_state = "grass"
	baseturfs = /turf/baseturf_bottom
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	color = "#423e3a"
	bullet_bounce_sound = null
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_ASH
	canSmoothWith = SMOOTH_GROUP_FLOOR_GRASS + SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_FLOOR_ASH
	layer = HIGH_TURF_LAYER + 0.008

/turf/open/misc/dirt/dwarf_fortress/Initialize(mapload)
	. = ..()
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(-9, -9)
		transform = translation
	make_diggable()
	make_farmable()

/// Adds the diggable element, and lets us tweak it for different turfs
/turf/open/misc/dirt/dwarf_fortress/proc/make_diggable()
	AddElement(/datum/element/diggable, null, 0, 0)

/// Adds the simple farming component
/turf/open/misc/dirt/dwarf_fortress/proc/make_farmable()
	AddComponent(/datum/component/simple_farm)

/turf/open/misc/dirt/dwarf_fortress/sandy_loam
	name = "sandy loam"
	desc = "Just who is Sandy Loam? What is the king and the homeland hiding from us?"
	color = "#817d70"

/turf/open/misc/dirt/dwarf_fortress/sand
	name = "sand"
	desc = "Sand, its coarse and it gets everywhere, but it makes for some nice glass material if you're into that kinda thing."
	icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/smooth_turfs/greyscale_sand.dmi'
	color = null
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_ASH_ROCKY
	canSmoothWith = SMOOTH_GROUP_FLOOR_GRASS + SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_FLOOR_ASH + SMOOTH_GROUP_FLOOR_ASH_ROCKY
	layer = HIGH_TURF_LAYER + 0.007
	material_flags = MATERIAL_EFFECTS | MATERIAL_COLOR | MATERIAL_ADD_PREFIX
	/// The type of material that this spawns with
	var/datum/material/turf_material = /obj/item/stack/dwarf_certified/powder/sand/yellow

/turf/open/misc/dirt/dwarf_fortress/sand/Initialize(mapload)
	. = ..()
	set_custom_materials(list(GET_MATERIAL_REF(turf_material) = SHEET_MATERIAL_AMOUNT))

/turf/open/misc/dirt/dwarf_fortress/sand/make_diggable()
	AddElement(/datum/element/diggable, /obj/item/stack/dwarf_certified/powder/sand/yellow, 1, 0)

/turf/open/misc/dirt/dwarf_fortress/sand/white
	turf_material = /datum/material/dwarf_certified/powder/sand/white

/turf/open/misc/dirt/dwarf_fortress/sand/white/make_diggable()
	AddElement(/datum/element/diggable, /obj/item/stack/dwarf_certified/powder/sand/white, 1, 0)

/turf/open/misc/dirt/dwarf_fortress/sand/black
	turf_material = /datum/material/dwarf_certified/powder/sand/black

/turf/open/misc/dirt/dwarf_fortress/sand/black/make_diggable()
	AddElement(/datum/element/diggable, /obj/item/stack/dwarf_certified/powder/sand/black, 1, 0)
