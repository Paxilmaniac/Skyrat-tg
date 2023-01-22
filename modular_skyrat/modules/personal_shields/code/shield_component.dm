/datum/component/reaction_shield
	/// The shield's owner
	var/mob/living/shield_haver
	/// How many 'charges' the shield has aka the number of hits the shield can take before shattering
	var/max_charges
	/// How many charges the shield currently has
	var/current_charges
	/// How long after the shield shattering does it take to recharge
	var/recharge_delay = 30 SECONDS
	/// What .dmi we're pulling the shield icon from
	var/shield_icon_file = 'modular_skyrat/modules/personal_shields/icons/shield_effect.dmi'
	/// What icon is used when someone has a functional shield up
	var/shield_icon = "shield"
	/// Tracks how long ago we were hit
	COOLDOWN_DECLARE(recent_hit_cooldown)

/datum/component/reaction_shield/Initialize(max_charges = 3, recharge_delay = 30 SECONDS, shield_icon_file = 'modular_skyrat/modules/personal_shields/icons/shield_effect.dmi', shield_icon = "shield")
	if(!isitem(parent) || max_charges <= 0)
		return COMPONENT_INCOMPATIBLE

	src.max_charges = max_charges
	src.recharge_delay = recharge_delay

	src.shield_icon_file = shield_icon_file
	src.shield_icon = shield_icon

	if(recharge_delay)
		START_PROCESSING(SSdcs, src)

/datum/component/shielded/skyrat_shield_flicker

/datum/component/shielded/skyrat_shield_flicker/on_update_overlays(atom/parent_atom, list/overlays)
	return

/datum/component/shielded/skyrat_shield_flicker/default_run_hit_callback(mob/living/owner, attack_text, current_charges)
	do_sparks(2, FALSE, owner)
	if(!current_charges <= 0)
		owner.visible_message(span_danger("[owner]'s shields deflect [attack_text] in a shower of sparks!"))
		var/mutable_appearance/overlay = mutable_appearance(shield_icon_file, shield_icon, ABOVE_MOB_LAYER)
		overlay.color = "#00e1ff"
		overlay.alpha = 200
		owner.flick_overlay_static(overlay, 0.5 SECONDS)
		playsound(owner, 'sound/effects/empulse.ogg', 50, TRUE)
		return
	else
		owner.visible_message(span_warning("[owner]'s shield overloads!"))
		var/mutable_appearance/overlay = mutable_appearance(shield_icon_file, "[shield_icon]_shatter", ABOVE_MOB_LAYER)
		overlay.color = "#00e1ff"
		overlay.alpha = 200
		owner.flick_overlay_static(overlay, 0.5 SECONDS)
		playsound(owner, 'sound/weapons/parry.ogg', 100, TRUE)
		return
