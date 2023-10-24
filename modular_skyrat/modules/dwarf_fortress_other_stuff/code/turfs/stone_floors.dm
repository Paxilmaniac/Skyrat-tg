// Stone floors

/turf/open/misc/dirt/dwarf_fortress/stone
	name = "floor"
	desc = "Stone cold, rock hard, you could not possibly guess what this is."
	icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/smooth_turfs/greyscale_stone.dmi'
	color = null
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_ICE
	canSmoothWith = SMOOTH_GROUP_FLOOR_GRASS + SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_FLOOR_ASH + SMOOTH_GROUP_FLOOR_ASH_ROCKY + SMOOTH_GROUP_FLOOR_ICE
	layer = HIGH_TURF_LAYER + 0.006
	material_flags = MATERIAL_EFFECTS | MATERIAL_COLOR | MATERIAL_ADD_PREFIX
	custom_materials = list(/datum/material/dwarf_certified/rock/siltstone = SHEET_MATERIAL_AMOUNT)

/turf/open/misc/dirt/dwarf_fortress/stone/make_diggable()
	AddElement(/datum/element/diggable, /obj/item/stack/dwarf_certified/rock/siltstone, 1, 0)
