/obj/machinery/power/kahraman_ore_thumper
	name = "ore thumper"
	desc = "A frame with a heavy block of metal suspended atop a pipe. When deployed outdoors and supplied with a wired power \
		connections, it will slam downward, forcing pressurized gas into the ground and forcing up buried resources."
	icon = 'modular_skyrat/modules/kahraman_mining/icons/ore_thumper.dmi'
	icon_state = "thumper_idle"
	density = TRUE
	max_integrity = 250
	idle_power_usage = 0
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION
	anchored = TRUE
	can_change_cable_layer = FALSE
	circuit = null
	/// Are we currently working?
	var/thumping = FALSE

/obj/machinery/power/kahraman_ore_thumper/add_context(
	atom/source,
	list/context,
	obj/item/held_item,
	mob/living/user,
)

	if(isnull(held_item))
		if(panel_open)
			context[SCREENTIP_CONTEXT_LMB] = "Activate Thumper"
			return CONTEXTUAL_SCREENTIP_SET
		return NONE

/obj/machinery/power/kahraman_ore_thumper/examine(mob/user)
	. = ..()
	var/area/thumper_area = get_area(src)
	if(!thumper_area.outdoors)
		. += span_notice("Its must be constructed <b>outdoors</b> to function.")
	if(!istype(get_turf(src), /turf/open/misc))
		. += span_notice("It must be constructed on <b>suitable terrain</b>, like ash or snow.")
	. += span_notice("It must have a powered, <b>wired connection</b> running beneath it to function.")

/obj/machinery/power/kahraman_ore_thumper/process()
	var/turf/our_turf = get_turf(src)
	var/obj/structure/cable/cable_under_us = locate() in our_turf
	if(!cable_under_us && powernet)
		disconnect_from_network()
	if(thumping)
		if(avail(active_power_usage))
			add_load(active_power_usage)
		else
			thumping = FALSE
	else if(avail(idle_power_usage))
		add_load(idle_power_usage)

/obj/machinery/power/kahraman_ore_thumper/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return

	if(thumping)
		thumping = FALSE
		balloon_alert(user, "thumper stopped")
		return
	start_her_up(current, user)
	balloon_alert(user, "thumper started")
