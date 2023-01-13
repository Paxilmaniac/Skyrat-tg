/datum/material/dwarf_certified
	name = "generic special event material"
	desc = "Hey... you shouldn't see this!"

	color = "#ffffff"
	greyscale_colors = "#ffffff"
	alpha = 255

	categories = list(MAT_CATEGORY_ITEM_MATERIAL = TRUE)

	sheet_type
	///This is a modifier for force, and resembles the strength of the material
	var/strength_modifier = 1
	///This is a modifier for integrity, and resembles the strength of the material
	var/integrity_modifier = 1
	///This is the amount of value per 1 unit of the material
	var/value_per_unit = 0
	///Armor modifiers, multiplies an items normal armor vars by these amounts.
	var/armor_modifiers = list(MELEE = 1, BULLET = 1, LASER = 1, ENERGY = 1, BOMB = 1, BIO = 1, FIRE = 1, ACID = 1)
	///How beautiful is this material per unit.
	var/beauty_modifier = 0
	///Can be used to override the sound items make, lets add some SLOSHing.
	var/item_sound_override
	///Can be used to override the stepsound a turf makes. MORE SLOOOSH
	var/turf_sound_override

/obj/item/stack/dwarf_certified
	name = "generic special event sheets"
	singular_name = "generic special event sheet"

	desc = "Strange... Maybe you shouldn't be seeing this."

	//lefthand_file = 'icons/mob/inhands/items/sheets_lefthand.dmi'
	//righthand_file = 'icons/mob/inhands/items/sheets_righthand.dmi'

	merge_type = /obj/item/stack/dwarf_certified

	w_class = WEIGHT_CLASS_NORMAL
	full_w_class = WEIGHT_CLASS_BULKY

	force = 5
	throwforce = 10
	max_amount = 15
	throw_speed = 1
	throw_range = 3

	attack_verb_continuous = list("bashes", "batters", "bludgeons", "thrashes", "smashes")
	attack_verb_simple = list("bash", "batter", "bludgeon", "thrash", "smash")

	novariants = FALSE
	material_flags = MATERIAL_EFFECTS
