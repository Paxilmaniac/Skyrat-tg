GLOBAL_LIST_INIT(dwarf_boulder_recipes, list(
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

GLOBAL_LIST_INIT(dwarf_brick_recipes, list(
	new /datum/stack_recipe( \
	"brick wall", \
	/turf/closed/wall/material/dwarf_fortress/brick, \
	req_amount = 1, \
	time = 3 SECONDS, \
	one_per_turf = TRUE, \
	on_solid_ground = TRUE, \
	applies_mats = TRUE, \
	category = CAT_STRUCTURE \
	), \
	new /datum/stack_recipe( \
	"brick floor tile", \
	/obj/item/stack/tile/material/dwarf_fortress/stone, \
	req_amount = 1, \
	res_amount = 1, \
	one_per_turf = FALSE, \
	on_solid_ground = TRUE, \
	applies_mats = TRUE \
	), \
))

/datum/material/dwarf_certified/rock
	name = "generic rock"
	desc = "Hey... you shouldn't see this!"

	color = "#ffffff"
	greyscale_colors = "#ffffff"

	sheet_type = /obj/item/stack/dwarf_certified/rock

	strength_modifier = 1
	integrity_modifier = 1
	armor_modifiers = list(MELEE = 0.7, BULLET = 0.7, LASER = 1, ENERGY = 1, BOMB = 0.5, BIO = 1, FIRE = 1, ACID = 1)

	// wood is 0.1, diamond is 0.3, iron is 0
	beauty_modifier = 0.1

	item_sound_override = null
	turf_sound_override = FOOTSTEP_FLOOR

/obj/item/stack/dwarf_certified/rock
	name = "generic boulder"
	singular_name = "generic boulder"

	desc = "Strange... Maybe you shouldn't be seeing this."

	icon_state = "chunk"

	inhand_icon_state = "stonelike"

	merge_type = /obj/item/stack/dwarf_certified/rock

	mats_per_unit = list(/datum/material/dwarf_certified/rock = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/rock

	max_amount = 1

	// What this boulder cuts into when a chisel or pickaxe is used on it
	var/obj/item/stack/cut_type = /obj/item/stack/dwarf_certified/brick
	// How many of cut_type do we spawn
	var/cut_amount = 3

/obj/item/stack/dwarf_certified/rock/examine()
	. = ..()
	. += span_notice("With a <b>chisel</b> or even a <b>pickaxe</b> of some kind, you could cut this into <b>blocks</b>.")

/obj/item/stack/dwarf_certified/rock/get_main_recipes()
	. = ..()
	. += GLOB.dwarf_boulder_recipes

/obj/item/stack/dwarf_certified/rock/attackby(obj/item/attacking_item, mob/user, params)
	if((attacking_item.tool_behaviour != TOOL_MINING) && !(istype(attacking_item, /obj/item/chisel)))
		return ..()
	playsound(src, 'sound/effects/picaxe1.ogg', 50, TRUE)
	balloon_alert_to_viewers("cutting...")
	if(!do_after(user, 2 SECONDS, target = src))
		balloon_alert_to_viewers("stopped cutting")
		return FALSE
	new cut_type(drop_location(), cut_amount)
	qdel(src)

/datum/material/dwarf_certified/rock/brick
	sheet_type = /obj/item/stack/dwarf_certified/brick

	integrity_modifier = 1.2 // Bricks are slightly stronger than building out of just uncut boulders

/obj/item/stack/dwarf_certified/brick
	name = "generic brick"
	singular_name = "generic brick"

	desc = "Strange... Maybe you shouldn't be seeing this."

	icon_state = "block"

	inhand_icon_state = "barlike"

	merge_type = /obj/item/stack/dwarf_certified/brick

	mats_per_unit = list(/datum/material/dwarf_certified/rock/brick = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/rock/brick

	max_amount = 6 // Blocks are so much easier to store and move around, don't you know?

/obj/item/stack/dwarf_certified/brick/get_main_recipes()
	. = ..()
	. += GLOB.dwarf_brick_recipes
