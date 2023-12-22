/obj/structure/mineral_door/manual_colony_door
	name = "large wooden gate"
	icon = 'modular_skyrat/modules/colony_fabriactor_event_code/icons/airlock_manual.dmi'
	material_flags = NONE
	icon_state = "manual"
	openSound = 'modular_skyrat/modules/colony_fabriactor_event_code/sound/manual_door/manual_door_open.ogg'
	closeSound = 'modular_skyrat/modules/colony_fabriactor_event_code/sound/manual_door/manual_door_close.ogg'
	/// What we disassemble into
	var/disassembled_type = /obj/item/flatpacked_machine/airlock_kit_manual
	/// How long it takes to open/close the door
	var/manual_actuation_delay = 1 SECONDS

/obj/structure/mineral_door/manual_colony_door/deconstruct(disassembled = TRUE)
	if(disassembled)
		new disassembled_type(get_turf(src))
	qdel(src)

// Pickaxes won't dig these apart
/obj/structure/mineral_door/manual_colony_door/pickaxe_door(mob/living/user, obj/item/item_in_question)
	return

// These doors have a short do_after to check if you can open or close them
/obj/structure/mineral_door/manual_colony_door/TryToSwitchState(atom/user)
	if(isSwitchingStates || !anchored)
		return
	if(!do_after(user, manual_actuation_delay, src))
		return

// We don't care about being bumped, just a copy of the base bumped proc
/obj/structure/mineral_door/manual_colony_door/Bumped(atom/movable/bumped_atom)
	set waitfor = FALSE
	SEND_SIGNAL(src, COMSIG_ATOM_BUMPED, bumped_atom)

// Parts kit for putting the door together
/obj/item/flatpacked_machine/airlock_kit_manual
	name = "prefab manual airlock parts kit"
	icon = 'modular_skyrat/modules/colony_fabriactor_event_code/icons/packed_machines.dmi'
	icon_state = "airlock_parts_manual"
	type_to_deploy = /obj/structure/mineral_door/manual_colony_door
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
	)
