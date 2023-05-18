GLOBAL_LIST_INIT(dwarf_log_recipes, list(
	new /datum/stack_recipe( \
	"rough rock wall", \
	/turf/closed/wall/material/dwarf_fortress/smooth, \
	1, \
	time = 3 SECONDS, \
	one_per_turf = TRUE, \
	on_solid_ground = TRUE, \
	applies_mats = TRUE, \
	category = CAT_STRUCTURE \
	), \
))

GLOBAL_LIST_INIT(dwarf_plank_recipes, list(
	new /datum/stack_recipe( \
	"brick wall", \
	/turf/closed/wall/material/dwarf_fortress/wood, \
	req_amount = 1, \
	time = 3 SECONDS, \
	one_per_turf = TRUE, \
	on_solid_ground = TRUE, \
	applies_mats = TRUE, \
	category = CAT_STRUCTURE \
	), \
	new /datum/stack_recipe( \
	"brick floor tile", \
	/obj/item/stack/tile/material/dwarf_fortress/wood, \
	req_amount = 1, \
	res_amount = 1, \
	one_per_turf = FALSE, \
	on_solid_ground = TRUE, \
	applies_mats = TRUE \
	), \
))

/datum/material/dwarf_certified/wood
	name = "generic rock"
	desc = "Hey... you shouldn't see this!"

	color = "#ffffff"
	greyscale_colors = "#ffffff"

	/// What color the leaves of the tree this comes from will eventually be
	var/leaf_color = "#a2dc34"
	/// What types of items the leaves drop when broken or just over time (for examples, nuts and fruits)
	var/list/leaf_fruits = list()
	/// How many fruits spawn when the leaves of this wood's tree are broken
	var/number_of_leaf_fruits = 3

	sheet_type = /obj/item/stack/dwarf_certified/log

	strength_modifier = 0.6
	integrity_modifier = 0.8
	armor_modifiers = list(MELEE = 0.4, BULLET = 0.3, LASER = 0.2, ENERGY = 0.3, BOMB = 0.5, BIO = 0, FIRE = 0, ACID = 0)

	// wood is 0.1, diamond is 0.3, iron is 0
	beauty_modifier = 0.1

	item_sound_override = null
	turf_sound_override = FOOTSTEP_WOOD

/obj/item/stack/dwarf_certified/log
	name = "generic log"
	singular_name = "generic log"

	desc = "Strange... Maybe you shouldn't be seeing this."

	icon_state = "log"

	inhand_icon_state = "loglike"

	merge_type = /obj/item/stack/dwarf_certified/log

	mats_per_unit = list(/datum/material/dwarf_certified/wood = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood

	max_amount = 5

	// What this log cuts into when something sharp is used on it
	var/obj/item/stack/cut_type = /obj/item/stack/dwarf_certified/wood/plank
	// How many of cut_type do we spawn
	var/cut_amount = 2

/obj/item/stack/dwarf_certified/log/examine()
	. = ..()
	. += span_notice("With something <b>sharp</b>, you could cut this into <b>planks</b>.")

/obj/item/stack/dwarf_certified/log/get_main_recipes()
	. = ..()
	. += GLOB.dwarf_log_recipes

/obj/item/stack/dwarf_certified/log/attackby(obj/item/attacking_item, mob/user, params)
	if((attacking_item.tool_behaviour != TOOL_SAW) && !(attacking_item.get_sharpness()))
		return ..()
	playsound(src, SFX_TREE_CHOP, 50, TRUE)
	balloon_alert_to_viewers("cutting...")
	if(!do_after(user, 2 SECONDS, target = src))
		balloon_alert_to_viewers("stopped cutting")
		return FALSE
	new cut_type(drop_location(), cut_amount)
	qdel(src)

/datum/material/dwarf_certified/wood/plank
	sheet_type = /obj/item/stack/dwarf_certified/plank

/obj/item/stack/dwarf_certified/plank
	name = "generic plank"
	singular_name = "generic plank"

	desc = "Strange... Maybe you shouldn't be seeing this."

	icon_state = "plank"

	inhand_icon_state = "woodlike"

	merge_type = /obj/item/stack/dwarf_certified/plank

	mats_per_unit = list(/datum/material/dwarf_certified/wood/plank = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/wood/plank

	max_amount = 6 // Planks are so much easier to store and move around, don't you know?

/obj/item/stack/dwarf_certified/plank/get_main_recipes()
	. = ..()
	. += GLOB.dwarf_plank_recipes
