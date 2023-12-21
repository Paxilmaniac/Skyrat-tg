/obj/machinery/power/kahraman_ore_thumper
	name = "ore thumper"
	desc = "A frame with a heavy block of metal suspended atop a pipe. When deployed outdoors and supplied with a wired power \
		connections, it will slam downward, forcing pressurized gas into the ground and forcing up buried resources."
	icon = 'modular_skyrat/modules/colony_fabriactor_event_code/icons/ore_thumper.dmi'
	icon_state = "thumper_idle"
	density = TRUE
	max_integrity = 250
	idle_power_usage = 0
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 10 // Should be 10 kw
	anchored = TRUE
	can_change_cable_layer = FALSE
	circuit = null
	/// Are we currently working?
	var/thumping = FALSE
	/// Our looping fan sound that we play when turned on
	var/datum/looping_sound/ore_thumper_fan/soundloop
	/// How many times we've slammed, counts up until the number is high enough to make a box of materials
	var/slam_jams = 0
	/// How many times we need to slam in order to produce a box of materials
	var/slam_jams_needed = 20
	/// List of the thumping sounds we can choose from
	var/list/list_of_thumper_sounds = list(
		'modular_skyrat/modules/colony_fabriactor_event_code/sound/thumper_thump/punch_press_1.wav',
		'modular_skyrat/modules/colony_fabriactor_event_code/sound/thumper_thump/punch_press_2.wav',
	)


/obj/machinery/power/kahraman_ore_thumper/Initialize(mapload)
	. = ..()
	soundloop = new(src, FALSE)

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
		. += span_notice("It must be constructed on <b>suitable terrain</b>, like ash, snow, or sand.")
	. += span_notice("It must have a powered, <b>wired connection</b> running beneath it to function.")
	. += span_notice("It will produce a box of materials after it has slammed [slam_jams_needed] times.")
	. += span_notice("Currently, it has slammed [slam_jams] / [slam_jams_needed] times needed.")
	. += span_notice("It will stop producing new boxes if one is left on top of the thumper, building up resources instead.")


/obj/machinery/power/kahraman_ore_thumper/process()
	var/turf/our_turf = get_turf(src)
	var/obj/structure/cable/cable_under_us = locate() in our_turf
	if(!cable_under_us && powernet)
		disconnect_from_network()
	if(thumping)
		if(!see_if_we_can_work(our_turf))
			balloon_alert_to_viewers("invalid location!")
			cut_that_out()
			return
		if(avail(active_power_usage))
			add_load(active_power_usage)
		else
			balloon_alert_to_viewers("not enough power!")
			cut_that_out()
	else if(avail(idle_power_usage))
		add_load(idle_power_usage)


/// Checks the turf we are on to make sure we are outdoors and on a misc turf
/obj/machinery/power/kahraman_ore_thumper/proc/see_if_we_can_work(turf/our_turf)
	var/area/our_current_area = get_area(src)
	if(!our_current_area.outdoors)
		return FALSE
	if(!istype(get_turf(src), /turf/open/misc))
		return FALSE
	return TRUE


/obj/machinery/power/kahraman_ore_thumper/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return

	if(thumping)
		cut_that_out()
		balloon_alert(user, "thumper stopped")
		return
	start_her_up(user)
	balloon_alert(user, "thumper started")


/obj/machinery/power/kahraman_ore_thumper/attack_ai(mob/user)
	return attack_hand(user)


/obj/machinery/power/kahraman_ore_thumper/attack_robot(mob/user)
	return attack_hand(user)


/// Attempts turning the thumper on, failing if any of the conditions aren't met
/obj/machinery/power/kahraman_ore_thumper/proc/start_her_up(mob/user)
	var/turf/our_turf = get_turf(src)
	var/obj/structure/cable/cable_under_us = locate() in our_turf
	if(!cable_under_us && powernet)
		balloon_alert(user, "not connected to wire")
		return
	if(!avail(active_power_usage))
		balloon_alert(user, "not enough power")
		return

	thumping = TRUE
	soundloop.start()

	balloon_alert(user, "thumper started")

	addtimer(CALLBACK(src, PROC_REF(slam_it_down)), 15 SECONDS)


/// Attempts to shut the thumper down
/obj/machinery/power/kahraman_ore_thumper/proc/cut_that_out(mob/user)
	thumping = FALSE
	soundloop.stop()

	icon_state = "thumper_idle"
	update_appearance()

	balloon_alert(user, "thumper stopped")


/// Makes the machine slam down, producing a box of ore if it has been slamming long enough
/obj/machinery/power/kahraman_ore_thumper/proc/slam_it_down()
	if(!thumping)
		return
	var/turf/our_turf = get_turf(src)
	if(!see_if_we_can_work(our_turf))
		balloon_alert_to_viewers("invalid location!")
		cut_that_out()
		return
	// Down we go
	flick("thumper_slam")
	icon_state = "thumper_down"
	// Crunch
	playsound(src, pick(list_of_thumper_sounds), 50, TRUE)
	slam_jams += 1
	// Up and at em
	flick("thumper_rise")
	icon_state = "thumper_idle"

	addtimer(CALLBACK(src, PROC_REF(slam_it_down)), 15 SECONDS)

	// If the number of slams is less than that of what we need, then we can stop here
	if(!(slam_jams >= slam_jams_needed))
		return

	// If there is already a box of ore sitting on the thumper, then we stop right here
	if(/obj/structure/closet/crate/large/ore_thumper in our_turf.contents)
		balloon_alert_to_viewers("ore outlet full")
		return

	addtimer(CALLBACK(src, PROC_REF(make_some_ore)), 3 SECONDS)


/// Spawns an ore box on top of the thumper
/obj/machinery/power/kahraman_ore_thumper/proc/make_some_ore
	new /obj/structure/closet/crate/large/ore_thumper(drop_location(src))
	playsound(src, 'sound/items/rped.ogg', 50, TRUE)
	slam_jams -= slam_jams_needed


// Item for deploying ore thumpers
/obj/item/flatpacked_machine/ore_thumper
	name = "flat-packed ore thumper"
	icon = 'modular_skyrat/modules/colony_fabriactor_event_code/icons/packed_machines.dmi'
	icon_state = "thumper_packed"
	type_to_deploy = /obj/machinery/power/kahraman_ore_thumper
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
	)


// Box that randomly spawns with ore, yippie!
/obj/structure/closet/crate/large/ore_thumper
	name = "packed materials crate"
	/// Weighted list of the ores we can spawn
	var/static/list/ore_weight_list = list(
		/obj/item/stack/ore/iron = 5,
		/obj/item/stack/ore/glass/basalt = 5,
		/obj/item/stack/ore/plasma = 4,
		/obj/item/stack/ore/uranium = 3,
		/obj/item/stack/ore/silver = 3,
		/obj/item/stack/ore/gold = 3,
		/obj/item/stack/ore/titanium = 3,
		/obj/item/stack/ore/diamond = 2,
		/obj/item/stack/ore/bluespace_crystal = 1,
	)


/obj/structure/closet/crate/large/ore_thumper/PopulateContents()
	..()
	for(var/i in 1 to rand(5, 8))
		var/obj/item/stack/new_ore = pick_weight(ore_weight_list)
		new new_ore(src, rand(20, 50))
