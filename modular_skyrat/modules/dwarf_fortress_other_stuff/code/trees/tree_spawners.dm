/obj/effect/spawner/dwarf_fortress_tree
	name = "tree structure spawner"

	/// The type of structure we use as the "base" or bottom level trunk for the spawner
	var/obj/structure/tree_bits/trunk/base_trunk = /obj/structure/tree_bits/trunk/base
	/// What wood material we are using for the tree to be made
	var/datum/material/dwarf_certified/wood/tree_material

/obj/effect/spawner/dwarf_fortress_tree/Initialize(mapload)
	. = ..()

	var/turf/above_turf = get_step_multiz(get_turf(src), UP)
	if(istype(above_turf, /turf/open/openspace))
		var/obj/structure/tree_bits/trunk/tree_bottom = new base_trunk(get_turf(src))
		tree_bottom.set_custom_materials(list(GET_MATERIAL_REF(tree_material) = SHEET_MATERIAL_AMOUNT * 4))
		tree_bottom.set_logs(tree_material)
		make_tree_top(above_turf, tree_bottom)
	else
		make_tree_top(get_turf(src))
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/dwarf_fortress_tree/proc/make_tree_top(turf/turf_to_work_on, obj/structure/tree_bits/trunk/base/trunk_to_link_to)
	var/obj/structure/tree_bits/trunk/top/upper_trunk = new /obj/structure/tree_bits/trunk/top(turf_to_work_on)
	upper_trunk.set_custom_materials(list(GET_MATERIAL_REF(tree_material) = SHEET_MATERIAL_AMOUNT * 4))
	upper_trunk.set_logs(tree_material)

	if(trunk_to_link_to)
		trunk_to_link_to.linked_tree_top = upper_trunk

	var/list/turfs_to_leaf_up = circle_view_turfs(turf_to_work_on, pick(3,2.5,2,1.5)) // Just don't worry about that pick list bro just trust me

	for(var/turf/leaf_subject in turfs_to_leaf_up)
		if(leaf_subject.is_blocked_turf(TRUE))
			continue // Don't put leaves on blocked turfs
		for(var/obj/structure/tree_bits/leaves/found_leaves in leaf_subject.contents)
			continue // Don't put leaves on turfs that already have tree bits on them
		var/obj/structure/tree_bits/leaves/new_leaves = new /obj/structure/tree_bits/leaves(leaf_subject)
		new_leaves.set_up_colors_n_fruits(tree_material)
		upper_trunk.leaves += new_leaves

/// Spawner subtypes start here

// Tea

/obj/effect/spawner/dwarf_fortress_tree/tea
	tree_material = /datum/material/dwarf_certified/wood/tea

/obj/structure/flora/df_sapling/tea
	tree_spawner_type = /obj/effect/spawner/dwarf_fortress_tree/tea

// Apple

/obj/effect/spawner/dwarf_fortress_tree/apple
	tree_material = /datum/material/dwarf_certified/wood/apple

/obj/structure/flora/df_sapling/apple
	tree_spawner_type = /obj/effect/spawner/dwarf_fortress_tree/apple

// Generic (deez) nuts

/obj/effect/spawner/dwarf_fortress_tree/nut
	tree_material = /datum/material/dwarf_certified/wood/korta

/obj/structure/flora/df_sapling/nut
	tree_spawner_type = /obj/effect/spawner/dwarf_fortress_tree/nut

// Plum

/obj/effect/spawner/dwarf_fortress_tree/plum
	tree_material = /datum/material/dwarf_certified/wood/plum

/obj/structure/flora/df_sapling/plum
	tree_spawner_type = /obj/effect/spawner/dwarf_fortress_tree/plum
