/obj/machinery/rnd/production/colony_lathe/engineering
	name = "rapid engineering fabricator"
	desc = "These bad boys are seen just about anywhere someone would want or need to build fast, damn the consequences. \
		That tends to be colonies, especially on dangerous worlds, where the influences of this one machine can be seen \
		in every bit of architecture. This type in particular is specialized for engineering applications."
	icon = 'modular_skyrat/modules/colony_fabriactor_event_code/icons/engi_fabricator.dmi'
	allowed_buildtypes = COLONY_ENGI_FAB
	repacked_type = /obj/item/flatpacked_machine

// Item for carrying the lathe around and building it

/obj/item/flatpacked_machine/engineering_lathe
	name = "flat-packed rapid engineering fabricator"
	icon = 'modular_skyrat/modules/colony_fabriactor_event_code/icons/packed_machines.dmi'
	icon_state = "engi_lathe"
	w_class = WEIGHT_CLASS_BULKY
	type_to_deploy = /obj/machinery/rnd/production/colony_lathe/engineering
