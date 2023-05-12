/datum/material/dwarf_certified/rock/crystal
	name = "generic raw crystal"
	desc = "Hey... you shouldn't see this!"

	color = "#ffffff"
	greyscale_colors = "#ffffff"

	sheet_type = /obj/item/stack/dwarf_certified/rock/crystal

	// wood is 0.1, diamond is 0.3, iron is 0
	beauty_modifier = 0.15

	turf_sound_override = FOOTSTEP_FLOOR

/obj/item/stack/dwarf_certified/rock/crystal
	name = "generic raw crystal"
	singular_name = "generic raw crystal"

	desc = "Strange... Maybe you shouldn't be seeing this."

	merge_type = /obj/item/stack/dwarf_certified/rock/crystal

	mats_per_unit = list(/datum/material/dwarf_certified/rock/crystal = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/rock/crystal

	cut_amount = 1

/obj/item/stack/dwarf_certified/cut_gem
	name = "generic gemstone"
	singular_name = "generic gemstone"

	desc = "Strange... Maybe you shouldn't be seeing this."

	icon_state = "crystal"

	inhand_icon_state = "gemlike"

	merge_type = /obj/item/stack/dwarf_certified/cut_gem

	mats_per_unit = list(/datum/material/dwarf_certified/rock/crystal = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/rock/crystal

	max_amount = 3

// Rock crystal, you know for making glass out of

/datum/material/dwarf_certified/rock/crystal/rock_crystal
	name = "rock crystal"
	desc = "Its really just quartz, but rock crystal sounds cooler doesn't it?"

	color = "#ffffffc4"
	greyscale_colors = "#ffffffc4"

	sheet_type = /obj/item/stack/dwarf_certified/rock/crystal/rock_crystal

	// wood is 0.1, diamond is 0.3, iron is 0
	beauty_modifier = 0.15

/obj/item/stack/dwarf_certified/rock/crystal/rock_crystal
	name = "raw rock crystal"
	singular_name = "raw rock crystal"

	desc = "Rock crystal, otherwise known as quartz."

	merge_type = /obj/item/stack/dwarf_certified/rock/crystal/rock_crystal

	mats_per_unit = list(/datum/material/dwarf_certified/rock/crystal/rock_crystal = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/rock/crystal/rock_crystal

	cut_type = /obj/item/stack/dwarf_certified/cut_gem/rock_crystal

/obj/item/stack/dwarf_certified/rock/crystal/rock_crystal/Initialize(mapload)
	. = ..()

	AddComponent(/datum/component/bakeable, /obj/item/stack/dwarf_certified/glass/crystal, rand(30 SECONDS, 45 SECONDS), TRUE, TRUE)

/obj/item/stack/dwarf_certified/cut_gem/rock_crystal
	name = "cut rock crystal"
	singular_name = "cut rock crystal"

	desc = "Despite everything, its still just quartz."

	merge_type = /obj/item/stack/dwarf_certified/cut_gem/rock_crystal

	mats_per_unit = list(/datum/material/dwarf_certified/rock/crystal/rock_crystal = SHEET_MATERIAL_AMOUNT)
	material_type = /datum/material/dwarf_certified/rock/crystal/rock_crystal
