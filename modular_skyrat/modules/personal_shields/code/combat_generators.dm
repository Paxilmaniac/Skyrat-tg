/obj/item/personal_shield_generator/combat
	name = "personal combat shield generator"
	desc = "A slim shield generator pack that will project a protective shield around the wearer. This shield is built to stop up to 3 incoming swings and projectiles."

/obj/item/personal_shield_generator/combat/Initialize(mapload)
	. = ..()

	setup_shielding()

/// Adds the shielded component to the belt
/obj/item/personal_shield_generator/combat/proc/setup_shielding()
	AddComponent(/datum/component/shielded/skyrat_shield_flicker,
		max_charges = 3,
		recharge_start_delay = 20 SECONDS,
		charge_increment_delay = 1 SECONDS,
		charge_recovery = 1,
		lose_multiple_charges = FALSE,
		shield_icon_file = src.shield_icon_file,
		shield_icon = src.shield_icon,
	)
