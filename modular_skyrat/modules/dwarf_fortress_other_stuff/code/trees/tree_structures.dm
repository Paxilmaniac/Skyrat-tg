/obj/structure/tree_bits
	anchored = TRUE
	move_resist = INFINITY

/obj/structure/tree_bits/trunk
	name = "trunk"
	desc = "This ain't right, you shouldn't be seeing this."
	icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/trees/trunks.dmi'
	icon_state = "surfacetrunk_base"
	density = TRUE
	max_integrity = 200
	obj_flags = CAN_BE_HIT | BLOCK_Z_IN_DOWN | BLOCK_Z_IN_UP

	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_GREYSCALE | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS

	/// What type of logs this drops
	var/obj/item/stack/dropped_logs
	/// How many logs this drops
	var/number_of_logs = 4

/obj/structure/tree_bits/trunk/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	playsound(src, SFX_TREE_CHOP, 50, vary = TRUE)

/obj/structure/tree_bits/trunk/deconstruct(disassembled = FALSE)
	for(var/iterated_log in 1 to number_of_logs)
	new dropped_logs(drop_location())

	qdel(src)

/obj/structure/tree_bits/trunk/base
	desc = "Look its a tree trunk, its made of wood (at least you'd hope) and is likely the base of a larger tree. Try looking up every now and then?"

	/// The thinner log segment of the top of the tree, which should also be destroyed if this is
	var/obj/structure/tree_bits/trunk/top/linked_tree_top

/obj/structure/tree_bits/trunk/base/deconstruct(disassembled = FALSE)
	if(linked_tree_top)
		linked_tree_top.deconstruct(FALSE)

	. = ..()

/obj/structure/tree_bits/trunk/top
	desc = "Look its a tree trunk, its made of wood (at least you'd hope) and is likely the top of a larger tree. Have you tried looking down?"
	icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/trees/big_tree_bits.dmi'
	icon_state = "surfacetree_top"

	pixel_x = -16
	pixel_y = -16

	base_pixel_x = -16
	base_pixel_y = -16

	/// Keeps track of every leaf structure attached to this treetop
	var/list/leaves = list()

/obj/structure/tree_bits/trunk/top/deconstruct(disassembled = FALSE)
	for(var/obj/structure/tree_bits/leaves/iterated_leaves in leaves)
		iterated_leaves.deconstruct(FALSE)

	. = ..()

/obj/structure/tree_bits/leaves
	name = "leaves"
	desc = "The leaves of a tree, at least I'd hope they came from a tree."
	icon = 'modular_skyrat/modules/dwarf_fortress_other_stuff/icons/trees/leaves.dmi'
	icon_state = "leaves_0"
	base_icon_state = "leaves"
	density = FALSE
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN
	max_integrity = 50

	// Leaf color is handled by the spawner that makes the tree, not the leaves or materials of said leaves
	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_AFFECT_STATISTICS

	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_LATTICE
	canSmoothWith = SMOOTH_GROUP_LATTICE

	/// What type of item should these leaves spawn when broken
	var/fruit
	/// How many of the above mentioned item should spawn
	var/fruit_amount
	/// The rng chance that a particular leaf structure actually bears fruit when broken
	var/chance_bears_fruit = 50

/obj/structure/tree_bits/leaves/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	playsound(src, SFX_CRUNCHY_BUSH_WHACK, 50, vary = TRUE)

/obj/structure/tree_bits/leaves/deconstruct(disassembled = FALSE)
	if(prob(chance_bears_fruit))
		for(var/iterated_fruit in 1 to fruit_amount)
			new fruit(drop_location())

	qdel(src)

/// Sets the color of the leaves, the fruit, and the amount of fruit based off of a passed wood material datum
/obj/structure/tree_bits/leaves/proc/set_up_colors_n_fruits(datum/material/dwarf_certified/wood/tree_material)
	color = initial(tree_material.leaf_color)
	fruit = initial(tree_material.leaf_fruit)
	fruit_amount = initial(tree_material.number_of_leaf_fruits)
