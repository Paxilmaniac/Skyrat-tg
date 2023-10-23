/datum/component/simple_farm
	///whether we limit the amount of plants you can have per turf
	var/one_per_turf = TRUE
	///the reference to the movable parent the component is attached to
	var/atom/atom_parent
	///the amount of pixels shifted (x,y)
	var/list/pixel_shift = 0

/datum/component/simple_farm/Initialize(set_plant = FALSE, set_turf_limit = TRUE, list/set_shift = list(0, 0))
	//we really need to check if its movable
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	atom_parent = parent
	//important to allow people to just straight up set allowing to plant
	one_per_turf = set_turf_limit
	pixel_shift = set_shift
	//now lets register the signals
	RegisterSignal(atom_parent, COMSIG_ATOM_ATTACKBY, PROC_REF(check_attack))
	RegisterSignal(atom_parent, COMSIG_ATOM_EXAMINE, PROC_REF(check_examine))

/datum/component/simple_farm/Destroy(force, silent)
	//lets not hard del
	UnregisterSignal(atom_parent, list(COMSIG_ATOM_ATTACKBY, COMSIG_ATOM_EXAMINE))
	atom_parent = null
	return ..()

/**
 * check_attack is meant to listen for the COMSIG_ATOM_ATTACKBY signal, where it essentially functions like the attackby proc
 */
/datum/component/simple_farm/proc/check_attack(datum/source, obj/item/attacking_item, mob/user)
	SIGNAL_HANDLER

	//if its a seed, lets try to plant
	if(istype(attacking_item, /obj/item/seeds))
		var/obj/item/seeds/attacking_seeds = attacking_item

		if(attacking_seeds.special_plant_type)
			var/locate_plant = locate(attacking_seeds.special_plant_type) in get_turf(atom_parent)
			if(locate_plant)
				atom_parent.balloon_alert_to_viewers("cannot plant more seeds here!")
				return
			new attacking_seeds.special_plant_type(get_turf(atom_parent))
			return

		var/obj/structure/simple_farm/locate_farm = locate() in get_turf(atom_parent)

		if(one_per_turf && locate_farm)
			atom_parent.balloon_alert_to_viewers("cannot plant more seeds here!")
			return

		locate_farm = new(get_turf(atom_parent))
		locate_farm.pixel_x = pixel_shift[1]
		locate_farm.pixel_y = pixel_shift[2]
		locate_farm.layer = atom_parent.layer + 0.1
		attacking_item.forceMove(locate_farm)
		locate_farm.planted_seed = attacking_item
		locate_farm.attached_atom = atom_parent
		atom_parent.balloon_alert_to_viewers("seed has been planted!")
		locate_farm.update_appearance()
		locate_farm.late_setup()

/**
 * check_examine is meant to listen for the COMSIG_ATOM_EXAMINE signal, where it will put additional information in the examine
 */
/datum/component/simple_farm/proc/check_examine(datum/source, mob/user, list/examine_list)
	examine_list += span_notice("You are able to plant seeds here!")

/obj/structure/simple_farm
	name = "simple farm"
	desc = "A small little plant that has adapted to the surrounding environment."
	//it needs to be able to be walked through
	density = FALSE
	//it should not be pulled by anything
	anchored = TRUE
	///the atom the farm is attached to
	var/atom/attached_atom
	///the seed that is held within
	var/obj/item/seeds/planted_seed
	///the max amount harvested from the plants
	var/max_harvest = 3
	///the cooldown amount between each harvest
	var/harvest_cooldown = 5 MINUTES
	//the cooldown between each harvest
	COOLDOWN_DECLARE(harvest_timer)

	/// Is the farm deleted when we harvest from it
	var/deletes_on_harvest = FALSE
	/// Does the farm spawn ready to harvest? Used for wild plants ready to go out the gate
	var/spawns_fully_grown = FALSE
	/// Does the plant give double returns due to being fertilized with potash?
	var/potash_fertilized = FALSE

/obj/structure/simple_farm/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	COOLDOWN_START(src, harvest_timer, (spawns_fully_grown ? 0.1 SECONDS : harvest_cooldown))

/obj/structure/simple_farm/Destroy()
	STOP_PROCESSING(SSobj, src)

	if(planted_seed)
		planted_seed.forceMove(get_turf(src))
		planted_seed = null

	if(attached_atom)
		if(ismovable(attached_atom))
			UnregisterSignal(attached_atom, COMSIG_MOVABLE_MOVED)

		attached_atom = null

	return ..()

/obj/structure/simple_farm/examine(mob/user)
	. = ..()
	. += span_notice("<br>It will be ready for harvest in [DisplayTimeText(COOLDOWN_TIMELEFT(src, harvest_timer))]")
	if(potash_fertilized)
		. += span_notice("<br>It has been fertilized and will yield more crop its next harvest!")
	else
		. += span_notice("<br>You can use <b>potash</b> to increase the harvest yield!")

/obj/structure/simple_farm/process(seconds_per_tick)
	update_appearance()

/obj/structure/simple_farm/update_appearance(updates)
	if(!planted_seed)
		return

	icon = planted_seed.growing_icon

	if(COOLDOWN_FINISHED(src, harvest_timer))
		if(planted_seed.icon_harvest)
			icon_state = planted_seed.icon_harvest

		else
			icon_state = "[planted_seed.icon_grow][planted_seed.growthstages]"

		name = lowertext(planted_seed.plantname)

	else
		icon_state = "[planted_seed.icon_grow]1"
		name = lowertext("harvested [planted_seed.plantname]")

	return ..()

/obj/structure/simple_farm/attack_hand(mob/living/user, list/modifiers)
	if(!COOLDOWN_FINISHED(src, harvest_timer))
		balloon_alert(user, "plant not ready for harvest!")
		return

	create_harvest()
	update_appearance()
	COOLDOWN_START(src, harvest_timer, (harvest_cooldown + rand(-1.5 MINUTES, 1.5 MINUTES)))
	return ..()

/obj/structure/simple_farm/attackby(obj/item/attacking_item, mob/user, params)
	//if its a shovel or knife, dismantle
	if(attacking_item.tool_behaviour == TOOL_SHOVEL || attacking_item.tool_behaviour == TOOL_KNIFE)
		var/turf/src_turf = get_turf(src)
		src_turf.balloon_alert_to_viewers("the plant crumbles!")
		Destroy()
		return

	if(istype(attacking_item, /obj/item/stack/dwarf_certified/powder/potash))
		if(potash_fertilized)
			balloon_alert(user, "already fertilized")
			return

		var/obj/item/stack/dwarf_certified/powder/potash/use_item = attacking_item

		if(!use_item.use(1))
			return

		potash_fertilized = TRUE
		return

	return ..()

/**
 * used during the component so that it can move when its attached atom moves
 */
/obj/structure/simple_farm/proc/late_setup()
	if(!ismovable(attached_atom))
		return
	RegisterSignal(attached_atom, COMSIG_MOVABLE_MOVED, PROC_REF(move_plant))

/**
 * a simple proc to forcemove the plant on top of the movable atom its attached to
 */
/obj/structure/simple_farm/proc/move_plant()
	forceMove(get_turf(attached_atom))

/**
 * will create a harvest of the seeds product, with a chance to create a mutated version
 */
/obj/structure/simple_farm/proc/create_harvest()
	if(!planted_seed)
		return

	if(locate(/datum/plant_gene/trait/repeated_harvest) in planted_seed.genes)
		deletes_on_harvest = FALSE

	var/amount_of_crop = planted_seed.yield
	if(potash_fertilized)
		amount_of_crop = round(amount_of_crop * 1.5, 1)

	for(var/i in 1 to rand(1, amount_of_crop))
		var/obj/creating_obj

		creating_obj = planted_seed.product

		if(!creating_obj)
			creating_obj = planted_seed.type

		new creating_obj(get_turf(src))

	/// You'll have to refertilize after every harvest if you want those gainz
	potash_fertilized = FALSE
	if(deletes_on_harvest)
		qdel(src)

/turf/open/misc/asteroid/basalt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/simple_farm)
