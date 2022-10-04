/obj/vehicle/modular_apc
	name = "testing modular vehicle"
	icon = 'modular_skyrat/modules/event_combat_stuff/icons/vehicles.dmi'
	icon_state = "generic"
	icon_state = null

	bound_width = 96
	bound_height = 96

	bound_x = -32
	bound_y = -32

	uses_integrity = FALSE

	/// How long should it take for people to climb in
	var/enter_delay = 2 SECONDS
	/// What map template should this vehicle spawn for the interior?
	var/datum/map_template/interior_map_template
	/// Saves a mapgen tool for deleting the interior of the vehicle if it gets deleted
	var/datum/map_generator/massdelete/map_deletion_generator
	/// Keeps track of the area that makes up the internals of our vehicle
	var/inside_area
	/// What is the rear door of this vehicle?
	var/rear_door

	/// The engine soundloop for the outside of the vehicle
	var/datum/looping_sound/generator/soundloop

/obj/vehicle/modular_apc/Initialize(mapload)
	. = ..()
	generate_vehicle_interior()
	soundloop = new(src, TRUE)

/obj/vehicle/modular_apc/Destroy()
	dump_all_occupants()
	QDEL_NULL(soundloop)
	map_deletion_generator.generate()
	return ..()

/// Throws a given person out of the vehicle
/obj/vehicle/modular_apc/proc/dump_all_occupants()
	var/dropoff_turf = get_step(src, turn(dir, 180))
	for(var/mob/living/person in inside_area.contents)
		person.forceMove(dropoff_turf)

/// Spawn the 'interior' of this vehicle on the CC z-level
/obj/vehicle/modular_apc/proc/generate_vehicle_interior()
	var/obj/effect/landmark/vehicle_interior_location/interior_landmark = get_valid_interior_spawn()
	var/turf/spawn_turf = get_turf(interior_landmark)

	interior_map_template = new interior_map_template
	if(!spawn_turf)
		CRASH("No spawn area detected for [src]'s interior!")

	var/list/bounds = interior_map_template.load(spawn_turf)
	if(!bounds)
		CRASH("Loading [src]'s interior failed!")
	map_deletion_generator.defineRegion(spawn_area, locate(spawn_area.x + 8,spawn_area.y + 8,spawn_area.z), replace = TRUE)

	inside_area = get_area(interior_landmark)
	for(var/obj/structure/chair/comfy/shuttle/vehicle_control_seat/control_seat in inside_area.contents)
		control_seat.parent_vehicle = src
	for(var/obj/effect/bump_teleporter/vehicle_door/door in inside_area.contents)
		rear_door = door

/// Find an interior spawn that isn't currently occupied on the list
/obj/vehicle/modular_apc/proc/get_valid_interior_spawn()
	for(var/obj/effect/landmark/vehicle_interior_location/interior_landmark in GLOB.landmarks_list)
		if(!interior_landmark.currently_occupied)
			return interior_landmark

/obj/vehicle/modular_apc/MouseDrop_T(mob/living/dragged_mob, /mob/living/user)
	if(user.incapacitated())
		return
	if(get_dist(user, src) > 2 || get_dist(dragged_mob, src) > 2)
		user.balloon_alert(user, "too far")
		return
	if(!(get_dir(user, src) == dir))
		user.balloon_alert(user, "wrong side")
	dragged_mob.forceMove(get_step(rear_door, rear_door.dir))

/obj/effect/landmark/vehicle_interior_location
	name = "Vehicle Interior Spawn Marker"
	var/currently_occupied = FALSE

/obj/structure/chair/comfy/shuttle/vehicle_control_seat //user.remote_control if this doesn't work
	name = "driver's seat"
	desc = "A comfortable, secure seat. It has a more sturdy looking buckling system, for bumpy rides."
	flags_1 = NODECONSTRUCT_1
	uses_integrity = FALSE
	/// What vehicle should we give the driver control of
	var/obj/vehicle/parent_vehicle

/obj/structure/chair/comfy/shuttle/vehicle_control_seat/post_buckle_mob(mob/living/sitting_mob)
	. = ..()
	parent_vehicle.add_occupant(sitting_mob)
	sitting_mob.reset_perspective(parent_vehicle)

/obj/structure/chair/comfy/shuttle/vehicle_control_seat/post_unbuckle_mob(mob/living/standing_mob)
	. = ..()
	parent_vehicle.remove_occupant(standing_mob)
	standing_mob.reset_perspective(null)

/obj/effect/bump_teleporter/vehicle_door
	name = "vehicle exit"
	desc = "An armor plated metal door that you might be able to leave the vehicle through."
	icon = 'icons/obj/doors/airlocks/centcom/centcom.dmi'
	icon_state = "fake_door"
	invisibility = 0
	opacity = TRUE
	/// What vehicle should we drop people off by
	var/parent_vehicle
	/// What angle from forwards should we drop people off at, in degrees
	var/dropoff_direction_angle = 180

/obj/effect/bump_teleporter/vehicle_door/Bumped(atom/movable/teleport_target)
	var/dropoff_turf = get_step(parent_vehicle, turn(parent_vehicle.dir, dropoff_direction_angle))
	teleport_target.forceMove(dropoff_turf)

/obj/effect/engine_noise_maker
	name = "Engine Noise Maker"
	/// The engine soundloop for the inside of the vehicle
	var/datum/looping_sound/generator/soundloop

/obj/effect/engine_noise_maker/Initialize(mapload)
	. = ..()
	soundloop = new(src, TRUE)

/obj/effect/engine_noise_maker/Destroy()
	QDEL_NULL(soundloop)
	return ..()

/area/centcom/vehicle_interior
	name = "Vehicle Interior"
	area_flags = NOTELEPORT
