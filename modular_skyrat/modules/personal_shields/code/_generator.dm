/obj/item/personal_shield_generator
	name = "broken shield generator"
	desc = "A slim shield generator pack that used to project a protective shield around the wearer."

	icon = 'modular_skyrat/modules/personal_shields/icons/generators.dmi'
	icon_state = "basic"
	worn_icon = 'modular_skyrat/modules/personal_shields/icons/generators_worn.dmi'
	worn_icon_state = "basic"

	slot_flags = ITEM_SLOT_GLOVES
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = FIRE_PROOF

	throwforce = 0

	/// The icon file for the shield overlay
	var/shield_icon_file = 'modular_skyrat/modules/personal_shields/icons/shield_effect.dmi'
	/// The icon the shield overlay should be using
	var/shield_icon = "shield"
