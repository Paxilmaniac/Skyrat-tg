/// Element that makes items turn into other items when you use them on a loom (or any other thing really if you change the var)
/datum/element/dwarven_plantable
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2
	/// What will spawn when the item is loomed
	var/resulting_atom
	/// How much of item do we need to loom, will be ignored if item isnt a stack
	var/list/required_turf_types = list()
	/// How long it takes to loom the item
	var/plant_time
	/// Typecache of turfs that can be planted upon
	var/list/turf_typecache = list()

/datum/element/dwarven_plantable/Attach(
	obj/item/target,
	resulting_atom = /obj/item/stack/sheet/cloth,
	required_turf_types = list(/turf/open/misc/sandy_dirt,),
	plant_time = 3 SECONDS
)
	. = ..()
	//currently this element only works for items as we need to call /obj/item/attack_atom()
	if(!isitem(target))
		return ELEMENT_INCOMPATIBLE
	src.resulting_atom = resulting_atom
	src.required_turf_types = required_turf_types
	turf_typecache = typecacheof(required_turf_types)
	src.plant_time = plant_time
	RegisterSignal(target, COMSIG_ITEM_ATTACK_ATOM, PROC_REF(try_and_plant_me))
	RegisterSignal(target, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))

/datum/element/dwarven_plantable/Detach(obj/item/source)
	. = ..()
	UnregisterSignal(source, list(COMSIG_ITEM_ATTACK_ATOM, COMSIG_ATOM_EXAMINE))

/// Adds an examine blurb to the description of any item that can be planted
/datum/element/dwarven_plantable/proc/on_examine(obj/item/source, mob/examiner, list/examine_list)
	SIGNAL_HANDLER

	var/list/names_of_all_plantable_turfs = list()
	for(var/turf/plantable_turf in required_turf_types)
		names_of_all_plantable_turfs += initial(plantable_turf.name)

	examine_list += span_nicegreen("You could <b>plant</b> this in: [english_list(turf_typecache)].")

/// Checks if the thing we clicked on can be used as a loom, and if we can actually loom the source at present (an example being does the stack have enough in it (if its a stack))
/datum/element/dwarven_plantable/proc/try_and_plant_me(obj/item/source, turf/target, mob/living/user)
	SIGNAL_HANDLER

	if(!is_type_in_typecache(target, turf_typecache))
		return

	INVOKE_ASYNC(src, PROC_REF(plant_me), source, user, target)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/// If a do_after of the specified loom_time passes, will create a new one of resulting_atom and either delete the item, or .use the required amount if its a stack
/datum/element/dwarven_plantable/proc/plant_me(obj/item/source, mob/living/user, turf/target)
	if(!do_after(user, plant_time, target))
		user.balloon_alert(user, "interrupted!")
		return

	var/new_thing = new resulting_atom(target.drop_location())
	user.balloon_alert_to_viewers("planted [new_thing]")
	qdel(source)
