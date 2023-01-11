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
