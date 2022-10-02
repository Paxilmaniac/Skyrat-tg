/obj/vehicle/modular_apc
	name = "testing modular vehicle"
	icon = 'modular_skyrat/modules/event_combat_stuff/icons/vehicles.dmi'
	icon_state = null
	/// What tiles should this vehicle prevent movement onto
	var/list/occupied_tile_structures = list()
	/// All 8 dirs, please don't hurt me
	var/list/static/every_direction = list(
		NORTH,
		SOUTH,
		EAST,
		WEST,
		NORTHEAST,
		NORTHWEST,
		SOUTHEAST,
		SOUTHWEST,
	)
	/// How long should it take for people to climb in
	var/enter_delay = 2 SECONDS

/obj/vehicle/modular_apc/Initialize(mapload)
	. = ..()
	fill_occupied_tiles()

/// Creates /obj/structure/filler/apc in all 8 dirs around the base vehicle
/obj/vehicle/modular_apc/fill_occupied_tiles()
	for(var/direction in every_direction)
		occupied_tile_structures += new /obj/structure/filler/apc(get_step(src, direction))
	for(var/obj/structure/filler/filler_structure in occupied_tile_structures)
		filler_structure.parent = src

/obj/structure/filler/apc
	name = "large vehicle part"
