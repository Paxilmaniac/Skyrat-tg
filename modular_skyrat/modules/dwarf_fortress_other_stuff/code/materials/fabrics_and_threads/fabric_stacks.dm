// BASE TYPES

/obj/item/stack/dwarf_certified/thread
	name = "generic threads"
	singular_name = "generic thread"

	desc = "Strange... Maybe you shouldn't be seeing this."

	icon_state = "thread"

	inhand_icon_state = "fabriclike"

	merge_type = /obj/item/stack/dwarf_certified/thread

	mats_per_unit = list(/datum/material/dwarf_certified/fabric = SHEET_MATERIAL_AMOUNT / 2)
	material_type = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric

	max_amount = 6

	/// Tells us what type of fabric we craft into
	var/fabric_we_weave = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric

/obj/item/stack/dwarf_certified/thread/get_main_recipes()
	. = ..()
	. += fabric_recipe_maker()

/obj/item/stack/dwarf_certified/thread/proc/fabric_recipe_maker()
	var/recipe_we_return = new /datum/stack_recipe( \
	"[name] fabric", \
	fabric_we_weave, \
	req_amount = 2, \
	res_amount = 1, \
	time = 1 SECONDS, \
	)

	return recipe_we_return

/obj/item/stack/dwarf_certified/leather_or_cloth/fabric
	name = "generic fabric"
	singular_name = "generic fabric"

	desc = "Strange... Maybe you shouldn't be seeing this."

	icon_state = "fabric"

	merge_type = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric

	mats_per_unit = list(/datum/material/dwarf_certified/fabric = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/fabric

/obj/item/stack/dwarf_certified/leather_or_cloth/examine(mob/user)
	. = ..()

	. += span_notice("Maybe with a <b>tailoring station</b>, you could work this into more advanced items?")

// CLOTH

/obj/item/stack/dwarf_certified/thread/cotton
	name = "spool of cotton thread"
	singular_name = "cotton thread"

	desc = "Thread made of cotton."

	merge_type = /obj/item/stack/dwarf_certified/thread/cotton

	mats_per_unit = list(/datum/material/dwarf_certified/fabric/cotton = SHEET_MATERIAL_AMOUNT / 2)
	material_type = /datum/material/dwarf_certified/fabric/cotton

	fabric_we_weave = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric/cotton

/obj/item/stack/dwarf_certified/leather_or_cloth/fabric/cotton
	name = "bolt of cotton fabric"
	singular_name = "cotton fabric"

	desc = "Fabric made of cotton."

	merge_type = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric/cotton

	mats_per_unit = list(/datum/material/dwarf_certified/fabric/cotton = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/fabric/cotton

// FLAX

/obj/item/stack/dwarf_certified/thread/flax
	name = "spool of flax thread"
	singular_name = "flax thread"

	desc = "Thread made of flax."

	merge_type = /obj/item/stack/dwarf_certified/thread/flax

	mats_per_unit = list(/datum/material/dwarf_certified/fabric/flax = SHEET_MATERIAL_AMOUNT / 2)
	material_type = /datum/material/dwarf_certified/fabric/flax

	fabric_we_weave = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric/flax

/obj/item/stack/dwarf_certified/leather_or_cloth/fabric/flax
	name = "bolt of flax fabric"
	singular_name = "flax fabric"

	desc = "Fabric made of flax."

	merge_type = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric/flax

	mats_per_unit = list(/datum/material/dwarf_certified/fabric/flax = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/fabric/flax

// REED FIBER

/obj/item/stack/dwarf_certified/thread/reed
	name = "spool of reed thread"
	singular_name = "reed thread"

	desc = "Thread made of reed."

	merge_type = /obj/item/stack/dwarf_certified/thread/reed

	mats_per_unit = list(/datum/material/dwarf_certified/fabric/reed = SHEET_MATERIAL_AMOUNT / 2)
	material_type = /datum/material/dwarf_certified/fabric/reed

	fabric_we_weave = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric/reed

/obj/item/stack/dwarf_certified/leather_or_cloth/fabric/reed
	name = "bolt of reed fabric"
	singular_name = "reed fabric"

	desc = "Fabric made of reed."

	merge_type = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric/reed

	mats_per_unit = list(/datum/material/dwarf_certified/fabric/reed = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/fabric/reed

// SPIDER SILK

/obj/item/stack/dwarf_certified/thread/silk
	name = "spool of spider silk thread"
	singular_name = "spider silk thread"

	desc = "Thread made of spider silk."

	merge_type = /obj/item/stack/dwarf_certified/thread/silk

	mats_per_unit = list(/datum/material/dwarf_certified/fabric/silk = SHEET_MATERIAL_AMOUNT / 2)
	material_type = /datum/material/dwarf_certified/fabric/silk

	fabric_we_weave = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric/silk

/obj/item/stack/dwarf_certified/leather_or_cloth/fabric/silk
	name = "bolt of spider silk fabric"
	singular_name = "spider silk fabric"

	desc = "Fabric made of spider silk."

	merge_type = /obj/item/stack/dwarf_certified/leather_or_cloth/fabric/silk

	mats_per_unit = list(/datum/material/dwarf_certified/fabric/silk = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/fabric/silk
